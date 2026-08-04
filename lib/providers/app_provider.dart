// lib/providers/app_provider.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/app_models.dart';
import '../models/libro_model.dart';
import '../data/libros_desarrollo_personal.dart';
import '../data/libros_educacion_financiera.dart';
import '../data/libros_autoestima.dart';
import '../data/libros_empoderamiento.dart';
import '../data/libros_liderazgo.dart';
import '../data/libros_mlm.dart';
import '../data/libros_disciplina.dart';
import '../data/libros_emprendedor.dart';
import '../data/libros_motivacion.dart';
import '../utils/sound_player.dart';

class AppProvider extends ChangeNotifier {
  // ── GAMIFICATION ──────────────────────────
  int _racha = 0;
  int _gemas = 50;
  int _vidas = 5;
  int _nivelActual = 1;
  String _ultimaFechaRacha = '';
  String _avatarActual = '🦋';
  // Regeneración de vidas: 1 vida cada 2 horas cuando _vidas < 5
  String _tiempoVidaRecarga = '';

  // ── FINANCIAL ─────────────────────────────
  double _fondoReinversion = 0;
  double _estiloVida = 0;        // acumulado total (para reportes)
  double _estiloVidaSemana = 0;  // semana actual (para medidor de libertad)
  double _fondoCashflow = 0;
  List<Transaccion> _transacciones = [];
  List<PuntoGrafica> _historialGrafica = [];

  // ── LESSONS ───────────────────────────────
  List<Leccion> _lecciones = crearLecciones();
  int _leccionActualIndex = 0;

  // ── STOCKS ────────────────────────────────
  List<AccionSimulada> _acciones = crearAcciones();
  Timer? _simulacionTimer;
  Timer? _vidaTimer;

  // ── NOTIFICACIONES PENDIENTES ─────────────
  final List<String> _notificacionesPendientes = [];

  // ── JOURNAL ───────────────────────────────
  List<EntradaGratitud> _entradas = [];
  bool _diarioHoyCompletado = false;
  int _diariosSemana = 0;

  // ── MISIONES ──────────────────────────────
  List<Mision> _misiones = crearMisionesSemanales();
  String _semanaActual = '';

  // ── METAS ─────────────────────────────────
  List<MetaFinanciera> _metas = [];

  // ── AVATARES ──────────────────────────────
  List<AvatarItem> _avatares = crearAvatares();

  // ── BIBLIOTECA ────────────────────────────
  List<Libro> _libros = [
    ...crearLibrosDesarrolloPersonal(),
    ...crearLibrosEducacionFinanciera(),
    ...crearLibrosAutoestima(),
    ...crearLibrosEmpoderamiento(),
    ...crearLibrosLiderazgo(),
    ...crearLibrosMLM(),
    ...crearLibrosDisciplina(),
    ...crearLibrosEmprendedor(),
    ...crearLibrosMotivacion(),
  ];
  Map<String, Set<int>> _capitulosLeidos = {};

  // ── RETO FINANCIERO ───────────────────────────
  List<RetoModulo>? _retoModulos;
  Map<int, int> _retoProgreso = {};

  // ── ONBOARDING ────────────────────────────
  bool _onboardingCompletado = false;

  // ── SEGURIDAD PADRES ──────────────────────
  String _pinPadres = '0000';

  // ── DEBUG ─────────────────────────────────
  DateTime _fechaSimuladaDebug = DateTime.now();

  // ═════════════════════════════════════════
  //  GETTERS
  // ═════════════════════════════════════════
  int get racha => _racha;
  int get gemas => _gemas;
  int get vidas => _vidas;
  int get nivelActual => _nivelActual;
  String get avatarActual => _avatarActual;
  String get pinPadres => _pinPadres;

  // Tiempo restante hasta la próxima vida regenerada (vacío si vidas == 5)
  String get tiempoHastaVida {
    if (_vidas >= 5 || _tiempoVidaRecarga.isEmpty) return '';
    final ref = DateTime.tryParse(_tiempoVidaRecarga);
    if (ref == null) return '';
    final prox = ref.add(const Duration(hours: 2));
    final diff = prox.difference(DateTime.now());
    if (diff.isNegative) return 'Disponible';
    final h = diff.inHours;
    final m = diff.inMinutes % 60;
    return h > 0 ? '${h}h ${m}m' : '${m}m';
  }

  double get fondoReinversion => _fondoReinversion;
  double get estiloVida => _estiloVida;
  double get estiloVidaSemana => _estiloVidaSemana;
  double get fondoCashflow => _fondoCashflow;

  List<Transaccion> get transacciones => _transacciones;
  List<Leccion> get lecciones => _lecciones;
  List<AccionSimulada> get acciones => _acciones;
  List<EntradaGratitud> get entradas => _entradas;
  bool get diarioHoyCompletado => _diarioHoyCompletado;
  List<Mision> get misiones => _misiones;
  List<MetaFinanciera> get metas => _metas;
  List<AvatarItem> get avatares => _avatares;
  List<PuntoGrafica> get historialGrafica => _historialGrafica;
  bool get onboardingCompletado => _onboardingCompletado;

