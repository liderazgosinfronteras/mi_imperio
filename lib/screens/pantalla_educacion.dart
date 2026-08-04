// lib/screens/pantalla_educacion.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import 'pantalla_gran_reto.dart';
import 'pantalla_biblioteca.dart';

class PantallaEducacion extends StatefulWidget {
  const PantallaEducacion({super.key});

  @override
  State<PantallaEducacion> createState() => _PantallaEducacionState();
}

class _PantallaEducacionState extends State<PantallaEducacion> {
  bool _showBiblioteca = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Column(
          children: [
            _buildTabSelector(),
            Expanded(
              child: _showBiblioteca
                  ? const PantallaBiblioteca()
                  : const PantallaGranReto(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSelector() {
    return Container(
      color: AppColors.fondoCard,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: _TabBtn(
              label: '🌍 El Gran Reto',
              activo: !_showBiblioteca,
              onTap: () => setState(() => _showBiblioteca = false),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _TabBtn(
              label: '📚 Biblioteca',
              activo: _showBiblioteca,
              onTap: () => setState(() => _showBiblioteca = true),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBtn extends StatelessWidget {
  final String label;
  final bool activo;
  final VoidCallback onTap;
  const _TabBtn({required this.label, required this.activo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient:
              activo ? const LinearGradient(colors: AppColors.gradienteHero) : null,
          color: activo ? null : AppColors.fondoCardClaro,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: activo ? Colors.white : AppColors.textoGris,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
