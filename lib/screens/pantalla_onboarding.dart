// lib/screens/pantalla_onboarding.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class PantallaOnboarding extends StatefulWidget {
  const PantallaOnboarding({super.key});

  @override
  State<PantallaOnboarding> createState() => _PantallaOnboardingState();
}

class _PantallaOnboardingState extends State<PantallaOnboarding>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _paginaActual = 0;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  final List<_SlideData> _slides = const [
    _SlideData(
      emoji: '👑',
      titulo: '¡Bienvenida a\nMi Imperio!',
      descripcion:
          'Esta app convierte tu negocio real en un juego de libertad financiera. Cada venta que haces aquí se divide automáticamente en 3 fondos.',
      colorGradiente: AppColors.gradienteHero,
      colorBorde: AppColors.neonMorado,
    ),
    _SlideData(
      emoji: '💰',
      titulo: 'La Regla del\n30 / 40 / 30',
      descripcion:
          'Cada vez que registras una venta, el dinero se divide solo:\n\n🔄 30% → Reinversión (suministros)\n🛍️ 40% → Estilo de Vida (gastos)\n📈 30% → Cashflow (acciones)',
      colorGradiente: AppColors.gradienteGold,
      colorBorde: AppColors.neonAmarillo,
    ),
    _SlideData(
      emoji: '🐀',
      titulo: 'Escapa de la\nCarrera de Ratas',
      descripcion:
          'La Barra Roja son tus gastos. La Barra Verde es lo que te genera tu dinero invertido.\n\nCuando la Verde supera la Roja... ¡eres LIBRE! 🦋',
      colorGradiente: AppColors.gradienteGreen,
      colorBorde: AppColors.neonVerde,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _irSiguiente() {
    if (_paginaActual < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _terminar();
    }
  }

  void _terminar() {
    Provider.of<AppProvider>(context, listen: false).completarOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: Column(
            children: [
              // Skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _terminar,
                  child: const Text(
                    'Saltar',
                    style: TextStyle(color: AppColors.textoGris, fontSize: 14),
                  ),
                ),
              ),

              // Pages
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _paginaActual = i),
                  itemCount: _slides.length,
                  itemBuilder: (_, i) => _buildSlide(_slides[i]),
                ),
              ),

              // Dots + Button
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _slides.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _paginaActual == i ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _paginaActual == i
                                ? _slides[_paginaActual].colorBorde
                                : AppColors.fondoCardClaro,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: NeonButton(
                        label: _paginaActual == _slides.length - 1
                            ? '¡Empezar mi Imperio! 🚀'
                            : 'Siguiente →',
                        onPressed: _irSiguiente,
                        gradientColors: _slides[_paginaActual].colorGradiente,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlide(_SlideData slide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Emoji con halo
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: slide.colorGradiente),
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: slide.colorBorde.withValues(alpha: 0.5),
                  blurRadius: 48,
                  spreadRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Text(slide.emoji,
                  style: const TextStyle(fontSize: 64)),
            ),
          ),
          const SizedBox(height: 40),

          // Título
          Text(
            slide.titulo,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: AppColors.textoBlanco,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Descripción
          GlassCard(
            borderColor: slide.colorBorde.withValues(alpha: 0.3),
            child: Text(
              slide.descripcion,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textoSubtitulo,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _SlideData {
  final String emoji;
  final String titulo;
  final String descripcion;
  final List<Color> colorGradiente;
  final Color colorBorde;

  const _SlideData({
    required this.emoji,
    required this.titulo,
    required this.descripcion,
    required this.colorGradiente,
    required this.colorBorde,
  });
}
