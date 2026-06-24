// lib/screens/pantalla_herramientas.dart — Herramientas Financieras 2026
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';

class PantallaHerramientas extends StatefulWidget {
  final int tabInicial;
  const PantallaHerramientas({super.key, this.tabInicial = 0});
  @override
  State<PantallaHerramientas> createState() => _PantallaHerramientasState();
}

class _PantallaHerramientasState extends State<PantallaHerramientas>
    with SingleTickerProviderStateMixin {
  late TabController _tab;
  @override
  void initState() { super.initState(); _tab = TabController(length: 3, vsync: this, initialIndex: widget.tabInicial); }
  @override
  void dispose() { _tab.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Column(children: [
          _buildHeader(),
          Container(
            color: AppColors.fondoCard,
            child: TabBar(
              controller: _tab,
              indicatorColor: AppColors.neonVerde,
              labelColor: AppColors.neonVerde,
              unselectedLabelColor: AppColors.textoGris,
              labelStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 11),
              tabs: const [
                Tab(text: '💰 Presupuesto'),
                Tab(text: '📈 Interés'),
                Tab(text: '🎯 Libertad'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tab,
              children: const [
                _PresupuestoTool(),
                _InteresTool(),
                _LibertadTool(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      color: AppColors.fondoCard,
      child: Row(children: [
        GestureDetector(onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 18)),
        const SizedBox(width: 10),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('🔧 Herramientas Financieras', style: AppTextStyles.cardTitle),
          Text('Calcula tu camino a la libertad', style: AppTextStyles.caption),
        ]),
      ]),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  HERRAMIENTA 1 — PRESUPUESTO 50/30/20
// ═══════════════════════════════════════════════════════════════
class _PresupuestoTool extends StatefulWidget {
  const _PresupuestoTool();
  @override
  State<_PresupuestoTool> createState() => _PresupuestoToolState();
}

class _PresupuestoToolState extends State<_PresupuestoTool> {
  final _ctrl = TextEditingController();
  double _ingreso = 0;
  // Porcentajes ajustables
  double _pctNecesidades = 50;
  double _pctDeseos = 20;
  double _pctAhorros = 10;
  double _pctInversiones = 20;

  double get _necesidades => _ingreso * _pctNecesidades / 100;
  double get _deseos => _ingreso * _pctDeseos / 100;
  double get _ahorros => _ingreso * _pctAhorros / 100;
  double get _inversiones => _ingreso * _pctInversiones / 100;
  double get _totalPct => _pctNecesidades + _pctDeseos + _pctAhorros + _pctInversiones;

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('💰 PRESUPUESTO INTELIGENTE', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        const Text('Distribuye tu ingreso mensual de forma inteligente.', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        // Ingreso input
        TextField(
          controller: _ctrl,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: const TextStyle(color: AppColors.textoBlanco, fontSize: 20, fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            prefixText: '\$ ',
            prefixStyle: const TextStyle(color: AppColors.neonVerde, fontSize: 20, fontWeight: FontWeight.w700),
            hintText: 'Tu ingreso mensual',
            hintStyle: const TextStyle(color: AppColors.textoGris),
            filled: true,
            fillColor: AppColors.fondoCard,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.neonVerde)),
          ),
          onChanged: (v) => setState(() => _ingreso = double.tryParse(v) ?? 0),
        ),
        const SizedBox(height: 20),
        // Sliders de porcentaje
        _sliderPct('🏠 Necesidades', _pctNecesidades, AppColors.neonRosa, (v) {
          final resto = 100 - v - _pctDeseos - _pctAhorros;
          if (resto >= 0) setState(() { _pctNecesidades = v; _pctInversiones = resto; });
        }),
        _sliderPct('🎉 Deseos', _pctDeseos, const Color(0xFFFF9800), (v) {
          final resto = 100 - _pctNecesidades - v - _pctAhorros;
          if (resto >= 0) setState(() { _pctDeseos = v; _pctInversiones = resto; });
        }),
        _sliderPct('🏦 Ahorros', _pctAhorros, AppColors.neonAzul, (v) {
          final resto = 100 - _pctNecesidades - _pctDeseos - v;
          if (resto >= 0) setState(() { _pctAhorros = v; _pctInversiones = resto; });
        }),
        _sliderPct('📈 Inversiones', _pctInversiones, AppColors.neonVerde, null),
        if (_totalPct.round() != 100)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(10)),
            child: Text('⚠️ Total: ${_totalPct.round()}% — ajusta los porcentajes a 100%', style: const TextStyle(color: Colors.orange, fontSize: 12)),
          ),
        if (_ingreso > 0) ...[
          const SizedBox(height: 20),
          const Text('TU DISTRIBUCIÓN MENSUAL', style: TextStyle(color: AppColors.textoGris, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
          const SizedBox(height: 12),
          _resultCard('🏠', 'Necesidades', _necesidades, 'Renta, comida, servicios, transporte', AppColors.neonRosa),
          _resultCard('🎉', 'Deseos', _deseos, 'Entretenimiento, ropa, salidas', const Color(0xFFFF9800)),
          _resultCard('🏦', 'Ahorros', _ahorros, 'Fondo de emergencia (6 meses de gastos)', AppColors.neonAzul),
          _resultCard('📈', 'Inversiones', _inversiones, 'Acciones, bienes raíces, negocio', AppColors.neonVerde),
          const SizedBox(height: 16),
          // Gráfico de barras
          _buildBarras(),
          const SizedBox(height: 16),
          GlassCard(
            borderColor: AppColors.neonAmarillo.withValues(alpha: 0.3),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('💡 La Regla Recomendada', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text('• 50% Necesidades\n• 20% Deseos\n• 10% Ahorros\n• 20% Inversiones', style: AppTextStyles.body),
              const SizedBox(height: 8),
              const Text('Si tu inversión mensual es \$0, tu futuro depende solo de tu salario. ¡Cambia eso hoy!', style: AppTextStyles.caption),
            ]),
          ),
        ],
        const SizedBox(height: 40),
      ]),
    );
  }

  Widget _sliderPct(String label, double value, Color color, Function(double)? onChanged) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w600, fontSize: 13)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
          child: Text('${value.round()}%', style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 13)),
        ),
      ]),
      SliderTheme(
        data: SliderThemeData(activeTrackColor: color, inactiveTrackColor: color.withValues(alpha: 0.2), thumbColor: color, overlayColor: color.withValues(alpha: 0.2), trackHeight: 4),
        child: Slider(
          value: value, min: 0, max: 80, divisions: 80,
          onChanged: onChanged,
        ),
      ),
      const SizedBox(height: 4),
    ]);
  }

  Widget _resultCard(String emoji, String label, double valor, String descripcion, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700)),
          Text(descripcion, style: const TextStyle(color: AppColors.textoGris, fontSize: 11)),
        ])),
        Text('\$${valor.toStringAsFixed(0)}', style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 16)),
      ]),
    );
  }

  Widget _buildBarras() {
    final total = _necesidades + _deseos + _ahorros + _inversiones;
    if (total == 0) return const SizedBox.shrink();
    return LayoutBuilder(builder: (_, c) {
      final w = c.maxWidth;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Distribución visual', style: AppTextStyles.caption),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(children: [
            _barra(_necesidades / total, AppColors.neonRosa, w),
            _barra(_deseos / total, const Color(0xFFFF9800), w),
            _barra(_ahorros / total, AppColors.neonAzul, w),
            _barra(_inversiones / total, AppColors.neonVerde, w),
          ]),
        ),
      ]);
    });
  }

  Widget _barra(double pct, Color color, double totalW) => AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    height: 22,
    width: (totalW * pct).clamp(0, totalW),
    color: color,
  );
}

