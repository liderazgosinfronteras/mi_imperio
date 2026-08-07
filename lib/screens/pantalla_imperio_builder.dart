// lib/screens/pantalla_imperio_builder.dart — Imperio Builder 🏙️
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/imperio_model.dart';
import '../providers/app_provider.dart';
import '../services/firebase_service.dart';
import '../theme.dart';
import '../utils/sound_player.dart';

// ─── Opción de decisión en un evento ─────────────────────────────
class _Opcion {
  final String emoji, label, descripcion, leccion;
  final double efectoCash;   // relativo al ingreso semanal si cashRelativo=true
  final bool cashRelativo;
  final double multSemanas;  // multiplicador de ingresos (0.6 = -40%, 1.5 = +50%)
  final int duracionSemanas;
  const _Opcion({
    required this.emoji, required this.label,
    required this.descripcion, required this.leccion,
    this.efectoCash = 0, this.cashRelativo = false,
    this.multSemanas = 1.0, this.duracionSemanas = 0,
  });
}

// ─── Evento semanal ───────────────────────────────────────────────
class _Evento {
  final String emoji, titulo, descripcion, leccion;
  final bool requiereDecision;
  final double efectoCash;
  final bool cashRelativo;
  final double multSemanas;
  final int duracionSemanas;
  final List<_Opcion> opciones;
  const _Evento({
    required this.emoji, required this.titulo,
    required this.descripcion, required this.leccion,
    this.requiereDecision = false,
    this.efectoCash = 0, this.cashRelativo = false,
    this.multSemanas = 1.0, this.duracionSemanas = 0,
    this.opciones = const [],
  });
}

