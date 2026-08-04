// lib/screens/pantalla_libro_detalle.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/libro_model.dart';
import '../theme.dart';
import 'pantalla_lector_libro.dart';
import 'pantalla_quiz_libro.dart';

class PantallaLibroDetalle extends StatelessWidget {
  final Libro libro;
  const PantallaLibroDetalle({super.key, required this.libro});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        final capitulosLeidos = app.capitulosLeidos(libro.id);
        final totalCaps = libro.capitulos.length;
        final todosLeidos = capitulosLeidos.length >= totalCaps;
        final isCompletado = libro.estado == EstadoLibro.completado;

        return Scaffold(
          backgroundColor: AppColors.fondoOscuro,
          body: CustomScrollView(
            slivers: [
              _buildAppBar(context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHero(isCompletado),
                      const SizedBox(height: 24),
                      _buildProgreso(capitulosLeidos.length, totalCaps),
                      const SizedBox(height: 24),
                      const Text('📖 Capítulos del Resumen', style: AppTextStyles.sectionTitle),
                      const SizedBox(height: 12),
                      ...List.generate(totalCaps, (i) => _CapituloTile(
                        libro: libro,
                        index: i,
                        leido: capitulosLeidos.contains(i),
                      )),
                      const SizedBox(height: 24),
                      if (todosLeidos && !isCompletado)
                        _buildQuizButton(context)
                      else if (isCompletado)
                        _buildCompletadoBadge()
                      else
                        _buildEmpezarButton(context, capitulosLeidos),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.fondoOscuro,
      foregroundColor: AppColors.textoBlanco,
      pinned: true,
      title: Text(
        libro.categoria.nombre,
        style: const TextStyle(fontSize: 14, color: AppColors.textoGris),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildHero(bool isCompletado) {
    return GlassCard(
      borderColor: isCompletado
          ? AppColors.neonVerde
          : AppColors.neonMorado.withValues(alpha: 0.4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isCompletado
                    ? AppColors.gradienteGreen
                    : AppColors.gradienteHero,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(libro.emoji, style: const TextStyle(fontSize: 40)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  libro.titulo,
                  style: const TextStyle(
                    color: AppColors.textoBlanco,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(libro.autor, style: AppTextStyles.caption),
                Text(libro.anio, style: AppTextStyles.caption),
                const SizedBox(height: 8),
                Text(
                  libro.resumenCorto,
                  style: const TextStyle(
                    color: Color(0xFFCDD0E3),
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.neonAmarillo.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.neonAmarillo.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    '+${libro.gemasRecompensa} 💎 al completar',
                    style: const TextStyle(
                      color: AppColors.neonAmarillo,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgreso(int leidos, int total) {
    final pct = total == 0 ? 0.0 : leidos / total;
    return GlassCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Progreso de lectura', style: AppTextStyles.cardTitle),
              Text(
                '$leidos/$total capítulos',
                style: const TextStyle(
                  color: AppColors.neonMorado,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: pct,
              backgroundColor: AppColors.fondoCardClaro,
              valueColor: AlwaysStoppedAnimation(
                pct >= 1.0 ? AppColors.neonVerde : AppColors.neonMorado,
              ),
              minHeight: 10,
            ),
          ),
          if (leidos == 0) ...[
            const SizedBox(height: 8),
            const Text(
              '📝 Cada capítulo resume ~10 páginas del libro',
              style: AppTextStyles.caption,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmpezarButton(BuildContext context, Set<int> capitulosLeidos) {
    final siguienteCapitulo = capitulosLeidos.isEmpty
        ? 0
        : List.generate(libro.capitulos.length, (i) => i)
            .firstWhere((i) => !capitulosLeidos.contains(i), orElse: () => 0);

    return SizedBox(
      width: double.infinity,
      child: NeonButton(
        label: capitulosLeidos.isEmpty ? 'Empezar a Leer' : 'Continuar Leyendo',
        emoji: capitulosLeidos.isEmpty ? '📖' : '▶️',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PantallaLectorLibro(
              libro: libro,
              capituloInicial: siguienteCapitulo,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizButton(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.neonVerde.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.4)),
          ),
          child: Row(
            children: [
              const Text('🎉', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '¡Leíste todos los capítulos! Ahora demuestra lo que aprendiste.',
                  style: AppTextStyles.body,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: NeonButton(
            label: 'Tomar el Quiz (+${libro.gemasRecompensa}💎)',
            emoji: '🎯',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PantallaQuizLibro(libro: libro),
              ),
            ),
            gradientColors: AppColors.gradienteGreen,
          ),
        ),
      ],
    );
  }

  Widget _buildCompletadoBadge() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: AppColors.gradienteGreen),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('🏆', style: TextStyle(fontSize: 32)),
          SizedBox(width: 12),
          Text(
            '¡Libro Completado!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  TILE DE CAPÍTULO
// ─────────────────────────────────────────────
class _CapituloTile extends StatelessWidget {
  final Libro libro;
  final int index;
  final bool leido;

  const _CapituloTile({
    required this.libro,
    required this.index,
    required this.leido,
  });

  @override
  Widget build(BuildContext context) {
    final cap = libro.capitulos[index];

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PantallaLectorLibro(
            libro: libro,
            capituloInicial: index,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.fondoCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: leido
                ? AppColors.neonVerde.withValues(alpha: 0.5)
                : const Color(0xFF252840),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: leido
                      ? AppColors.gradienteGreen
                      : [AppColors.fondoCardClaro, AppColors.fondoCard],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  leido ? '✅' : cap.emoji,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cap. ${index + 1}: ${cap.titulo}',
                    style: TextStyle(
                      color: leido ? AppColors.neonVerde : AppColors.textoBlanco,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    leido ? 'Leído ✓' : '~10 págs de resumen',
                    style: TextStyle(
                      color: leido ? AppColors.neonVerde : AppColors.textoGris,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textoGris,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
