// lib/screens/pantalla_memoria_financiera.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../providers/app_provider.dart';

// ─── Datos ───────────────────────────────────────────────────────────────────

class _Par {
  final String emoji;
  final String termino;
  final String definicion;
  const _Par(this.emoji, this.termino, this.definicion);
}

const _todosLosPares = [
  _Par('💰', 'Ahorro', 'Guardar dinero para el futuro'),
  _Par('📈', 'Inversión', 'Poner tu dinero a trabajar para ganar más'),
  _Par('📋', 'Presupuesto', 'Plan de cuánto gastar y cuánto guardar'),
  _Par('💸', 'Interés', 'Dinero extra que crece con el tiempo'),
  _Par('🏦', 'Banco', 'Lugar seguro donde guardar tu dinero'),
  _Par('💳', 'Deuda', 'Dinero que debes devolver a alguien'),
  _Par('🧾', 'Ingreso', 'Dinero que recibes por tu trabajo'),
  _Par('🛒', 'Gasto', 'Dinero que usas para comprar algo'),
  _Par('📦', 'Activo', 'Algo que pone dinero en tu bolsillo'),
  _Par('📤', 'Pasivo', 'Algo que saca dinero de tu bolsillo'),
  _Par('🏆', 'Ganancia', 'Lo que sobra después de pagar costos'),
  _Par('🌱', 'Capital', 'Dinero disponible para invertir'),
  _Par('🚀', 'Emprender', 'Crear tu propio negocio o proyecto'),
  _Par('🎯', 'Meta', 'Objetivo financiero que quieres lograr'),
  _Par('📉', 'Inflación', 'Precios que suben y dinero que vale menos'),
  _Par('🤝', 'Dividendo', 'Parte de ganancias repartida entre socios'),
  _Par('🏠', 'Patrimonio', 'Todo lo que tienes de valor'),
  _Par('💡', 'Libertad', 'Vivir de inversiones sin necesitar un jefe'),
  _Par('📊', 'Acción', 'Parte pequeña de la propiedad de una empresa'),
  _Par('🔄', 'Flujo', 'Dinero que entra y sale de tu bolsillo'),
];

// ─── Modelos ─────────────────────────────────────────────────────────────────

class _Carta {
  final int pairId;
  final bool esTerm;
  final String content;
  final String emoji;
  bool isFlipped = false;
  bool isMatched = false;
  bool isWrong = false;

  _Carta({
    required this.pairId,
    required this.esTerm,
    required this.content,
    required this.emoji,
  });
}

class _Nivel {
  final String nombre;
  final String emoji;
  final int pares;
  final int cols;
  final Color c1, c2;
  final int gemasBase;
  const _Nivel(this.nombre, this.emoji, this.pares, this.cols, this.c1, this.c2, this.gemasBase);
}

const _niveles = [
  _Nivel('Fácil',   '🌱', 6,  4, Color(0xFF1B5E20), Color(0xFF388E3C), 5),
  _Nivel('Medio',   '⭐', 10, 4, Color(0xFF0D47A1), Color(0xFF1976D2), 10),
  _Nivel('Difícil', '🔥', 16, 4, Color(0xFF4A148C), Color(0xFF7B1FA2), 20),
];

// ─── Screen ──────────────────────────────────────────────────────────────────

class PantallaMemoriaFinanciera extends StatefulWidget {
  const PantallaMemoriaFinanciera({super.key});

  @override
  State<PantallaMemoriaFinanciera> createState() => _PantallaMemoriaFinancieraState();
}

class _PantallaMemoriaFinancieraState extends State<PantallaMemoriaFinanciera> {
  int _vista = 0; // 0=select, 1=game, 2=results
  int _nivelIdx = 0;

  List<_Carta> _cartas = [];
  List<int> _seleccionadas = [];
  int _parejas = 0;
  int _intentos = 0;
  bool _bloqueado = false;

  int _segundos = 0;
  Timer? _timer;

  int _estrellas = 0;
  int _gemasGanadas = 0;

  // ── Lógica ───────────────────────────────────────────────────────────────

