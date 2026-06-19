// lib/screens/pantalla_misiones.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';

class PantallaMisiones extends StatelessWidget {
  const PantallaMisiones({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        final completadas = app.misiones.where((m) => m.completada).length;
        final total = app.misiones.length;

        return Scaffold(
          backgroundColor: AppColors.fondoOscuro,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(completadas, total),
                  const SizedBox(height: 20),
                  _buildProgresoBarra(completadas, total),
                  const SizedBox(height: 24),
                  _buildMisiones(context, app),
                  const SizedBox(height: 24),
                  _buildResumenSemana(app),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(int completadas, int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🎯 Misiones', style: AppTextStyles.heroTitle),
            Text(
              'Semana actual • $completadas/$total completadas',
              style: AppTextStyles.caption,
            ),
          ],
        ),
        GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          borderColor: AppColors.neonAmarillo.withValues(alpha: 0.4),
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 20)),
              Text(
                completadas == total && total > 0 ? '¡Todo!' : '$completadas/$total',
                style: TextStyle(
                  color: completadas == total ? AppColors.neonVerde : AppColors.neonAmarillo,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgresoBarra(int completadas, int total) {
    final pct = total == 0 ? 0.0 : completadas / total;
    return GlassCard(
      borderColor: pct == 1.0 ? AppColors.neonVerde.withValues(alpha: 0.5) : AppColors.neonMorado.withValues(alpha: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pct == 1.0 ? '¡Semana perfecta! 🎉' : 'Progreso semanal',
                style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Text(
                '${(pct * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  color: pct == 1.0 ? AppColors.neonVerde : AppColors.neonMorado,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LayoutBuilder(builder: (_, c) => Stack(children: [
            Container(height: 12, width: c.maxWidth, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(6))),
            AnimatedContainer(
              duration: const Duration(milliseconds: 800), curve: Curves.easeOutCubic,
              height: 12,
              width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(8.0, c.maxWidth),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: pct == 1.0 ? AppColors.gradienteGreen : AppColors.gradienteHero),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [BoxShadow(color: (pct == 1.0 ? AppColors.neonVerde : AppColors.neonMorado).withValues(alpha: 0.5), blurRadius: 8)],
              ),
            ),
          ])),
          if (pct == 1.0) ...[
            const SizedBox(height: 10),
            const Text('¡Completaste todas las misiones esta semana! Las nuevas llegan el lunes.', style: AppTextStyles.body),
          ],
        ],
      ),
    );
  }

  Widget _buildMisiones(BuildContext context, AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('📋 Misiones de la Semana', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        ...app.misiones.map((mision) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildTarjetaMision(context, app, mision),
        )),
      ],
    );
  }

  Widget _buildTarjetaMision(BuildContext context, AppProvider app, Mision mision) {
    final pct = mision.porcentaje;
    final esCompleta = mision.completada;

    return GlassCard(
      borderColor: esCompleta
          ? AppColors.neonVerde.withValues(alpha: 0.5)
          : AppColors.neonMorado.withValues(alpha: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: esCompleta ? AppColors.gradienteGreen : AppColors.gradienteHero),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: Text(mision.emoji, style: const TextStyle(fontSize: 24))),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mision.titulo, style: AppTextStyles.cardTitle),
                    Text(mision.descripcion, style: AppTextStyles.caption),
                  ],
                ),
              ),
              if (esCompleta)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.neonVerde.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.4)),
                  ),
                  child: const Text('✅ Lista', style: TextStyle(color: AppColors.neonVerde, fontSize: 12, fontWeight: FontWeight.w700)),
                )
              else
                Text(
                  '+${mision.gemasRecompensa}💎',
                  style: const TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800),
                ),
            ],
          ),
          const SizedBox(height: 14),
          // Progress bar
          Row(
            children: [
              Expanded(
                child: LayoutBuilder(builder: (_, c) => Stack(children: [
                  Container(height: 10, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(5))),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    height: 10,
                    width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(5.0, c.maxWidth),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: esCompleta ? AppColors.gradienteGreen : AppColors.gradienteHero),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ])),
              ),
              const SizedBox(width: 10),
              Text(
                _labelProgreso(mision),
                style: TextStyle(
                  color: esCompleta ? AppColors.neonVerde : AppColors.textoGris,
                  fontSize: 12, fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _labelProgreso(Mision m) {
    switch (m.tipo) {
      case TipoMision.ventas:
        return '\$${m.progreso.toStringAsFixed(0)} / \$${m.meta.toStringAsFixed(0)}';
      case TipoMision.lecciones:
        return '${m.progreso.toInt()} / ${m.meta.toInt()} lecciones';
      case TipoMision.diario:
        return '${m.progreso.toInt()} / ${m.meta.toInt()} días';
      case TipoMision.cashflow:
        return '\$${m.progreso.toStringAsFixed(2)} / \$${m.meta.toStringAsFixed(2)}';
    }
  }

  Widget _buildResumenSemana(AppProvider app) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📊 Tu semana en números', style: AppTextStyles.cardTitle),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _buildMiniStat('💰', 'Vendido', '\$${app.totalVentas.toStringAsFixed(0)}')),
              Expanded(child: _buildMiniStat('📚', 'Lecciones', '${app.leccionesCompletadas}')),
              Expanded(child: _buildMiniStat('🔥', 'Racha', '${app.racha} días')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(String emoji, String label, String valor) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 4),
        Text(valor, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w800, fontSize: 15)),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