// ═══════════════════════════════════════════════════════════════
//  HERRAMIENTA 2 — INTERÉS COMPUESTO
// ═══════════════════════════════════════════════════════════════
class _InteresTool extends StatefulWidget {
  const _InteresTool();
  @override
  State<_InteresTool> createState() => _InteresToolState();
}

class _InteresToolState extends State<_InteresTool> {
  final _capitalCtrl = TextEditingController();
  final _mensualCtrl = TextEditingController();
  double _capital = 0;
  double _mensual = 0;
  double _tasa = 8; // % anual
  double _anos = 10;

  double get _resultado {
    if (_capital == 0 && _mensual == 0) return 0;
    final r = _tasa / 100 / 12;
    final n = (_anos * 12).round();
    double total = _capital;
    if (r > 0) {
      total = _capital * pow(1 + r, n) + (_mensual > 0 ? _mensual * (pow(1 + r, n) - 1) / r : 0);
    } else {
      total = _capital + _mensual * n;
    }
    return total;
  }

  double get _totalInvertido => _capital + _mensual * _anos * 12;
  double get _ganancias => _resultado - _totalInvertido;

  List<double> get _puntosPorAno {
    final r = _tasa / 100 / 12;
    List<double> pts = [];
    for (int a = 0; a <= _anos.round(); a++) {
      final n = a * 12;
      double v = _capital;
      if (r > 0) {
        v = _capital * pow(1 + r, n) + (_mensual > 0 ? _mensual * (pow(1 + r, n) - 1) / r : 0);
      } else {
        v = _capital + _mensual * n;
      }
      pts.add(v);
    }
    return pts;
  }

