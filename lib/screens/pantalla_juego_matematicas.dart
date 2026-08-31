// lib/screens/pantalla_juego_matematicas.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../providers/app_provider.dart';
import '../utils/sound_player.dart';
import 'pantalla_ranking_ninos.dart';

class PantallaJuegoMatematicas extends StatefulWidget {
  const PantallaJuegoMatematicas({super.key});

  @override
  State<PantallaJuegoMatematicas> createState() => _PantallaJuegoMatematicasState();
}

class _Pregunta {
  final String enunciado;
  final List<String> opciones;
  final int correcta;
  final String emoji;
  final int puntos;

  const _Pregunta({
    required this.enunciado,
    required this.opciones,
    required this.correcta,
    required this.emoji,
    required this.puntos,
  });
}

class _PantallaJuegoMatematicasState extends State<PantallaJuegoMatematicas>
    with TickerProviderStateMixin {
  int _nivelSeleccionado = 0;
  bool _juegoIniciado = false;
  bool _juegoTerminado = false;

  List<_Pregunta> _preguntas = [];
  int _indicePregunta = 0;
  int? _respuestaSeleccionada;
  bool? _esCorrecta;

  int _correctas = 0;
  int _racha = 0;
  int _rachaMax = 0;
  int _puntosGanados = 0;
  int _gemasGanadas = 0;

  late AnimationController _timerCtrl;
  late AnimationController _feedbackCtrl;
  late AnimationController _slideCtrl;
  late Animation<double> _feedbackScale;
  late Animation<Offset> _slideAnim;

  Timer? _logicTimer;
  Timer? _transitionTimer;

  final _rng = Random();

  static const _duracionSegundos = 10;

  @override
  void initState() {
    super.initState();
    _timerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: _duracionSegundos),
    );
    _feedbackCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    _slideCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 320));
    _feedbackScale = CurvedAnimation(parent: _feedbackCtrl, curve: Curves.elasticOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0.35, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _slideCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _logicTimer?.cancel();
    _transitionTimer?.cancel();
    _timerCtrl.dispose();
    _feedbackCtrl.dispose();
    _slideCtrl.dispose();
    super.dispose();
  }

  // ─── GENERACIÓN DE PREGUNTAS ────────────────

  List<_Pregunta> _generarRonda(int nivel) =>
      List.generate(10, (i) => _generarPregunta(nivel));

  _Pregunta _generarPregunta(int nivel) {
    const emojis = ['🍋', '💰', '🏪', '🛍️', '💎', '🚀', '🎯', '📈', '💡', '⭐'];
    final emoji = emojis[_rng.nextInt(emojis.length)];
    if (nivel == 0) return _preguntaBasica(emoji);
    if (nivel == 1) return _preguntaIntermedia(emoji);
    return _preguntaAvanzada(emoji);
  }

  _Pregunta _preguntaBasica(String emoji) {
    final tipo = _rng.nextInt(4);
    int a, b, resp;
    String texto;
    switch (tipo) {
      case 0:
        a = _rng.nextInt(10) + 1; b = _rng.nextInt(10) + 1; resp = a + b;
        texto = 'Si tienes \$$a y ganas \$$b más, ¿cuánto tienes?';
        break;
      case 1:
        b = _rng.nextInt(8) + 1; a = b + _rng.nextInt(12) + 1; resp = a - b;
        texto = 'Tienes \$$a y gastas \$$b. ¿Cuánto te queda?';
        break;
      case 2:
        a = _rng.nextInt(6) + 2; b = _rng.nextInt(6) + 2; resp = a * b;
        texto = 'Vendiste $a paletas a \$$b cada una. ¿Cuánto ganaste?';
        break;
      default:
        b = [2, 4, 5][_rng.nextInt(3)]; resp = _rng.nextInt(8) + 1; a = b * resp;
        texto = 'Repartiste \$$a entre $b amigos. ¿Cuánto recibe cada uno?';
    }
    return _construir(texto, resp, emoji, 15);
  }

  _Pregunta _preguntaIntermedia(String emoji) {
    final tipo = _rng.nextInt(4);
    int a, b, resp;
    String texto;
    switch (tipo) {
      case 0:
        a = (_rng.nextInt(8) + 2) * 10; b = _rng.nextInt(6) + 2; resp = a * b;
        texto = 'Ahorras \$$a por día. En $b días, ¿cuánto habrás ahorrado?';
        break;
      case 1:
        b = _rng.nextInt(50) + 20; a = b + (_rng.nextInt(5) + 1) * 10; resp = a - b;
        texto = 'Tienes \$$a y gastas \$$b. ¿Cuánto te sobra?';
        break;
      case 2:
        a = _rng.nextInt(12) + 3; b = (_rng.nextInt(8) + 2) * 5; resp = a * b;
        texto = 'Vendiste $a juguetes a \$$b cada uno. ¿Cuánto ganaste?';
        break;
      default:
        b = [4, 5, 8, 10][_rng.nextInt(4)]; resp = _rng.nextInt(15) + 5; a = b * resp;
        texto = 'Dividiste \$$a en $b partes iguales. ¿Cuánto es cada parte?';
    }
    return _construir(texto, resp, emoji, 20);
  }

  _Pregunta _preguntaAvanzada(String emoji) {
    final tipo = _rng.nextInt(3);
    int resp;
    String texto;
    switch (tipo) {
      case 0:
        final base = [100, 200, 150, 400, 500][_rng.nextInt(5)];
        final porc = [10, 20, 25, 50][_rng.nextInt(4)];
        resp = (base * porc / 100).round();
        texto = 'Tienes \$$base. Ahorras el $porc%. ¿Cuánto ahorras?';
        break;
      case 1:
        final sueldo = (_rng.nextInt(8) + 5) * 100;
        final gasto = sueldo - (_rng.nextInt(4) + 1) * 50;
        resp = (sueldo - gasto) * 12;
        texto = 'Ganas \$$sueldo/mes y gastas \$$gasto. ¿Cuánto ahorras en un año?';
        break;
      default:
        final precio = (_rng.nextInt(6) + 2) * 50;
        final porc = [10, 20, 25][_rng.nextInt(3)];
        final ventas = _rng.nextInt(4) + 2;
        resp = (precio * porc / 100 * ventas).round();
        texto = 'De cada \$$precio vendido, el $porc% es ganancia. ¿Cuánto ganas en $ventas ventas?';
    }
    return _construir(texto, resp, emoji, 25);
  }

  _Pregunta _construir(String texto, int resp, String emoji, int pts) {
    final Set<int> usados = {resp};
    int intentos = 0;
    while (usados.length < 4 && intentos++ < 60) {
      final delta = _rng.nextInt(10) + 1;
      for (final c in [resp + delta, (resp - delta).abs(), resp + delta * 2, max(1, resp - delta * 2)]) {
        if (c >= 0 && c != resp) { usados.add(c); if (usados.length >= 4) break; }
      }
    }
    final lista = usados.toList()..shuffle(_rng);
    return _Pregunta(
      enunciado: texto,
      opciones: lista.map((o) => '\$$o').toList(),
      correcta: lista.indexOf(resp),
      emoji: emoji,
      puntos: pts,
    );
  }

  // ─── LÓGICA DEL JUEGO ───────────────────────

  void _iniciarJuego() {
    _logicTimer?.cancel();
    _transitionTimer?.cancel();
    setState(() {
      _preguntas = _generarRonda(_nivelSeleccionado);
      _indicePregunta = 0;
      _correctas = 0; _racha = 0; _rachaMax = 0;
      _puntosGanados = 0; _gemasGanadas = 0;
      _juegoIniciado = true; _juegoTerminado = false;
      _respuestaSeleccionada = null; _esCorrecta = null;
    });
    _slideCtrl.forward(from: 0);
    _arrancarTimer();
  }

  void _arrancarTimer() {
    _timerCtrl.reset();
    _timerCtrl.forward();
    _logicTimer?.cancel();
    _logicTimer = Timer(const Duration(seconds: _duracionSegundos), () {
      if (!mounted || _respuestaSeleccionada != null) return;
      _tiempoAgotado();
    });
  }

  void _detenerTimer() {
    _logicTimer?.cancel();
    _timerCtrl.stop();
  }

  void _tiempoAgotado() {
    setState(() {
      _respuestaSeleccionada = -1;
      _esCorrecta = false;
      _racha = 0;
    });
    SoundPlayer.error();
    _feedbackCtrl.forward(from: 0);
    _transitionTimer = Timer(const Duration(milliseconds: 1800), _avanzar);
  }

  void _responder(int idx) {
    if (_respuestaSeleccionada != null) return;
    _detenerTimer();
    final pregunta = _preguntas[_indicePregunta];
    final correcto = idx == pregunta.correcta;
    setState(() {
      _respuestaSeleccionada = idx;
      _esCorrecta = correcto;
      if (correcto) {
        _correctas++;
        _racha++;
        _rachaMax = max(_rachaMax, _racha);
        final bonus = _racha >= 3 ? 5 : 0;
        _puntosGanados += pregunta.puntos + bonus;
        _gemasGanadas += _racha >= 3 ? 3 : 2;
      } else {
        _racha = 0;
      }
    });
    correcto ? SoundPlayer.correcto() : SoundPlayer.error();
    _feedbackCtrl.forward(from: 0);
    _transitionTimer = Timer(const Duration(milliseconds: 1400), _avanzar);
  }

  void _avanzar() {
    if (!mounted) return;
    if (_indicePregunta >= _preguntas.length - 1) {
      _terminar();
      return;
    }
    setState(() {
      _indicePregunta++;
      _respuestaSeleccionada = null;
      _esCorrecta = null;
    });
    _slideCtrl.forward(from: 0);
    _arrancarTimer();
  }

  Future<void> _terminar() async {
    _detenerTimer();
    if (_correctas >= 8) { _puntosGanados += 50; _gemasGanadas += 5; }
    final provider = context.read<AppProvider>();
    if (_puntosGanados > 0) await provider.agregarPuntosRanking(_puntosGanados);
    if (_gemasGanadas > 0) await provider.agregarGemasQuiz(_gemasGanadas);
    if (_correctas >= 8) { SoundPlayer.victoria(); }
    else if (_correctas >= 5) { SoundPlayer.nivel(); }
    setState(() => _juegoTerminado = true);
  }

  // ─── UI ─────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: _juegoTerminado
            ? _buildResultados()
            : !_juegoIniciado
                ? _buildSeleccionNivel()
                : _buildJuego(),
      ),
    );
  }

  // ── Selección de nivel ──

  Widget _buildSeleccionNivel() {
    const datos = [
      ('⭐', 'Básico', 'Sumas, restas y\ndivisiones simples', Color(0xFF1B5E20), Color(0xFF43A047)),
      ('⭐⭐', 'Intermedio', 'Multiplicaciones\ncon dinero real', Color(0xFF0D47A1), Color(0xFF1E88E5)),
      ('⭐⭐⭐', 'Avanzado', 'Porcentajes y\nganancias de negocio', Color(0xFF4A148C), Color(0xFF8E24AA)),
    ];
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Row(children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 20),
          ),
          const SizedBox(width: 12),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('🧮 Matemáticas', style: AppTextStyles.heroTitle),
            Text('Pon a prueba tu mente', style: AppTextStyles.caption),
          ]),
        ]),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1A1B2E), Color(0xFF252840)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.35)),
          ),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 44)),
            const SizedBox(height: 10),
            const Text('Competencia de Matemáticas',
                style: TextStyle(color: AppColors.textoBlanco, fontSize: 17, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center),
            const SizedBox(height: 6),
            const Text('10 preguntas · 10 segundos cada una\nGana gemas y sube en el ranking',
                style: TextStyle(color: AppColors.textoGris, fontSize: 12, height: 1.4),
                textAlign: TextAlign.center),
          ]),
        ),
      ),
      const SizedBox(height: 24),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Align(alignment: Alignment.centerLeft,
            child: Text('ELIGE NIVEL', style: AppTextStyles.sectionTitle)),
      ),
      const SizedBox(height: 10),
      ...List.generate(3, (i) {
        final (stars, nombre, desc, c1, c2) = datos[i];
        final sel = _nivelSeleccionado == i;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: GestureDetector(
            onTap: () { setState(() => _nivelSeleccionado = i); SoundPlayer.click(); },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: sel ? LinearGradient(colors: [c1, c2]) : null,
                color: sel ? null : AppColors.fondoCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: sel ? c2 : AppColors.fondoCardClaro, width: sel ? 2 : 1),
                boxShadow: sel ? [BoxShadow(color: c2.withValues(alpha: 0.3), blurRadius: 10)] : null,
              ),
              child: Row(children: [
                Text(stars, style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 14),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(nombre, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
                  Text(desc, style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 11, height: 1.3)),
                ])),
                Icon(sel ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: sel ? Colors.white : AppColors.textoGris, size: 20),
              ]),
            ),
          ),
        );
      }),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: _iniciarJuego,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.neonMorado, AppColors.neonAzul]),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.45), blurRadius: 18, offset: const Offset(0, 4))],
            ),
            child: const Text('🚀 ¡Jugar Ahora!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
          ),
        ),
      ),
    ]);
  }

  // ── Juego activo ──

  Widget _buildJuego() {
    final pregunta = _preguntas[_indicePregunta];
    return Column(children: [
      // Header
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
        child: Row(children: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: AppColors.fondoCard,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                title: const Text('¿Salir?', style: TextStyle(color: Colors.white)),
                content: const Text('Perderás el progreso de esta ronda.', style: TextStyle(color: AppColors.textoGris)),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Continuar')),
                  TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); },
                      child: const Text('Salir', style: TextStyle(color: Colors.redAccent))),
                ],
              ),
            ),
            child: const Icon(Icons.close, color: AppColors.textoGris, size: 22),
          ),
          const SizedBox(width: 10),
          Expanded(child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('${_indicePregunta + 1} / 10',
                  style: const TextStyle(color: AppColors.textoGris, fontSize: 12, fontWeight: FontWeight.w700)),
              if (_racha >= 2)
                Row(children: [
                  const Text('🔥', style: TextStyle(fontSize: 14)),
                  Text(' $_racha racha', style: const TextStyle(color: AppColors.neonCoral, fontSize: 12, fontWeight: FontWeight.w900)),
                ]),
            ]),
            const SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (_indicePregunta + 1) / 10,
                backgroundColor: AppColors.fondoCardClaro,
                valueColor: const AlwaysStoppedAnimation(AppColors.neonVerde),
                minHeight: 6,
              ),
            ),
          ])),
          const SizedBox(width: 10),
          _nivelBadge(),
        ]),
      ),

      // Timer bar
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: AnimatedBuilder(
          animation: _timerCtrl,
          builder: (_, __) {
            final p = 1 - _timerCtrl.value;
            final color = p > 0.4 ? AppColors.neonVerde : p > 0.2 ? AppColors.neonAmarillo : AppColors.neonCoral;
            return Stack(children: [
              Container(height: 8, decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.fondoCardClaro)),
              FractionallySizedBox(
                widthFactor: p.clamp(0.0, 1.0),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: color,
                    boxShadow: [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 6)],
                  ),
                ),
              ),
            ]);
          },
        ),
      ),

      const SizedBox(height: 12),

      // Question + options
      Expanded(
        child: SlideTransition(
          position: _slideAnim,
          child: FadeTransition(
            opacity: _slideCtrl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                // Question card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1A1B2E), Color(0xFF232540)],
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.3)),
                  ),
                  child: Column(children: [
                    Text(pregunta.emoji, style: const TextStyle(fontSize: 42)),
                    const SizedBox(height: 10),
                    Text(pregunta.enunciado,
                        style: const TextStyle(color: AppColors.textoBlanco, fontSize: 15, fontWeight: FontWeight.w700, height: 1.45),
                        textAlign: TextAlign.center),
                    if (_esCorrecta != null) ...[
                      const SizedBox(height: 10),
                      ScaleTransition(
                        scale: _feedbackScale,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            color: (_esCorrecta! ? AppColors.neonVerde : AppColors.neonCoral).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _esCorrecta!
                                ? '✅ ¡Correcto! +${_preguntas[_indicePregunta].puntos} pts'
                                : '❌ ${_respuestaSeleccionada == -1 ? "¡Tiempo!" : "¡Incorrecto!"}',
                            style: TextStyle(
                              color: _esCorrecta! ? AppColors.neonVerde : AppColors.neonCoral,
                              fontWeight: FontWeight.w900, fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ]),
                ),

                const SizedBox(height: 14),

                // Options
                ...List.generate(4, (i) => _buildOpcion(i, pregunta)),
              ]),
            ),
          ),
        ),
      ),

      // Bottom stats bar
      Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.fondoCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.fondoCardClaro),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _statBadge('✅', '$_correctas', 'correctas'),
          _statBadge('💎', '+$_gemasGanadas', 'gemas'),
          _statBadge('🏆', '+$_puntosGanados', 'pts rank'),
        ]),
      ),
    ]);
  }

  Widget _buildOpcion(int idx, _Pregunta p) {
    final sel = _respuestaSeleccionada == idx;
    final correcta = idx == p.correcta;
    Color border = AppColors.fondoCardClaro;
    Color bg = AppColors.fondoCard;
    if (_respuestaSeleccionada != null) {
      if (correcta) { border = AppColors.neonVerde; bg = AppColors.neonVerde.withValues(alpha: 0.1); }
      else if (sel) { border = AppColors.neonCoral; bg = AppColors.neonCoral.withValues(alpha: 0.1); }
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () => _responder(idx),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: border, width: border == AppColors.fondoCardClaro ? 1 : 2),
          ),
          child: Row(children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: border.withValues(alpha: 0.18),
                border: Border.all(color: border),
              ),
              child: Center(child: Text(['A', 'B', 'C', 'D'][idx],
                  style: TextStyle(color: border, fontWeight: FontWeight.w900, fontSize: 11))),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(p.opciones[idx],
                style: const TextStyle(color: AppColors.textoBlanco, fontSize: 16, fontWeight: FontWeight.w700))),
            if (_respuestaSeleccionada != null && correcta)
              const Icon(Icons.check_circle_rounded, color: AppColors.neonVerde, size: 20),
            if (_respuestaSeleccionada != null && sel && !correcta)
              const Icon(Icons.cancel_rounded, color: AppColors.neonCoral, size: 20),
          ]),
        ),
      ),
    );
  }

  Widget _nivelBadge() {
    const colores = [Color(0xFF43A047), Color(0xFF1E88E5), Color(0xFF8E24AA)];
    const nombres = ['Básico', 'Medio', 'Avanzado'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colores[_nivelSeleccionado].withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colores[_nivelSeleccionado]),
      ),
      child: Text(nombres[_nivelSeleccionado],
          style: TextStyle(color: colores[_nivelSeleccionado], fontSize: 10, fontWeight: FontWeight.w900)),
    );
  }

  Widget _statBadge(String emoji, String valor, String label) {
    return Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 16)),
      const SizedBox(height: 2),
      Text(valor, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w900, fontSize: 13)),
      Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 9)),
    ]);
  }

  // ── Resultados ──

  Widget _buildResultados() {
    final pct = (_correctas / 10 * 100).round();
    final String msg;
    final String emojiRes;
    if (_correctas >= 9) { msg = '¡Eres una genio!'; emojiRes = '🏆'; }
    else if (_correctas >= 7) { msg = '¡Excelente trabajo!'; emojiRes = '⭐'; }
    else if (_correctas >= 5) { msg = '¡Sigue practicando!'; emojiRes = '💪'; }
    else { msg = '¡Inténtalo de nuevo!'; emojiRes = '📚'; }

    final gradColors = _correctas >= 7
        ? [const Color(0xFF1B5E20), const Color(0xFF388E3C)]
        : _correctas >= 5
            ? [const Color(0xFF0D47A1), const Color(0xFF1976D2)]
            : [const Color(0xFF4A1940), const Color(0xFF880E4F)];

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Row(children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 20),
          ),
          const SizedBox(width: 12),
          const Text('Resultados', style: AppTextStyles.heroTitle),
        ]),
      ),
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(children: [
                Text(emojiRes, style: const TextStyle(fontSize: 60)),
                const SizedBox(height: 10),
                Text(msg, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text('$_correctas de 10 correctas · $pct%',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 13)),
              ]),
            ),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: _resCard('💎', '+$_gemasGanadas', 'Gemas ganadas', AppColors.neonAzul)),
              const SizedBox(width: 10),
              Expanded(child: _resCard('🏆', '+$_puntosGanados', 'Puntos ranking', AppColors.neonMorado)),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: _resCard('🔥', '$_rachaMax', 'Racha máxima', AppColors.neonCoral)),
              const SizedBox(width: 10),
              Expanded(child: _resCard('⭐', ['Básico', 'Intermedio', 'Avanzado'][_nivelSeleccionado], 'Nivel jugado', AppColors.neonAmarillo)),
            ]),
            if (_correctas >= 8) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.neonVerde.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.35)),
                ),
                child: const Row(children: [
                  Text('🎁', style: TextStyle(fontSize: 22)),
                  SizedBox(width: 10),
                  Expanded(child: Text('¡Bonus 8+ correctas!\n+50 pts ranking · +5 💎',
                      style: TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w800, fontSize: 13, height: 1.4))),
                ]),
              ),
            ],
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _iniciarJuego,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.neonMorado, AppColors.neonAzul]),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.4), blurRadius: 14)],
                ),
                child: const Text('🔄 Jugar de Nuevo',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const PantallaRankingNinos())),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.neonAmarillo.withValues(alpha: 0.4)),
                ),
                child: const Text('🏆 Ver Ranking',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.neonAmarillo, fontSize: 16, fontWeight: FontWeight.w900)),
              ),
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget _resCard(String emoji, String val, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 6),
        Text(val, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w900)),
        Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 10), textAlign: TextAlign.center),
      ]),
    );
  }
}
