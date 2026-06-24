// lib/screens/pantalla_juegos.dart — Hub de Juegos y Herramientas
import 'package:flutter/material.dart';
import '../theme.dart';
import 'pantalla_quiz.dart';
import 'pantalla_juego_vida.dart';
import 'pantalla_monopolio.dart';
import 'pantalla_cashflow_lobby.dart';
import 'pantalla_social.dart';
import 'pantalla_herramientas.dart';
import 'pantalla_estadisticas.dart';

class PantallaJuegos extends StatelessWidget {
  const PantallaJuegos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('🎮 Juegos & Herramientas', style: AppTextStyles.heroTitle),
              const SizedBox(height: 4),
              const Text('Aprende finanzas jugando', style: AppTextStyles.caption),
              const SizedBox(height: 24),

              const Text('🕹️ JUEGOS', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),

              _JuegoCard(
                emoji: '🎯',
                titulo: 'Quiz Financiero',
                descripcion: 'Pon a prueba tus conocimientos y gana gemas',
                color1: const Color(0xFF6A1B9A),
                color2: const Color(0xFF9C27B0),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PantallaQuiz())),
              ),
              const SizedBox(height: 12),

              _JuegoCard(
                emoji: '🎲',
                titulo: 'Juego de la Vida',
                descripcion: 'Simula decisiones financieras a lo largo de tu vida',
                color1: const Color(0xFF0D47A1),
                color2: const Color(0xFF1976D2),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PantallaJuegoVida())),
              ),
              const SizedBox(height: 12),

              _JuegoCard(
                emoji: '♟️',
                titulo: 'Monopolio LSF',
                descripcion: 'Invierte en propiedades y construye tu imperio',
                color1: const Color(0xFF1B5E20),
                color2: const Color(0xFF388E3C),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PantallaMonopolio())),
              ),
              const SizedBox(height: 12),

              _JuegoCard(
                emoji: '💰',
                titulo: 'Cashflow Multijugador',
                descripcion: 'Juega Cashflow en tiempo real con hasta 6 jugadoras',
                color1: const Color(0xFFE65100),
                color2: const Color(0xFFFF6D00),
                badge: 'MULTIJUGADOR',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PantallaCashflowLobby())),
              ),
              const SizedBox(height: 12),

              _JuegoCard(
                emoji: '👥',
                titulo: 'Desafíos Sociales',
                descripcion: 'Compite con amigas y sube al ranking global',
                color1: const Color(0xFF880E4F),
                color2: const Color(0xFFE91E63),
                badge: 'MULTIJUGADOR',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PantallaSocial())),
              ),

              const SizedBox(height: 28),
              const Text('🔧 HERRAMIENTAS', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),

              Row(children: [
                Expanded(
                  child: _HerramientaCard(
                    emoji: '💰',
                    titulo: 'Presupuesto',
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const PantallaHerramientas(tabInicial: 0))),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _HerramientaCard(
                    emoji: '📈',
                    titulo: 'Interés Compuesto',
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const PantallaHerramientas(tabInicial: 1))),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: _HerramientaCard(
                    emoji: '🎯',
                    titulo: 'Libertad Financiera',
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const PantallaHerramientas(tabInicial: 2))),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _HerramientaCard(
                    emoji: '📊',
                    titulo: 'Estadísticas',
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const PantallaEstadisticas())),
                  ),
                ),
              ]),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _JuegoCard extends StatelessWidget {
  final String emoji;
  final String titulo;
  final String descripcion;
  final Color color1;
  final Color color2;
  final String? badge;
  final VoidCallback onTap;

  const _JuegoCard({
    required this.emoji,
    required this.titulo,
    required this.descripcion,
    required this.color1,
    required this.color2,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: color2.withValues(alpha: 0.35), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Row(children: [
          Text(emoji, style: const TextStyle(fontSize: 42)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)),
                if (badge != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(badge!, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w900)),
                  ),
                ],
              ]),
              const SizedBox(height: 4),
              Text(descripcion, style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12, height: 1.3)),
            ]),
          ),
          const SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios, color: Colors.white.withValues(alpha: 0.6), size: 16),
        ]),
      ),
    );
  }
}

class _HerramientaCard extends StatelessWidget {
  final String emoji;
  final String titulo;
  final VoidCallback onTap;

  const _HerramientaCard({required this.emoji, required this.titulo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        borderColor: AppColors.neonVerde.withValues(alpha: 0.3),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 8),
          Text(titulo, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700, fontSize: 12), textAlign: TextAlign.center),
          const SizedBox(height: 4),
          const Icon(Icons.arrow_forward_ios, color: AppColors.textoGris, size: 12),
        ]),
      ),
    );
  }
}