  // ── BIBLIOTECA ────────────────────────────
  List<Libro> get libros => _libros;
  int get librosCompletados => _libros.where((l) => l.estado == EstadoLibro.completado).length;
  int get librosEnProgreso => _libros.where((l) => l.estado == EstadoLibro.enProgreso).length;

  Set<int> capitulosLeidos(String libroId) => _capitulosLeidos[libroId] ?? {};

  // ── RETO FINANCIERO ───────────────────────────
  List<RetoModulo> get retoModulos => _retoModulos ??= _construirRetoModulos();
  int progresoModulo(int idx) => _retoProgreso[idx] ?? 0;
  int get totalNivelesRetoCompletados => _retoProgreso.values.fold(0, (a, b) => a + b);
  bool moduloRetoDesbloqueado(int idx) {
    if (idx == 0) return true;
    final prev = retoModulos[idx - 1];
    return (_retoProgreso[idx - 1] ?? 0) >= prev.preguntas.length;
  }
  bool get granRetoCompleto {
    final mods = retoModulos;
    return mods.isNotEmpty &&
        mods.every((m) => m.preguntas.isNotEmpty && (_retoProgreso[m.id] ?? 0) >= m.preguntas.length);
  }

  // ── NOTIFICACIONES ────────────────────────
  List<String> consumirNotificaciones() {
    final copy = List<String>.from(_notificacionesPendientes);
    _notificacionesPendientes.clear();
    return copy;
  }

  Future<void> marcarCapituloLeido(String libroId, int capituloIndex) async {
    _capitulosLeidos[libroId] ??= {};
    _capitulosLeidos[libroId]!.add(capituloIndex);
    final libro = _libros.firstWhere((l) => l.id == libroId);
    if (libro.estado == EstadoLibro.disponible) {
      libro.estado = EstadoLibro.enProgreso;
    }
    _registrarActividadHoy();
    notifyListeners();
    await _guardarDatos();
  }

  Future<void> completarLibro(String libroId, int correctas, int total) async {
    final libro = _libros.firstWhere((l) => l.id == libroId);
    libro.estado = EstadoLibro.completado;
    _gemas += libro.gemasRecompensa;
    if (correctas == total) _gemas += 20;
    _actualizarMision(TipoMision.lecciones, 1);
    _registrarActividadHoy();
    notifyListeners();
    await _guardarDatos();
  }

