// lib/screens/pantalla_academia_matematicas.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../providers/app_provider.dart';
import '../utils/sound_player.dart';
import '../data/preguntas_matematicas.dart';

// ══════════════════════════════════════════════════════
//  CONFIGURACIÓN DE NIVELES
// ══════════════════════════════════════════════════════
class _NivelCfg {
  final String emoji;
  final String nombre;
  final String subtitulo;
  final Color c1;
  final Color c2;
  final int segundos;
  final String descripcion;
  const _NivelCfg(this.emoji, this.nombre, this.subtitulo, this.c1, this.c2, this.segundos, this.descripcion);
}

const _niveles = [
  _NivelCfg('🏫', 'Primaria',       'Los Fundamentos',    Color(0xFF1B5E20), Color(0xFF43A047), 0,
      'Sumas, restas, multiplicaciones y problemas básicos con dinero.'),
  _NivelCfg('📐', 'Secundaria',     'Álgebra y Geometría', Color(0xFF0D47A1), Color(0xFF1E88E5), 15,
      'Ecuaciones, geometría, porcentajes, logaritmos y estadística básica.'),
  _NivelCfg('🎓', 'Universidad',    'Cálculo y Análisis',  Color(0xFF4A148C), Color(0xFF8E24AA), 20,
      'Derivadas, integrales, límites, álgebra lineal y probabilidad.'),
  _NivelCfg('🔬', 'Matemático Puro','Teoría y Abstracción', Color(0xFF7B1FA2), Color(0xFFB47FFF), 25,
      'Teoría de números, combinatoria, grafos y álgebra abstracta.'),
  _NivelCfg('🧠', 'Superdotado',    'Nivel Olimpiada',     Color(0xFFB71C1C), Color(0xFFE53935), 30,
      'Problemas de olimpiadas matemáticas internacionales.'),
];

const _correctasParaDesbloquear = 15;

// ══════════════════════════════════════════════════════
//  WIDGET PRINCIPAL
// ══════════════════════════════════════════════════════
class PantallaAcademiaMatematicas extends StatefulWidget {
  const PantallaAcademiaMatematicas({super.key});

  @override
  State<PantallaAcademiaMatematicas> createState() => _PantallaAcademiaMatematicasState();
}

enum _Vista { mapa, juego, resultados }

class _PreguntaActiva {
  final PreguntaMatematica data;
  final List<String> opcionesOrdenadas;
  final int correctaOrdenada;
  _PreguntaActiva(this.data, this.opcionesOrdenadas, this.correctaOrdenada);
}

