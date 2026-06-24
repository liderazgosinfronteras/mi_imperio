// lib/screens/pantalla_proximamente.dart — Teaser para juegos futuros
import 'package:flutter/material.dart';
import '../theme.dart';

class PantallaProximamente extends StatelessWidget {
  final String emoji;
  final String titulo;
  final String subtitulo;
  final List<String> caracteristicas;
  final Color color;

  const PantallaProximamente({
    super.key,
    required this.emoji,
    required this.titulo,
    required this.subtitulo,
    required this.caracteristicas,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Column(children: [
          // ── Header ─────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withValues(alpha: 0.3), AppColors.fondoOscuro],
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
              ),
            ),
            child: Row(children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              const Spacer(),
            ]),
          ),
          Expanded(child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(children: [
              // Gran emoji animado
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.5, end: 1.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.elasticOut,
                builder: (_, v, child) => Transform.scale(scale: v, child: child),
                child: Text(emoji, style: const TextStyle(fontSize: 90)),
              ),
              const SizedBox(height: 20),
              // Badge Próximamente
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color.withValues(alpha: 0.6)),
                ),
                child: const Text('🚧 PRÓXIMAMENTE',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 2)),
              ),
              const SizedBox(height: 16),
              Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(subtitulo, style: AppTextStyles.caption, textAlign: TextAlign.center),
              const SizedBox(height: 36),
              // Características
              const Align(alignment: Alignment.centerLeft,
                child: Text('Lo que viene:', style: AppTextStyles.sectionTitle)),
              const SizedBox(height: 14),
              ...caracteristicas.map((c) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                ),
                child: Row(children: [
                  Icon(Icons.check_circle, color: color, size: 18),
                  const SizedBox(width: 12),
                  Expanded(child: Text(c, style: const TextStyle(color: Colors.white, fontSize: 14))),
                ]),
              )),
              const SizedBox(height: 36),
              // Mensaje motivador
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [color.withValues(alpha: 0.2), color.withValues(alpha: 0.05)]),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color.withValues(alpha: 0.4)),
                ),
                child: Column(children: [
                  const Text('🎯', style: TextStyle(fontSize: 36)),
                  const SizedBox(height: 8),
                  const Text('Mientras tanto…',
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 4),
                  const Text('Completa lecciones y juega Imperio Builder\npara estar lista cuando llegue este juego.',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, height: 1.5),
                    textAlign: TextAlign.center),
                ]),
              ),
              const SizedBox(height: 24),
              SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('← Volver a Academia',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
              )),
              const SizedBox(height: 40),
            ]),
          )),
        ]),
      ),
    );
  }
}