  // ═════════════════════════════════════════
  //  RETO ENGINE
  // ═════════════════════════════════════════
  List<RetoModulo> _construirRetoModulos() {
    List<Pregunta> pFor(List<CategoriaLibro> cats) => _libros
        .where((l) => cats.contains(l.categoria))
        .expand((l) => l.preguntas.map((p) => Pregunta(
              enunciado: p.enunciado,
              opciones: p.opciones,
              respuestaCorrecta: p.respuestaCorrecta,
              explicacion: p.explicacion,
            )))
        .toList();
    return [
      RetoModulo(
        id: 0, nombre: 'Primeros Pasos', emoji: '💰',
        descripcion: 'Fundamentos del dinero y la riqueza',
        dificultad: '⭐ Básico', pais: 'Japón', bandera: '🇯🇵',
        paisEmoji: '🗾🌸⛩️',
        paisDesc: 'Tierra de disciplina y prosperidad milenaria',
        preguntas: pFor([CategoriaLibro.educacionFinanciera]),
      ),
      RetoModulo(
        id: 1, nombre: 'Mentalidad del Éxito', emoji: '🧠',
        descripcion: 'Cómo piensan los que triunfan',
        dificultad: '⭐⭐ Básico+', pais: 'Islandia', bandera: '🇮🇸',
        paisEmoji: '🌌❄️🏔️',
        paisDesc: 'Tierra de auroras boreales y resiliencia infinita',
        preguntas: pFor([CategoriaLibro.motivacion]),
      ),
      RetoModulo(
        id: 2, nombre: 'Desarrollo Personal', emoji: '🌱',
        descripcion: 'Conviértete en la mejor versión de ti',
        dificultad: '⭐⭐ Básico+', pais: 'Maldivas', bandera: '🇲🇻',
        paisEmoji: '🏝️🌊💙',
        paisDesc: 'Paraíso donde la abundancia es una decisión',
        preguntas: pFor([CategoriaLibro.desarrolloPersonal]),
      ),
      RetoModulo(
        id: 3, nombre: 'Emprendimiento', emoji: '🚀',
        descripcion: 'Construye algo que el mundo necesita',
        dificultad: '⭐⭐⭐ Intermedio', pais: 'Marruecos', bandera: '🇲🇦',
        paisEmoji: '🕌🐪🌅',
        paisDesc: 'Tierra de comerciantes y rutas de riqueza milenarias',
        preguntas: pFor([CategoriaLibro.emprendedor]),
      ),
      RetoModulo(
        id: 4, nombre: 'Hábitos y Disciplina', emoji: '⚡',
        descripcion: 'La diferencia entre soñar y lograr',
        dificultad: '⭐⭐⭐ Intermedio', pais: 'Perú', bandera: '🇵🇪',
        paisEmoji: '🦙🏔️🌿',
        paisDesc: 'Tierra de civilizaciones que dominaron la disciplina',
        preguntas: pFor([CategoriaLibro.disciplina]),
      ),
      RetoModulo(
        id: 5, nombre: 'Autoestima y Confianza', emoji: '💜',
        descripcion: 'Tu mayor inversión eres tú misma',
        dificultad: '⭐⭐⭐ Intermedio', pais: 'Nueva Zelanda', bandera: '🇳🇿',
        paisEmoji: '🥝🌿🏔️',
        paisDesc: 'Tierra de líderes que conquistaron su mundo interior',
        preguntas: pFor([CategoriaLibro.autoestima]),
      ),
      RetoModulo(
        id: 6, nombre: 'Empoderamiento', emoji: '🦋',
        descripcion: 'Transforma tu poder en acción imparable',
        dificultad: '⭐⭐⭐⭐ Avanzado', pais: 'Noruega', bandera: '🇳🇴',
        paisEmoji: '🌊🏔️🌄',
        paisDesc: 'Tierra del alto rendimiento y la plenitud auténtica',
        preguntas: pFor([CategoriaLibro.empoderamiento]),
      ),
      RetoModulo(
        id: 7, nombre: 'Liderazgo', emoji: '👑',
        descripcion: 'Inspira, guía y multiplica tu impacto',
        dificultad: '⭐⭐⭐⭐ Avanzado', pais: 'Brasil', bandera: '🇧🇷',
        paisEmoji: '🌴🎭🌺',
        paisDesc: 'Tierra de líderes apasionados y visionarios',
        preguntas: pFor([CategoriaLibro.liderazgo]),
      ),
      RetoModulo(
        id: 8, nombre: 'Redes y Negocios', emoji: '🌐',
        descripcion: 'Tu red es tu activo más poderoso',
        dificultad: '⭐⭐⭐⭐ Avanzado', pais: 'India', bandera: '🇮🇳',
        paisEmoji: '🕌🐘🌺',
        paisDesc: 'Tierra de 1,400 millones de conexiones humanas',
        preguntas: pFor([CategoriaLibro.mlm]),
      ),
      RetoModulo(
        id: 9, nombre: 'Maestría Total', emoji: '🌍',
        descripcion: 'El conocimiento que te hace imparable',
        dificultad: '🏆 Maestría', pais: 'El Mundo', bandera: '🌎',
        paisEmoji: '🌍🌎🌏',
        paisDesc: 'Cuando dominas el conocimiento, el mundo entero es tuyo',
        preguntas: pFor(CategoriaLibro.values.toList()),
      ),
    ];
  }

  Future<void> completarNivelReto(int moduloIdx, bool correcto) async {
    final modulo = retoModulos[moduloIdx];
    final actual = _retoProgreso[moduloIdx] ?? 0;
    if (actual >= modulo.preguntas.length) return;
    _retoProgreso[moduloIdx] = actual + 1;
    if (correcto) _gemas += 5;
    if ((_retoProgreso[moduloIdx] ?? 0) >= modulo.preguntas.length) {
      _gemas += 50;
      SoundPlayer.mision();
    }
    _registrarActividadHoy();
    notifyListeners();
    await _guardarDatos();
  }

  // ── COMPUTED ──────────────────────────────
  // Usa _fechaSimuladaDebug en debug para que el simulador de días funcione
  bool get esDiaEducacion {
    final fecha = kDebugMode ? _fechaSimuladaDebug : DateTime.now();
    final dia = fecha.weekday;
    return dia == 1 || dia == 2 || dia == 4 || dia == 5;
  }

  // Libertad Financiera: cashflow acumulado >= gasto de esta semana
  // (el cashflow crece con el tiempo mientras los gastos se reinician cada semana)
  bool get libertadFinanciera => _estiloVidaSemana > 0 && _fondoCashflow >= _estiloVidaSemana;
  double get porcentajeLiberacion =>
      _estiloVidaSemana == 0 ? 0 : (_fondoCashflow / _estiloVidaSemana).clamp(0.0, 1.0);

  double get totalVentas => _transacciones.fold(0.0, (s, t) => s + t.montoTotal);
  bool get puedeJugar => _vidas > 0;
  bool get puedeRestaurarVidas => _gemas >= 30 && _vidas < 5;

  int get misionesCompletadas => _misiones.where((m) => m.completada).length;
  int get leccionesCompletadas => _lecciones.where((l) => l.estado == EstadoLeccion.completada).length;

  // Progreso al siguiente nivel (0.0 – 1.0)
  double get progresoNivel {
    final completadas = leccionesCompletadas;
    final total = _lecciones.length;
    if (total == 0) return 0;
    return (completadas % 1 == 0) ? (completadas / total) : 0;
  }

