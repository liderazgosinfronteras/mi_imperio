// lib/providers/app_provider.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/app_models.dart';
import '../utils/sound_player.dart';

class AppProvider extends ChangeNotifier {
  // ── GAMIFICATION ──────────────────────────
  int _racha = 0;
  int _gemas = 50;
  int _vidas = 5;
  int _nivelActual = 1;
  String _ultimaFechaRacha = '';
  String _avatarActual = '🦋';

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
    super.dispose();
  }

  Future<void> _cargarDatos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('schemaVersion', 3);

    _onboardingCompletado = prefs.getBool('onboardingCompletado') ?? false;
    _racha = prefs.getInt('racha') ?? 0;
    _gemas = prefs.getInt('gemas') ?? 50;
    _vidas = prefs.getInt('vidas') ?? 5;
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

    _verificarRachaDelDia();
    _actualizarMetasConCashflow(); // Asegura que las metas estén al día al cargar
    notifyListeners();
  }

  Future<void> _guardarDatos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('schemaVersion', 3);
    await prefs.setBool('onboardingCompletado', _onboardingCompletado);
    await prefs.setInt('racha', _racha);
    await prefs.setInt('gemas', _gemas);
    await prefs.setInt('vidas', _vidas);
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
      _vidas--;
      notifyListeners();
      await _guardarDatos();
    }
  }

  Future<void> restaurarVidas() async {
    if (_gemas >= 30 && _vidas < 5) {
      _gemas -= 30;
      _vidas = 5;
      notifyListeners();
      await _guardarDatos();
    }
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
          SoundPlayer.mision();
        }
      }
    }
  }

  // Para misiones de cashflow: el progreso es el valor absoluto del fondo
  void _actualizarMisionCashflow() {
    for (final mision in _misiones) {
      if (mision.tipo == TipoMision.cashflow && !mision.completada) {
        mision.progreso = _fondoCashflow.clamp(0, mision.meta);
        if (mision.progreso >= mision.meta) {
          mision.completada = true;
          _gemas += mision.gemasRecompensa;
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
    notifyListeners();
    await _guardarDatos();
  }
}