  void _iniciarJuego(int nivelIdx) {
    final nivel = _niveles[nivelIdx];
    final rng = Random();
    final pares = (_todosLosPares.toList()..shuffle(rng)).take(nivel.pares).toList();

    final cartas = <_Carta>[];
    for (int i = 0; i < pares.length; i++) {
      cartas.add(_Carta(pairId: i, esTerm: true,  content: pares[i].termino,   emoji: pares[i].emoji));
      cartas.add(_Carta(pairId: i, esTerm: false, content: pares[i].definicion, emoji: pares[i].emoji));
    }
    cartas.shuffle(rng);

    _timer?.cancel();
    setState(() {
      _nivelIdx     = nivelIdx;
      _cartas       = cartas;
      _seleccionadas = [];
      _parejas      = 0;
      _intentos     = 0;
      _bloqueado    = false;
      _segundos     = 0;
      _vista        = 1;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _segundos++);
    });
  }

  void _onTap(int idx) {
    if (_bloqueado) return;
    final carta = _cartas[idx];
    if (carta.isFlipped || carta.isMatched) return;
    if (_seleccionadas.length == 1 && _seleccionadas[0] == idx) return;

    setState(() => carta.isFlipped = true);

    if (_seleccionadas.isEmpty) {
      _seleccionadas.add(idx);
      return;
    }

    _seleccionadas.add(idx);
    _bloqueado = true;
    _intentos++;

    final a = _cartas[_seleccionadas[0]];
    final b = _cartas[_seleccionadas[1]];

    if (a.pairId == b.pairId && a.esTerm != b.esTerm) {
      Future.delayed(const Duration(milliseconds: 400), () {
        if (!mounted) return;
        setState(() {
          a.isMatched = true;
          b.isMatched = true;
          _seleccionadas.clear();
          _bloqueado = false;
          _parejas++;
        });
        if (_parejas == _niveles[_nivelIdx].pares) _finalizarJuego();
      });
    } else {
      setState(() { a.isWrong = true; b.isWrong = true; });
      Future.delayed(const Duration(milliseconds: 900), () {
        if (!mounted) return;
        setState(() {
          a.isFlipped = false; b.isFlipped = false;
          a.isWrong   = false; b.isWrong   = false;
          _seleccionadas.clear();
          _bloqueado = false;
        });
      });
    }
  }

  void _finalizarJuego() {
    _timer?.cancel();
    final nivel    = _niveles[_nivelIdx];
    final efic     = _intentos > 0 ? _parejas / _intentos : 1.0;
    final estrellas = efic >= 0.85 ? 3 : efic >= 0.65 ? 2 : 1;
    final gemas    = nivel.gemasBase + (estrellas - 1) * 3;

    context.read<AppProvider>().agregarGemasQuiz(gemas);
    setState(() { _estrellas = estrellas; _gemasGanadas = gemas; _vista = 2; });
  }

  @override
  void dispose() { _timer?.cancel(); super.dispose(); }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: _vista == 0 ? _buildSelect()
             : _vista == 1 ? _buildGame()
             : _buildResults(),
      ),
    );
  }

  // ── Pantalla selección ────────────────────────────────────────────────────

  Widget _buildSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco),
              onPressed: () => Navigator.pop(context),
            ),
            const Text('🧠 Memoria Financiera', style: AppTextStyles.heroTitle),
          ]),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Empareja cada término con su definición.\nVoltea las cartas y encuentra las parejas.',
            style: AppTextStyles.caption,
          ),
        ),
        const SizedBox(height: 40),
        ...List.generate(_niveles.length, (i) {
          final n = _niveles[i];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: GestureDetector(
              onTap: () => _iniciarJuego(i),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [n.c1, n.c2], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [BoxShadow(color: n.c2.withValues(alpha: 0.4), blurRadius: 12, offset: const Offset(0, 4))],
                ),
                child: Row(children: [
                  Text(n.emoji, style: const TextStyle(fontSize: 36)),
                  const SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(n.nombre, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
                    Text('${n.pares} parejas · +${n.gemasBase} 💎', style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 13)),
                  ])),
                  const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
                ]),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ── Pantalla juego ────────────────────────────────────────────────────────

  Widget _buildGame() {
    final nivel = _niveles[_nivelIdx];

    return Column(children: [
      // Header
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(children: [
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.textoBlanco),
            onPressed: () { _timer?.cancel(); setState(() => _vista = 0); },
          ),
          Expanded(
            child: Text('${nivel.emoji} ${nivel.nombre}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
          ),
          _Chip(Icons.timer, _formatTime(_segundos)),
          const SizedBox(width: 8),
          _Chip(Icons.check_circle_outline, '${_parejas}/${nivel.pares}'),
        ]),
      ),
      // Grid
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: nivel.cols,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              childAspectRatio: 0.78,
            ),
            itemCount: _cartas.length,
            itemBuilder: (ctx, i) => _buildCarta(i),
          ),
        ),
      ),
      // Barra de progreso
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Intentos: $_intentos', style: const TextStyle(color: AppColors.textoGris, fontSize: 11)),
            Text('${((_parejas / nivel.pares) * 100).round()}% completado',
              style: const TextStyle(color: AppColors.textoGris, fontSize: 11)),
          ]),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: _parejas / nivel.pares,
            backgroundColor: Colors.white10,
            valueColor: AlwaysStoppedAnimation(nivel.c2),
            minHeight: 5,
            borderRadius: BorderRadius.circular(3),
          ),
        ]),
      ),
    ]);
  }

  Widget _buildCarta(int idx) {
    final carta   = _cartas[idx];
    final visible = carta.isFlipped || carta.isMatched;

    Color borde = Colors.transparent;
    if (carta.isMatched) borde = AppColors.neonVerde;
    if (carta.isWrong)   borde = Colors.redAccent;

    return GestureDetector(
      onTap: () => _onTap(idx),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borde, width: 2),
          boxShadow: carta.isMatched
              ? [BoxShadow(color: AppColors.neonVerde.withValues(alpha: 0.3), blurRadius: 8)]
              : carta.isWrong
              ? [BoxShadow(color: Colors.redAccent.withValues(alpha: 0.3), blurRadius: 8)]
              : null,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 280),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
          child: visible
              ? _cartaFrente(carta, key: ValueKey('f$idx'))
              : _cartaDorso(key: ValueKey('b$idx')),
        ),
      ),
    );
  }

  Widget _cartaDorso({Key? key}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A0533), Color(0xFF2E1B52)],
          begin: Alignment.topLeft, end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Text('🧠', style: TextStyle(fontSize: 26))),
    );
  }

  Widget _cartaFrente(_Carta carta, {Key? key}) {
    final isTerm = carta.esTerm;
    final c1 = isTerm ? const Color(0xFF0D3B73) : const Color(0xFF4A0E6E);
    final c2 = isTerm ? const Color(0xFF1565C0) : const Color(0xFF7B1FA2);

    return Container(
      key: key,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [c1, c2], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (isTerm) ...[
          Text(carta.emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 3),
        ],
        Text(
          carta.content,
          style: TextStyle(
            color: Colors.white,
            fontSize: isTerm ? 11 : 9,
            fontWeight: isTerm ? FontWeight.w900 : FontWeight.w500,
            height: 1.25,
          ),
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            isTerm ? 'TÉRMINO' : 'DEFINICIÓN',
            style: const TextStyle(color: Colors.white70, fontSize: 6.5, fontWeight: FontWeight.w900, letterSpacing: 0.4),
          ),
        ),
      ]),
    );
  }

  // ── Pantalla resultados ───────────────────────────────────────────────────

  Widget _buildResults() {
    final nivel  = _niveles[_nivelIdx];
    final efic   = _intentos > 0 ? (_parejas / _intentos * 100).round() : 100;
    final titulo = _estrellas == 3 ? '¡Memoria perfecta!' : _estrellas == 2 ? '¡Muy bien!' : '¡Lo lograste!';

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) =>
              Text(i < _estrellas ? '⭐' : '☆', style: const TextStyle(fontSize: 36)))),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white12),
            ),
            child: Column(children: [
              _fila('Nivel',     nivel.nombre),
              _fila('Tiempo',    _formatTime(_segundos)),
              _fila('Parejas',   '${nivel.pares}/${nivel.pares}'),
              _fila('Intentos',  '$_intentos'),
              _fila('Eficiencia','$efic%'),
              _fila('Gemas',     '+$_gemasGanadas 💎'),
            ]),
          ),
          const SizedBox(height: 32),
          Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _vista = 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Text('Niveles', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () => _iniciarJuego(_nivelIdx),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [nivel.c1, nivel.c2]),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [BoxShadow(color: nivel.c2.withValues(alpha: 0.4), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: const Text('Jugar de nuevo', textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Widget _fila(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 14)),
        Text(valor,  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
      ]),
    );
  }

  String _formatTime(int s) =>
      '${(s ~/ 60).toString().padLeft(2, '0')}:${(s % 60).toString().padLeft(2, '0')}';
}

// ─── Helper widget ────────────────────────────────────────────────────────────

class _Chip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Chip(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: Colors.white70, size: 13),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
      ]),
    );
  }
}