  String get nombreDia {
    const dias = ['', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
    return dias[DateTime.now().weekday];
  }

  // Debug
  void avanzarDia() {
    _fechaSimuladaDebug = _fechaSimuladaDebug.add(const Duration(days: 1));
    notifyListeners();
  }

  String get nombreDiaDebug {
    const d = ['', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
    return d[_fechaSimuladaDebug.weekday];
  }

  // ═════════════════════════════════════════
  //  INIT / DISPOSE
  // ═════════════════════════════════════════
  AppProvider() {
    _cargarDatos();
    _iniciarSimulacionAcciones();
  }

  @override
  void dispose() {
    _simulacionTimer?.cancel();
    _vidaTimer?.cancel();
    super.dispose();
  }

  Future<void> _cargarDatos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('schemaVersion', 3);

    _onboardingCompletado = prefs.getBool('onboardingCompletado') ?? false;
    _racha = prefs.getInt('racha') ?? 0;
    _gemas = prefs.getInt('gemas') ?? 50;
    _vidas = prefs.getInt('vidas') ?? 5;
    _tiempoVidaRecarga = prefs.getString('tiempoVidaRecarga') ?? '';
    // Regenerar vidas acumuladas: 1 cada 2 horas mientras _vidas < 5
    if (_vidas < 5 && _tiempoVidaRecarga.isNotEmpty) {
      final ref = DateTime.tryParse(_tiempoVidaRecarga);
      if (ref != null) {
        var tiempoRef = ref;
        final ahora = DateTime.now();
        while (_vidas < 5 && tiempoRef.add(const Duration(hours: 2)).isBefore(ahora)) {
          _vidas++;
          tiempoRef = tiempoRef.add(const Duration(hours: 2));
        }
        _tiempoVidaRecarga = _vidas >= 5 ? '' : tiempoRef.toIso8601String();
      }
    }
    _nivelActual = prefs.getInt('nivel') ?? 1;
    _ultimaFechaRacha = prefs.getString('ultimaFechaRacha') ?? '';
    _avatarActual = prefs.getString('avatarActual') ?? '🦋';
    _pinPadres = prefs.getString('pinPadres') ?? '0000';
    _fondoReinversion = prefs.getDouble('reinversion') ?? 0.0;
    _estiloVida = prefs.getDouble('estiloVida') ?? 0.0;
    _fondoCashflow = prefs.getDouble('cashflow') ?? 0.0;

    // Transacciones
    final txJson = prefs.getStringList('transacciones') ?? [];
    _transacciones = txJson.map((s) {
      try {
        final m = jsonDecode(s) as Map<String, dynamic>;
        return Transaccion(
          montoTotal: (m['total'] as num).toDouble(),
          fecha: DateTime.parse(m['fecha']),
          descripcion: m['desc'] ?? '',
        );
      } catch (_) {
        return null;
      }
    }).whereType<Transaccion>().toList();

    // Historial gráfica
    final grafJson = prefs.getStringList('historialGrafica') ?? [];
    _historialGrafica = grafJson.map((s) {
      try {
        final m = jsonDecode(s) as Map<String, dynamic>;
        return PuntoGrafica(
          fecha: DateTime.parse(m['fecha']),
          cashflow: (m['cf'] as num).toDouble(),
          estiloVida: (m['ev'] as num).toDouble(),
          ventas: (m['vt'] as num).toDouble(),
        );
      } catch (_) {
        return null;
      }
    }).whereType<PuntoGrafica>().toList();

    // Estados de lecciones
    final lessonStates = prefs.getStringList('leccionEstados') ?? [];
    if (lessonStates.isNotEmpty) {
      for (int i = 0; i < lessonStates.length && i < _lecciones.length; i++) {
        final idx = int.tryParse(lessonStates[i]);
        if (idx != null && idx < EstadoLeccion.values.length) {
          _lecciones[i].estado = EstadoLeccion.values[idx];
        }
      }
    }
    _leccionActualIndex = prefs.getInt('leccionIndex') ?? 0;

    // Diario
    final journalJson = prefs.getStringList('entradas') ?? [];
    _entradas = journalJson.map((s) {
      try {
        final m = jsonDecode(s) as Map<String, dynamic>;
        return EntradaGratitud(texto: m['texto'], fecha: DateTime.parse(m['fecha']));
      } catch (_) {
        return null;
      }
    }).whereType<EntradaGratitud>().toList();
    _diarioHoyCompletado = _entradas.any((e) => _mismodia(e.fecha, DateTime.now()));

    // Metas
    final metasJson = prefs.getStringList('metas') ?? [];
    _metas = metasJson.map((s) {
      try {
        final m = jsonDecode(s) as Map<String, dynamic>;
        return MetaFinanciera(
          nombre: m['nombre'],
          emoji: m['emoji'],
          montoObjetivo: (m['objetivo'] as num).toDouble(),
          montoActual: (m['actual'] as num).toDouble(),
          alcanzada: m['alcanzada'] ?? false,
        );
      } catch (_) {
        return null;
      }
    }).whereType<MetaFinanciera>().toList();

    // Avatares desbloqueados
    final avJson = prefs.getStringList('avataresDesbloqueados') ?? [];
    for (final av in _avatares) {
      if (avJson.contains(av.id)) av.desbloqueado = true;
    }

    // Misiones semanales — resetear si cambia la semana
    _semanaActual = prefs.getString('semanaActual') ?? '';
    final semanaHoy = _semanaKey(DateTime.now());
    if (_semanaActual != semanaHoy) {
      _misiones = crearMisionesSemanales();
      _semanaActual = semanaHoy;
      _diariosSemana = 0;
      _estiloVidaSemana = 0; // Reset semanal del gasto
    } else {
      _estiloVidaSemana = prefs.getDouble('estiloVidaSemana') ?? 0.0;
      final misionesJson = prefs.getStringList('misionesEstado') ?? [];
      if (misionesJson.length == _misiones.length) {
        for (int i = 0; i < misionesJson.length; i++) {
          try {
            final m = jsonDecode(misionesJson[i]) as Map<String, dynamic>;
            _misiones[i].progreso = (m['p'] as num).toDouble();
            _misiones[i].completada = m['c'] ?? false;
          } catch (_) {}
        }
      }
      _diariosSemana = prefs.getInt('diariosSemana') ?? 0;
    }

    // Recalcular nivel real por lecciones completadas
    final completadas = _lecciones.where((l) => l.estado == EstadoLeccion.completada).length;
    _nivelActual = completadas + 1;

    // Biblioteca — estados de libros
    final librosEstadoJson = prefs.getString('librosEstado') ?? '{}';
    try {
      final Map<String, dynamic> estadoMap = jsonDecode(librosEstadoJson);
      for (final libro in _libros) {
        final idx = estadoMap[libro.id];
        if (idx != null && idx < EstadoLibro.values.length) {
          libro.estado = EstadoLibro.values[idx as int];
        }
      }
    } catch (_) {}

    final capitulosJson = prefs.getString('capitulosLeidos') ?? '{}';
    try {
      final Map<String, dynamic> capMap = jsonDecode(capitulosJson);
      _capitulosLeidos = capMap.map((k, v) =>
          MapEntry(k, Set<int>.from((v as List).map((e) => e as int))));
    } catch (_) {}

    // Reto progreso
    final retoJson = prefs.getString('retoProgreso') ?? '{}';
    try {
      final m = jsonDecode(retoJson) as Map<String, dynamic>;
      _retoProgreso = m.map((k, v) => MapEntry(int.parse(k), (v as num).toInt()));
    } catch (_) {}

    _verificarRachaDelDia();
    _actualizarMetasConCashflow();
    _iniciarTimerVidas();
    notifyListeners();
  }

  Future<void> _guardarDatos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('schemaVersion', 3);
    await prefs.setBool('onboardingCompletado', _onboardingCompletado);
    await prefs.setInt('racha', _racha);
    await prefs.setInt('gemas', _gemas);
    await prefs.setInt('vidas', _vidas);
    await prefs.setString('tiempoVidaRecarga', _tiempoVidaRecarga);
    await prefs.setInt('nivel', _nivelActual);
    await prefs.setString('ultimaFechaRacha', _ultimaFechaRacha);
    await prefs.setString('avatarActual', _avatarActual);
    await prefs.setString('pinPadres', _pinPadres);
    await prefs.setDouble('reinversion', _fondoReinversion);
    await prefs.setDouble('estiloVida', _estiloVida);
    await prefs.setDouble('estiloVidaSemana', _estiloVidaSemana);
    await prefs.setDouble('cashflow', _fondoCashflow);
    await prefs.setString('semanaActual', _semanaActual);
    await prefs.setInt('diariosSemana', _diariosSemana);

    await prefs.setStringList(
      'transacciones',
      _transacciones
          .map((t) => jsonEncode({'total': t.montoTotal, 'fecha': t.fecha.toIso8601String(), 'desc': t.descripcion}))
          .toList(),
    );
    await prefs.setStringList(
      'historialGrafica',
      _historialGrafica
          .map((p) => jsonEncode({'fecha': p.fecha.toIso8601String(), 'cf': p.cashflow, 'ev': p.estiloVida, 'vt': p.ventas}))
          .toList(),
    );
    await prefs.setStringList('leccionEstados', _lecciones.map((l) => l.estado.index.toString()).toList());
    await prefs.setInt('leccionIndex', _leccionActualIndex);
    await prefs.setStringList(
      'entradas',
      _entradas.map((e) => jsonEncode({'texto': e.texto, 'fecha': e.fecha.toIso8601String()})).toList(),
    );
    await prefs.setStringList(
      'metas',
      _metas
          .map((m) => jsonEncode({
                'nombre': m.nombre,
                'emoji': m.emoji,
                'objetivo': m.montoObjetivo,
                'actual': m.montoActual,
                'alcanzada': m.alcanzada,
              }))
          .toList(),
    );
    await prefs.setStringList('avataresDesbloqueados', _avatares.where((a) => a.desbloqueado).map((a) => a.id).toList());
    await prefs.setStringList(
      'misionesEstado',
      _misiones.map((m) => jsonEncode({'p': m.progreso, 'c': m.completada})).toList(),
    );

    // Biblioteca
    final estadoMap = {for (final l in _libros) l.id: l.estado.index};
    await prefs.setString('librosEstado', jsonEncode(estadoMap));
    final capMap = _capitulosLeidos.map((k, v) => MapEntry(k, v.toList()));
    await prefs.setString('capitulosLeidos', jsonEncode(capMap));

    // Reto progreso
    await prefs.setString('retoProgreso',
        jsonEncode(_retoProgreso.map((k, v) => MapEntry(k.toString(), v))));
  }