// ─── Banco de eventos ─────────────────────────────────────────────
final _kEventos = <_Evento>[
  // ── Positivos ──────────────────────────────────────────────────
  const _Evento(
    emoji: '🌟', titulo: '¡Publicación Viral!',
    descripcion: 'Tu contenido en redes explotó. Miles de personas descubren tu negocio esta semana.',
    leccion: '💡 Las redes sociales pueden duplicar tus ingresos sin costo. El marketing de contenidos es la inversión más rentable del siglo XXI.',
    multSemanas: 2.0, duracionSemanas: 2,
  ),
  const _Evento(
    emoji: '🎄', titulo: 'Temporada Alta',
    descripcion: 'Los clientes están comprando más que nunca. El mercado está en su mejor momento.',
    leccion: '💡 Aprovecha las temporadas altas para generar el flujo de caja que te sostiene en las bajas. Ahorra el excedente.',
    multSemanas: 1.7, duracionSemanas: 2,
  ),
  const _Evento(
    emoji: '🤝', titulo: '¡Cliente Estrella!',
    descripcion: 'Una empresa grande contrató tus servicios. Firmaron un contrato importante.',
    leccion: '💡 Un cliente grande puede representar el 30-50% de tus ingresos. Trátalo como oro, pero no dependas solo de él.',
    efectoCash: 3.0, cashRelativo: true,
  ),
  // ── Negativos automáticos ──────────────────────────────────────
  const _Evento(
    emoji: '📉', titulo: 'Crisis del Mercado',
    descripcion: 'Una caída económica afecta toda la industria. Las ventas bajan en todos los sectores.',
    leccion: '💡 Las crisis son cíclicas e inevitables. Tener múltiples fuentes de ingreso y un fondo de emergencia es tu mejor protección.',
    multSemanas: 0.55, duracionSemanas: 3,
  ),
  // ── Decisiones ────────────────────────────────────────────────
  _Evento(
    emoji: '⚠️', titulo: 'Temporada Baja',
    descripcion: 'Las ventas cayeron un 40%. Los clientes están gastando menos. Tienes que decidir cómo reaccionar.',
    leccion: '💡 Todo negocio tiene ciclos. La clave está en tener reservas para aguantar los valles sin endeudarse.',
    requiereDecision: true,
    opciones: [
      const _Opcion(
        emoji: '🎁', label: 'Hacer descuentos',
        descripcion: 'Atraes clientes con precios más bajos. Recuperas ventas pero reduces tu margen de ganancia.',
        multSemanas: 0.85, duracionSemanas: 1,
        leccion: '💡 Los descuentos atraen volumen pero destruyen el margen. Úsalos estratégicamente, nunca como norma.',
      ),
      const _Opcion(
        emoji: '📢', label: 'Invertir en marketing',
        descripcion: 'Gastas en publicidad ahora para recuperar clientes más rápido.',
        efectoCash: -0.8, cashRelativo: true, multSemanas: 1.1, duracionSemanas: 3,
        leccion: '💡 El marketing bien usado genera 5x su costo. Es una inversión, no un gasto.',
      ),
      const _Opcion(
        emoji: '🛡️', label: 'Aguantar con reservas',
        descripcion: 'Usas tus ahorros para sostener el negocio. La temporada baja pasará sola.',
        efectoCash: -0.6, cashRelativo: true,
        leccion: '💡 El fondo de emergencia existe exactamente para esto. Aguantar sin dañar el negocio es sabiduría financiera.',
      ),
    ],
  ),
  _Evento(
    emoji: '🔧', titulo: 'Equipo Dañado',
    descripcion: 'Tu herramienta principal se dañó. Sin ella tu productividad cae a la mitad. ¿Qué haces?',
    leccion: '💡 Los gastos imprevistos son inevitables. El fondo de emergencia no es opcional, es una necesidad.',
    requiereDecision: true,
    opciones: [
      const _Opcion(
        emoji: '🔨', label: 'Reparar de inmediato',
        descripcion: 'Gastas en la reparación pero sigues operando sin perder más ingresos.',
        efectoCash: -0.5, cashRelativo: true,
        leccion: '💡 Las herramientas de trabajo son prioridad. Sin ellas, no hay negocio posible.',
      ),
      const _Opcion(
        emoji: '⏳', label: 'Esperar para reparar',
        descripcion: 'Ahorras el dinero ahora, pero operas al 40% de capacidad por 3 semanas.',
        multSemanas: 0.4, duracionSemanas: 3,
        leccion: '💡 Ahorrar en herramientas clave siempre sale más caro. El costo de oportunidad supera el gasto.',
      ),
    ],
  ),
  _Evento(
    emoji: '💸', titulo: 'Impuesto Inesperado',
    descripcion: 'El gobierno anunció un impuesto especial para negocios este trimestre. Debes pagarlo.',
    leccion: '💡 Los impuestos son inevitables. Un buen contador los planifica con antelación. No los evites, adminístralos.',
    requiereDecision: true,
    opciones: [
      const _Opcion(
        emoji: '✅', label: 'Pagar completo ahora',
        descripcion: 'Sale de tus ahorros. Sin deudas ni intereses. Paz mental garantizada.',
        efectoCash: -1.5, cashRelativo: true,
        leccion: '💡 Pagar a tiempo evita multas e intereses. Siempre protege tu historial financiero.',
      ),
      const _Opcion(
        emoji: '📆', label: 'Fraccionar en 4 cuotas',
        descripcion: 'Pagas en 4 semanas pero con 25% de interés adicional. Mejor flujo de caja ahora.',
        efectoCash: -0.5, cashRelativo: true, multSemanas: 0.88, duracionSemanas: 4,
        leccion: '💡 Fraccionar tiene costo (el interés). Cuando puedes pagar completo, siempre es la mejor opción.',
      ),
    ],
  ),
  _Evento(
    emoji: '🥊', titulo: 'Competidor Nuevo',
    descripcion: 'Una empresa grande entró a tu mercado con precios más bajos. Tus clientes la están evaluando.',
    leccion: '💡 La competencia es inevitable. Diferenciarte por calidad o nicho es más efectivo que pelear en precio.',
    requiereDecision: true,
    opciones: [
      const _Opcion(
        emoji: '✨', label: 'Diferenciarte en calidad',
        descripcion: 'Inviertes en mejorar la experiencia. No compites en precio, compites en valor.',
        efectoCash: -0.5, cashRelativo: true, multSemanas: 1.25, duracionSemanas: 5,
        leccion: '💡 La diferenciación protege tu margen. Las empresas que compiten en precio destruyen su rentabilidad.',
      ),
      const _Opcion(
        emoji: '📉', label: 'Bajar tus precios',
        descripcion: 'Compites en precio. Mantienes clientes pero tus ganancias caen significativamente.',
        multSemanas: 0.65, duracionSemanas: 4,
        leccion: '💡 La guerra de precios perjudica a todos. Úsala solo como último recurso y con estrategia de salida.',
      ),
      const _Opcion(
        emoji: '🎯', label: 'Especializarte en un nicho',
        descripcion: 'Te enfocas en el segmento que el competidor grande no atiende bien.',
        efectoCash: -0.3, cashRelativo: true, multSemanas: 1.35, duracionSemanas: 6,
        leccion: '💡 Los nichos son el refugio de los emprendedores. Menos clientes, pero más lealtad y mayor margen.',
      ),
    ],
  ),
  _Evento(
    emoji: '📈', titulo: 'Tus Costos Subieron',
    descripcion: 'Los costos de operación aumentaron 35% por inflación. Tu margen neto se está reduciendo.',
    leccion: '💡 Controlar costos es tan importante como aumentar ingresos. Revisa tus gastos mensualmente.',
    requiereDecision: true,
    opciones: [
      const _Opcion(
        emoji: '💰', label: 'Subir tus precios',
        descripcion: 'Trasladas el aumento al cliente. Puedes perder algunos, pero proteges tu margen.',
        multSemanas: 0.9, duracionSemanas: 1,
        leccion: '💡 Si tu producto tiene valor real, los clientes aceptan ajustes razonables de precio.',
      ),
      const _Opcion(
        emoji: '✂️', label: 'Recortar gastos innecesarios',
        descripcion: 'Identificas gastos que no generan valor y los eliminas. Eficiencia pura.',
        efectoCash: 0.3, cashRelativo: true, multSemanas: 0.88, duracionSemanas: 2,
        leccion: '💡 Auditar gastos puede liberar 15-30% de tu dinero sin afectar los ingresos reales.',
      ),
      const _Opcion(
        emoji: '🤖', label: 'Automatizar procesos',
        descripcion: 'Inviertes en herramientas que reducen costos operativos para siempre.',
        efectoCash: -1.2, cashRelativo: true, multSemanas: 1.2, duracionSemanas: 8,
        leccion: '💡 La automatización tiene costo inicial pero retorno indefinido. Es la mejor inversión a largo plazo.',
      ),
    ],
  ),
  _Evento(
    emoji: '🌍', titulo: 'Oportunidad de Expansión',
    descripcion: 'Un nuevo mercado se abrió. Tienes 1 semana para decidir si expandirte antes de que tu competencia lo haga.',
    leccion: '💡 Las oportunidades tienen ventana de tiempo. Analizar rápido y decidir con datos es una habilidad clave.',
    requiereDecision: true,
    opciones: [
      const _Opcion(
        emoji: '🚀', label: 'Expandirme ahora',
        descripcion: 'Inviertes capital en el nuevo mercado. Crecimiento acelerado pero mayor riesgo.',
        efectoCash: -2.0, cashRelativo: true, multSemanas: 1.45, duracionSemanas: 8,
        leccion: '💡 Expandir cuando tienes solidez financiera es el momento correcto. Riesgo calculado = inteligencia financiera.',
      ),
      const _Opcion(
        emoji: '📊', label: 'Esperar y acumular capital',
        descripcion: 'Analizas mejor y esperas tener más capital. Más seguro, pero llegas tarde.',
        leccion: '💡 "Primero habla, después actúa" aplica en expansión. Una mala expansión puede hundir un buen negocio.',
      ),
    ],
  ),
];

// ═══════════════════════════════════════════════════════════════
//  PANTALLA PRINCIPAL
// ═══════════════════════════════════════════════════════════════
class PantallaImperioBuilder extends StatefulWidget {
  const PantallaImperioBuilder({super.key});
  @override
  State<PantallaImperioBuilder> createState() => _PantallaImperioBuilderState();
}

