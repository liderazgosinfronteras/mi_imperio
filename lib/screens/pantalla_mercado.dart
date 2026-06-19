// lib/screens/pantalla_mercado.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';
import '../utils/sound_player.dart';

class PantallaMercado extends StatefulWidget {
  const PantallaMercado({super.key});

  @override
  State<PantallaMercado> createState() => _PantallaMercadoState();
}

class _PantallaMercadoState extends State<PantallaMercado>
    with SingleTickerProviderStateMixin {
  final _montoController = TextEditingController();
  final _descripcionController = TextEditingController();
  bool _mostrandoSplit = false;
  double? _montoIngresado;
  late AnimationController _successController;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _successController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _successController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _montoController.dispose();
    _descripcionController.dispose();
    _successController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        // FIX: resizeToAvoidBottomInset + CustomScrollView garantiza
        // que el botón de confirmar siempre sea visible al abrir el teclado
        return Scaffold(
          backgroundColor: AppColors.fondoOscuro,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildHeader(app),
                      const SizedBox(height: 24),
                      _buildPOSTerminal(app),
                      if (_mostrandoSplit && _montoIngresado != null) ...[
                        const SizedBox(height: 24),
                        _buildSplitAnimation(_montoIngresado!),
                      ],
                      const SizedBox(height: 24),
                      _buildStocksBoard(app),
                      const SizedBox(height: 24),
                      _buildRecentSales(app),
                      // Espacio extra para que el botón no quede bajo el teclado
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? 280
                            : 40,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  //  HEADER
  // ─────────────────────────────────────────────
  Widget _buildHeader(AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('🏪', style: TextStyle(fontSize: 36)),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mi Tienda', style: AppTextStyles.heroTitle),
                  Text(
                    'Registra tus ventas reales',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GlassCard(
                padding: const EdgeInsets.all(14),
                borderColor: AppColors.neonVerde.withValues(alpha: 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('📈 Cashflow', style: AppTextStyles.caption),
                    Text(
                      '\$${app.fondoCashflow.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: AppColors.neonVerde,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GlassCard(
                padding: const EdgeInsets.all(14),
                borderColor: AppColors.neonAmarillo.withValues(alpha: 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('💰 Total Ventas', style: AppTextStyles.caption),
                    Text(
                      '\$${app.totalVentas.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: AppColors.neonAmarillo,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  POS TERMINAL
  // ─────────────────────────────────────────────
  Widget _buildPOSTerminal(AppProvider app) {
    return GlassCard(
      borderColor: AppColors.neonMorado.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppColors.gradienteHero),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('💳', style: TextStyle(fontSize: 22)),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Terminal de Cobro', style: AppTextStyles.cardTitle),
                  Text('Ingresa tu venta de hoy', style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Amount input
          TextField(
            controller: _montoController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            style: const TextStyle(
              color: AppColors.neonVerde,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
            decoration: const InputDecoration(
              labelText: 'Monto vendido',
              prefixIcon: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  '\$',
                  style: TextStyle(
                    color: AppColors.neonVerde,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              hintText: '0.00',
              hintStyle: TextStyle(color: AppColors.textoGris, fontSize: 28),
            ),
            onChanged: (_) => setState(() {
              _mostrandoSplit = false;
            }),
          ),
          const SizedBox(height: 14),

          // Description input
          TextField(
            controller: _descripcionController,
            style: const TextStyle(color: AppColors.textoBlanco),
            decoration: const InputDecoration(
              labelText: 'Descripción (opcional)',
              prefixIcon: Icon(Icons.edit_note),
              hintText: 'Ej: Limonada, pulseras, brownies...',
            ),
          ),
          const SizedBox(height: 20),

          // Preview before confirming
          if (_montoController.text.isNotEmpty &&
              double.tryParse(_montoController.text) != null &&
              double.parse(_montoController.text) > 0) ...[
            _buildSplitPreview(double.parse(_montoController.text)),
            const SizedBox(height: 16),
          ],

          // CTA Button
          SizedBox(
            width: double.infinity,
            child: NeonButton(
              label: 'Registrar Venta',
              emoji: '✅',
              onPressed: () => _registrarVenta(app),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  SPLIT PREVIEW (live)
  // ─────────────────────────────────────────────
  Widget _buildSplitPreview(double monto) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.fondoCardClaro,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2E3150)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📊 Distribución 30/40/30',
            style: TextStyle(
              color: AppColors.textoBlanco,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildMiniChip('🔄 30%', '\$${(monto * 0.30).toStringAsFixed(2)}',
                  AppColors.neonAmarillo, 'Reinversión'),
              const SizedBox(width: 6),
              _buildMiniChip('🛍️ 40%', '\$${(monto * 0.40).toStringAsFixed(2)}',
                  AppColors.neonRosa, 'Estilo Vida'),
              const SizedBox(width: 6),
              _buildMiniChip('📈 30%', '\$${(monto * 0.30).toStringAsFixed(2)}',
                  AppColors.neonVerde, 'Cashflow'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniChip(
      String label, String valor, Color color, String sublabel) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Column(
          children: [
            Text(label,
                style: TextStyle(
                    color: color, fontSize: 10, fontWeight: FontWeight.w800)),
            Text(valor,
                style: TextStyle(
                    color: color, fontSize: 14, fontWeight: FontWeight.w900)),
            Text(sublabel,
                style: const TextStyle(
                    color: AppColors.textoGris, fontSize: 9),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  SPLIT ANIMATION (after confirming)
  // ─────────────────────────────────────────────
  Widget _buildSplitAnimation(double monto) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: GlassCard(
        borderColor: AppColors.neonVerde.withValues(alpha: 0.6),
        child: Column(
          children: [
            const Text('🎉', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 8),
            const Text(
              '¡Venta Registrada!',
              style: TextStyle(
                color: AppColors.neonVerde,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${monto.toStringAsFixed(2)} distribuidos así:',
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 20),
            // Animated distribution
            _buildDistCard('🔄', 'Fondo Reinversión',
                '\$${(monto * 0.30).toStringAsFixed(2)}',
                AppColors.neonAmarillo,
                'Para comprar más suministros del negocio'),
            const SizedBox(height: 10),
            _buildDistCard('🛍️', 'Estilo de Vida',
                '\$${(monto * 0.40).toStringAsFixed(2)}',
                AppColors.neonRosa,
                'Simula tus gastos personales (Barra Roja)'),
            const SizedBox(height: 10),
            _buildDistCard('📈', 'Fondo Cashflow',
                '\$${(monto * 0.30).toStringAsFixed(2)}',
                AppColors.neonVerde,
                '¡Tu dinero comprando acciones! (Barra Verde)'),
            const SizedBox(height: 16),
            const Text(
              '+5💎 por registrar venta',
              style: TextStyle(
                color: AppColors.neonAmarillo,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDistCard(
      String emoji, String titulo, String valor, Color color, String desc) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo,
                    style: TextStyle(
                        color: color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                Text(desc, style: AppTextStyles.caption),
              ],
            ),
          ),
          Text(
            valor,
            style: TextStyle(
                color: color, fontSize: 16, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  STOCKS BOARD (full)
  // ─────────────────────────────────────────────
  Widget _buildStocksBoard(AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('📊 Acciones de tu Portafolio', style: AppTextStyles.sectionTitle),
            GestureDetector(
              onTap: () => app.simularMovimientoMercado(),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.refresh, color: AppColors.neonAzul, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Tu Fondo Cashflow invierte automáticamente en estas empresas',
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: 12),
        ...app.acciones.map((accion) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlassCard(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: accion.variacion >= 0
                              ? AppColors.gradienteGreen
                              : AppColors.gradienteRed,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(accion.emoji,
                            style: const TextStyle(fontSize: 22)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(accion.nombre, style: AppTextStyles.cardTitle),
                          Text(
                            accion.ticker,
                            style: const TextStyle(
                              color: AppColors.textoGris,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${accion.precio.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: AppColors.textoBlanco,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              accion.variacion >= 0
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              size: 12,
                              color: accion.variacion >= 0
                                  ? AppColors.neonVerde
                                  : AppColors.neonRosa,
                            ),
                            Text(
                              '${accion.variacion.abs().toStringAsFixed(2)}%',
                              style: TextStyle(
                                color: accion.variacion >= 0
                                    ? AppColors.neonVerde
                                    : AppColors.neonRosa,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  RECENT SALES
  // ─────────────────────────────────────────────
  Widget _buildRecentSales(AppProvider app) {
    if (app.transacciones.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('🧾 Ventas Recientes', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        const Text('Desliza ← para corregir/eliminar una venta', style: AppTextStyles.caption),
        const SizedBox(height: 12),
        ...app.transacciones.take(5).map((tx) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Dismissible(
                key: Key(tx.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: AppColors.neonRosa.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.delete_outline, color: AppColors.neonRosa),
                ),
                confirmDismiss: (_) async {
                  return await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: AppColors.fondoCard,
                      title: const Text('¿Eliminar venta?', style: TextStyle(color: AppColors.textoBlanco)),
                      content: Text(
                        'Se eliminará esta venta y se revertirán los fondos.\n¿Segura?',
                        style: AppTextStyles.body,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris)),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonRosa),
                          child: const Text('Eliminar'),
                        ),
                      ],
                    ),
                  ) ??
                      false;
                },
                onDismissed: (_) => app.eliminarTransaccion(tx.id),
                child: GlassCard(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.neonAmarillo.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('💵', style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.descripcion.isNotEmpty ? tx.descripcion : 'Venta directa',
                              style: AppTextStyles.cardTitle,
                            ),
                            Text(_formatFecha(tx.fecha), style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${tx.montoTotal.toStringAsFixed(2)}',
                            style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            '📈 \$${tx.cashflow.toStringAsFixed(2)}',
                            style: const TextStyle(color: AppColors.neonVerde, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  LOGIC
  // ─────────────────────────────────────────────
  void _registrarVenta(AppProvider app) {
    final text = _montoController.text.trim();
    if (text.isEmpty) return;
    final monto = double.tryParse(text);
    if (monto == null || monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('⚠️ Ingresa un monto válido mayor a 0'),
          backgroundColor: AppColors.neonRosa.withValues(alpha: 0.8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }
    if (monto > 9999) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('⚠️ El monto máximo por venta es \$9,999'),
          backgroundColor: AppColors.neonRosa.withValues(alpha: 0.8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }

    app.registrarVenta(monto, _descripcionController.text.trim());
    SoundPlayer.venta();
    setState(() {
      _montoIngresado = monto;
      _mostrandoSplit = true;
    });
    _montoController.clear();
    _descripcionController.clear();
    _successController.forward(from: 0);

    HapticFeedback.heavyImpact();
  }

  String _formatFecha(DateTime fecha) {
    final diff = DateTime.now().difference(fecha);
    if (diff.inMinutes < 1) return 'Ahora mismo';
    if (diff.inHours < 1) return 'Hace ${diff.inMinutes}m';
    if (diff.inDays < 1) return 'Hace ${diff.inHours}h';
    return '${fecha.day}/${fecha.month}';
  }
}