  // ═════════════════════════════════════════
  //  HELPERS DE FECHA
  // ═════════════════════════════════════════
  bool _mismodia(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
  String _fechaKey(DateTime d) => '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  String _semanaKey(DateTime d) {
    final lunes = d.subtract(Duration(days: d.weekday - 1));
    return _fechaKey(lunes);
  }

  void _verificarRachaDelDia() {
    if (_ultimaFechaRacha.isEmpty) return;
    final ultima = DateTime.tryParse(_ultimaFechaRacha);
    if (ultima == null) return;
    if (DateTime.now().difference(ultima).inDays > 1) {
      _racha = 0;
      _ultimaFechaRacha = '';
    }
  }

  void _registrarActividadHoy() {
    final hoy = _fechaKey(DateTime.now());
    if (_ultimaFechaRacha != hoy) {
      if (_ultimaFechaRacha.isNotEmpty) {
        _racha++; // día consecutivo → incrementar
      } else {
        _racha = 1; // primer día de actividad → racha = 1
      }
      _ultimaFechaRacha = hoy;
    }
  }

  // ═════════════════════════════════════════
  //  ONBOARDING
  // ═════════════════════════════════════════
  Future<void> completarOnboarding() async {
    _onboardingCompletado = true;
    notifyListeners();
    await _guardarDatos();
  }