  @override
  void dispose() { _capitalCtrl.dispose(); _mensualCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final pts = _puntosPorAno;
    final maxV = pts.isEmpty ? 1.0 : pts.reduce(max).clamp(1, double.maxFinite);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('📈 INTERÉS COMPUESTO', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        const Text('"El octavo milagro del mundo" — Albert Einstein', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        _inputField(_capitalCtrl, 'Capital inicial', (v) => setState(() => _capital = double.tryParse(v) ?? 0)),
        const SizedBox(height: 10),
        _inputField(_mensualCtrl, 'Aporte mensual adicional', (v) => setState(() => _mensual = double.tryParse(v) ?? 0)),
        const SizedBox(height: 16),
        // Tasa
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Tasa de retorno anual', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w600, fontSize: 13)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(color: AppColors.neonVerde.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
            child: Text('${_tasa.round()}%', style: const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w900, fontSize: 13)),
          ),
        ]),
        SliderTheme(
          data: SliderThemeData(activeTrackColor: AppColors.neonVerde, inactiveTrackColor: AppColors.neonVerde.withValues(alpha: 0.2), thumbColor: AppColors.neonVerde, trackHeight: 4),
          child: Slider(value: _tasa, min: 1, max: 25, divisions: 24, onChanged: (v) => setState(() => _tasa = v)),
        ),
        const SizedBox(height: 4),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('📝 Referencia: S&P500 histórico ≈ 10%/año', style: TextStyle(color: AppColors.textoGris, fontSize: 11)),
        ]),
        const SizedBox(height: 12),
        // Años
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Tiempo de inversión', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w600, fontSize: 13)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(color: AppColors.neonMorado.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
            child: Text('${_anos.round()} años', style: const TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w900, fontSize: 13)),
          ),
        ]),
        SliderTheme(
          data: SliderThemeData(activeTrackColor: AppColors.neonMorado, inactiveTrackColor: AppColors.neonMorado.withValues(alpha: 0.2), thumbColor: AppColors.neonMorado, trackHeight: 4),
          child: Slider(value: _anos, min: 1, max: 40, divisions: 39, onChanged: (v) => setState(() => _anos = v)),
        ),
        if (_resultado > 0) ...[
          const SizedBox(height: 16),
          // Resultado destacado
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.gradienteGreen),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(children: [
              const Text('Tu dinero en el futuro', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(height: 4),
              Text('\$${_formatNum(_resultado)}', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(children: [
                  Text('\$${_formatNum(_totalInvertido)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  const Text('Invertido', style: TextStyle(color: Colors.white70, fontSize: 11)),
                ]),
                Column(children: [
                  Text('\$${_formatNum(_ganancias)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  const Text('Ganancias', style: TextStyle(color: Colors.white70, fontSize: 11)),
                ]),
                Column(children: [
                  Text('${(_ganancias / _totalInvertido * 100).toStringAsFixed(0)}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  const Text('Retorno', style: TextStyle(color: Colors.white70, fontSize: 11)),
                ]),
              ]),
            ]),
          ),
          const SizedBox(height: 16),
          // Gráfico
          const Text('Crecimiento por año', style: AppTextStyles.caption),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(pts.length, (i) {
                final h = (pts[i] / maxV * 100).clamp(2.0, 100.0);
                final isLast = i == pts.length - 1;
                return Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      height: h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isLast ? AppColors.gradienteGreen : [AppColors.neonMorado.withValues(alpha: 0.5), AppColors.neonAzul.withValues(alpha: 0.7)],
                          begin: Alignment.bottomCenter, end: Alignment.topCenter,
                        ),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
                      ),
                    ),
                    if (i % (pts.length > 15 ? 5 : 2) == 0)
                      Text('$i', style: const TextStyle(color: AppColors.textoGris, fontSize: 8)),
                  ]),
                ));
              }),
            ),
          ),
          const SizedBox(height: 4),
          const Center(child: Text('Años →', style: TextStyle(color: AppColors.textoGris, fontSize: 10))),
          const SizedBox(height: 16),
          GlassCard(
            borderColor: AppColors.neonAmarillo.withValues(alpha: 0.3),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('💡 El poder del tiempo', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text('Warren Buffett ganó el 97% de su riqueza después de los 65 años. No porque empezó tarde, sino porque empezó a los 11 y dejó correr el tiempo.', style: AppTextStyles.caption),
            ]),
          ),
        ],
        const SizedBox(height: 40),
      ]),
    );
  }

  String _formatNum(double n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toStringAsFixed(0);
  }

  Widget _inputField(TextEditingController ctrl, String hint, Function(String) onChanged) {
    return TextField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(color: AppColors.textoBlanco, fontSize: 18, fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        prefixText: '\$ ',
        prefixStyle: const TextStyle(color: AppColors.neonVerde, fontSize: 18, fontWeight: FontWeight.w700),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textoGris, fontSize: 14),
        filled: true,
        fillColor: AppColors.fondoCard,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.neonVerde)),
      ),
      onChanged: onChanged,
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  HERRAMIENTA 3 — CALCULADORA DE LIBERTAD FINANCIERA
// ═══════════════════════════════════════════════════════════════
class _LibertadTool extends StatefulWidget {
  const _LibertadTool();
  @override
  State<_LibertadTool> createState() => _LibertadToolState();
}