class _PantallaAcademiaMatematicasState extends State<PantallaAcademiaMatematicas>
    with TickerProviderStateMixin {
  _Vista _vista = _Vista.mapa;
  int _nivelActivo = 0;

  // — Juego —
  List<_PreguntaActiva> _ronda = [];
  int _idx = 0;
  int? _seleccionada;
  bool? _esCorrecta;
  bool _mostrandoExplicacion = false;

  int _correctas = 0;
  int _racha = 0;
  int _rachaMax = 0;

  late AnimationController _timerCtrl;
  late AnimationController _feedbackCtrl;
  late AnimationController _slideCtrl;
  late Animation<double> _feedbackScale;
  late Animation<Offset> _slideAnim;
  Timer? _logicTimer;
  Timer? _transTimer;

  final _rng = Random();

  // — Tiempo Primaria (0 = sin límite) —
  int _tiempoPrimaria = 0;
  int _segundosActivos = 0;

  // — Resultados —
  int _estrellas = 0;
  bool _desbloqueoNuevo = false;

  @override
  void initState() {
    super.initState();
    _timerCtrl = AnimationController(vsync: this);
    _feedbackCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _slideCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 330));
    _feedbackScale = CurvedAnimation(parent: _feedbackCtrl, curve: Curves.elasticOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0.4, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _slideCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _logicTimer?.cancel();
    _transTimer?.cancel();
    _timerCtrl.dispose();
    _feedbackCtrl.dispose();
    _slideCtrl.dispose();
    super.dispose();
  }

  // ── Generación de preguntas ──────────────────────

  List<_PreguntaActiva> _generarRonda(int nivel) {
    final banco = _getBanco(nivel);
    final seleccionadas = List<PreguntaMatematica>.from(banco)..shuffle(_rng);
    final lista = seleccionadas.take(10).toList();
    return lista.map(_activar).toList();
  }

  _PreguntaActiva _activar(PreguntaMatematica p) {
    final ops = List<String>.from(p.opciones)..shuffle(_rng);
    final correctaIdx = ops.indexOf(p.opciones[p.correcta]);
    return _PreguntaActiva(p, ops, correctaIdx);
  }

  List<PreguntaMatematica> _getBanco(int nivel) {
    if (nivel == 0) return _generarBancoPrimaria();
    if (nivel == 1) return preguntasSecundaria.toList();
    if (nivel == 2) return preguntasUniversidad.toList();
    if (nivel == 3) return preguntasMatPuro.toList();
    return preguntasSuperdotado.toList();
  }

  List<PreguntaMatematica> _generarBancoPrimaria() {
    final resultado = <PreguntaMatematica>[];
    for (int i = 0; i < 20; i++) {
      resultado.add(_generarPrimaria());
    }
    return resultado;
  }

  PreguntaMatematica _generarPrimaria() {
    final tipo = _rng.nextInt(5);
    int a, b, resp;
    String txt;
    const emojis = ['🍎', '💰', '🏪', '🌽', '📦', '🧁', '🚗', '⭐', '🏠', '🌮'];
    final emoji = emojis[_rng.nextInt(emojis.length)];

    switch (tipo) {
      case 0:
        a = _rng.nextInt(20) + 1; b = _rng.nextInt(20) + 1; resp = a + b;
        txt = 'Tienes $a manzanas y te dan $b más. ¿Cuántas tienes?';
        break;
      case 1:
        b = _rng.nextInt(10) + 1; a = b + _rng.nextInt(15) + 1; resp = a - b;
        txt = 'Tienes \$$a y gastas \$$b. ¿Cuánto te queda?';
        break;
      case 2:
        a = _rng.nextInt(9) + 2; b = _rng.nextInt(9) + 2; resp = a * b;
        txt = 'Vendiste $a paquetes a \$$b cada uno. ¿Cuánto ganaste?';
        break;
      case 3:
        b = [2, 3, 4, 5][_rng.nextInt(4)]; resp = _rng.nextInt(10) + 1; a = b * resp;
        txt = 'Repartiste $a dulces entre $b niños. ¿Cuántos recibe cada uno?';
        break;
      default:
        final mitades = [2, 4, 6, 8, 10, 12];
        a = mitades[_rng.nextInt(mitades.length)]; resp = a ~/ 2;
        txt = '¿Cuánto es la mitad de $a?';
    }
    return _construirPrimaria(txt, resp, emoji);
  }

  PreguntaMatematica _construirPrimaria(String txt, int resp, String emoji) {
    final Set<int> ops = {resp};
    int tries = 0;
    while (ops.length < 4 && tries++ < 50) {
      final d = _rng.nextInt(8) + 1;
      for (final c in [resp + d, max(0, resp - d), resp + d * 2, max(1, resp - d * 2)]) {
        if (c >= 0 && c != resp) { ops.add(c); if (ops.length >= 4) break; }
      }
    }
    final lista = ops.toList()..shuffle(_rng);
    return PreguntaMatematica(
      emoji: emoji,
      enunciado: txt,
      opciones: lista.map((v) => '$v').toList(),
      correcta: lista.indexOf(resp),
      explicacion: 'La respuesta correcta es $resp.',
    );
  }

  // ── Inicio del juego ─────────────────────────────

  void _iniciarNivel(int nivel) {
    _logicTimer?.cancel();
    _transTimer?.cancel();
    final cfg = _niveles[nivel];
    final segs = nivel == 0 ? _tiempoPrimaria : cfg.segundos;
    setState(() {
      _nivelActivo = nivel;
      _segundosActivos = segs;
      _ronda = _generarRonda(nivel);
      _idx = 0; _correctas = 0; _racha = 0; _rachaMax = 0;
      _seleccionada = null; _esCorrecta = null; _mostrandoExplicacion = false;
      _vista = _Vista.juego;
    });
    if (segs > 0) _timerCtrl.duration = Duration(seconds: segs);
    _slideCtrl.forward(from: 0);
    _arrancarTimer();
  }

  void _arrancarTimer() {
    if (_segundosActivos <= 0) return; // sin límite de tiempo
    _timerCtrl.reset();
    _timerCtrl.forward();
    _logicTimer?.cancel();
    _logicTimer = Timer(Duration(seconds: _segundosActivos), () {
      if (!mounted || _seleccionada != null) return;
      _responder(-1);
    });
  }

  void _detenerTimer() {
    _logicTimer?.cancel();
    _timerCtrl.stop();
  }

  void _responder(int idx) {
    if (_seleccionada != null) return;
    _detenerTimer();
    final correcto = idx == _ronda[_idx].correctaOrdenada;
    setState(() {
      _seleccionada = idx;
      _esCorrecta = correcto;
      _mostrandoExplicacion = !correcto || _nivelActivo >= 2;
      if (correcto) {
        _correctas++; _racha++;
        _rachaMax = max(_rachaMax, _racha);
      } else {
        _racha = 0;
      }
    });
    correcto ? SoundPlayer.correcto() : SoundPlayer.error();
    _feedbackCtrl.forward(from: 0);

    final delay = _mostrandoExplicacion
        ? const Duration(milliseconds: 2800)
        : const Duration(milliseconds: 1300);
    _transTimer = Timer(delay, _avanzar);
  }

  void _avanzar() {
    if (!mounted) return;
    if (_idx >= _ronda.length - 1) { _terminar(); return; }
    setState(() {
      _idx++;
      _seleccionada = null; _esCorrecta = null; _mostrandoExplicacion = false;
    });
    _slideCtrl.forward(from: 0);
    _arrancarTimer();
  }

  Future<void> _terminar() async {
    _detenerTimer();
    final provider = context.read<AppProvider>();
    final anteriorDesbloqueado = provider.nivelMatDesbloqueado;
    await provider.registrarResultadoMat(_nivelActivo, _correctas);
    final nuevoDesbloqueado = provider.nivelMatDesbloqueado;

    final stars = _correctas >= 9 ? 3 : _correctas >= 7 ? 2 : _correctas >= 5 ? 1 : 0;
    if (_correctas >= 9) { SoundPlayer.victoria(); }
    else if (_correctas >= 5) { SoundPlayer.nivel(); }

    setState(() {
      _estrellas = stars;
      _desbloqueoNuevo = nuevoDesbloqueado > anteriorDesbloqueado;
      _vista = _Vista.resultados;
    });
  }

  // ════════════════════════════════════════════════════
  //  BUILD
  // ════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: switch (_vista) {
          _Vista.mapa => _buildMapa(),
          _Vista.juego => _buildJuego(),
          _Vista.resultados => _buildResultados(),
        },
      ),
    );
  }

  // ── MAPA ────────────────────────────────────────────
  Widget _buildMapa() {
    final provider = context.watch<AppProvider>();
    final maxDesbloqueado = provider.nivelMatDesbloqueado;

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
            Text('📚 Academia Matemáticas', style: AppTextStyles.heroTitle),
            Text('Sube de nivel aprendiendo', style: AppTextStyles.caption),
          ]),
        ]),
      ),
      const SizedBox(height: 16),
      Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _niveles.length,
          itemBuilder: (_, i) => _buildNivelCard(i, maxDesbloqueado, provider),
        ),
      ),
    ]);
  }

  Widget _buildNivelCard(int i, int maxDesbloqueado, AppProvider provider) {
    final cfg = _niveles[i];
    final desbloqueado = i <= maxDesbloqueado;
    final estrellas = provider.estrellasMatNivel(i);
    final correctas = provider.correctasMatNivel(i);
    final siguiente = i < 4 ? _correctasParaDesbloquear - (provider.correctasMatNivel(i)).clamp(0, _correctasParaDesbloquear) : 0;

    return GestureDetector(
      onTap: desbloqueado ? () { SoundPlayer.click(); _iniciarNivel(i); } : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: desbloqueado
              ? LinearGradient(colors: [cfg.c1, cfg.c2], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : null,
          color: desbloqueado ? null : AppColors.fondoCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: desbloqueado ? cfg.c2.withValues(alpha: 0.6) : AppColors.fondoCardClaro,
          ),
          boxShadow: desbloqueado
              ? [BoxShadow(color: cfg.c2.withValues(alpha: 0.3), blurRadius: 14, offset: const Offset(0, 4))]
              : null,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(cfg.emoji, style: const TextStyle(fontSize: 36)),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text('Nivel ${i + 1}',
                    style: TextStyle(
                        color: desbloqueado ? Colors.white.withValues(alpha: 0.7) : AppColors.textoGris,
                        fontSize: 11, fontWeight: FontWeight.w700)),
                const Spacer(),
                if (desbloqueado) _buildEstrellas(estrellas),
                if (!desbloqueado) const Icon(Icons.lock, color: AppColors.textoGris, size: 18),
              ]),
              Text(cfg.nombre,
                  style: TextStyle(
                      color: desbloqueado ? Colors.white : AppColors.textoGris,
                      fontSize: 18, fontWeight: FontWeight.w900)),
              Text(cfg.subtitulo,
                  style: TextStyle(
                      color: desbloqueado ? Colors.white.withValues(alpha: 0.7) : AppColors.textoGris,
                      fontSize: 12)),
            ])),
          ]),
          const SizedBox(height: 10),
          Text(cfg.descripcion,
              style: TextStyle(
                  color: desbloqueado ? Colors.white.withValues(alpha: 0.75) : AppColors.textoGris,
                  fontSize: 11, height: 1.4)),
          // Selector de tiempo solo para Primaria
          if (i == 0 && desbloqueado) ...[
            const SizedBox(height: 12),
            Row(children: [
              const Text('⏱', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              const Text('Tiempo:', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w700)),
              const SizedBox(width: 8),
              ...{0: 'Sin límite', 30: '30s', 60: '60s', 120: '2 min'}.entries.map((e) {
                final sel = _tiempoPrimaria == e.key;
                return GestureDetector(
                  onTap: () => setState(() => _tiempoPrimaria = e.key),
                  child: Container(
                    margin: const EdgeInsets.only(right: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: sel ? Colors.white : Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(e.value,
                        style: TextStyle(
                          color: sel ? cfg.c1 : Colors.white,
                          fontSize: 10, fontWeight: FontWeight.w900,
                        )),
                  ),
                );
              }),
            ]),
          ],
          if (desbloqueado && correctas > 0) ...[
            const SizedBox(height: 10),
            Row(children: [
              Text('$correctas correctas acumuladas', style: TextStyle(color: Colors.white.withValues(alpha: 0.65), fontSize: 10)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 14),
            ]),
          ],
          if (!desbloqueado && i > 0) ...[
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: (correctas / _correctasParaDesbloquear).clamp(0.0, 1.0),
              backgroundColor: AppColors.fondoCardClaro,
              valueColor: const AlwaysStoppedAnimation(AppColors.neonAmarillo),
              borderRadius: BorderRadius.circular(4),
              minHeight: 5,
            ),
            const SizedBox(height: 4),
            Text('Necesitas $siguiente respuestas correctas más en el nivel anterior',
                style: const TextStyle(color: AppColors.textoGris, fontSize: 9)),
          ],
        ]),
      ),
    );
  }

  Widget _buildEstrellas(int n) {
    return Row(children: List.generate(3, (i) => Text(
      i < n ? '⭐' : '☆',
      style: const TextStyle(fontSize: 14),
    )));
  }

  // ── JUEGO ───────────────────────────────────────────
  Widget _buildJuego() {
    final cfg = _niveles[_nivelActivo];
    final pregunta = _ronda[_idx];

    return Column(children: [
      // Header
      Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 6),
        child: Row(children: [
          GestureDetector(
            onTap: () => _confirmarSalida(),
            child: const Icon(Icons.close, color: AppColors.textoGris, size: 22),
          ),
          const SizedBox(width: 10),
          Expanded(child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('${_idx + 1} / 10',
                  style: const TextStyle(color: AppColors.textoGris, fontSize: 12, fontWeight: FontWeight.w700)),
              if (_racha >= 2)
                Row(children: [
                  const Text('🔥', style: TextStyle(fontSize: 13)),
                  Text(' $_racha', style: const TextStyle(color: AppColors.neonCoral, fontSize: 12, fontWeight: FontWeight.w900)),
                ]),
            ]),
            const SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (_idx + 1) / 10,
                backgroundColor: AppColors.fondoCardClaro,
                valueColor: AlwaysStoppedAnimation(cfg.c2),
                minHeight: 5,
              ),
            ),
          ])),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: cfg.c1.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: cfg.c2),
            ),
            child: Text(cfg.emoji, style: const TextStyle(fontSize: 16)),
          ),
        ]),
      ),

      // Timer bar — solo si hay límite de tiempo
      if (_segundosActivos > 0) Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
        child: AnimatedBuilder(
          animation: _timerCtrl,
          builder: (_, __) {
            final p = 1 - _timerCtrl.value;
            final color = p > 0.5 ? cfg.c2 : p > 0.25 ? AppColors.neonAmarillo : AppColors.neonCoral;
            return Stack(children: [
              Container(height: 7, decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.fondoCardClaro)),
              FractionallySizedBox(
                widthFactor: p.clamp(0.0, 1.0),
                child: Container(height: 7, decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: color,
                  boxShadow: [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 5)],
                )),
              ),
            ]);
          },
        ),
      ),

      const SizedBox(height: 10),

      // Question + options
      Expanded(
        child: SlideTransition(
          position: _slideAnim,
          child: FadeTransition(
            opacity: _slideCtrl,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(children: [
                // Question card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      cfg.c1.withValues(alpha: 0.6),
                      AppColors.fondoCard,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cfg.c2.withValues(alpha: 0.4)),
                  ),
                  child: Column(children: [
                    Text(pregunta.data.emoji, style: const TextStyle(fontSize: 38)),
                    const SizedBox(height: 10),
                    Text(pregunta.data.enunciado,
                        style: const TextStyle(color: AppColors.textoBlanco, fontSize: 15, fontWeight: FontWeight.w700, height: 1.45),
                        textAlign: TextAlign.center),

                    // Feedback
                    if (_esCorrecta != null) ...[
                      const SizedBox(height: 10),
                      ScaleTransition(
                        scale: _feedbackScale,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: (_esCorrecta! ? AppColors.neonVerde : AppColors.neonCoral).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _esCorrecta! ? '✅ ¡Correcto!' : (_seleccionada == -1 ? '⏰ ¡Tiempo!' : '❌ Incorrecto'),
                            style: TextStyle(
                              color: _esCorrecta! ? AppColors.neonVerde : AppColors.neonCoral,
                              fontWeight: FontWeight.w900, fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],

                    // Explicación (shown for wrong answers or hard levels)
                    if (_mostrandoExplicacion && _seleccionada != null) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.neonAzul.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.neonAzul.withValues(alpha: 0.4)),
                        ),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Text('💡', style: TextStyle(fontSize: 14)),
                          const SizedBox(width: 8),
                          Expanded(child: Text(pregunta.data.explicacion,
                              style: const TextStyle(color: AppColors.neonAzul, fontSize: 11, height: 1.4))),
                        ]),
                      ),
                    ],
                  ]),
                ),

                const SizedBox(height: 12),

                // Options
                ...List.generate(4, (i) => _buildOpcion(i, pregunta, cfg)),

                const SizedBox(height: 12),
              ]),
            ),
          ),
        ),
      ),

      // Stats bar
      Container(
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.fondoCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.fondoCardClaro),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _stat('✅', '$_correctas', 'correctas'),
          _stat('🔥', '$_rachaMax', 'racha max'),
          _stat(cfg.emoji, cfg.nombre, 'nivel'),
        ]),
      ),
    ]);
  }

  Widget _buildOpcion(int idx, _PreguntaActiva p, _NivelCfg cfg) {
    final sel = _seleccionada == idx;
    final esCorrecta = idx == p.correctaOrdenada;
    Color border = AppColors.fondoCardClaro;
    Color bg = AppColors.fondoCard;

    if (_seleccionada != null) {
      if (esCorrecta) { border = AppColors.neonVerde; bg = AppColors.neonVerde.withValues(alpha: 0.1); }
      else if (sel) { border = AppColors.neonCoral; bg = AppColors.neonCoral.withValues(alpha: 0.1); }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () => _responder(idx),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
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
                color: border.withValues(alpha: 0.15),
                border: Border.all(color: border),
              ),
              child: Center(child: Text(['A', 'B', 'C', 'D'][idx],
                  style: TextStyle(color: border, fontWeight: FontWeight.w900, fontSize: 11))),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(p.opcionesOrdenadas[idx],
                style: const TextStyle(color: AppColors.textoBlanco, fontSize: 15, fontWeight: FontWeight.w700))),
            if (_seleccionada != null && esCorrecta)
              const Icon(Icons.check_circle_rounded, color: AppColors.neonVerde, size: 20),
            if (_seleccionada != null && sel && !esCorrecta)
              const Icon(Icons.cancel_rounded, color: AppColors.neonCoral, size: 20),
          ]),
        ),
      ),
    );
  }

  Widget _stat(String emoji, String valor, String label) => Column(children: [
    Text(emoji, style: const TextStyle(fontSize: 15)),
    const SizedBox(height: 2),
    Text(valor, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w900, fontSize: 12)),
    Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 9)),
  ]);

  void _confirmarSalida() {
    showDialog(context: context, builder: (_) => AlertDialog(
      backgroundColor: AppColors.fondoCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('¿Salir?', style: TextStyle(color: Colors.white)),
      content: const Text('Perderás el progreso de esta ronda.', style: TextStyle(color: AppColors.textoGris)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Continuar')),
        TextButton(
          onPressed: () { Navigator.pop(context); setState(() => _vista = _Vista.mapa); },
          child: const Text('Salir', style: TextStyle(color: Colors.redAccent)),
        ),
      ],
    ));
  }

  // ── RESULTADOS ───────────────────────────────────────
  Widget _buildResultados() {
    final cfg = _niveles[_nivelActivo];
    final provider = context.watch<AppProvider>();
    final pct = (_correctas / 10 * 100).round();
    final String msg = _correctas >= 9 ? '¡Perfecto! 🌟'
        : _correctas >= 7 ? '¡Excelente! ⭐'
        : _correctas >= 5 ? '¡Bien hecho! 💪'
        : '¡Sigue practicando! 📖';

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Row(children: [
          GestureDetector(
            onTap: () => setState(() => _vista = _Vista.mapa),
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
            // Hero result card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [cfg.c1, cfg.c2], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: cfg.c2.withValues(alpha: 0.4), blurRadius: 20)],
              ),
              child: Column(children: [
                Text(cfg.emoji, style: const TextStyle(fontSize: 52)),
                const SizedBox(height: 10),
                Text(msg, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text('$_correctas de 10 · $pct%', style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 14)),
                const SizedBox(height: 14),
                _buildEstrellasAnim(_estrellas),
              ]),
            ),

            const SizedBox(height: 16),

            // Stats row
            Row(children: [
              Expanded(child: _resCard('✅', '$_correctas', 'Correctas', AppColors.neonVerde)),
              const SizedBox(width: 10),
              Expanded(child: _resCard('🔥', '$_rachaMax', 'Racha máx.', AppColors.neonCoral)),
              const SizedBox(width: 10),
              Expanded(child: _resCard('💎', '+${_correctas + _estrellas * 3}', 'Gemas', AppColors.neonAmarillo)),
            ]),

            const SizedBox(height: 10),
            _resCardWide('🏆', '+${_correctas * [8, 15, 25, 40, 60][_nivelActivo.clamp(0, 4)]}',
                'Puntos de ranking ganados', AppColors.neonMorado),

            // Progreso
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.fondoCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.fondoCardClaro),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('📈 Progreso en este nivel', style: TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700, fontSize: 13)),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: (provider.correctasMatNivel(_nivelActivo) / _correctasParaDesbloquear).clamp(0.0, 1.0),
                  backgroundColor: AppColors.fondoCardClaro,
                  valueColor: AlwaysStoppedAnimation(cfg.c2),
                  borderRadius: BorderRadius.circular(4),
                  minHeight: 7,
                ),
                const SizedBox(height: 6),
                Text('${provider.correctasMatNivel(_nivelActivo)} / $_correctasParaDesbloquear para desbloquear el siguiente nivel',
                    style: const TextStyle(color: AppColors.textoGris, fontSize: 10)),
              ]),
            ),

            // Desbloqueo nuevo!
            if (_desbloqueoNuevo && _nivelActivo < 4) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [_niveles[_nivelActivo + 1].c1, _niveles[_nivelActivo + 1].c2]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(children: [
                  const Text('🔓', style: TextStyle(fontSize: 28)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('¡Nuevo nivel desbloqueado!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
                    Text(_niveles[_nivelActivo + 1].nombre,
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12)),
                  ])),
                ]),
              ),
            ],

            const SizedBox(height: 20),

            // Buttons
            GestureDetector(
              onTap: () => _iniciarNivel(_nivelActivo),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [cfg.c1, cfg.c2]),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: cfg.c2.withValues(alpha: 0.4), blurRadius: 12)],
                ),
                child: const Text('🔄 Jugar de Nuevo', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => setState(() => _vista = _Vista.mapa),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.fondoCardClaro),
                ),
                child: const Text('🗺️ Ver Niveles', textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.textoBlanco, fontSize: 16, fontWeight: FontWeight.w700)),
              ),
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildEstrellasAnim(int n) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(3, (i) {
      return AnimatedOpacity(
        opacity: i < n ? 1.0 : 0.35,
        duration: Duration(milliseconds: 300 + i * 150),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(i < n ? '⭐' : '☆', style: const TextStyle(fontSize: 32)),
        ),
      );
    }));
  }

  Widget _resCard(String emoji, String val, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 4),
        Text(val, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w900)),
        Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 9), textAlign: TextAlign.center),
      ]),
    );
  }

  Widget _resCardWide(String emoji, String val, String label, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(width: 10),
        Text(val, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w900)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 12)),
      ]),
    );
  }
}
