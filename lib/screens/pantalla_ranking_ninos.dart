// lib/screens/pantalla_ranking_ninos.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../providers/app_provider.dart';
import '../utils/sound_player.dart';
import 'pantalla_juego_matematicas.dart';

class PantallaRankingNinos extends StatefulWidget {
  const PantallaRankingNinos({super.key});

  @override
  State<PantallaRankingNinos> createState() => _PantallaRankingNinosState();
}

class _JugadorRanking {
  final String nombre;
  final String avatar;
  final int puntos;
  final bool esUsuario;
  const _JugadorRanking(this.nombre, this.avatar, this.puntos, {this.esUsuario = false});
}

class _PantallaRankingNinosState extends State<PantallaRankingNinos>
    with TickerProviderStateMixin {
  static const _bots = [
    ('Valentina', '🌺', 850),
    ('Santiago', '⚽', 790),
    ('Isabella', '🦋', 735),
    ('Mateo', '🚀', 690),
    ('Sofía', '🌸', 650),
    ('Lucas', '🎮', 615),
    ('Emma', '⭐', 580),
    ('Sebastián', '🦁', 545),
    ('Camila', '🎯', 510),
    ('Diego', '🏆', 468),
    ('Valeria', '💎', 435),
    ('Nicolás', '🔥', 400),
    ('Daniela', '🌙', 370),
    ('Andrés', '⚡', 340),
    ('Mariana', '🌻', 315),
    ('Alejandro', '🎸', 282),
    ('Paula', '🦄', 250),
    ('Gabriel', '🌊', 222),
    ('Luciana', '🌈', 195),
  ];

  late Timer _clockTimer;
  String _countdown = '--:--:--';

  late AnimationController _pulseCtrl;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _pulse = Tween<double>(begin: 1.0, end: 1.06).animate(
        CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _countdown = _calcCountdown());
    });
    _countdown = _calcCountdown();
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _pulseCtrl.dispose();
    super.dispose();
  }

  String _calcCountdown() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    final diff = midnight.difference(now);
    final h = diff.inHours.toString().padLeft(2, '0');
    final m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final s = (diff.inSeconds % 60).toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  int _puntosBotDia(int base, int botIdx) {
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    final variation = (sin(dayOfYear * 1.73 + botIdx * 2.31) * 75).round();
    return (base + variation).clamp(50, 999);
  }

  List<_JugadorRanking> _buildJugadores(int puntosUsuario, String avatarUsuario) {
    final lista = <_JugadorRanking>[];
    for (int i = 0; i < _bots.length; i++) {
      final (nombre, av, base) = _bots[i];
      lista.add(_JugadorRanking(nombre, av, _puntosBotDia(base, i)));
    }
    lista.add(_JugadorRanking('Yo', avatarUsuario, puntosUsuario, esUsuario: true));
    lista.sort((a, b) => b.puntos.compareTo(a.puntos));
    return lista;
  }

  bool _jugoHoy(String ultimaFecha) {
    if (ultimaFecha.isEmpty) return false;
    final ultima = DateTime.tryParse(ultimaFecha);
    if (ultima == null) return false;
    final hoy = DateTime.now();
    return ultima.year == hoy.year && ultima.month == hoy.month && ultima.day == hoy.day;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final jugadores = _buildJugadores(provider.puntosRanking, provider.avatarActual);
    final posicion = jugadores.indexWhere((j) => j.esUsuario) + 1;
    final yaJugoHoy = _jugoHoy(provider.ultimaFechaJuego);

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Column(children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Row(children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 20),
              ),
              const SizedBox(width: 12),
              const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('🏆 Ranking de Niños', style: AppTextStyles.heroTitle),
                Text('Top 20 jugadores activos', style: AppTextStyles.caption),
              ]),
            ]),
          ),

          const SizedBox(height: 16),

          // User position card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ScaleTransition(
              scale: _pulse,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: posicion <= 3
                        ? [const Color(0xFF6A1B9A), const Color(0xFFB47FFF)]
                        : posicion <= 10
                            ? [const Color(0xFF0D47A1), const Color(0xFF4ECDC4)]
                            : [const Color(0xFF1A1B2E), const Color(0xFF252840)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: posicion <= 3 ? AppColors.neonAmarillo.withValues(alpha: 0.6)
                        : AppColors.neonMorado.withValues(alpha: 0.4),
                    width: posicion <= 3 ? 2 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (posicion <= 3 ? AppColors.neonMorado : AppColors.neonAzul).withValues(alpha: 0.25),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Row(children: [
                  Text(provider.avatarActual, style: const TextStyle(fontSize: 40)),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Tu posición', style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12)),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text('#$posicion',
                          style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900, height: 1)),
                      const SizedBox(width: 6),
                      Text('de 20', style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 14)),
                    ]),
                    Text('${provider.puntosRanking} puntos',
                        style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 13, fontWeight: FontWeight.w700)),
                  ])),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    if (posicion == 1) const Text('👑 Campeón!', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w900, fontSize: 12)),
                    if (posicion <= 3 && posicion > 1) const Text('🥈 Podio!', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w900, fontSize: 12)),
                    if (!yaJugoHoy) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.neonCoral.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.neonCoral.withValues(alpha: 0.5)),
                        ),
                        child: const Text('⚠️ Juega hoy', style: TextStyle(color: AppColors.neonCoral, fontSize: 9, fontWeight: FontWeight.w900)),
                      ),
                    ] else ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.neonVerde.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('✅ Ya jugaste', style: TextStyle(color: AppColors.neonVerde, fontSize: 9, fontWeight: FontWeight.w900)),
                      ),
                    ],
                  ]),
                ]),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Countdown + decay warning
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.fondoCard,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.fondoCardClaro),
                  ),
                  child: Row(children: [
                    const Text('⏰', style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 8),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Reset a medianoche', style: TextStyle(color: AppColors.textoGris, fontSize: 9)),
                      Text(_countdown, style: const TextStyle(color: AppColors.textoBlanco, fontSize: 14, fontWeight: FontWeight.w900)),
                    ]),
                  ]),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    SoundPlayer.click();
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaJuegoMatematicas()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [AppColors.neonMorado, AppColors.neonAzul]),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.4), blurRadius: 10)],
                    ),
                    child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('🧮', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 6),
                      Text('¡Jugar!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
                    ]),
                  ),
                ),
              ),
            ]),
          ),

          if (!yaJugoHoy) ...[
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.neonCoral.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.neonCoral.withValues(alpha: 0.3)),
              ),
              child: const Row(children: [
                Text('📉', style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Expanded(child: Text(
                  '¡Si no juegas hoy, bajarás de posición a medianoche!',
                  style: TextStyle(color: AppColors.neonCoral, fontSize: 11, fontWeight: FontWeight.w700),
                )),
              ]),
            ),
          ],

          const SizedBox(height: 12),

          // List header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              SizedBox(width: 36, child: Text('#', style: TextStyle(color: AppColors.textoGris, fontSize: 11, fontWeight: FontWeight.w700))),
              Expanded(child: Text('JUGADOR', style: TextStyle(color: AppColors.textoGris, fontSize: 11, fontWeight: FontWeight.w700))),
              Text('PUNTOS', style: TextStyle(color: AppColors.textoGris, fontSize: 11, fontWeight: FontWeight.w700)),
            ]),
          ),
          const SizedBox(height: 6),

          // Player list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: jugadores.length,
              itemBuilder: (_, i) => _buildFila(jugadores[i], i + 1),
            ),
          ),

          const SizedBox(height: 8),
        ]),
      ),
    );
  }

  Widget _buildFila(_JugadorRanking jugador, int pos) {
    final Color fondo;
    final Color border;
    if (jugador.esUsuario) {
      fondo = AppColors.neonMorado.withValues(alpha: 0.12);
      border = AppColors.neonMorado.withValues(alpha: 0.5);
    } else if (pos == 1) {
      fondo = AppColors.neonAmarillo.withValues(alpha: 0.08);
      border = AppColors.neonAmarillo.withValues(alpha: 0.25);
    } else if (pos <= 3) {
      fondo = AppColors.neonCoral.withValues(alpha: 0.06);
      border = AppColors.neonCoral.withValues(alpha: 0.2);
    } else {
      fondo = Colors.transparent;
      border = Colors.transparent;
    }

    final posEmoji = pos == 1 ? '🥇' : pos == 2 ? '🥈' : pos == 3 ? '🥉' : '#$pos';
    final posColor = pos == 1
        ? AppColors.neonAmarillo
        : pos <= 3
            ? AppColors.neonCoral
            : jugador.esUsuario
                ? AppColors.neonMorado
                : AppColors.textoGris;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: fondo,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border, width: border == Colors.transparent ? 0 : 1),
      ),
      child: Row(children: [
        SizedBox(
          width: 36,
          child: Text(posEmoji,
              style: TextStyle(
                color: posColor,
                fontSize: pos <= 3 ? 18 : 13,
                fontWeight: FontWeight.w900,
              )),
        ),
        Text(jugador.avatar, style: const TextStyle(fontSize: 22)),
        const SizedBox(width: 10),
        Expanded(child: Text(
          jugador.nombre,
          style: TextStyle(
            color: jugador.esUsuario ? AppColors.neonMorado : AppColors.textoBlanco,
            fontWeight: jugador.esUsuario ? FontWeight.w900 : FontWeight.w600,
            fontSize: 14,
          ),
        )),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('${jugador.puntos}',
              style: TextStyle(
                color: jugador.esUsuario ? AppColors.neonMorado : AppColors.textoBlanco,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              )),
          Text('pts', style: const TextStyle(color: AppColors.textoGris, fontSize: 9)),
        ]),
        if (jugador.esUsuario) ...[
          const SizedBox(width: 6),
          const Icon(Icons.arrow_right, color: AppColors.neonMorado, size: 20),
        ],
      ]),
    );
  }
}