  // ═════════════════════════════════════════
  //  FINANCIAL ENGINE
  // ═════════════════════════════════════════
  Future<void> registrarVenta(double monto, String descripcion) async {
    final tx = Transaccion(montoTotal: monto, fecha: DateTime.now(), descripcion: descripcion);
    _transacciones.insert(0, tx);
    _fondoReinversion += tx.reinversion;
    _fondoCashflow += tx.cashflow;
    _estiloVida += tx.estiloVida;
    _estiloVidaSemana += tx.estiloVida; // Gasto de la semana actual

    _actualizarMetasConCashflow();
    _actualizarMision(TipoMision.ventas, monto);
    _actualizarMisionCashflow();
    _actualizarHistorialGrafica();
    _fluctuarAcciones(afectarCashflow: false);
    _gemas += 5;
    _registrarActividadHoy();
    notifyListeners();
    await _guardarDatos();
  }

  Future<void> depositarDesdeImperio(double monto) async {
    _fondoCashflow += monto;
    _gemas += 10;
    _actualizarMetasConCashflow();
    _actualizarMisionCashflow();
    _actualizarHistorialGrafica();
    notifyListeners();
    await _guardarDatos();
  }

  Future<void> eliminarTransaccion(String id) async {
    final tx = _transacciones.firstWhere((t) => t.id == id, orElse: () => throw Exception('TX not found'));
    _transacciones.removeWhere((t) => t.id == id);
    // Revertir fondos
    _fondoReinversion = (_fondoReinversion - tx.reinversion).clamp(0, double.infinity);
    _fondoCashflow = (_fondoCashflow - tx.cashflow).clamp(0, double.infinity);
    _estiloVida = (_estiloVida - tx.estiloVida).clamp(0, double.infinity);
    _estiloVidaSemana = (_estiloVidaSemana - tx.estiloVida).clamp(0, double.infinity);
    _actualizarMetasConCashflow();
    _actualizarHistorialGrafica();
    notifyListeners();
    await _guardarDatos();
  }

  void _actualizarHistorialGrafica() {
    final hoy = DateTime.now();
    final ultimo = _historialGrafica.isNotEmpty ? _historialGrafica.last : null;
    if (ultimo != null && _mismodia(ultimo.fecha, hoy)) {
      _historialGrafica[_historialGrafica.length - 1] =
          PuntoGrafica(fecha: hoy, cashflow: _fondoCashflow, estiloVida: _estiloVida, ventas: totalVentas);
    } else {
      _historialGrafica.add(PuntoGrafica(fecha: hoy, cashflow: _fondoCashflow, estiloVida: _estiloVida, ventas: totalVentas));
      if (_historialGrafica.length > 60) _historialGrafica.removeAt(0);
    }
  }