class _LibertadToolState extends State<_LibertadTool> {
  final _gastosCtrl = TextEditingController();
  final _ahorroCtrl = TextEditingController();
  final _activoCtrl = TextEditingController();
  double _gastosMes = 0;
  double _ahorroMes = 0;
  double _activoActual = 0;
  double _tasaRetiro = 4; // Regla del 4%

  // Número mágico = gastos anuales / tasa de retiro
  double get _numeroMagico => _gastosMes * 12 / (_tasaRetiro / 100);
  double get _faltante => max(0, _numeroMagico - _activoActual);
  double get _mesesParaLibertad => _ahorroMes <= 0 ? double.infinity : _faltante / _ahorroMes;
  double get _anosParaLibertad => _mesesParaLibertad / 12;
  double get _pctActual => _numeroMagico <= 0 ? 0 : (_activoActual / _numeroMagico).clamp(0, 1);

  @override
  void dispose() { _gastosCtrl.dispose(); _ahorroCtrl.dispose(); _activoCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final esLibre = _activoActual >= _numeroMagico && _numeroMagico > 0;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('🎯 LIBERTAD FINANCIERA', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        const Text('¿Cuánto necesitas para no trabajar nunca más?', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        _field(_gastosCtrl, '💸 Gastos mensuales actuales', (v) => setState(() => _gastosMes = double.tryParse(v) ?? 0)),
        const SizedBox(height: 10),
        _field(_activoCtrl, '🏦 Ahorros e inversiones actuales', (v) => setState(() => _activoActual = double.tryParse(v) ?? 0)),
        const SizedBox(height: 10),
        _field(_ahorroCtrl, '💰 Cuánto inviertes por mes', (v) => setState(() => _ahorroMes = double.tryParse(v) ?? 0)),
        const SizedBox(height: 16),
        // Tasa de retiro
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Tasa de retiro seguro', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w600, fontSize: 13)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
            child: Text('${_tasaRetiro.toStringAsFixed(1)}%', style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w900, fontSize: 13)),
          ),
        ]),
        SliderTheme(
          data: SliderThemeData(activeTrackColor: AppColors.neonAmarillo, inactiveTrackColor: AppColors.neonAmarillo.withValues(alpha: 0.2), thumbColor: AppColors.neonAmarillo, trackHeight: 4),
          child: Slider(value: _tasaRetiro, min: 2, max: 6, divisions: 8, onChanged: (v) => setState(() => _tasaRetiro = v)),
        ),
        const Text('La "Regla del 4%" es el estándar. 3.5% es más conservador, 5% más agresivo.', style: TextStyle(color: AppColors.textoGris, fontSize: 10)),
        if (_gastosMes > 0) ...[
          const SizedBox(height: 20),
          // Número mágico
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF4A148C), Color(0xFF6A1B9A), Color(0xFF7B1FA2)]),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.4), blurRadius: 20)],
            ),
            child: Column(children: [
              const Text('🎯 TU NÚMERO MÁGICO', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(height: 4),
              Text('\$${_formatNum(_numeroMagico)}', style: const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text('= \$${_gastosMes.toStringAsFixed(0)}/mes × 12 meses / ${_tasaRetiro}%', style: const TextStyle(color: Colors.white60, fontSize: 11)),
            ]),
          ),
          const SizedBox(height: 16),
          // Progreso
          GlassCard(
            borderColor: AppColors.neonVerde.withValues(alpha: 0.3),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Tu progreso', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700)),
                Text('${(_pctActual * 100).toStringAsFixed(1)}%', style: TextStyle(color: esLibre ? AppColors.neonVerde : AppColors.neonMorado, fontWeight: FontWeight.w900)),
              ]),
              const SizedBox(height: 8),
              LayoutBuilder(builder: (_, c) => Stack(children: [
                Container(height: 14, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(7))),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  height: 14,
                  width: (_pctActual * c.maxWidth).clamp(4.0, c.maxWidth),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: AppColors.gradienteGreen),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [BoxShadow(color: AppColors.neonVerde.withValues(alpha: 0.5), blurRadius: 8)],
                  ),
                ),
              ])),
              const SizedBox(height: 10),
              if (esLibre) ...[
                const Center(child: Text('🏆 ¡ERES FINANCIERAMENTE LIBRE!', style: TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w900, fontSize: 14))),
              ] else if (_ahorroMes > 0) ...[
                _filaResultado('💰 Ya tienes', '\$${_formatNum(_activoActual)}'),
                _filaResultado('🎯 Te falta', '\$${_formatNum(_faltante)}'),
                _filaResultado('⏳ Tiempo estimado', '${_anosParaLibertad >= 100 ? '100+' : _anosParaLibertad.toStringAsFixed(1)} años'),
                if (_anosParaLibertad < 100)
                  _filaResultado('📅 Lo lograrías en', '${DateTime.now().year + _anosParaLibertad.round()}'),
              ] else ...[
                _filaResultado('💰 Ya tienes', '\$${_formatNum(_activoActual)}'),
                _filaResultado('🎯 Te falta', '\$${_formatNum(_faltante)}'),
                const Text('Ingresa cuánto inviertes por mes para calcular el tiempo.', style: AppTextStyles.caption),
              ],
            ]),
          ),
          const SizedBox(height: 12),
          // Escenarios de inversión
          if (_faltante > 0 && !esLibre) ...[
            const Text('¿QUÉ PASA SI INVIERTES MÁS?', style: TextStyle(color: AppColors.textoGris, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1)),
            const SizedBox(height: 8),
            _escenario('\$100/mes', 100),
            _escenario('\$300/mes', 300),
            _escenario('\$500/mes', 500),
            _escenario('\$1,000/mes', 1000),
            const SizedBox(height: 12),
          ],
          GlassCard(
            borderColor: AppColors.neonAmarillo.withValues(alpha: 0.3),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('💡 La Regla del 4%', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800)),
              SizedBox(height: 8),
              Text('Si retiras el 4% de tu portafolio anualmente, estadísticamente dura 30+ años sin agotarse. Esta es la base de la mayoría de los planes de retiro anticipado (FIRE movement).', style: AppTextStyles.caption),
            ]),
          ),
        ],
        const SizedBox(height: 40),
      ]),
    );
  }

  Widget _escenario(String label, double monto) {
    final meses = _faltante / monto;
    final anos = meses / 12;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.2))),
      child: Row(children: [
        Expanded(child: Text(label, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700))),
        Text(anos >= 100 ? '+100 años' : '${anos.toStringAsFixed(1)} años', style: TextStyle(color: anos <= 20 ? AppColors.neonVerde : anos <= 35 ? AppColors.neonAmarillo : AppColors.neonRosa, fontWeight: FontWeight.w900)),
      ]),
    );
  }

  Widget _filaResultado(String label, String valor) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: AppTextStyles.caption),
      Text(valor, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700)),
    ]),
  );

  String _formatNum(double n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(0)}K';
    return n.toStringAsFixed(0);
  }

  Widget _field(TextEditingController ctrl, String hint, Function(String) onChanged) {
    return TextField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(color: AppColors.textoBlanco, fontSize: 16, fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        prefixText: '\$ ',
        prefixStyle: const TextStyle(color: AppColors.neonVerde, fontSize: 16, fontWeight: FontWeight.w700),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textoGris, fontSize: 13),
        filled: true,
        fillColor: AppColors.fondoCard,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.neonVerde)),
      ),
      onChanged: onChanged,
    );
  }
}
