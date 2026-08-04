// lib/screens/pantalla_quiz_libro.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/app_provider.dart';
import '../models/libro_model.dart';
import '../theme.dart';

class PantallaQuizLibro extends StatefulWidget {
  final Libro libro;
  const PantallaQuizLibro({super.key, required this.libro});

  @override
  State<PantallaQuizLibro> createState() => _PantallaQuizLibroState();
}

class _PantallaQuizLibroState extends State<PantallaQuizLibro> {
  int _preguntaActual = 0;
  int? _seleccionada;
  bool _respondida = false;
  int _correctas = 0;
  bool _finalizado = false;

  List<PreguntaLibro> get _preguntas => widget.libro.preguntas;
  PreguntaLibro get _pregunta => _preguntas[_preguntaActual];

  void _seleccionar(int idx) {
    if (_respondida) return;
    setState(() {
      _seleccionada = idx;
      _respondida = true;
      if (idx == _pregunta.respuestaCorrecta) _correctas++;
    });
  }

  void _siguiente(AppProvider app) async {
    if (_preguntaActual + 1 >= _preguntas.length) {
      await app.completarLibro(widget.libro.id, _correctas, _preguntas.length);
      setState(() => _finalizado = true);
    } else {
      setState(() {
        _preguntaActual++;
        _seleccionada = null;
        _respondida = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        if (_finalizado) return _buildResultado(context, app);

        return Scaffold(
          backgroundColor: AppColors.fondoOscuro,
          body: SafeArea(
            child: Column(
              children: [
                _buildTopBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPreguntaCard(),
                        const SizedBox(height: 20),
                        ..._buildOpciones(),
                        if (_respondida) ...[
                          const SizedBox(height: 16),
                          _buildExplicacion(),
                        ],
                      ],
                    ),
                  ),
                ),
                if (_respondida)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: NeonButton(
                        label: _preguntaActual + 1 >= _preguntas.length
                            ? 'Ver Resultado 🏆'
                            : 'Siguiente Pregunta →',
                        emoji: '',
                        onPressed: () => _siguiente(app),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: AppColors.fondoCard,
        border: Border(bottom: BorderSide(color: Color(0xFF252840))),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: AppColors.textoGris),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '🎯 Quiz: ${widget.libro.titulo}',
                  style: const TextStyle(
                    color: AppColors.textoBlanco,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${_preguntaActual + 1}/${_preguntas.length}',
                style: const TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (_preguntaActual + 1) / _preguntas.length,
              backgroundColor: AppColors.fondoCardClaro,
              valueColor: const AlwaysStoppedAnimation(AppColors.neonMorado),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreguntaCard() {
    return GlassCard(
      borderColor: AppColors.neonMorado.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pregunta ${_preguntaActual + 1}',
            style: const TextStyle(
              color: AppColors.neonMorado,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _pregunta.enunciado,
            style: const TextStyle(
              color: AppColors.textoBlanco,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOpciones() {
    return List.generate(_pregunta.opciones.length, (i) {
      final esCorrecta = i == _pregunta.respuestaCorrecta;
      final esSeleccionada = i == _seleccionada;

      Color borderColor;
      Color bgColor;

      if (!_respondida) {
        borderColor = const Color(0xFF252840);
        bgColor = AppColors.fondoCard;
      } else if (esCorrecta) {
        borderColor = AppColors.neonVerde;
        bgColor = AppColors.neonVerde.withValues(alpha: 0.12);
      } else if (esSeleccionada) {
        borderColor = AppColors.neonRosa;
        bgColor = AppColors.neonRosa.withValues(alpha: 0.1);
      } else {
        borderColor = const Color(0xFF252840);
        bgColor = AppColors.fondoCard;
      }

      return GestureDetector(
        onTap: () => _seleccionar(i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
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
                  shape: BoxShape.circle,
                  color: _respondida && esCorrecta
                      ? AppColors.neonVerde
                      : _respondida && esSeleccionada
                          ? AppColors.neonRosa
                          : AppColors.fondoCardClaro,
                ),
                child: Center(
                  child: Text(
                    _respondida && esCorrecta
                        ? '✓'
                        : _respondida && esSeleccionada
                            ? '✗'
                            : String.fromCharCode(65 + i),
                    style: TextStyle(
                      color: _respondida && (esCorrecta || esSeleccionada)
                          ? Colors.white
                          : AppColors.textoGris,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  _pregunta.opciones[i],
                  style: TextStyle(
                    color: _respondida && esCorrecta
                        ? AppColors.neonVerde
                        : AppColors.textoBlanco,
                    fontSize: 14,
                    fontWeight: esCorrecta && _respondida ? FontWeight.w700 : FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildExplicacion() {
    final correcto = _seleccionada == _pregunta.respuestaCorrecta;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: correcto
            ? AppColors.neonVerde.withValues(alpha: 0.1)
            : AppColors.neonRosa.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: correcto
              ? AppColors.neonVerde.withValues(alpha: 0.4)
              : AppColors.neonRosa.withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            correcto ? '✅ ¡Correcto!' : '❌ Respuesta incorrecta',
            style: TextStyle(
              color: correcto ? AppColors.neonVerde : AppColors.neonRosa,
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(_pregunta.explicacion, style: AppTextStyles.body),
        ],
      ),
    );
  }

  Widget _buildResultado(BuildContext context, AppProvider app) {
    final pct = _correctas / _preguntas.length;
    final esPerfecto = _correctas == _preguntas.length;
    final gemas = widget.libro.gemasRecompensa + (esPerfecto ? 20 : 0);

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                esPerfecto ? '🏆' : pct >= 0.6 ? '🎉' : '📚',
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 24),
              Text(
                esPerfecto
                    ? '¡Perfecta! Libro Dominado'
                    : pct >= 0.6
                        ? '¡Muy Bien!'
                        : 'Sigue Practicando',
                style: AppTextStyles.heroTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '$_correctas de ${_preguntas.length} respuestas correctas',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              GlassCard(
                borderColor: AppColors.neonAmarillo.withValues(alpha: 0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('💎', style: TextStyle(fontSize: 32)),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '+$gemas Gemas Ganadas',
                          style: const TextStyle(
                            color: AppColors.neonAmarillo,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        if (esPerfecto)
                          const Text(
                            '+20 bonus por puntuación perfecta',
                            style: AppTextStyles.caption,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: NeonButton(
                  label: 'Volver a la Biblioteca',
                  emoji: '📚',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  final texto = esPerfecto
                      ? '🏆 ¡Completé "${widget.libro.titulo}" con puntuación PERFECTA en Mi Imperio!\n'
                          '${_preguntas.length}/${_preguntas.length} respuestas correctas 💎 +$gemas gemas\n\n'
                          '¡Aprende finanzas y construye tu libertad financiera! 🦋\n'
                          '👑 Mi Imperio — App Educación Financiera LSF'
                      : '📚 ¡Completé "${widget.libro.titulo}" en Mi Imperio!\n'
                          '$_correctas/${_preguntas.length} respuestas correctas 💎 +$gemas gemas\n\n'
                          '¡Aprende finanzas y construye tu libertad financiera! 🦋\n'
                          '👑 Mi Imperio — App Educación Financiera LSF';
                  Share.share(texto);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.5)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('📲', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 8),
                      Text('Compartir Logro', style: TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w800, fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
