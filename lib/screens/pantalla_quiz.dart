// lib/screens/pantalla_quiz.dart — Quiz Financiero 🧠
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/app_models.dart';
import '../theme.dart';

class _PQ {
  final String texto, explicacion, emoji;
  final List<String> opciones;
  final int correcta; // índice en opciones shuffled
  const _PQ({required this.texto, required this.explicacion, required this.emoji,
    required this.opciones, required this.correcta});
}

class PantallaQuiz extends StatefulWidget {
  const PantallaQuiz({super.key});
  @override
  State<PantallaQuiz> createState() => _PantallaQuizState();
}

class _PantallaQuizState extends State<PantallaQuiz> with TickerProviderStateMixin {
  late List<_PQ>  _preguntas;
  int  _idx       = 0;
  int  _puntaje   = 0;
  int? _elegida;
  bool _respondio = false;
  bool _terminado = false;
  int  _tiempo    = 30;
  Timer? _timer;
  late AnimationController _barCtrl;
  late AnimationController _cardCtrl;
  late Animation<double>   _cardAnim;

  static const _emojis = ['💰','📈','🏦','💡','🎯','💎','🏆','🚀','⭐','🌟'];

  @override
  void initState() {
    super.initState();
    _barCtrl  = AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _cardCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _cardAnim = CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOut);
    _preguntas = _generarPreguntas();
    _iniciarTimer();
    _cardCtrl.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _barCtrl.dispose();
    _cardCtrl.dispose();
    super.dispose();
  }

  List<_PQ> _generarPreguntas() {
    final lecciones = crearLecciones();
    final todas = <_PQ>[];
    final rand = Random();
    for (final l in lecciones) {
      for (final p in l.preguntas) {
        // Mezclar opciones
        final idxs = List.generate(p.opciones.length, (i) => i)..shuffle(rand);
        final opcionesMezcladas = idxs.map((i) => p.opciones[i]).toList();
        final correctaIdx = idxs.indexOf(p.respuestaCorrecta);
        todas.add(_PQ(
          texto: p.enunciado,
          explicacion: p.explicacion,
          emoji: _emojis[rand.nextInt(_emojis.length)],
          opciones: opcionesMezcladas,
          correcta: correctaIdx,
        ));
      }
    }
    todas.shuffle(rand);
    return todas.take(10).toList();
  }

  void _iniciarTimer() {
    _timer?.cancel();
    setState(() => _tiempo = 30);
    _barCtrl.forward(from: 0);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_tiempo <= 1) {
        _timer?.cancel();
        _responder(-1); // Tiempo agotado
      } else {
        setState(() => _tiempo--);
      }
    });
  }

  void _responder(int idx) {
    if (_respondio) return;
    _timer?.cancel();
    _barCtrl.stop();
    final p = _preguntas[_idx];
    final correcta = idx == p.correcta;
    final bonus = ((_tiempo / 30) * 50).round();
    setState(() {
      _elegida   = idx;
      _respondio = true;
      if (correcta) _puntaje += 100 + bonus;
    });
  }

  void _siguiente() {
    if (_idx >= _preguntas.length - 1) {
      setState(() => _terminado = true);
      return;
    }
    setState(() {
      _idx++;
      _elegida   = null;
      _respondio = false;
    });
    _cardCtrl.forward(from: 0);
    _iniciarTimer();
  }

  // ── BUILD ──────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: _terminado ? _buildResultados() : _buildJuego(),
      ),
    );
  }

  Widget _buildJuego() {
    final p = _preguntas[_idx];
    return Column(children: [
      // ── Header ───────────────────────────────────────────────
      Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF1A0A3C), Color(0xFF0D0E1A)]),
        ),
        child: Column(children: [
          Row(children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white54),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(child: LinearProgressIndicator(
              value: (_idx + 1) / _preguntas.length,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.neonMorado),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            )),
            const SizedBox(width: 8),
            Text('${_idx + 1}/${_preguntas.length}',
              style: const TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Puntos
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('⭐ $_puntaje pts',
                style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.w900, fontSize: 14)),
            ),
            // Timer
            AnimatedBuilder(
              animation: _barCtrl,
              builder: (_, __) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _tiempo <= 10 ? Colors.red.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.timer, size: 14, color: _tiempo <= 10 ? Colors.red[300] : Colors.white54),
                  const SizedBox(width: 4),
                  Text('$_tiempo s',
                    style: TextStyle(
                      color: _tiempo <= 10 ? Colors.red[300] : Colors.white,
                      fontWeight: FontWeight.w900, fontSize: 14)),
                ]),
              ),
            ),
          ]),
        ]),
      ),

      // ── Pregunta ─────────────────────────────────────────────
      Expanded(child: FadeTransition(
        opacity: _cardAnim,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(height: 12),
            Text(p.emoji, style: const TextStyle(fontSize: 50)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF2A0850), Color(0xFF1A1035)]),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.4)),
              ),
              child: Text(p.texto,
                style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700, height: 1.5),
                textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            // Opciones
            ...List.generate(p.opciones.length, (i) => _buildOpcion(p, i)),
            // Explicación (si respondió)
            if (_respondio) ...[
              const SizedBox(height: 16),
              _buildExplicacion(p),
              const SizedBox(height: 16),
              SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: _siguiente,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neonMorado,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(_idx < _preguntas.length - 1 ? '→ SIGUIENTE PREGUNTA' : '🏆 VER RESULTADO',
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)),
              )),
            ],
          ]),
        ),
      )),
    ]);
  }

  Widget _buildOpcion(_PQ p, int i) {
    Color color;
    Color border;
    Widget? icon;

    if (!_respondio) {
      color  = _elegida == i ? AppColors.neonMorado.withValues(alpha: 0.3) : AppColors.fondoCard;
      border = _elegida == i ? AppColors.neonMorado : Colors.white12;
      icon   = null;
    } else {
      if (i == p.correcta) {
        color  = const Color(0xFF1B5E20);
        border = const Color(0xFF4CAF50);
        icon   = const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 20);
      } else if (i == _elegida && i != p.correcta) {
        color  = const Color(0xFF7F0000);
        border = Colors.red;
        icon   = const Icon(Icons.cancel, color: Colors.red, size: 20);
      } else {
        color  = AppColors.fondoCard;
        border = Colors.white10;
        icon   = null;
      }
    }

    final letras = ['A', 'B', 'C', 'D'];

    return GestureDetector(
      onTap: !_respondio ? () => _responder(i) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Row(children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(
              color: border.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Center(child: Text(letras[i],
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900))),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(p.opciones[i],
            style: const TextStyle(color: Colors.white, fontSize: 14))),
          if (icon != null) icon,
        ]),
      ),
    );
  }

  Widget _buildExplicacion(_PQ p) {
    final correcto = _elegida == p.correcta;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: correcto ? const Color(0xFF1B5E20) : const Color(0xFF3A1A0A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: correcto ? const Color(0xFF4CAF50) : Colors.orange),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(correcto ? '✅' : '💡', style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(correcto ? '¡Correcto! +${100 + ((_tiempo / 30) * 50).round()} pts' : 'La respuesta correcta era:',
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(p.explicacion, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
        ])),
      ]),
    );
  }

  // ── RESULTADOS ────────────────────────────────────────────────
  Widget _buildResultados() {
    final pct   = _puntaje / (10 * 150); // max 150 pts por pregunta
    final badge = pct >= 0.9 ? ('🏆', 'Maestra Financiera', 'Puntaje perfecto. ¡Eres imparable!')
        : pct >= 0.7 ? ('💎', 'Experta', '¡Excelente! Sabes mucho de finanzas.')
        : pct >= 0.5 ? ('⭐', 'Aprendiz', 'Buen intento. ¡Sigue estudiando!')
        : ('🌱', 'Rookie', 'Completa más lecciones y vuelve a intentarlo.');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        const SizedBox(height: 32),
        Text(badge.$1, style: const TextStyle(fontSize: 80)),
        const SizedBox(height: 16),
        Text(badge.$2, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text(badge.$3, style: AppTextStyles.caption, textAlign: TextAlign.center),
        const SizedBox(height: 36),
        // Score ring
        Container(
          width: 160, height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.neonMorado, width: 4),
            gradient: const RadialGradient(colors: [Color(0xFF2A0850), Color(0xFF1A0A3C)]),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('$_puntaje', style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900)),
            const Text('PUNTOS', style: TextStyle(color: Colors.white38, fontSize: 11, letterSpacing: 2)),
          ]),
        ),
        const SizedBox(height: 32),
        // Stats
        Row(children: [
          _statCard('Correctas', '${(_puntaje ~/ 100).clamp(0, 10)}/10', '✅'),
          const SizedBox(width: 12),
          _statCard('Precisión', '${(pct * 100).round()}%', '🎯'),
        ]),
        const SizedBox(height: 32),
        // Botones
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () => setState(() {
            _idx = 0; _puntaje = 0; _elegida = null;
            _respondio = false; _terminado = false;
            _preguntas = _generarPreguntas();
            _iniciarTimer();
          }),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.neonMorado,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: const Text('🔄 JUGAR DE NUEVO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
        )),
        const SizedBox(height: 12),
        TextButton(onPressed: () => Navigator.pop(context),
          child: const Text('← Volver', style: TextStyle(color: Colors.white54))),
      ]),
    );
  }

  Widget _statCard(String label, String valor, String emoji) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 6),
        Text(valor, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
        Text(label, style: AppTextStyles.caption),
      ]),
    ));
  }
}
