// lib/screens/pantalla_reto_nivel.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';

const List<List<Color>> _kGradientes = [
  [Color(0xFF4A00E0), Color(0xFF7B2FF7)],
  [Color(0xFF0072FF), Color(0xFF00C6FF)],
  [Color(0xFF11998E), Color(0xFF38EF7D)],
  [Color(0xFFFF6B35), Color(0xFFF7C59F)],
  [Color(0xFF667EEA), Color(0xFF764BA2)],
  [Color(0xFFFC466B), Color(0xFF3F5EFB)],
  [Color(0xFFF953C6), Color(0xFFB91D73)],
  [Color(0xFFF7971E), Color(0xFFFFD200)],
  [Color(0xFF56CCF2), Color(0xFF2F80ED)],
  [Color(0xFF6B0AC9), Color(0xFFE040FB)],
];

class PantallaRetoNivel extends StatefulWidget {
  final int moduloId;
  const PantallaRetoNivel({super.key, required this.moduloId});

  @override
  State<PantallaRetoNivel> createState() => _PantallaRetoNivelState();
}

class _PantallaRetoNivelState extends State<PantallaRetoNivel>
    with SingleTickerProviderStateMixin {
  late int _questionIndex;
  int _seleccionado = -1;
  bool _respondido = false;
  bool _correcto = false;
  bool _completado = false;
  int _correctasEnSesion = 0;
  int _respondidosEnSesion = 0;
  late AnimationController _celebracionCtrl;

  @override
  void initState() {
    super.initState();
    _celebracionCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    final app = Provider.of<AppProvider>(context, listen: false);
    final modulo = app.retoModulos[widget.moduloId];
    _questionIndex = app.progresoModulo(widget.moduloId);
    if (_questionIndex >= modulo.preguntas.length) {
      _completado = true;
    }
  }

  @override
  void dispose() {
    _celebracionCtrl.dispose();
    super.dispose();
  }

  void _responder(int index) {
    if (_respondido) return;
    final app = Provider.of<AppProvider>(context, listen: false);
    final modulo = app.retoModulos[widget.moduloId];
    final pregunta = modulo.preguntas[_questionIndex];
    final correcto = index == pregunta.respuestaCorrecta;
    _respondidosEnSesion++;
    if (correcto) _correctasEnSesion++;
    setState(() {
      _seleccionado = index;
      _respondido = true;
      _correcto = correcto;
    });
    app.completarNivelReto(widget.moduloId, correcto);
  }

  void _siguiente() {
    final app = Provider.of<AppProvider>(context, listen: false);
    final modulo = app.retoModulos[widget.moduloId];
    final siguiente = _questionIndex + 1;
    if (siguiente >= modulo.preguntas.length) {
      _celebracionCtrl.forward();
      setState(() => _completado = true);
    } else {
      setState(() {
        _questionIndex = siguiente;
        _seleccionado = -1;
        _respondido = false;
        _correcto = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final modulo = app.retoModulos[widget.moduloId];
    final gradiente = _kGradientes[widget.moduloId];

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: modulo.preguntas.isEmpty
          ? _buildEmptyState(modulo)
          : _completado
              ? _buildCompletionScreen(modulo, gradiente)
              : _buildQuizScreen(app, modulo, gradiente),
    );
  }

  Widget _buildEmptyState(RetoModulo modulo) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco),
              ),
            ),
            const SizedBox(height: 32),
            Text(modulo.emoji, style: const TextStyle(fontSize: 60)),
            const SizedBox(height: 16),
            Text(modulo.nombre,
                style: const TextStyle(color: AppColors.textoBlanco, fontSize: 20, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center),
            const SizedBox(height: 12),
            const Text('Este módulo aún no tiene preguntas disponibles.\nLee más libros de la categoría para activarlo.',
                style: AppTextStyles.body, textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  PANTALLA DE QUIZ
  // ─────────────────────────────────────────────
  Widget _buildQuizScreen(AppProvider app, RetoModulo modulo, List<Color> gradiente) {
    final total = modulo.preguntas.length;
    final pct = total == 0 ? 0.0 : ((_questionIndex) / total).clamp(0.0, 1.0);
    final pregunta = modulo.preguntas[_questionIndex];

    return SafeArea(
      child: Column(
        children: [
          // App bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.fondoCard,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.arrow_back_ios,
                        color: AppColors.textoBlanco, size: 18),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${modulo.emoji} ${modulo.nombre}',
                        style: const TextStyle(
                            color: AppColors.textoBlanco,
                            fontSize: 14,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '${_questionIndex + 1} / $total',
                        style: const TextStyle(
                            color: AppColors.textoGris, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.neonAmarillo.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.neonAmarillo.withValues(alpha: 0.4)),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Text('💎', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text('+${_correctasEnSesion * 5}',
                        style: const TextStyle(
                            color: AppColors.neonAmarillo,
                            fontSize: 13,
                            fontWeight: FontWeight.w800)),
                  ]),
                ),
              ],
            ),
          ),
          // Progress bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 7,
                backgroundColor: AppColors.fondoCardClaro,
                valueColor:
                    AlwaysStoppedAnimation<Color>(gradiente[0]),
              ),
            ),
          ),
          // Question
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question number badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: gradiente),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      modulo.bandera +
                          '  Nivel ${_questionIndex + 1}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Question text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.fondoCard,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color(0xFF252840), width: 1),
                    ),
                    child: Text(
                      pregunta.enunciado,
                      style: const TextStyle(
                          color: AppColors.textoBlanco,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          height: 1.45),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Options
                  ...List.generate(pregunta.opciones.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _OptionButton(
                        label: pregunta.opciones[i],
                        index: i,
                        seleccionado: _seleccionado,
                        respondido: _respondido,
                        correcta: pregunta.respuestaCorrecta,
                        gradiente: gradiente,
                        onTap: () => _responder(i),
                      ),
                    );
                  }),
                  // Explanation
                  if (_respondido) ...[
                    const SizedBox(height: 8),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _correcto
                            ? AppColors.neonVerde.withValues(alpha: 0.12)
                            : AppColors.neonCoral.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _correcto
                              ? AppColors.neonVerde.withValues(alpha: 0.4)
                              : AppColors.neonCoral.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                _correcto
                                    ? '✅ ¡Correcto! +5💎'
                                    : '❌ Respuesta incorrecta',
                                style: TextStyle(
                                  color: _correcto
                                      ? AppColors.neonVerde
                                      : AppColors.neonCoral,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            pregunta.explicacion,
                            style: const TextStyle(
                                color: AppColors.textoBlanco,
                                fontSize: 13,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: AppColors.textoGris),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            child: const Text('Salir',
                                style: TextStyle(
                                    color: AppColors.textoGris,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: _siguiente,
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              backgroundColor: gradiente[0],
                            ),
                            child: const Text(
                              'Siguiente →',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  PANTALLA DE COMPLETADO
  // ─────────────────────────────────────────────
  Widget _buildCompletionScreen(RetoModulo modulo, List<Color> gradiente) {
    final pctCorrecto = _respondidosEnSesion == 0
        ? 100
        : ((_correctasEnSesion / _respondidosEnSesion) * 100).round();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradiente[0].withValues(alpha: 0.8), AppColors.fondoOscuro],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🎉', style: TextStyle(fontSize: 60)),
                const SizedBox(height: 16),
                Text(
                  '¡MÓDULO COMPLETADO!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      shadows: [
                        Shadow(
                            color: gradiente[0],
                            blurRadius: 20)
                      ]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(modulo.paisEmoji,
                    style: const TextStyle(fontSize: 52)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: gradiente),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${modulo.bandera} ¡${modulo.pais} Desbloqueado!',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '"${modulo.paisDesc}"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      height: 1.4),
                ),
                const SizedBox(height: 28),
                // Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _StatChip(
                        emoji: '✅',
                        label: '$_correctasEnSesion correctas'),
                    const SizedBox(width: 12),
                    _StatChip(
                        emoji: '💎',
                        label:
                            '+${_correctasEnSesion * 5 + 50} gemas'),
                    const SizedBox(width: 12),
                    _StatChip(
                        emoji: '🎯',
                        label: '$pctCorrecto%'),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(
                      '← Volver al Mapa',
                      style: TextStyle(
                          color: gradiente[0],
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  OPTION BUTTON
// ─────────────────────────────────────────────
class _OptionButton extends StatelessWidget {
  final String label;
  final int index;
  final int seleccionado;
  final bool respondido;
  final int correcta;
  final List<Color> gradiente;
  final VoidCallback onTap;

  const _OptionButton({
    required this.label,
    required this.index,
    required this.seleccionado,
    required this.respondido,
    required this.correcta,
    required this.gradiente,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color bgColor;
    Color textColor = AppColors.textoBlanco;
    String? badge;

    if (!respondido) {
      borderColor = const Color(0xFF252840);
      bgColor = AppColors.fondoCard;
    } else if (index == correcta) {
      borderColor = AppColors.neonVerde;
      bgColor = AppColors.neonVerde.withValues(alpha: 0.12);
      badge = '✓';
    } else if (index == seleccionado) {
      borderColor = AppColors.neonCoral;
      bgColor = AppColors.neonCoral.withValues(alpha: 0.12);
      textColor = AppColors.neonCoral;
      badge = '✗';
    } else {
      borderColor = const Color(0xFF252840);
      bgColor = AppColors.fondoCard;
      textColor = AppColors.textoGris;
    }

    final letters = ['A', 'B', 'C', 'D'];

    return GestureDetector(
      onTap: respondido ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                gradient: !respondido
                    ? LinearGradient(colors: gradiente)
                    : index == correcta
                        ? const LinearGradient(
                            colors: [AppColors.neonVerde, Color(0xFF00E676)])
                        : index == seleccionado
                            ? const LinearGradient(colors: [
                                AppColors.neonCoral,
                                Color(0xFFFF5252)
                              ])
                            : const LinearGradient(colors: [
                                AppColors.fondoCardClaro,
                                AppColors.fondoCard
                              ]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  badge ?? letters[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  STAT CHIP
// ─────────────────────────────────────────────
class _StatChip extends StatelessWidget {
  final String emoji;
  final String label;

  const _StatChip({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
