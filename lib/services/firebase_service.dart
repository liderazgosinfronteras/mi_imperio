// lib/services/firebase_service.dart
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../firebase_options.dart';

// ════════════════════════════════════════════════════════════════
//  ACTIVA el multijugador cambiando esto a true DESPUÉS de
//  configurar Firebase. Ver instrucciones en firebase_options.dart
// ════════════════════════════════════════════════════════════════
// Firebase habilitado en todas las plataformas (web usa firebase_core/auth/firestore JS SDK)
const bool kFirebaseEnabled = true;

class FirebaseService {
  static bool _fbReady = false;
  static String _fbError = '';
  static FirebaseAuth get _auth => FirebaseAuth.instance;
  static FirebaseFirestore get _db => FirebaseFirestore.instance;

  // Acceso público para widgets que necesitan init antes de usar streams
  static Future<bool> ensureInit() => _ensureFirebase();

  // Llamar desde main() justo después de Firebase.initializeApp() exitoso
  static void markReady() => _fbReady = true;

  static Future<bool> _ensureFirebase() async {
    if (_fbReady) return true;
    // Si ya hay apps registradas, Firebase ya fue inicializado desde main()
    try {
      if (Firebase.apps.isNotEmpty) {
        _fbReady = true;
        return true;
      }
    } catch (_) {}
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      _fbReady = true;
      return true;
    } on FirebaseException catch (e) {
      if (e.code == 'duplicate-app') {
        _fbReady = true;
        return true;
      }
      _fbError = e.message ?? e.toString();
      return false;
    } catch (e) {
      _fbError = e.toString();
      return false;
    }
  }

  // ─── Identidad local (sin Firebase) ──────────────────────────
  static String? _apodoLocal;
  static int     _avatarLocal = 0;

  static Future<void> cargarPerfil() async {
    final prefs = await SharedPreferences.getInstance();
    _apodoLocal  = prefs.getString('social_apodo');
    _avatarLocal = prefs.getInt('social_avatar') ?? 0;
  }

  // Auto-login silencioso al arrancar la app — no toca SharedPreferences
  static Future<void> silentAutoLogin() async {
    await cargarPerfil();
    if (!kFirebaseEnabled) return;
    if (!await _ensureFirebase()) return;
    try {
      if (_auth.currentUser != null) return;
      final cred = await _auth.signInAnonymously();
      await cred.user?.updateDisplayName(_apodoLocal ?? 'Jugadora');
    } catch (_) {}
  }

  static String? get apodo {
    if (!kFirebaseEnabled || !_fbReady) return _apodoLocal;
    try { return _auth.currentUser?.displayName ?? _apodoLocal; } catch (_) { return _apodoLocal; }
  }
  static int     get avatar => _avatarLocal;
  static String? get uid {
    if (!kFirebaseEnabled || !_fbReady) return null;
    try { return _auth.currentUser?.uid; } catch (_) { return null; }
  }
  static bool    get tienePerfilCompleto => _apodoLocal != null && _apodoLocal!.isNotEmpty;

  // ─── Auth anónima ─────────────────────────────────────────────
  static Future<bool> signInAnonymously(String apodo, int avatarIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('social_apodo', apodo);
    await prefs.setInt('social_avatar', avatarIndex);
    _apodoLocal  = apodo;
    _avatarLocal = avatarIndex;

    if (!kFirebaseEnabled) return true;
    if (!await _ensureFirebase()) return false;

    try {
      final cred = await _auth.signInAnonymously();
      await cred.user?.updateDisplayName(apodo);
      await _db.collection('usuarios').doc(cred.user?.uid).set({
        'apodo':       apodo,
        'avatarIndex': avatarIndex,
        'createdAt':   FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      return true;
    } catch (_) {
      return false;
    }
  }

  // ─── Salas ────────────────────────────────────────────────────
  static String _genCodigo() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final r = Random();
    return List.generate(6, (_) => chars[r.nextInt(chars.length)]).join();
  }

  // Devuelve null en éxito, o un String con el error
  static Future<String?> _ensureAuth() async {
    if (!await _ensureFirebase()) return 'Firebase error: $_fbError';
    try {
      if (_auth.currentUser != null) return null;
      final cred = await _auth.signInAnonymously();
      await cred.user?.updateDisplayName(_apodoLocal ?? 'Jugadora');
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        return 'Firebase: Activa "Anonymous" en Authentication → Sign-in method.';
      }
      if (e.code == 'unauthorized-domain') {
        return 'Firebase: Dominio no autorizado. Añade el dominio en Authentication → Settings → Authorized domains.';
      }
      return 'Firebase Auth error (${e.code}): ${e.message}';
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('unauthorized-domain') || msg.contains('unauthorized domain')) {
        return 'Firebase: Dominio no autorizado. Añade el dominio en Authentication → Settings → Authorized domains.';
      }
      if (msg.contains('operation-not-allowed')) {
        return 'Firebase: Activa "Anonymous" en Authentication → Sign-in method.';
      }
      if (msg.contains('channel-error') || msg.contains('MissingPluginException')) {
        return 'Firebase no inicializado. Recarga la página e intenta de nuevo.';
      }
      return 'No se pudo conectar a Firebase: $msg';
    }
  }

  static Map<String, dynamic> _crearSalaLocal(int duracionMin) => {
    'salaId': 'local_${DateTime.now().millisecondsSinceEpoch}',
    'codigo': _genCodigo(),
  };

  static Future<Map<String, dynamic>> createRoom(int duracionMin) async {
    if (!kFirebaseEnabled) return _crearSalaLocal(duracionMin);
    final authError = await _ensureAuth();
    if (authError != null) return _crearSalaLocal(duracionMin); // local fallback
    final u = uid!;
    try {
      final codigo = _genCodigo();
      final ref    = _db.collection('salas').doc();
      await ref.set({
        'codigo':          codigo,
        'estado':          'esperando',
        'creadaPor':       u,
        'duracionMinutos': duracionMin,
        'jugadores':       {u: {'apodo': _apodoLocal, 'avatarIndex': _avatarLocal}},
        'createdAt':       FieldValue.serverTimestamp(),
      });
      return {'salaId': ref.id, 'codigo': codigo};
    } catch (e) {
      return {'error': 'No se pudo crear la sala: $e'};
    }
  }

  static Future<Map<String, dynamic>> joinRoom(String codigo) async {
    if (!kFirebaseEnabled) return {'error': 'Firebase no está activado.'};
    final authError = await _ensureAuth();
    if (authError != null) return {'error': authError};
    final u = uid!;
    try {
      final q = await _db.collection('salas')
          .where('codigo', isEqualTo: codigo.toUpperCase().trim())
          .where('estado', isEqualTo: 'esperando')
          .limit(1).get();
      if (q.docs.isEmpty) return {'error': 'Código no encontrado. ¿Ya inició la partida?'};
      final doc = q.docs.first;
      await doc.reference.update({
        'jugadores.$u': {'apodo': _apodoLocal, 'avatarIndex': _avatarLocal}
      });
      return {
        'salaId':      doc.id,
        'duracionMin': (doc.data()['duracionMinutos'] as int?) ?? 10,
      };
    } catch (e) {
      return {'error': 'No se pudo unir a la sala: $e'};
    }
  }

  static Future<void> startGame(String salaId, int durMin) async {
    if (!kFirebaseEnabled) return;
    await _db.collection('salas').doc(salaId).update({
      'estado':    'jugando',
      'iniciadaEn': FieldValue.serverTimestamp(),
      'terminaEn':  Timestamp.fromDate(DateTime.now().add(Duration(minutes: durMin))),
    });
  }

  static Future<void> endGame(String salaId) async {
    if (!kFirebaseEnabled) return;
    await _db.collection('salas').doc(salaId).update({'estado': 'terminada'});
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>>? roomStream(String salaId) {
    if (!kFirebaseEnabled) return null;
    return _db.collection('salas').doc(salaId).snapshots();
  }

  // ─── Scores en tiempo real ────────────────────────────────────
  static Future<void> updateScore(String salaId,
      double dinero, double totalGanado, double ingPorSeg, int negocios) async {
    if (!kFirebaseEnabled || uid == null) return;
    await _db.collection('salas').doc(salaId).collection('scores').doc(uid).set({
      'apodo':           _apodoLocal,
      'avatarIndex':     _avatarLocal,
      'dinero':          dinero,
      'totalGanado':     totalGanado,
      'ingresosPorSeg':  ingPorSeg,
      'negociosActivos': negocios,
      'online':          true,
      'ultimaSync':      FieldValue.serverTimestamp(),
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>? scoresStream(String salaId) {
    if (!kFirebaseEnabled) return null;
    return _db.collection('salas').doc(salaId).collection('scores').snapshots();
  }

  // ─── Chat ─────────────────────────────────────────────────────
  static Stream<QuerySnapshot<Map<String, dynamic>>>? chatStream(String salaId) {
    if (!kFirebaseEnabled) return null;
    return _db.collection('salas').doc(salaId)
        .collection('chat').orderBy('hora').limit(50).snapshots();
  }

  static Future<void> sendMessage(String salaId, String texto) async {
    if (!kFirebaseEnabled || uid == null) return;
    await _db.collection('salas').doc(salaId).collection('chat').add({
      'uid':         uid,
      'apodo':       _apodoLocal,
      'avatarIndex': _avatarLocal,
      'texto':       texto.trim(),
      'hora':        FieldValue.serverTimestamp(),
    });
  }

  // ─── Leaderboard ──────────────────────────────────────────────
  static Future<void> updateLeaderboard(double totalImperio, int nivel) async {
    if (!kFirebaseEnabled || uid == null) return;
    await _db.collection('leaderboard').doc(uid).set({
      'apodo':        _apodoLocal,
      'avatarIndex':  _avatarLocal,
      'totalImperio': totalImperio,
      'nivel':        nivel,
      'actualizadoEn': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>? leaderboardStream() {
    if (!kFirebaseEnabled || !_fbReady) return null;
    return _db.collection('leaderboard')
        .orderBy('totalImperio', descending: true).limit(20).snapshots();
  }

  // ─── Sistema de Amigas ────────────────────────────────────────
  static Future<String?> obtenerCodigoAmiga() async {
    if (!kFirebaseEnabled || uid == null) return null;
    final doc = await _db.collection('usuarios').doc(uid).get();
    if (doc.exists && doc.data()?['codigoAmiga'] != null) {
      return doc.data()!['codigoAmiga'] as String;
    }
    // Generar código único
    String codigo;
    bool unico = false;
    do {
      codigo = _genCodigo();
      final q = await _db.collection('codigos').doc(codigo).get();
      unico = !q.exists;
    } while (!unico);
    // Guardar
    await _db.collection('usuarios').doc(uid).set({'codigoAmiga': codigo}, SetOptions(merge: true));
    await _db.collection('codigos').doc(codigo).set({'uid': uid});
    return codigo;
  }

  static Future<void> publicarEstadisticas({
    required int nivel,
    required double cashflow,
    required int lecciones,
    required int gemas,
  }) async {
    if (!kFirebaseEnabled || uid == null) return;
    await _db.collection('usuarios').doc(uid).set({
      'apodo':      _apodoLocal,
      'avatarIndex': _avatarLocal,
      'nivel':      nivel,
      'cashflow':   cashflow,
      'lecciones':  lecciones,
      'gemas':      gemas,
      'actualizadoEn': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<Map<String, dynamic>> agregarAmiga(String codigo) async {
    if (!kFirebaseEnabled) return {'error': 'Firebase no está activado.'};
    final authError = await _ensureAuth();
    if (authError != null) return {'error': authError};
    try {
      final codigoDoc = await _db.collection('codigos').doc(codigo.toUpperCase().trim()).get();
      if (!codigoDoc.exists) return {'error': 'Código de amiga no encontrado. Verifica que esté bien escrito.'};
      final amigoUid = codigoDoc.data()!['uid'] as String;
      if (amigoUid == uid) return {'error': 'No puedes agregarte a ti misma.'};
      // Verificar que no sea amiga ya
      final existente = await _db.collection('usuarios').doc(uid).collection('amigas').doc(amigoUid).get();
      if (existente.exists) return {'error': 'Ya tienes a esta amiga en tu lista.'};
      // Obtener perfil de amiga
      final amigoDoc = await _db.collection('usuarios').doc(amigoUid).get();
      if (!amigoDoc.exists) return {'error': 'Perfil no encontrado. La amiga debe haberse conectado al menos una vez.'};
      // Agregar relación bidireccional
      await _db.collection('usuarios').doc(uid).collection('amigas').doc(amigoUid).set({
        'desde': FieldValue.serverTimestamp(),
      });
      await _db.collection('usuarios').doc(amigoUid).collection('amigas').doc(uid).set({
        'desde': FieldValue.serverTimestamp(),
      });
      return {'ok': true, 'apodo': amigoDoc.data()!['apodo'] ?? 'Amiga'};
    } catch (e) {
      return {'error': 'Error al agregar amiga: $e'};
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>? amigasStream() {
    if (!kFirebaseEnabled || uid == null) return null;
    return _db.collection('usuarios').doc(uid).collection('amigas').snapshots();
  }

  // ─── Salas Cashflow Multijugador ──────────────────────────────
  static Future<Map<String, dynamic>> createCashflowRoom() async {
    if (!kFirebaseEnabled) return {'error': 'Firebase no está configurado.'};
    final authError = await _ensureAuth();
    if (authError != null) return {'error': authError};
    final u = uid!;
    try {
      final codigo = _genCodigo();
      final ref = _db.collection('cashflow_rooms').doc();
      await ref.set({
        'codigo':    codigo,
        'estado':    'lobby',
        'creadoPor': u,
        'creadoEn':  FieldValue.serverTimestamp(),
        'jugadores': {
          u: _jugadoraVacia(u),
        },
      });
      return {'roomId': ref.id, 'codigo': codigo};
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('PERMISSION_DENIED') || msg.contains('permission-denied')) {
        return {'error': 'Sin permisos en Firebase. Ejecuta: firebase deploy --only firestore:rules'};
      }
      return {'error': 'No se pudo crear la sala: $e'};
    }
  }

  static Map<String, dynamic> _jugadoraVacia(String u) => {
    'apodo':       _apodoLocal ?? 'Jugadora',
    'avatarIndex': _avatarLocal,
    'posicion':    0,
    'efectivo':    0,
    'ingresoPasivo': 0,
    'gastosMes':   0,
    'profNombre':  '',
    'profIndex':   -1,
    'rapida':      false,
    'gano':        false,
    'turno':       0,
    'pctLibertad': 0.0,
    'ultimoEvento': '',
  };

  static Future<Map<String, dynamic>> joinCashflowRoom(String codigo) async {
    if (!kFirebaseEnabled) return {'error': 'Firebase no está configurado.'};
    final authError = await _ensureAuth();
    if (authError != null) return {'error': authError};
    final u = uid!;
    try {
      final q = await _db.collection('cashflow_rooms')
          .where('codigo', isEqualTo: codigo.toUpperCase().trim())
          .limit(5).get();
      if (q.docs.isEmpty) return {'error': 'Código no encontrado. Verifica que esté bien escrito.'};
      // Buscar sala activa (sin necesitar índice compuesto)
      final doc = q.docs.firstWhere(
        (d) {
          final e = d.data()['estado'] as String? ?? '';
          return e == 'lobby' || e == 'jugando';
        },
        orElse: () => q.docs.first,
      );
      final estado = doc.data()['estado'] as String? ?? '';
      if (estado != 'lobby' && estado != 'jugando') {
        return {'error': 'Esta sala ya terminó. Pide a tu amiga que cree una nueva.'};
      }
      await doc.reference.update({'jugadores.$u': _jugadoraVacia(u)});
      return {'roomId': doc.id};
    } catch (e) {
      return {'error': 'No se pudo unir: $e'};
    }
  }

  static Future<void> startCashflowRoom(String roomId) async {
    if (!kFirebaseEnabled) return;
    await _db.collection('cashflow_rooms').doc(roomId).update({
      'estado': 'jugando',
      'iniciadoEn': FieldValue.serverTimestamp(),
      'turnoActualUid': uid, // el host empieza
    });
  }

  static Future<void> pasarTurnoCashflow(String roomId, String siguienteUid) async {
    if (!kFirebaseEnabled) return;
    try {
      await _db.collection('cashflow_rooms').doc(roomId)
          .update({'turnoActualUid': siguienteUid});
    } catch (_) {}
  }

  static Future<void> updateCashflowState(String roomId, Map<String, dynamic> estado) async {
    if (!kFirebaseEnabled || uid == null) return;
    try {
      await _db.collection('cashflow_rooms').doc(roomId).update({
        'jugadores.$uid': {...estado, 'ultimaSync': FieldValue.serverTimestamp()},
      });
    } catch (_) {}
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>>? cashflowRoomStream(String roomId) {
    if (!kFirebaseEnabled || !_fbReady) return null;
    try {
      return _db.collection('cashflow_rooms').doc(roomId).snapshots();
    } catch (_) {
      return null;
    }
  }

  // ─── Monopolio Multijugador ───────────────────────────────────
  static Future<Map<String, dynamic>> createMonopolioRoom() async {
    if (!kFirebaseEnabled) return {'error': 'Firebase no disponible.'};
    final authError = await _ensureAuth();
    if (authError != null) return {'error': authError};
    final u = uid!;
    try {
      final codigo = _genCodigo();
      final ref = _db.collection('monopolio_rooms').doc();
      await ref.set({
        'codigo':         codigo,
        'estado':         'lobby',
        'creadoPor':      u,
        'creadoEn':       FieldValue.serverTimestamp(),
        'jugadoresUids':  [u],
        'jugadoresInfo':  {u: {'apodo': _apodoLocal ?? 'Jugadora', 'avatarIndex': _avatarLocal}},
        'gameState':      null,
      });
      return {'roomId': ref.id, 'codigo': codigo};
    } catch (e) {
      return {'error': 'No se pudo crear la sala: $e'};
    }
  }

  static Future<Map<String, dynamic>> joinMonopolioRoom(String codigo) async {
    if (!kFirebaseEnabled) return {'error': 'Firebase no disponible.'};
    final authError = await _ensureAuth();
    if (authError != null) return {'error': authError};
    final u = uid!;
    try {
      final q = await _db.collection('monopolio_rooms')
          .where('codigo', isEqualTo: codigo.toUpperCase().trim())
          .limit(5).get();
      if (q.docs.isEmpty) return {'error': 'Código no encontrado.'};
      final doc = q.docs.firstWhere(
        (d) => (d.data()['estado'] as String?) == 'lobby',
        orElse: () => q.docs.first,
      );
      final estado = doc.data()['estado'] as String? ?? '';
      if (estado != 'lobby') return {'error': 'La partida ya comenzó o terminó.'};
      final uids = List<String>.from(doc.data()['jugadoresUids'] ?? []);
      if (uids.length >= 4) return {'error': 'Sala llena (máximo 4 jugadoras).'};
      if (!uids.contains(u)) {
        await doc.reference.update({
          'jugadoresUids':      FieldValue.arrayUnion([u]),
          'jugadoresInfo.$u':   {'apodo': _apodoLocal ?? 'Jugadora', 'avatarIndex': _avatarLocal},
        });
      }
      return {'roomId': doc.id, 'codigo': doc.data()['codigo'] ?? ''};
    } catch (e) {
      return {'error': 'No se pudo unir: $e'};
    }
  }

  static Future<void> startMonopolioRoom(String roomId, Map<String, dynamic> gameState) async {
    if (!kFirebaseEnabled) return;
    await _db.collection('monopolio_rooms').doc(roomId).update({
      'estado':     'jugando',
      'iniciadoEn': FieldValue.serverTimestamp(),
      'gameState':  gameState,
    });
  }

  static Future<void> updateMonopolioState(String roomId, Map<String, dynamic> gameState) async {
    if (!kFirebaseEnabled) return;
    try {
      await _db.collection('monopolio_rooms').doc(roomId).update({'gameState': gameState});
    } catch (_) {}
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>>? monopolioRoomStream(String roomId) {
    if (!kFirebaseEnabled || !_fbReady) return null;
    try { return _db.collection('monopolio_rooms').doc(roomId).snapshots(); } catch (_) { return null; }
  }

  static Future<Map<String, dynamic>?> obtenerPerfilAmiga(String amigoUid) async {
    if (!kFirebaseEnabled) return null;
    try {
      final doc = await _db.collection('usuarios').doc(amigoUid).get();
      return doc.data();
    } catch (_) {
      return null;
    }
  }
}