class _PantallaImperioBuilderState extends State<PantallaImperioBuilder>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  List<IBNegocio> _negocios = crearNegocios();
  double _dinero = 0;
  double _totalGanado = 0;
  Timer? _ticker;
  Timer? _timerGuardado;
  int    _prestiges = 0;
  bool _cargado = false;
  String? _mensajeHito;
  IBNegocio? _leccionActual;
  late AnimationController _hitoCtrl;
  late Animation<double> _hitoAnim;
  int _hitoActual = -1;

  // ── Sistema semanal ──────────────────────────────────────────
  int _semana = 0;
  double _ingresoUltimaSemana = 0;
  double _gastosUltimaSemana  = 0;
  bool _semanaAnimando = false;

  // ── Eventos ──────────────────────────────────────────────────
  _Evento? _eventoActivo;
  _Opcion? _decisionTomada;
  bool _mostrarResultadoDecision = false;
  double _efectoMult   = 1.0;
  int _semanasEfecto   = 0;

  final _rand = Random();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _hitoCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _hitoAnim = CurvedAnimation(parent: _hitoCtrl, curve: Curves.elasticOut);
    _cargarEstado();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _guardarEstado();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _ticker?.cancel();
    _timerGuardado?.cancel();
    _guardarEstado();
    _hitoCtrl.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────
  //  PERSISTENCIA
  // ─────────────────────────────────────────
  Future<void> _cargarEstado() async {
    final prefs = await SharedPreferences.getInstance();
    final dinero      = prefs.getDouble('ib_dinero') ?? 50.0;
    final totalGanado = prefs.getDouble('ib_total') ?? 0;
    final ultimaVez   = prefs.getString('ib_ultima') ?? '';
    final nivelesJson = prefs.getString('ib_niveles') ?? '{}';
    final prestiges   = prefs.getInt('ib_prestiges') ?? 0;
    final semana      = prefs.getInt('ib_semana') ?? 0;
    final niveles     = Map<String, dynamic>.from(jsonDecode(nivelesJson));

    final negocios = crearNegocios();
    for (final n in negocios) {
      if (niveles.containsKey(n.id)) n.nivel = niveles[n.id] as int;
    }

    // Ganancias offline: semanas que pasaron × ingreso neto semanal
    double offline = 0;
    if (ultimaVez.isNotEmpty) {
      final ultima = DateTime.tryParse(ultimaVez);
      if (ultima != null) {
        final segundosReales = DateTime.now().difference(ultima).inSeconds.clamp(0, 43200);
        // 1 semana-juego = 8 segundos reales → cuántas semanas pasaron
        final semanasOffline = (segundosReales / 8).floor().clamp(0, 200);
        final ingresoSeg = negocios.fold(0.0, (s, n) => s + n.ingresoActual);
        // Ingreso neto por semana = bruto×8×0.75 (después del 25% de gastos)
        offline = (ingresoSeg * 8 * 0.75 * semanasOffline).clamp(0.0, 50000.0);
      }
    }

    if (!mounted) return;
    setState(() {
      _negocios    = negocios;
      _dinero      = dinero + offline;
      _totalGanado = totalGanado + offline;
      _cargado     = true;
      _hitoActual  = _calcHitoActual(totalGanado);
      _prestiges   = prestiges;
      _semana      = semana;
    });

    if (offline >= 10) _mostrarOffline(offline);
    _iniciarTicker();
  }

  Future<void> _guardarEstado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('ib_dinero', _dinero);
    await prefs.setDouble('ib_total', _totalGanado);
    await prefs.setString('ib_ultima', DateTime.now().toIso8601String());
    await prefs.setInt('ib_semana', _semana);
    final niveles = {for (final n in _negocios) n.id: n.nivel};
    await prefs.setString('ib_niveles', jsonEncode(niveles));
    await prefs.setInt('ib_prestiges', _prestiges);
    if (kFirebaseEnabled) {
      FirebaseService.updateLeaderboard(_totalGanado, nivelImperio(_totalGanado));
    }
  }

  // ─────────────────────────────────────────
  //  TICKER SEMANAL (1 semana = 8 segundos)
  // ─────────────────────────────────────────
  void _iniciarTicker() {
    _ticker?.cancel();
    _timerGuardado?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 8), (_) {
      if (!mounted) return;
      // Esperar si hay una decisión pendiente
      if (_eventoActivo != null && _eventoActivo!.requiereDecision && !_mostrarResultadoDecision) return;
      _procesarSemana();
    });
    _timerGuardado = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) _guardarEstado();
    });
  }

  void _procesarSemana() {
    if (!_negocios.any((n) => n.comprado)) {
      // Sin negocios, nada que procesar
      setState(() => _semana++);
      return;
    }

    _semana++;

    // Decrement effect timer
    if (_semanasEfecto > 0) {
      _semanasEfecto--;
      if (_semanasEfecto == 0 && mounted) setState(() => _efectoMult = 1.0);
    }

    final bonus = bonusMultiplier(_totalGanado) * pow(1.25, _prestiges.clamp(0, 7));
    final baseIngSemana = _negocios.fold(0.0, (s, n) => s + n.ingresoActual) * bonus * 8;

    // Ingresos brutos con efecto de evento activo
    final ingresoSemana = baseIngSemana * _efectoMult;
    // Gastos fijos: 25% del ingreso base (siempre se aplican)
    final gastosSemana  = baseIngSemana * 0.25;
    final netaSemana    = ingresoSemana - gastosSemana;

    setState(() {
      _dinero          = (_dinero + netaSemana).clamp(0, double.infinity);
      if (netaSemana > 0) _totalGanado += netaSemana;
      _ingresoUltimaSemana = ingresoSemana;
      _gastosUltimaSemana  = gastosSemana;
      _semanaAnimando  = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _semanaAnimando = false);
    });

    _verificarHitos();

    // Trigger evento cada ~3-4 semanas
    if (_semana > 2 && _semana % 3 == 0 && _eventoActivo == null) {
      Future.delayed(const Duration(milliseconds: 1200), _triggerEvento);
    }
  }

  // ─────────────────────────────────────────
  //  SISTEMA DE EVENTOS
  // ─────────────────────────────────────────
  void _triggerEvento() {
    if (!mounted || !_negocios.any((n) => n.comprado)) return;
    final evento = _kEventos[_rand.nextInt(_kEventos.length)];
    setState(() => _eventoActivo = evento);

    if (!evento.requiereDecision) {
      _aplicarEfectoEvento(evento.efectoCash, evento.cashRelativo,
          evento.multSemanas, evento.duracionSemanas);
      final positivo = evento.multSemanas >= 1.0 && evento.efectoCash >= 0;
      positivo ? SoundPlayer.payday() : SoundPlayer.pasivo();
    } else {
      SoundPlayer.click();
    }
  }

  void _aplicarEfectoEvento(double cash, bool relativo, double mult, int duracion) {
    final ingresoSemana = _ingresoPorSegundoNeto * 8;
    final cashAbs = relativo ? cash * ingresoSemana : cash;
    setState(() {
      _dinero = (_dinero + cashAbs).clamp(0, double.infinity);
      if (cashAbs > 0) _totalGanado += cashAbs;
      _efectoMult    = mult;
      _semanasEfecto = duracion;
    });
  }

  void _aplicarDecision(_Opcion opcion) {
    _aplicarEfectoEvento(opcion.efectoCash, opcion.cashRelativo,
        opcion.multSemanas, opcion.duracionSemanas);
    final positivo = opcion.efectoCash >= 0 && opcion.multSemanas >= 1.0;
    positivo ? SoundPlayer.correcto() : SoundPlayer.pasivo();
    setState(() {
      _decisionTomada = opcion;
      _mostrarResultadoDecision = true;
    });
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) setState(() {
        _eventoActivo = null;
        _decisionTomada = null;
        _mostrarResultadoDecision = false;
      });
    });
  }

  // ─────────────────────────────────────────
  //  HITOS
  // ─────────────────────────────────────────
  int _calcHitoActual(double total) {
    int h = -1;
    for (int i = 0; i < kHitos.length; i++) {
      if (total >= kHitos[i].$1) h = i;
    }
    return h;
  }

  void _verificarHitos() {
    final nuevo = _calcHitoActual(_totalGanado);
    if (nuevo > _hitoActual) {
      _hitoActual = nuevo;
      final h = kHitos[nuevo];
      setState(() => _mensajeHito = '${h.$1} ${h.$2}\n${h.$3}\n${h.$4}');
      _hitoCtrl.forward(from: 0);
      nuevo == kHitos.length - 1 ? SoundPlayer.victoria() : SoundPlayer.mision();
    }
  }

  // ─────────────────────────────────────────
  //  ACCIONES
  // ─────────────────────────────────────────
  void _comprarOUpgrade(IBNegocio n) {
    final costo = n.costoSiguiente;
    if (_dinero < costo) return;
    final esPrimero = !n.comprado;
    setState(() { _dinero -= costo; n.nivel++; });
    SoundPlayer.compra();
    _guardarEstado();
    if (esPrimero) setState(() => _leccionActual = n);
  }

  int get _totalNegocios => _negocios.where((n) => n.comprado).length;

  // Ingreso neto por segundo (después del 25% de gastos)
  double get _ingresoPorSegundoNeto =>
      _negocios.fold(0.0, (s, n) => s + n.ingresoActual) *
      bonusMultiplier(_totalGanado) * pow(1.25, _prestiges.clamp(0, 7)) * 0.75 * _efectoMult;

  double get _ingresoSemanalNeto => _ingresoPorSegundoNeto * 8;

  String _etaParaComprar(IBNegocio n) {
    final falta = n.costoSiguiente - _dinero;
    if (falta <= 0 || _ingresoPorSegundoNeto <= 0) return '∞';
    final seg = falta / _ingresoPorSegundoNeto;
    if (seg < 60)    return '${seg.round()}s';
    if (seg < 3600)  return '${(seg / 60).round()}min';
    if (seg < 86400) return '${(seg / 3600).toStringAsFixed(1)}h';
    return '${(seg / 86400).round()}d';
  }

  // ─────────────────────────────────────────
  //  PRESTIGE
  // ─────────────────────────────────────────
  static const _maxPrestiges = 7;

  void _hacerPrestige() {
    final esMaximo = _prestiges >= _maxPrestiges;
    final multActual = pow(1.25, _prestiges.clamp(0, _maxPrestiges)).toStringAsFixed(2);
    final multSig    = pow(1.25, (_prestiges + 1).clamp(0, _maxPrestiges)).toStringAsFixed(2);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('⚡ PRESTIGE', style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.w900, fontSize: 20)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(esMaximo ? '👑' : '⚡', style: const TextStyle(fontSize: 60)),
          const SizedBox(height: 12),
          Text(
            esMaximo
              ? '¡Alcanzaste el PRESTIGE MÁXIMO!\nSigues ganando con el multiplicador ×$multActual para siempre.'
              : '¡Alcanzaste el Millón!\nReinicia tu Imperio con un multiplicador permanente de ×1.25.',
            style: AppTextStyles.body, textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text('Prestige: $_prestiges / $_maxPrestiges', style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(
            esMaximo ? 'Multiplicador máximo: ×$multActual 🏆'
                     : 'Multiplicador: ×$multActual  →  ×$multSig',
            style: const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris))),
          if (!esMaximo) TextButton.icon(
            icon: const Text('📲', style: TextStyle(fontSize: 16)),
            label: const Text('Compartir', style: TextStyle(color: AppColors.neonMorado)),
            onPressed: () {
              Share.share('⚡ ¡Hice PRESTIGE ${_prestiges + 1} en Imperio Builder!\n'
                  'Alcancé \$1,000,000 y reinicié con ×$multSig\n'
                  '¡Construye tu libertad financiera! 💪\n👑 Mi Imperio — App LSF');
            },
          ),
          if (!esMaximo) ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFD700)),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _prestiges++;
                _negocios    = crearNegocios();
                _dinero      = 50.0;
                _totalGanado = 0;
                _hitoActual  = -1;
                _leccionActual = null;
                _mensajeHito   = null;
                _efectoMult    = 1.0;
                _semanasEfecto = 0;
                _eventoActivo  = null;
              });
              _guardarEstado();
              SoundPlayer.victoria();
            },
            child: const Text('⚡ PRESTIGE!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
          ),
          if (esMaximo) ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonMorado),
            onPressed: () => Navigator.pop(context),
            child: const Text('¡Soy Leyenda! 👑', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
          ),
        ],
      ),
    );
  }

  void _mostrarOffline(double cantidad) {
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.fondoCard,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('⏰ ¡Mientras estabas fuera!', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w900)),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text('🏙️', style: TextStyle(fontSize: 60)),
            const SizedBox(height: 10),
            const Text('Tus negocios trabajaron sin ti.\nDespués de gastos de operación, ganaste:', style: AppTextStyles.body, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(_formatNum(cantidad), style: const TextStyle(color: AppColors.neonVerde, fontSize: 32, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            const Text('💡 Eso es ingreso pasivo en acción. Los negocios trabajan aunque tú descanses, pero los gastos tampoco paran.', style: AppTextStyles.caption, textAlign: TextAlign.center),
          ]),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonVerde),
              onPressed: () => Navigator.pop(context),
              child: const Text('¡Genial! 🎉', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      );
    });
  }

  // ═══════════════════════════════════════════════════════════════
  //  BUILD
  // ═══════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    if (!_cargado) return const Scaffold(backgroundColor: AppColors.fondoOscuro, body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Stack(children: [
          Column(children: [
            _buildHeader(),
            _buildProgreso(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 100),
                children: [
                  if (_semanaAnimando) _buildResumenSemana(),
                  if (_efectoMult != 1.0) _buildEfectoActivo(),
                  _buildCityView(),
                  const SizedBox(height: 16),
                  const Text('🏗️ Construye tu Imperio', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 8),
                  ..._negocios.map((n) => _buildNegocioCard(n)),
                ],
              ),
            ),
          ]),
          if (_leccionActual != null) _buildLeccionPopup(_leccionActual!),
          if (_mensajeHito != null) _buildHitoPopup(),
          if (_eventoActivo != null) _buildEventoCard(),
        ]),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  RESUMEN SEMANAL (banner animado)
  // ─────────────────────────────────────────
  Widget _buildResumenSemana() {
    final neta = _ingresoUltimaSemana - _gastosUltimaSemana;
    final positivo = neta >= 0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: positivo
          ? [const Color(0xFF0D2A0D), const Color(0xFF1A4A1A)]
          : [const Color(0xFF2A0D0D), const Color(0xFF4A1A1A)]),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: positivo ? AppColors.neonVerde : Colors.redAccent, width: 1.5),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(positivo ? '📊' : '📉', style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text('Semana $_semana — Resultado', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13)),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _statSemana('💰 Ingresos', _ingresoUltimaSemana, AppColors.neonVerde),
          _statSemana('💸 Gastos op.', -_gastosUltimaSemana, Colors.redAccent),
          _statSemana(positivo ? '✅ Neta' : '⚠️ Neta', neta, positivo ? AppColors.neonAmarillo : Colors.redAccent),
        ]),
        if (_efectoMult != 1.0) ...[
          const SizedBox(height: 6),
          Text(
            _efectoMult > 1.0
              ? '🌟 Multiplicador activo ×${_efectoMult.toStringAsFixed(1)} por $_semanasEfecto semanas más'
              : '⚠️ Efecto negativo ×${_efectoMult.toStringAsFixed(1)} por $_semanasEfecto semanas más',
            style: TextStyle(color: _efectoMult > 1.0 ? AppColors.neonAmarillo : Colors.orange, fontSize: 11),
          ),
        ],
      ]),
    );
  }

  Widget _statSemana(String label, double valor, Color color) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
    Text('${valor >= 0 ? "+" : ""}${_formatNum(valor)}', style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 13)),
  ]);

  Widget _buildEfectoActivo() {
    final positivo = _efectoMult > 1.0;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: (positivo ? AppColors.neonVerde : Colors.orange).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: (positivo ? AppColors.neonVerde : Colors.orange).withValues(alpha: 0.4)),
      ),
      child: Row(children: [
        Text(positivo ? '🌟' : '⚠️', style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(child: Text(
          positivo
            ? 'Efecto positivo activo: ingresos ×${_efectoMult.toStringAsFixed(1)} por $_semanasEfecto semanas'
            : 'Efecto negativo activo: ingresos ×${_efectoMult.toStringAsFixed(1)} por $_semanasEfecto semanas',
          style: TextStyle(color: positivo ? AppColors.neonVerde : Colors.orange, fontSize: 12, fontWeight: FontWeight.w700),
        )),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  CARD DE EVENTO
  // ─────────────────────────────────────────
  Widget _buildEventoCard() {
    final e = _eventoActivo!;
    final positivo = e.multSemanas >= 1.0 && e.efectoCash >= 0;
    final colorBorde = e.requiereDecision ? Colors.orange : (positivo ? AppColors.neonVerde : Colors.redAccent);

    return Container(
      color: Colors.black.withValues(alpha: 0.82),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.fondoCard,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: colorBorde, width: 2),
              boxShadow: [BoxShadow(color: colorBorde.withValues(alpha: 0.3), blurRadius: 24)],
            ),
            child: _mostrarResultadoDecision ? _buildResultadoDecision() : _buildContenidoEvento(e, colorBorde),
          ),
        ),
      ),
    );
  }

  Widget _buildContenidoEvento(_Evento e, Color colorBorde) {
    final positivo = e.multSemanas >= 1.0 && e.efectoCash >= 0;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        e.requiereDecision ? '🎯 DECISIÓN FINANCIERA' : (positivo ? '🌟 BUENAS NOTICIAS' : '⚠️ ALERTA FINANCIERA'),
        style: TextStyle(color: colorBorde, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1),
      ),
      const SizedBox(height: 14),
      Text(e.emoji, style: const TextStyle(fontSize: 54)),
      const SizedBox(height: 10),
      Text(e.titulo, style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
      const SizedBox(height: 10),
      Text(e.descripcion, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
      const SizedBox(height: 14),

      if (!e.requiereDecision) ...[
        // Mostrar efecto automático
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: colorBorde.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            e.multSemanas != 1.0
              ? '${e.multSemanas > 1 ? "+" : ""}${((e.multSemanas - 1) * 100).round()}% ingresos × ${e.duracionSemanas} semanas'
              : e.efectoCash > 0
                ? '+${_formatNum(e.efectoCash * _ingresoSemanalNeto)}'
                : _formatNum(e.efectoCash * _ingresoSemanalNeto),
            style: TextStyle(color: colorBorde, fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12)),
          child: Text(e.leccion, style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 12, height: 1.5), textAlign: TextAlign.center),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () => setState(() => _eventoActivo = null),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            decoration: BoxDecoration(color: colorBorde, borderRadius: BorderRadius.circular(12)),
            child: const Text('Entendido ✓', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
          ),
        ),
      ] else ...[
        // Opciones de decisión
        const SizedBox(height: 4),
        const Text('¿Qué decides hacer?', style: TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 12),
        ...e.opciones.map((op) {
          final opPositivo = op.efectoCash >= 0 && op.multSemanas >= 1.0;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () => _aplicarDecision(op),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(children: [
                  Text(op.emoji, style: const TextStyle(fontSize: 26)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(op.label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
                    const SizedBox(height: 3),
                    Text(op.descripcion, style: const TextStyle(color: Colors.white54, fontSize: 11, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                  ])),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, color: opPositivo ? AppColors.neonVerde : Colors.orange, size: 14),
                ]),
              ),
            ),
          );
        }),
      ],
    ]);
  }

  Widget _buildResultadoDecision() {
    final op = _decisionTomada!;
    final cashAbs = op.cashRelativo ? op.efectoCash * _ingresoSemanalNeto : op.efectoCash;
    final positivo = cashAbs >= 0 && op.multSemanas >= 1.0;

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(positivo ? '✅ BUENA DECISIÓN' : '⚡ DECISIÓN TOMADA',
        style: TextStyle(color: positivo ? AppColors.neonVerde : Colors.orange,
          fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1)),
      const SizedBox(height: 14),
      Text(op.emoji, style: const TextStyle(fontSize: 50)),
      const SizedBox(height: 8),
      Text(op.label, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
      const SizedBox(height: 12),
      if (op.efectoCash != 0)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: (cashAbs >= 0 ? AppColors.neonVerde : Colors.redAccent).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${cashAbs >= 0 ? "+" : ""}${_formatNum(cashAbs)}',
            style: TextStyle(color: cashAbs >= 0 ? AppColors.neonVerde : Colors.redAccent, fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      if (op.multSemanas != 1.0) ...[
        const SizedBox(height: 8),
        Text(
          '${op.multSemanas > 1 ? "+" : ""}${((op.multSemanas - 1) * 100).round()}% ingresos × ${op.duracionSemanas} semanas',
          style: TextStyle(color: op.multSemanas > 1 ? AppColors.neonVerde : Colors.orange, fontWeight: FontWeight.w700, fontSize: 13),
        ),
      ],
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12)),
        child: Text(op.leccion, style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 12, height: 1.5), textAlign: TextAlign.center),
      ),
    ]);
  }

  // ─────────────────────────────────────────
  //  HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF0A0A1A), Color(0xFF12103A)]),
      ),
      child: Column(children: [
        Row(children: [
          GestureDetector(
            onTap: () { _guardarEstado(); Navigator.pop(context); },
            child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 18),
          ),
          const SizedBox(width: 8),
          const Text('🏙️', style: TextStyle(fontSize: 24)),
          const SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('IMPERIO BUILDER', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1)),
            Text('Semana $_semana · Simulador de negocios', style: AppTextStyles.caption),
          ]),
          const Spacer(),
          GestureDetector(
            onTap: _mostrarInfo,
            child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(10)), child: const Text('❓', style: TextStyle(fontSize: 16))),
          ),
        ]),
        const SizedBox(height: 14),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _headerStat('💰', _formatNum(_dinero), 'Disponible', AppColors.neonAmarillo),
          Container(width: 1, height: 40, color: AppColors.textoGris.withValues(alpha: 0.3)),
          _headerStat('📊', '${_formatNum(_ingresoSemanalNeto)}/sem', 'Ingreso neto', AppColors.neonVerde),
          Container(width: 1, height: 40, color: AppColors.textoGris.withValues(alpha: 0.3)),
          _headerStat('🏆', _formatNum(_totalGanado), 'Total ganado', AppColors.neonMorado),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(
            child: GestureDetector(
              onTap: _mostrarTransferencia,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppColors.gradienteGreen),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text('💸 Depositar al Cashflow →', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12))),
              ),
            ),
          ),
          if (_totalGanado >= 1000000) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _hacerPrestige,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                decoration: BoxDecoration(color: const Color(0xFFFFD700), borderRadius: BorderRadius.circular(10)),
                child: const Text('⚡ PRESTIGE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12)),
              ),
            ),
          ],
        ]),
      ]),
    );
  }

  Future<void> _mostrarTransferencia() async {
    if (_dinero <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('⚠️ No tienes dinero disponible.')));
      return;
    }
    final ctrl = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('💸 Depositar al Cashflow', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w800)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Disponible: ${_formatNum(_dinero)}', style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          const Text('Este dinero se suma a tu Fondo Cashflow y mueve la Barra Verde.', style: AppTextStyles.caption),
          const SizedBox(height: 16),
          TextField(
            controller: ctrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: const TextStyle(color: AppColors.textoBlanco, fontSize: 20, fontWeight: FontWeight.w700),
            decoration: const InputDecoration(
              labelText: 'Monto a transferir', prefixText: '\$',
              prefixStyle: TextStyle(color: AppColors.neonVerde, fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => ctrl.text = _dinero.toStringAsFixed(2),
            child: const Text('Transferir todo →', style: TextStyle(color: AppColors.neonAzul, fontSize: 12, decoration: TextDecoration.underline)),
          ),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris))),
          ElevatedButton(
            onPressed: () {
              final monto = double.tryParse(ctrl.text.trim()) ?? 0;
              if (monto <= 0 || monto > _dinero) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('⚠️ Monto inválido')));
                return;
              }
              setState(() => _dinero -= monto);
              _guardarEstado();
              context.read<AppProvider>().depositarDesdeImperio(monto);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('✅ ${_formatNum(monto)} transferidos al Cashflow!'),
                behavior: SnackBarBehavior.floating,
              ));
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonVerde),
            child: const Text('Transferir', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
    ctrl.dispose();
  }

  Widget _headerStat(String emoji, String valor, String label, Color color) => Column(children: [
    Text(emoji, style: const TextStyle(fontSize: 18)),
    const SizedBox(height: 2),
    Text(valor, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 14)),
    Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 9)),
  ]);

  // ─────────────────────────────────────────
  //  BARRA DE PROGRESO
  // ─────────────────────────────────────────
  Widget _buildProgreso() {
    final hitoSig = kHitos.firstWhere((h) => _totalGanado < h.$1, orElse: () => kHitos.last);
    final hitoAnt = _hitoActual >= 0 ? kHitos[_hitoActual].$1 : 0.0;
    final pct = hitoSig.$1 == hitoAnt ? 1.0 : ((_totalGanado - hitoAnt) / (hitoSig.$1 - hitoAnt)).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
      color: const Color(0xFF0D0E1A),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(_hitoActual >= 0 ? kHitos[_hitoActual].$3 : '🌱 Inicio', style: const TextStyle(color: AppColors.textoGris, fontSize: 10)),
          Text('Meta: ${hitoSig.$2} ${hitoSig.$3}', style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 10, fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 5),
        LayoutBuilder(builder: (_, c) => Stack(children: [
          Container(height: 8, decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(4))),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: 8,
            width: (c.maxWidth * pct).clamp(4.0, c.maxWidth),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFFA500)]),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [BoxShadow(color: const Color(0xFFFFD700).withValues(alpha: 0.5), blurRadius: 6)],
            ),
          ),
        ])),
        const SizedBox(height: 4),
        Text('Faltan ${_formatNum(hitoSig.$1 - _totalGanado)} para el siguiente hito', style: const TextStyle(color: AppColors.textoGris, fontSize: 9)),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  VISTA DE CIUDAD
  // ─────────────────────────────────────────
  Widget _buildCityView() {
    final comprados = _negocios.where((n) => n.comprado).toList();
    if (comprados.isEmpty) {
      return Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF0D1B0D), Color(0xFF1A2E0A)]),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.2)),
        ),
        child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('🌱', style: TextStyle(fontSize: 40)),
          SizedBox(height: 6),
          Text('Tu terreno está vacío. ¡Construye tu primer negocio!', style: AppTextStyles.caption, textAlign: TextAlign.center),
        ])),
      );
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: comprados.length >= 8
            ? [const Color(0xFF1A0A3C), const Color(0xFF2D1B69)]
            : comprados.length >= 4
              ? [const Color(0xFF0A1A2E), const Color(0xFF0D3B70)]
              : [const Color(0xFF0D1B0D), const Color(0xFF1A3A0A)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('🏙️ Tu Imperio (${comprados.length} negocios)', style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w800, fontSize: 13)),
          Text('Nivel $_totalNegocios', style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w700, fontSize: 12)),
        ]),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8, runSpacing: 8,
          children: comprados.map((n) => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(n.emoji, style: const TextStyle(fontSize: 26)),
              const SizedBox(height: 2),
              Text('Nv.${n.nivel}', style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 9, fontWeight: FontWeight.w800)),
            ]),
          )).toList(),
        ),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  CARD DE NEGOCIO
  // ─────────────────────────────────────────
  Widget _buildNegocioCard(IBNegocio n) {
    final totalComprados = _totalNegocios;
    final bloqueado = totalComprados < n.nivelDesbloqueo;
    final puedePagar = _dinero >= n.costoSiguiente;
    final color = _categoriaColor(n.categoria);

    if (bloqueado) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.fondoCard.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.textoGris.withValues(alpha: 0.15)),
        ),
        child: Row(children: [
          const Text('🔒', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(n.nombre, style: const TextStyle(color: AppColors.textoGris, fontWeight: FontWeight.w700, fontSize: 14)),
            Text('Desbloquea comprando ${n.nivelDesbloqueo} negocios (tienes $totalComprados)', style: const TextStyle(color: AppColors.textoGris, fontSize: 11)),
          ])),
        ]),
      );
    }

    // Ingreso neto semanal del negocio (para mostrar)
    final ingresoSemNeto = n.comprado ? n.ingresoActual * 8 * 0.75 : 0.0;
    final gastosSem      = n.comprado ? n.ingresoActual * 8 * 0.25 : 0.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: n.comprado ? color.withValues(alpha: 0.5) : color.withValues(alpha: 0.2), width: n.comprado ? 2 : 1),
        boxShadow: n.comprado ? [BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 8)] : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(children: [
          Row(children: [
            Container(
              width: 58, height: 58,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
              child: Center(child: Text(n.emoji, style: const TextStyle(fontSize: 30))),
            ),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(n.nombre, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w800, fontSize: 14)),
                if (n.comprado) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                    child: Text('Nv.${n.nivel}', style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w900)),
                  ),
                ],
              ]),
              const SizedBox(height: 2),
              Text(n.descripcion, style: const TextStyle(color: AppColors.textoGris, fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
              if (n.comprado) ...[
                const SizedBox(height: 5),
                Row(children: [
                  Text('+${_formatNum(ingresoSemNeto)}/sem', style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 12)),
                  const SizedBox(width: 8),
                  Text('-${_formatNum(gastosSem)} gastos', style: const TextStyle(color: Colors.redAccent, fontSize: 10)),
                ]),
              ],
            ])),
          ]),
          const SizedBox(height: 10),
          if (n.comprado)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: LayoutBuilder(builder: (_, c) => Stack(children: [
                Container(height: 4, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(2))),
                Container(height: 4, width: (c.maxWidth * (n.nivel / 20).clamp(0, 1)), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
              ])),
            ),
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: puedePagar ? () => _comprarOUpgrade(n) : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: puedePagar ? LinearGradient(colors: [color, color.withValues(alpha: 0.7)]) : null,
                  color: puedePagar ? null : AppColors.fondoCardClaro,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(
                  n.comprado ? '⬆️ Mejorar · ${_formatNum(n.costoSiguiente)}' : '🏗️ Abrir · ${_formatNum(n.costoSiguiente)}',
                  style: TextStyle(color: puedePagar ? Colors.white : AppColors.textoGris, fontWeight: FontWeight.w900, fontSize: 14),
                )),
              ),
            ),
          ),
          if (!puedePagar) ...[
            const SizedBox(height: 6),
            Text('Faltan ${_formatNum(n.costoSiguiente - _dinero)} · en ~${_etaParaComprar(n)}', style: const TextStyle(color: AppColors.textoGris, fontSize: 10)),
          ],
        ]),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  POPUP LECCIÓN AL COMPRAR
  // ─────────────────────────────────────────
  Widget _buildLeccionPopup(IBNegocio n) {
    return GestureDetector(
      onTap: () => setState(() => _leccionActual = null),
      child: Container(
        color: Colors.black.withValues(alpha: 0.7),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.fondoCard,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: _categoriaColor(n.categoria), width: 2),
                boxShadow: [BoxShadow(color: _categoriaColor(n.categoria).withValues(alpha: 0.4), blurRadius: 30)],
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Text('🎉 ¡NUEVO NEGOCIO!', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1)),
                const SizedBox(height: 12),
                Text(n.emoji, style: const TextStyle(fontSize: 60)),
                const SizedBox(height: 10),
                Text(n.nombre, style: const TextStyle(color: AppColors.textoBlanco, fontSize: 20, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Text(n.descripcion, style: AppTextStyles.body, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12)),
                  child: Text(n.leccion, style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
                ),
                const SizedBox(height: 16),
                Text('+${_formatNum(n.ingresoActual * 8 * 0.75)}/semana neto', style: TextStyle(color: _categoriaColor(n.categoria), fontWeight: FontWeight.w800, fontSize: 15)),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => setState(() => _leccionActual = null),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    decoration: BoxDecoration(gradient: const LinearGradient(colors: AppColors.gradienteHero), borderRadius: BorderRadius.circular(14)),
                    child: const Text('¡A seguir creciendo! 🚀', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  POPUP HITO
  // ─────────────────────────────────────────
  Widget _buildHitoPopup() {
    if (_hitoActual < 0 || _hitoActual >= kHitos.length) return const SizedBox.shrink();
    final h = kHitos[_hitoActual];
    return GestureDetector(
      onTap: () => setState(() => _mensajeHito = null),
      child: Container(
        color: Colors.black.withValues(alpha: 0.75),
        child: Center(
          child: ScaleTransition(
            scale: _hitoAnim,
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF2D1B00), Color(0xFF4A3000)]),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFFFFD700), width: 3),
                  boxShadow: const [BoxShadow(color: Color(0xFFFFD700), blurRadius: 40, spreadRadius: 5)],
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(h.$2, style: const TextStyle(fontSize: 70)),
                  const SizedBox(height: 10),
                  Text(h.$3, style: const TextStyle(color: Color(0xFFFFD700), fontSize: 26, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Text(h.$4, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTap: () => setState(() => _mensajeHito = null),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(color: const Color(0xFFFFD700), borderRadius: BorderRadius.circular(14)),
                        child: const Text('¡SEGUIR! 🚀', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Share.share('${h.$2} ¡Alcancé ${h.$3} en Imperio Builder!\n${h.$4}\n\n¡Construye tu libertad financiera! 👑\nMi Imperio — App LSF'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFFFD700)), borderRadius: BorderRadius.circular(14)),
                        child: const Text('📲', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ]),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  INFO
  // ─────────────────────────────────────────
  void _mostrarInfo() {
    showDialog(context: context, builder: (_) => AlertDialog(
      backgroundColor: AppColors.fondoCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('🏙️ ¿Cómo funciona?', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w900)),
      content: const Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('⏱️ Cada 8 segundos = 1 semana de negocio', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('💰 Ingresos brutos − 25% gastos fijos = ganancia neta', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('⚡ Cada ~3 semanas ocurre un evento real del mercado', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('🎯 Los eventos de decisión tienen consecuencias financieras reales', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('📈 Mejora tus negocios para multiplicar el ingreso neto', style: AppTextStyles.body),
        SizedBox(height: 14),
        Text('💡 En el mundo real, los negocios tienen ganancias Y gastos, ciclos altos y bajos, y requieren decisiones difíciles. Este simulador te prepara para eso.', style: AppTextStyles.caption),
      ]),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Entendido ✅', style: TextStyle(color: AppColors.neonVerde)))],
    ));
  }

  // ─────────────────────────────────────────
  //  HELPERS
  // ─────────────────────────────────────────
  String _formatNum(double n) {
    if (n >= 1000000000) return '\$${(n / 1000000000).toStringAsFixed(1)}B';
    if (n >= 1000000)    return '\$${(n / 1000000).toStringAsFixed(2)}M';
    if (n >= 1000)       return '\$${(n / 1000).toStringAsFixed(1)}K';
    return '\$${n.toStringAsFixed(n.abs() < 10 ? 2 : 0)}';
  }

  Color _categoriaColor(String cat) => switch (cat) {
    'Starter'     => const Color(0xFF66BB6A),
    'Digital'     => const Color(0xFF42A5F5),
    'Comida'      => const Color(0xFFFF9800),
    'Tech'        => AppColors.neonMorado,
    'Local'       => const Color(0xFFFFCA28),
    'Inmuebles'   => const Color(0xFF26C6DA),
    'Corporativo' => const Color(0xFFFFD700),
    _             => AppColors.neonVerde,
  };
}