  // ═════════════════════════════════════════
  //  GAMIFICATION ENGINE
  // ═════════════════════════════════════════
  Future<void> completarLeccion(int leccionIndex, int respuestasCorrectas) async {
    final leccion = _lecciones[leccionIndex];
    final esPerfecto = respuestasCorrectas == leccion.preguntas.length;
    leccion.estado = EstadoLeccion.completada;
    if (leccionIndex + 1 < _lecciones.length) {
      _lecciones[leccionIndex + 1].estado = EstadoLeccion.disponible;
    }
    _gemas += leccion.gemasRecompensa + (esPerfecto ? 5 : 0);
    _registrarActividadHoy();

    // Nivel = total de lecciones completadas + 1
    final completadas = _lecciones.where((l) => l.estado == EstadoLeccion.completada).length;
    _nivelActual = completadas + 1;

    _leccionActualIndex = leccionIndex + 1;
    _actualizarMision(TipoMision.lecciones, 1);
    _verificarAvatarNivel();
    notifyListeners();
    await _guardarDatos();
  }

  Future<void> perderVida() async {
    if (_vidas > 0) {
      final eraMaximo = _vidas == 5;
      _vidas--;
      if (eraMaximo) _tiempoVidaRecarga = DateTime.now().toIso8601String();
      _iniciarTimerVidas();
      notifyListeners();
      await _guardarDatos();
    }
  }

  Future<void> restaurarVidas() async {
    if (_gemas >= 30 && _vidas < 5) {
      _gemas -= 30;
      _vidas = 5;
      _tiempoVidaRecarga = '';
      _vidaTimer?.cancel();
      notifyListeners();
      await _guardarDatos();
    }
  }

  void _iniciarTimerVidas() {
    _vidaTimer?.cancel();
    if (_vidas >= 5 || _tiempoVidaRecarga.isEmpty) return;
    _vidaTimer = Timer.periodic(const Duration(minutes: 1), (_) => _verificarRegeneracionVida());
  }

  void _verificarRegeneracionVida() {
    if (_vidas >= 5) {
      _vidaTimer?.cancel();
      _tiempoVidaRecarga = '';
      return;
    }
    final ref = DateTime.tryParse(_tiempoVidaRecarga);
    if (ref == null) return;
    final nextTime = ref.add(const Duration(hours: 2));
    if (!DateTime.now().isAfter(nextTime)) return;
    _vidas++;
    _tiempoVidaRecarga = _vidas >= 5 ? '' : nextTime.toIso8601String();
    if (_vidas >= 5) _vidaTimer?.cancel();
    notifyListeners();
    _guardarDatos();
  }

  Future<void> agregarGemasQuiz(int cantidad) async {
    _gemas += cantidad;
    notifyListeners();
    await _guardarDatos();
  }

  // ═════════════════════════════════════════
  //  JOURNAL ENGINE
  // ═════════════════════════════════════════
  Future<void> agregarEntradaGratitud(String texto) async {
    _entradas.insert(0, EntradaGratitud(texto: texto.trim(), fecha: DateTime.now()));
    _diarioHoyCompletado = true;
    _gemas += 8;
    _diariosSemana++;
    _actualizarMision(TipoMision.diario, 1);
    _registrarActividadHoy();
    notifyListeners();
    await _guardarDatos();
  }

  // ═════════════════════════════════════════
  //  MISIONES ENGINE
  // ═════════════════════════════════════════
  void _actualizarMision(TipoMision tipo, double valor) {
    for (final mision in _misiones) {
      if (mision.tipo == tipo && !mision.completada) {
        mision.progreso = (mision.progreso + valor).clamp(0, mision.meta);
        if (mision.progreso >= mision.meta) {
          mision.completada = true;
          _gemas += mision.gemasRecompensa;
          _notificacionesPendientes.add('${mision.emoji} ${mision.titulo} +${mision.gemasRecompensa}💎');
          SoundPlayer.mision();
        }
      }
    }
  }

  void _actualizarMisionCashflow() {
    for (final mision in _misiones) {
      if (mision.tipo == TipoMision.cashflow && !mision.completada) {
        mision.progreso = _fondoCashflow.clamp(0, mision.meta);
        if (mision.progreso >= mision.meta) {
          mision.completada = true;
          _gemas += mision.gemasRecompensa;
          _notificacionesPendientes.add('${mision.emoji} ${mision.titulo} +${mision.gemasRecompensa}💎');
          SoundPlayer.mision();
        }
      }
    }
  }

  // ═════════════════════════════════════════
  //  METAS ENGINE
  // ═════════════════════════════════════════
  Future<void> agregarMeta(String nombre, String emoji, double monto) async {
    _metas.add(MetaFinanciera(nombre: nombre, emoji: emoji, montoObjetivo: monto));
    _actualizarMetasConCashflow();
    notifyListeners();
    await _guardarDatos();
  }

  Future<void> eliminarMeta(String id) async {
    _metas.removeWhere((m) => m.id == id);
    notifyListeners();
    await _guardarDatos();
  }

