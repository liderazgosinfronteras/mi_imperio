// lib/theme.dart
import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
//  PREMIUM PASTEL-NEON PALETTE
//  "Cozy galaxy" aesthetic: deep navy base,
//  neon accent pops, soft pastel cards.
// ─────────────────────────────────────────────
class AppColors {
  // Backgrounds
  static const fondoOscuro = Color(0xFF0D0E1A);       // Deep navy
  static const fondoCard = Color(0xFF161829);          // Card bg
  static const fondoCardClaro = Color(0xFF1E2035);     // Lighter card

  // Neon accents
  static const neonVerde = Color(0xFF00FFB2);          // Cashflow / income bar
  static const neonMorado = Color(0xFFB47FFF);         // Primary CTA
  static const neonRosa = Color(0xFFFF6BA8);           // Expense bar / danger
  static const neonAmarillo = Color(0xFFFFD166);       // Gems / rewards
  static const neonAzul = Color(0xFF4ECDC4);           // Lesson completed
  static const neonCoral = Color(0xFFFF8C61);          // Streak fire

  // Pastel softs
  static const pastelMorado = Color(0xFF9B8EC4);
  static const pastelRosa = Color(0xFFFFB3D1);
  static const pastelVerde = Color(0xFF95E8C5);
  static const pastelAmarillo = Color(0xFFFFE599);

  // Text
  static const textoBlanco = Color(0xFFF0F2FF);
  static const textoGris = Color(0xFF8890B0);
  static const textoSubtitulo = Color(0xFFADB5D9);

  // Gradients
  static const gradienteHero = [Color(0xFF6B35E8), Color(0xFFB47FFF)];
  static const gradienteGreen = [Color(0xFF00FFB2), Color(0xFF06D6A0)];
  static const gradienteRed = [Color(0xFFFF6BA8), Color(0xFFFF4466)];
  static const gradienteGold = [Color(0xFFFFD166), Color(0xFFFF9F1C)];
  static const gradienteSky = [Color(0xFF4ECDC4), Color(0xFF44B8D6)];
}

// ─────────────────────────────────────────────
//  TEXT STYLES
// ─────────────────────────────────────────────
class AppTextStyles {
  static const heroTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: AppColors.textoBlanco,
    letterSpacing: -0.5,
  );

  static const sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.textoBlanco,
  );

  static const cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textoBlanco,
  );

  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textoSubtitulo,
    height: 1.5,
  );

  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textoGris,
  );

  static const neonGreen = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: AppColors.neonVerde,
  );

  static const neonPurple = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: AppColors.neonMorado,
  );
}

// ─────────────────────────────────────────────
//  THEME DATA
// ─────────────────────────────────────────────
ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.fondoOscuro,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.neonMorado,
      secondary: AppColors.neonVerde,
      surface: AppColors.fondoCard,
      error: AppColors.neonRosa,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.fondoOscuro,
      elevation: 0,
      titleTextStyle: AppTextStyles.sectionTitle,
      iconTheme: IconThemeData(color: AppColors.textoBlanco),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.neonMorado,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fondoCardClaro,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.pastelMorado),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF2E3150)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.neonMorado, width: 2),
      ),
      labelStyle: const TextStyle(color: AppColors.textoGris),
      prefixIconColor: AppColors.neonMorado,
    ),
  );
}

// ─────────────────────────────────────────────
//  REUSABLE WIDGETS
// ─────────────────────────────────────────────
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? borderColor;
  final double borderRadius;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderColor,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? const Color(0xFF252840),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (borderColor ?? Colors.transparent).withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}

class NeonButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final String? emoji;
  final bool isSmall;

  const NeonButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.gradientColors = AppColors.gradienteHero,
    this.emoji,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isSmall ? 10 : 16,
          horizontal: isSmall ? 16 : 24,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradientColors.first.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (emoji != null) ...[
              Text(emoji!, style: TextStyle(fontSize: isSmall ? 16 : 20)),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: isSmall ? 14 : 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
