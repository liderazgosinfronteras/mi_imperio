// lib/screens/pantalla_leccion.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';
import '../utils/sound_player.dart';

class PantallaLeccion extends StatefulWidget {
  final int leccionIndex;
  const PantallaLeccion({super.key, required this.leccionIndex});
  @override
  State<PantallaLeccion> createState() => _PantallaLeccionState();
}

class _PantallaLeccionState extends State<PantallaLeccion>
    with TickerProviderStateMixin {
  int _preguntaActual = 0;
  int? _respuestaSeleccionada;
  bool _mostrandoResultado = false;
  int _respuestasCorrectas = 0;
  bool _completada = false;

  late AnimationController _celebrationController;

  @override
  void initState() {
    super.initState();
    _celebrationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _celebrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context, listen: false);
    final leccion = app.lecciones[widget.leccionIndex];

    if (_completada) return _buildCompletionScreen(leccion, app);

    final pregunta = leccion.preguntas[_preguntaActual];
    final progreso = _preguntaActual / leccion.preguntas.length;

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context, app, leccion, progreso),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildLessonHeader(leccion),
                    const SizedBox(height: 28),
                    _buildQuestion(pregunta),
                    const SizedBox(height: 24),
                    _buildOptions(pregunta),
                    if (_mostrandoResultado) ...[
                      const SizedBox(height: 20),
                      _buildFeedback(pregunta),
                    ],
                  ],
                ),
              ),
            ),
            if (_mostrandoResultado)
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: NeonButton(
                    label: _preguntaActual + 1 < leccion.preguntas.length ? 'Siguiente →' : '¡Finalizar! 🎉',
                    onPressed: _siguientePregunta,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, AppProvider app, Leccion leccion, double progreso) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _confirmarSalida(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.close, color: AppColors.textoGris, size: 20),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Stack(children: [
              Container(height: 12, decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(6))),
              AnimatedFractionallySizedBox(
                duration: const Duration(milliseconds: 500),
                widthFactor: progreso,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: AppColors.gradienteHero),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.6), blurRadius: 8)],
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(width: 16),
          Consumer<AppProvider>(
            builder: (_, a, __) => Row(children: [
              Text(a.vidas == 0 ? '💔' : '❤️'),
              Text(' ${a.vidas}', style: const TextStyle(color: AppColors.neonRosa, fontWeight: FontWeight.w800)),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonHeader(Leccion leccion) {
    return Column(
      children: [
        Text(leccion.emoji, style: const TextStyle(fontSize: 56)),
        const SizedBox(height: 12),
        Text(leccion.titulo, style: AppTextStyles.heroTitle, textAlign: TextAlign.center),
        const SizedBox(height: 6),
        Text('Pregunta ${_preguntaActual + 1} de ${leccion.preguntas.length}', style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildQuestion(Pregunta pregunta) {
    return GlassCard(
      borderColor: AppColors.neonMorado.withValues(alpha: 0.3),
      child: Text(pregunta.enunciado, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textoBlanco, height: 1.4), textAlign: TextAlign.center),
    );
  }

  Widget _buildOptions(Pregunta pregunta) {
    return Column(
      children: List.generate(pregunta.opciones.length, (i) {
        final isSelected = _respuestaSeleccionada == i;
        final isCorrect = i == pregunta.respuestaCorrecta;
        Color borderColor = const Color(0xFF252840);
        Color bgColor = AppColors.fondoCard;
        if (_mostrandoResultado) {
          if (isCorrect) { borderColor = AppColors.neonVerde; bgColor = AppColors.neonVerde.withValues(alpha: 0.1); }
          else if (isSelected && !isCorrect) { borderColor = AppColors.neonRosa; bgColor = AppColors.neonRosa.withValues(alpha: 0.1); }
        } else if (isSelected) { borderColor = AppColors.neonMorado; bgColor = AppColors.neonMorado.withValues(alpha: 0.1); }

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: _mostrandoResultado ? null : () => _seleccionarRespuesta(i, pregunta),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: borderColor, width: 2)),
              child: Row(
                children: [
                  Container(
                    width: 32, height: 32,
                    decoration: BoxDecoration(color: borderColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8), border: Border.all(color: borderColor)),
                    child: Center(child: Text(
                      _mostrandoResultado && isCorrect ? '✓' : _mostrandoResultado && isSelected && !isCorrect ? '✗' : ['A','B','C','D'][i],
                      style: TextStyle(color: _mostrandoResultado ? borderColor : AppColors.textoGris, fontWeight: FontWeight.w900),
                    )),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(pregunta.opciones[i], style: TextStyle(
                    fontSize: 15, color: _mostrandoResultado ? isCorrect ? AppColors.neonVerde : isSelected ? AppColors.neonRosa : AppColors.textoGris : AppColors.textoBlanco,
                    fontWeight: FontWeight.w600,
                  ))),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildFeedback(Pregunta pregunta) {
    final esCorrecta = _respuestaSeleccionada == pregunta.respuestaCorrecta;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: esCorrecta ? AppColors.neonVerde.withValues(alpha: 0.1) : AppColors.neonRosa.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: esCorrecta ? AppColors.neonVerde : AppColors.neonRosa),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(esCorrecta ? '🎉' : '💡', style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(esCorrecta ? '¡Correcto!' : 'Casi...', style: TextStyle(color: esCorrecta ? AppColors.neonVerde : AppColors.neonRosa, fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(pregunta.explicacion, style: AppTextStyles.body),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletionScreen(Leccion leccion, AppProvider app) {
    final esPerfecto = _respuestasCorrectas == leccion.preguntas.length;
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(esPerfecto ? '🏆' : '🎯', style: const TextStyle(fontSize: 80)),
                const SizedBox(height: 20),
                Text(esPerfecto ? '¡LECCIÓN PERFECTA!' : '¡Lección Completada!', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppColors.textoBlanco), textAlign: TextAlign.center),
                const SizedBox(height: 12),
                Text('${_respuestasCorrectas} de ${leccion.preguntas.length} correctas', style: AppTextStyles.body),
                const SizedBox(height: 30),
                GlassCard(
                  borderColor: AppColors.neonAmarillo.withValues(alpha: 0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildRewardChip('💎', '+${leccion.gemasRecompensa + (esPerfecto ? 5 : 0)}', 'Gemas', AppColors.neonAmarillo),
                      _buildRewardChip('🔥', 'Racha', '¡Activa!', AppColors.neonCoral),
                      if (esPerfecto) _buildRewardChip('⭐', 'BONUS', '+5💎', AppColors.neonVerde),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(width: double.infinity, child: NeonButton(label: '¡Continuar!', emoji: '🚀', onPressed: () => Navigator.pop(context))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRewardChip(String emoji, String valor, String label, Color color) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 4),
        Text(valor, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w900)),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }

  Future<void> _confirmarSalida(BuildContext context) async {
    if (_preguntaActual == 0 && _respuestaSeleccionada == null) {
      Navigator.pop(context);
      return;
    }
    final salir = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('¿Salir de la lección?', style: TextStyle(color: AppColors.textoBlanco)),
        content: const Text(
          'Si sales ahora perderás el progreso de esta lección. ¿Estás segura?',
          style: AppTextStyles.body,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Seguir lección', style: TextStyle(color: AppColors.neonVerde)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Salir', style: TextStyle(color: AppColors.textoGris)),
          ),
        ],
      ),
    );
    if (salir == true && context.mounted) Navigator.pop(context);
  }

  void _seleccionarRespuesta(int index, Pregunta pregunta) {
    setState(() { _respuestaSeleccionada = index; _mostrandoResultado = true; });
    if (index == pregunta.respuestaCorrecta) {
      _respuestasCorrectas++;
      SoundPlayer.correcto();
    } else {
      Provider.of<AppProvider>(context, listen: false).perderVida();
      SoundPlayer.error();
    }
  }

  void _siguientePregunta() {
    final app = Provider.of<AppProvider>(context, listen: false);
    final leccion = app.lecciones[widget.leccionIndex];
    if (_preguntaActual + 1 < leccion.preguntas.length) {
      setState(() { _preguntaActual++; _respuestaSeleccionada = null; _mostrandoResultado = false; });
    } else {
      app.completarLeccion(widget.leccionIndex, _respuestasCorrectas);
      SoundPlayer.leccion();
      setState(() => _completada = true);
    }
  }
}