  void _actualizarMetasConCashflow() {
    for (final meta in _metas) {
      if (!meta.alcanzada) {
        meta.montoActual = _fondoCashflow.clamp(0, meta.montoObjetivo);
        if (meta.montoActual >= meta.montoObjetivo) meta.alcanzada = true;
      }
    }
  }

  // ═════════════════════════════════════════
  //  AVATARES ENGINE
  // ═════════════════════════════════════════
  Future<void> desbloquearAvatar(String avatarId) async {
    final av = _avatares.firstWhere((a) => a.id == avatarId, orElse: () => throw Exception());
    if (!av.desbloqueado && _gemas >= av.costoGemas && _nivelActual >= av.nivelRequerido) {
      _gemas -= av.costoGemas;
      av.desbloqueado = true;
      notifyListeners();
      await _guardarDatos();
    }
  }

  Future<void> seleccionarAvatar(String emoji) async {
    _avatarActual = emoji;
    notifyListeners();
    await _guardarDatos();
  }

  void _verificarAvatarNivel() {
    for (final av in _avatares) {
      if (!av.desbloqueado && av.costoGemas == 0 && _nivelActual >= av.nivelRequerido) {
        av.desbloqueado = true;
      }
    }
  }

  bool puedeDesbloquearAvatar(AvatarItem av) =>
      !av.desbloqueado && _gemas >= av.costoGemas && _nivelActual >= av.nivelRequerido;

  // ═════════════════════════════════════════
  //  SEGURIDAD PADRES
  // ═════════════════════════════════════════
  bool verificarPin(String pin) => pin == _pinPadres;

  Future<void> cambiarPin(String nuevoPin) async {
    _pinPadres = nuevoPin;
    await _guardarDatos();
  }

  // ═════════════════════════════════════════
  //  STOCK SIMULATION
  // ═════════════════════════════════════════
  void _iniciarSimulacionAcciones() {
    _simulacionTimer = Timer(const Duration(seconds: 3), () {
      if (_fondoCashflow > 0) _fluctuarAcciones(afectarCashflow: true);
    });
  }

  void _fluctuarAcciones({bool afectarCashflow = true}) {
    final rng = Random();
    double deltaTotal = 0;
    for (final accion in _acciones) {
      final cambio = (rng.nextDouble() - 0.48) * 2.5;
      accion.variacion = cambio;
      accion.precio = (accion.precio * (1 + cambio / 100)).clamp(1.0, 9999.0);
      deltaTotal += cambio;
    }
    if (afectarCashflow && _fondoCashflow > 0) {
      final promedio = deltaTotal / _acciones.length;
      final impacto = _fondoCashflow * (promedio / 100) * 0.2;
      _fondoCashflow = (_fondoCashflow + impacto).clamp(0.0, 99999.0);
      _actualizarMetasConCashflow();
      _actualizarMisionCashflow();
    }
    notifyListeners();
  }

  Future<void> simularMovimientoMercado() async {
    _fluctuarAcciones(afectarCashflow: true);
    await _guardarDatos();
  }

  // ═════════════════════════════════════════
  //  EXPORTAR DATOS
  // ═════════════════════════════════════════
  Map<String, dynamic> exportarDatos() {
    return {
      'version': 3,
      'fecha': DateTime.now().toIso8601String(),
      'gemas': _gemas,
      'vidas': _vidas,
      'racha': _racha,
      'nivel': _nivelActual,
      'avatar': _avatarActual,
      'reinversion': _fondoReinversion,
      'estiloVida': _estiloVida,
      'estiloVidaSemana': _estiloVidaSemana,
      'cashflow': _fondoCashflow,
      'totalVentas': totalVentas,
      'leccionesCompletadas': leccionesCompletadas,
      'totalEntradas': _entradas.length,
      'transacciones': _transacciones.length,
      'metas': _metas.length,
    };
  }

  // ═════════════════════════════════════════
  //  RESET
  // ═════════════════════════════════════════
  Future<void> resetearProgreso() async {
    _simulacionTimer?.cancel();
    final prefs = await SharedPreferences.getInstance();
    final pinActual = _pinPadres; // Preservar el PIN al resetear
    await prefs.clear();
    _racha = 0;
    _gemas = 50;
    _vidas = 5;
    _tiempoVidaRecarga = '';
    _nivelActual = 1;
    _ultimaFechaRacha = '';
    _avatarActual = '🦋';
    _fondoReinversion = 0;
    _estiloVida = 0;
    _estiloVidaSemana = 0;
    _fondoCashflow = 0;
    _transacciones = [];
    _historialGrafica = [];
    _lecciones = crearLecciones();
    _entradas = [];
    _diarioHoyCompletado = false;
    _diariosSemana = 0;
    _misiones = crearMisionesSemanales();
    _semanaActual = '';
    _metas = [];
    _avatares = crearAvatares();
    _onboardingCompletado = false;
    _pinPadres = pinActual; // Restaurar el PIN
    _retoProgreso = {};
    _retoModulos = null;
    notifyListeners();
    await _guardarDatos();
  }
}
