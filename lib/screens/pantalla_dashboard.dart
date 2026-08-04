// lib/screens/pantalla_dashboard.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';
import 'pantalla_historial.dart';

class PantallaDashboard extends StatelessWidget {
  const PantallaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        return Scaffold(
          backgroundColor: AppColors.fondoOscuro,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(app),
                  const SizedBox(height: 20),
                  _buildRatRaceMeter(app),
                  const SizedBox(height: 20),
                  _buildGamificationRow(context, app),
                  const SizedBox(height: 20),
                  _buildCashflowCards(app),
                  const SizedBox(height: 20),
                  if (app.historialGrafica.length >= 2) ...[
                    _buildCashflowChart(app),
                    const SizedBox(height: 20),
                  ],
                  _buildBibliotecaProgress(app),
                  const SizedBox(height: 20),
                  _buildStocksPreview(app),
                  const SizedBox(height: 20),
                  _buildTransactionHistory(context, app),
                  if (kDebugMode) ...[
                    const SizedBox(height: 20),
                    _buildDaySimulatorDebug(context, app),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                app.libertadFinanciera ? '¡ERES LIBRE! 🎉' : 'Mi Imperio 👑',
                style: AppTextStyles.heroTitle,
              ),
              Text(
                '${app.nombreDia} • Nivel ${app.nivelActual}',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
        _buildAvatarBadge(app),
      ],
    );
  }

  Widget _buildAvatarBadge(AppProvider app) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      borderColor: AppColors.neonMorado,
      child: Column(
        children: [
          Text(app.avatarActual, style: const TextStyle(fontSize: 28)),
          Text(
            'Nv. ${app.nivelActual}',
            style: const TextStyle(
              color: AppColors.neonMorado,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  RAT RACE METER
  // ─────────────────────────────────────────────
  Widget _buildRatRaceMeter(AppProvider app) {
    final pct = app.porcentajeLiberacion;
    final esLibre = app.libertadFinanciera;
    final sinVentas = app.estiloVidaSemana == 0;

    return GlassCard(
      borderColor: esLibre
          ? AppColors.neonVerde
          : sinVentas
              ? AppColors.neonMorado.withValues(alpha: 0.4)
              : AppColors.neonMorado,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('⚡ Medidor de Libertad', style: AppTextStyles.cardTitle),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: esLibre ? AppColors.gradienteGreen : AppColors.gradienteHero,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  sinVentas
                      ? 'Sin datos'
                      : esLibre
                          ? '¡LIBRE!'
                          : '${(pct * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Tu Cashflow acumulado vs los gastos de esta semana',
            style: AppTextStyles.caption,
          ),
          const SizedBox(height: 16),

          _buildBarLabel(
            '🔴 Gastos (esta semana)',
            sinVentas ? '\$0.00' : '\$${app.estiloVidaSemana.toStringAsFixed(2)}',
            AppColors.neonRosa,
          ),
          const SizedBox(height: 6),
          _buildBar(sinVentas ? 0.0 : 1.0, AppColors.gradienteRed),
          const SizedBox(height: 14),

          _buildBarLabel(
            '🟢 Cashflow (acumulado)',
            '\$${app.fondoCashflow.toStringAsFixed(2)}',
            AppColors.neonVerde,
          ),
          const SizedBox(height: 6),
          _buildBar(sinVentas ? 0.0 : pct, AppColors.gradienteGreen),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.fondoCardClaro,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  sinVentas ? '💡' : esLibre ? '🏆' : '🐀',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    sinVentas
                        ? 'Registra tu primera venta para ver el medidor en acción.'
                        : esLibre
                            ? '¡Tu Cashflow supera tus gastos semanales! Eres LIBRE. 🦋'
                            : 'Cuando la Barra Verde supere la Roja, ¡eres libre! Sigue vendiendo.',
                    style: AppTextStyles.body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarLabel(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.caption),
        Text(value, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w800)),
      ],
    );
  }

  Widget _buildBar(double pct, List<Color> colors) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        return Stack(
          children: [
            Container(
              height: 16,
              width: w,
              decoration: BoxDecoration(
                color: AppColors.fondoCardClaro,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutCubic,
              height: 16,
              width: pct <= 0 ? 0 : (w * pct).clamp(8.0, w),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: colors.first.withValues(alpha: 0.55), blurRadius: 10),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  //  GAMIFICATION ROW
  // ─────────────────────────────────────────────
  Widget _buildGamificationRow(BuildContext context, AppProvider app) {
    return Row(
      children: [
        Expanded(child: _buildStatChip('🔥', '${app.racha}', 'Racha', AppColors.neonCoral)),
        const SizedBox(width: 10),
        Expanded(child: _buildStatChip('💎', '${app.gemas}', 'Gemas', AppColors.neonAzul)),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: app.vidas == 0 && app.puedeRestaurarVidas
                ? () => _mostrarRestaurarVidas(context, app)
                : null,
            child: GlassCard(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              borderColor: app.vidas == 0 ? AppColors.neonRosa : AppColors.neonRosa.withValues(alpha: 0.4),
              child: Column(
                children: [
                  Text(app.vidas == 0 ? '💔' : '❤️', style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 4),
                  Text(
                    '${app.vidas}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.neonRosa,
                    ),
                  ),
                  Text(app.vidas == 0 ? '¡Tocar!' : 'Vidas', style: AppTextStyles.caption),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _mostrarRestaurarVidas(BuildContext context, AppProvider app) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('❤️ Restaurar Vidas', style: TextStyle(color: AppColors.textoBlanco)),
        content: Text(
          '¿Usar 30💎 para recuperar todas tus vidas?\nTienes ${app.gemas} gemas.',
          style: AppTextStyles.body,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris)),
          ),
          ElevatedButton(
            onPressed: () {
              app.restaurarVidas();
              Navigator.pop(context);
            },
            child: const Text('Usar 30💎'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(String emoji, String value, String label, Color color) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      borderColor: color.withValues(alpha: 0.4),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  CASHFLOW CARDS
  // ─────────────────────────────────────────────
  Widget _buildCashflowCards(AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('💼 Mis Fondos', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildFundCard('🔄', 'Reinversión', '30%', app.fondoReinversion, AppColors.gradienteGold, 'Para suministros'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildFundCard('📈', 'Cashflow', '30%', app.fondoCashflow, AppColors.gradienteGreen, 'Tus acciones'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GlassCard(
          borderColor: AppColors.neonRosa.withValues(alpha: 0.3),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppColors.gradienteRed),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('🛍️', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Estilo de Vida (40%)', style: AppTextStyles.cardTitle),
                    Text('Gastos acumulados totales', style: AppTextStyles.caption),
                  ],
                ),
              ),
              Text(
                '\$${app.estiloVida.toStringAsFixed(2)}',
                style: const TextStyle(color: AppColors.neonRosa, fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        GlassCard(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('💰 Total Vendido', style: AppTextStyles.body),
              Text(
                '\$${app.totalVentas.toStringAsFixed(2)}',
                style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFundCard(String emoji, String nombre, String pct, double valor, List<Color> gradient, String descripcion) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradient),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(emoji, style: const TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 8),
              Text(pct, style: TextStyle(color: gradient.first, fontSize: 14, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 10),
          Text(nombre, style: AppTextStyles.cardTitle),
          Text(descripcion, style: AppTextStyles.caption),
          const SizedBox(height: 8),
          Text(
            '\$${valor.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: gradient.first),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  CASHFLOW CHART (fl_chart)
  // ─────────────────────────────────────────────
  Widget _buildCashflowChart(AppProvider app) {
    final puntos = app.historialGrafica;
    if (puntos.length < 2) return const SizedBox.shrink();

    final spots = puntos.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.cashflow)).toList();

    final maxY = puntos.map((p) => p.cashflow).reduce((a, b) => a > b ? a : b);
    final minY = 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('📈 Evolución del Cashflow', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        GlassCard(
          padding: const EdgeInsets.fromLTRB(12, 20, 20, 12),
          child: SizedBox(
            height: 140,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: (spots.length - 1).toDouble(),
                minY: minY,
                maxY: maxY == 0 ? 1 : maxY * 1.2,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: AppColors.neonVerde,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.neonVerde.withValues(alpha: 0.12),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => AppColors.fondoCard,
                    getTooltipItems: (spots) => spots
                        .map((s) => LineTooltipItem(
                              '\$${s.y.toStringAsFixed(2)}',
                              const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w700, fontSize: 12),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '${puntos.length} registros de cashflow',
          style: AppTextStyles.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  BIBLIOTECA PROGRESS
  // ─────────────────────────────────────────────
  Widget _buildBibliotecaProgress(AppProvider app) {
    final total = app.libros.length;
    final completados = app.librosCompletados;
    final enProgreso = app.librosEnProgreso;
    final pct = total == 0 ? 0.0 : (completados / total).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('📚 Biblioteca', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        GlassCard(
          borderColor: AppColors.neonAzul.withValues(alpha: 0.35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        '$completados de $total libros leídos',
                        style: const TextStyle(color: AppColors.textoBlanco, fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        enProgreso > 0 ? '$enProgreso en progreso' : 'Comienza un libro en Academia',
                        style: AppTextStyles.caption,
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.neonAzul.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.neonAzul.withValues(alpha: 0.4)),
                    ),
                    child: Text(
                      '${(pct * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(color: AppColors.neonAzul, fontSize: 14, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LayoutBuilder(
                builder: (_, c) => Stack(children: [
                  Container(height: 10, width: c.maxWidth,
                      decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(5))),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800), curve: Curves.easeOutCubic,
                    height: 10,
                    width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(6.0, c.maxWidth),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFF0072FF), Color(0xFF00C6FF)]),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(color: AppColors.neonAzul.withValues(alpha: 0.5), blurRadius: 6)],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  STOCKS PREVIEW
  // ─────────────────────────────────────────────
  Widget _buildStocksPreview(AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('📊 Mercado en Vivo', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        const Text('Tu Cashflow invierte aquí automáticamente', style: AppTextStyles.caption),
        const SizedBox(height: 12),
        ...app.acciones.take(3).map((accion) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text(accion.emoji, style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(accion.nombre, style: AppTextStyles.cardTitle),
                          Text(accion.ticker, style: AppTextStyles.caption),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${accion.precio.toStringAsFixed(2)}',
                          style: const TextStyle(color: AppColors.textoBlanco, fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          '${accion.variacion >= 0 ? '+' : ''}${accion.variacion.toStringAsFixed(2)}%',
                          style: TextStyle(
                            color: accion.variacion >= 0 ? AppColors.neonVerde : AppColors.neonRosa,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
        TextButton(
          onPressed: () => app.simularMovimientoMercado(),
          child: const Text('🔄 Actualizar Mercado', style: TextStyle(color: AppColors.neonAzul)),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  HISTORIAL DE VENTAS (últimas 5 + botón ver todo)
  // ─────────────────────────────────────────────
  Widget _buildTransactionHistory(BuildContext context, AppProvider app) {
    if (app.transacciones.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('📋 Últimas Ventas', style: AppTextStyles.sectionTitle),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PantallaHistorial()),
              ),
              child: const Text('Ver todo →', style: TextStyle(color: AppColors.neonAzul, fontSize: 13)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...app.transacciones.take(5).map((tx) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlassCard(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const Text('💵', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.descripcion.isNotEmpty ? tx.descripcion : 'Venta',
                            style: AppTextStyles.cardTitle,
                          ),
                          Text(
                            '🔄 \$${tx.reinversion.toStringAsFixed(2)} | 📈 \$${tx.cashflow.toStringAsFixed(2)}',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${tx.montoTotal.toStringAsFixed(2)}',
                      style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  DEBUG — Simulador de Días
  // ─────────────────────────────────────────────
  Widget _buildDaySimulatorDebug(BuildContext context, AppProvider app) {
    return GlassCard(
      borderColor: AppColors.pastelMorado.withValues(alpha: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🛠️ DEBUG — Simulador de Días', style: AppTextStyles.cardTitle),
          const Text('Solo visible en modo desarrollo (flutter run)', style: AppTextStyles.caption),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${app.nombreDiaDebug} • ${app.esDiaEducacion ? '📚 Edu' : '🏪 Mercado'}',
                style: const TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w700),
              ),
              ElevatedButton.icon(
                onPressed: () => app.avanzarDia(),
                icon: const Icon(Icons.skip_next, size: 16),
                label: const Text('Siguiente Día'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.fondoCardClaro,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
