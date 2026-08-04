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
    final niveles     = Map<String, dynamic>.from(jsonDecode(nivelesJson));

    // Aplicar niveles guardados
    final negocios = crearNegocios();
    for (final n in negocios) {
      if (niveles.containsKey(n.id)) n.nivel = niveles[n.id] as int;
    }

    // Ganancias offline: máx 2 horas de tiempo Y máx $50,000
    double offline = 0;
    if (ultimaVez.isNotEmpty) {
      final ultima = DateTime.tryParse(ultimaVez);
      if (ultima != null) {
        final segundos = DateTime.now().difference(ultima).inSeconds.clamp(0, 7200);
        final ingresoSeg = negocios.fold(0.0, (s, n) => s + n.ingresoActual);
        offline = (ingresoSeg * segundos).clamp(0.0, 50000.0);
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
    });

    if (offline >= 10) _mostrarOffline(offline);
    _iniciarTicker();
  }

  Future<void> _guardarEstado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('ib_dinero', _dinero);
    await prefs.setDouble('ib_total', _totalGanado);
    await prefs.setString('ib_ultima', DateTime.now().toIso8601String());
    final niveles = {for (final n in _negocios) n.id: n.nivel};
    await prefs.setString('ib_niveles', jsonEncode(niveles));
    await prefs.setInt('ib_prestiges', _prestiges);
    if (kFirebaseEnabled) {
      FirebaseService.updateLeaderboard(_totalGanado, nivelImperio(_totalGanado));
    }
  }

  void _iniciarTicker() {
    _ticker?.cancel();
    _timerGuardado?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      final bonus = bonusMultiplier(_totalGanado) * pow(1.25, _prestiges.clamp(0, 7));
      final ingresoSeg = _negocios.fold(0.0, (s, n) => s + n.ingresoActual) * bonus;
      final ganado = ingresoSeg * 0.1;
      setState(() {
        _dinero      += ganado;
        _totalGanado += ganado;
      });
      _verificarHitos();
    });
    _timerGuardado = Timer.periodic(const Duration(seconds: 30), (_) { if (mounted) _guardarEstado(); });
  }

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
    setState(() {
      _dinero -= costo;
      n.nivel++;
    });
    SoundPlayer.compra();
    _guardarEstado();
    if (esPrimero) {
      setState(() => _leccionActual = n);
    }
  }

  int get _totalNegocios => _negocios.where((n) => n.comprado).length;

  double get _ingresoPorSegundo =>
      _negocios.fold(0.0, (s, n) => s + n.ingresoActual) *
      bonusMultiplier(_totalGanado) * pow(1.25, _prestiges.clamp(0, 7));

  // ─────────────────────────────────────────
  //  ETA PARA EL SIGUIENTE NEGOCIO
  // ─────────────────────────────────────────
  String _etaParaComprar(IBNegocio n) {
    final falta = n.costoSiguiente - _dinero;
    if (falta <= 0 || _ingresoPorSegundo <= 0) return '∞';
    final seg = falta / _ingresoPorSegundo;
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
              ? '¡Alcanzaste el PRESTIGE MÁXIMO!\nSigues ganando con el multiplicador máximo ×$multActual para siempre.'
              : '¡Alcanzaste el Millón!\nReinicia tu Imperio desde cero pero con un multiplicador permanente de ×1.25.',
            style: AppTextStyles.body, textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text('Prestige: $_prestiges / $_maxPrestiges', style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(
            esMaximo
              ? 'Multiplicador máximo: ×$multActual 🏆'
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
              final texto = '⚡ ¡Hice PRESTIGE ${_prestiges + 1} en Imperio Builder!\n'
                  'Alcancé \$1,000,000 y reinicié con multiplicador ×$multSig\n\n'
                  '¡Construye tu libertad financiera desde cero! 💪\n'
                  '👑 Mi Imperio — App LSF';
              Share.share(texto);
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
            const Text('Tus negocios trabajaron sin ti:', style: AppTextStyles.body),
            const SizedBox(height: 8),
            Text(_formatNum(cantidad), style: const TextStyle(color: AppColors.neonVerde, fontSize: 32, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            const Text('💡 Eso es el ingreso pasivo en acción.\n¡El dinero trabaja, tú descansas!', style: AppTextStyles.caption, textAlign: TextAlign.center),
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
        child: Stack(
          children: [
            Column(children: [
              _buildHeader(),
              _buildProgreso(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 100),
                  children: [
                    _buildCityView(),
                    const SizedBox(height: 16),
                    const Text('🏗️ Construye tu Imperio', style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 8),
                    ..._negocios.map((n) => _buildNegocioCard(n)),
                  ],
                ),
              ),
            ]),
            // Popup lección
            if (_leccionActual != null) _buildLeccionPopup(_leccionActual!),
            // Popup hito
            if (_mensajeHito != null) _buildHitoPopup(),
          ],
        ),
      ),
    );
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
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('IMPERIO BUILDER', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1)),
            Text('Hazte millonaria a los 20 🏆', style: AppTextStyles.caption),
          ]),
          const Spacer(),
          GestureDetector(
            onTap: _mostrarInfo,
            child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(10)), child: const Text('❓', style: TextStyle(fontSize: 16))),
          ),
        ]),
        const SizedBox(height: 14),
        // Dinero principal
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _headerStat('💰', _formatNum(_dinero), 'Disponible', AppColors.neonAmarillo),
          Container(width: 1, height: 40, color: AppColors.textoGris.withValues(alpha: 0.3)),
          _headerStat('📈', '${_formatNum(_ingresoPorSegundo)}/s', 'Ingreso pasivo', AppColors.neonVerde),
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
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(10),
                ),
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('⚠️ No tienes dinero disponible para transferir.')));
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
          Text('Disponible en Imperio: ${_formatNum(_dinero)}', style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          const Text('Este dinero se suma a tu Fondo Cashflow y mueve la Barra Verde.', style: AppTextStyles.caption),
          const SizedBox(height: 16),
          TextField(
            controller: ctrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: const TextStyle(color: AppColors.textoBlanco, fontSize: 20, fontWeight: FontWeight.w700),
            decoration: const InputDecoration(
              labelText: 'Monto a transferir',
              prefixText: '\$',
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
                content: Text('✅ \$${monto.toStringAsFixed(2)} transferidos al Cashflow principal! +10💎'),
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
    Text(valor, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 15)),
    Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 9)),
  ]);

  // ─────────────────────────────────────────
  //  BARRA DE PROGRESO AL MILLÓN
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
          Text('Nivel ${_totalNegocios}', style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w700, fontSize: 12)),
        ]),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: comprados.map((n) => _buildCityBuilding(n)).toList(),
        ),
      ]),
    );
  }

  Widget _buildCityBuilding(IBNegocio n) {
    return Container(
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
            // Emoji grande con fondo
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
                const SizedBox(height: 4),
                Text('+${_formatNum(n.ingresoActual)}/s', style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 13)),
              ],
            ])),
          ]),
          const SizedBox(height: 10),
          // Barra de nivel
          if (n.comprado)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: LayoutBuilder(builder: (_, c) => Stack(children: [
                Container(height: 4, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(2))),
                Container(height: 4, width: (c.maxWidth * (n.nivel / 20).clamp(0, 1)), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
              ])),
            ),
          // Botón comprar/upgrade
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: puedePagar ? () => _comprarOUpgrade(n) : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: puedePagar
                    ? LinearGradient(colors: [color, color.withValues(alpha: 0.7)])
                    : null,
                  color: puedePagar ? null : AppColors.fondoCardClaro,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    n.comprado ? '⬆️ Mejorar · ${_formatNum(n.costoSiguiente)}' : '🏗️ Construir · ${_formatNum(n.costoSiguiente)}',
                    style: TextStyle(
                      color: puedePagar ? Colors.white : AppColors.textoGris,
                      fontWeight: FontWeight.w900, fontSize: 14,
                    ),
                  ),
                ]),
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
                Text('+${_formatNum(n.ingresoActual)}/segundo de ingreso pasivo', style: TextStyle(color: _categoriaColor(n.categoria), fontWeight: FontWeight.w800, fontSize: 15)),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => setState(() => _leccionActual = null),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: AppColors.gradienteHero),
                      borderRadius: BorderRadius.circular(14),
                    ),
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
                  boxShadow: [const BoxShadow(color: Color(0xFFFFD700), blurRadius: 40, spreadRadius: 5)],
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
                      onTap: () {
                        final texto = '${h.$2} ¡Alcancé ${h.$3} en Imperio Builder!\n'
                            '${h.$4}\n'
                            '💰 Total generado: ${_formatNum(_totalGanado)}\n\n'
                            '¡Construye tu libertad financiera! 👑\n'
                            'Mi Imperio — App LSF';
                        Share.share(texto);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFFFD700)),
                          borderRadius: BorderRadius.circular(14),
                        ),
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
      title: const Text('🏙️ ¿Cómo jugar?', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w900)),
      content: const Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('1. 💰 Compra negocios con tu dinero', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('2. 📈 Cada negocio genera ingresos pasivos por segundo', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('3. ⬆️ Mejora tus negocios para multiplicar ganancias', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('4. ⏰ ¡Tu imperio gana dinero aunque no estés en la app!', style: AppTextStyles.body),
        SizedBox(height: 6),
        Text('5. 🏆 Meta: llegar a \$1,000,000 y ser MILLONARIA', style: AppTextStyles.body),
        SizedBox(height: 14),
        Text('💡 En la vida real, construir múltiples fuentes de ingreso es exactamente así. Cada negocio o inversión que agregas acelera tu libertad financiera.', style: AppTextStyles.caption),
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
    return '\$${n.toStringAsFixed(n < 10 ? 2 : 0)}';
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
