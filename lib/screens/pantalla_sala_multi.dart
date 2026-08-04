// lib/screens/pantalla_sala_multi.dart — Sala Multijugador: Imperio Builder
import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/imperio_model.dart';
import '../services/firebase_service.dart';
import '../theme.dart';
import '../utils/sound_player.dart';

class PantallaSalaMulti extends StatefulWidget {
  final String salaId;
  final String codigo;
  final bool   esHost;
  final int    duracionMin;
  const PantallaSalaMulti({
    super.key,
    required this.salaId,
    required this.codigo,
    required this.esHost,
    required this.duracionMin,
  });

  @override
  State<PantallaSalaMulti> createState() => _PantallaSalaMultiState();
}

class _PantallaSalaMultiState extends State<PantallaSalaMulti>
    with TickerProviderStateMixin {

  // ── Fase ─────────────────────────────────────────────────────
  String _fase = 'espera'; // 'espera' | 'jugando' | 'terminada'

  // ── Jugadores en sala ─────────────────────────────────────────
  Map<String, Map<String, dynamic>> _jugadores = {};  // uid → data
  // Scores en tiempo real durante la partida
  List<Map<String, dynamic>> _scores = [];

  // ── Streams ───────────────────────────────────────────────────
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _roomSub;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?    _scoresSub;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?    _chatSub;

  // ── Timer de partida ──────────────────────────────────────────
  int  _segundosRestantes = 0;
  Timer? _countdownTimer;
  DateTime? _terminaEn;

  // ── Juego (Imperio Builder) ──────────────────────────────────
  List<IBNegocio> _negocios  = crearNegocios();
  double _dinero     = 0;
  double _totalGanado = 0;
  Timer? _ticker;
  Timer? _syncTimer;
  double _bonusMult   = 1.0;
  IBNegocio? _leccionActual;

  // ── Chat ──────────────────────────────────────────────────────
  bool   _chatVisible   = false;
  int    _mensajesNoLeidos = 0;
  List<Map<String, dynamic>> _mensajes = [];
  final _chatCtrl   = TextEditingController();
  final _chatScroll = ScrollController();

  // ── Animaciones ───────────────────────────────────────────────
  late AnimationController _confettiCtrl;

  // ── Mi info ───────────────────────────────────────────────────
  String get _miApodo  => FirebaseService.apodo ?? 'Anónima';
  int    get _miAvatar => FirebaseService.avatar;
  String get _miUid    => FirebaseService.uid ?? 'local';
  bool   get _esLocal  => widget.salaId.startsWith('local_');

  // ── Duración ─────────────────────────────────────────────────
  int get _durMin => widget.duracionMin;

  @override
  void initState() {
    super.initState();
    _confettiCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _bonusMult = 1.0;
    if (kFirebaseEnabled && !_esLocal) _escucharSala();
  }

  @override
  void dispose() {
    _roomSub?.cancel();
    _scoresSub?.cancel();
    _chatSub?.cancel();
    _ticker?.cancel();
    _syncTimer?.cancel();
    _countdownTimer?.cancel();
    _confettiCtrl.dispose();
    _chatCtrl.dispose();
    _chatScroll.dispose();
    super.dispose();
  }

  // ─── Escuchar sala en Firestore ──────────────────────────────
  void _escucharSala() {
    final stream = FirebaseService.roomStream(widget.salaId);
    if (stream == null) return;
    _roomSub = stream.listen((snap) {
      if (!snap.exists || !mounted) return;
      final data = snap.data()!;
      final estado = data['estado'] as String? ?? 'esperando';
      final jugadores = (data['jugadores'] as Map<String, dynamic>?)
          ?.map((k, v) => MapEntry(k, v as Map<String, dynamic>)) ?? {};

      setState(() => _jugadores = jugadores);

      if (estado == 'jugando' && _fase == 'espera') {
        final terminaEn = (data['terminaEn'] as Timestamp?)?.toDate();
        _iniciarJuego(terminaEn: terminaEn);
      }
      if (estado == 'terminada' && _fase == 'jugando') {
        _terminarJuego();
      }
    });

    _escucharScores();
    _escucharChat();
  }

  void _escucharScores() {
    final stream = FirebaseService.scoresStream(widget.salaId);
    if (stream == null) return;
    _scoresSub = stream.listen((snap) {
      if (!mounted) return;
      final lista = snap.docs.map((d) => {...d.data(), 'uid': d.id}).toList();
      lista.sort((a, b) => ((b['totalGanado'] as num?) ?? 0).compareTo((a['totalGanado'] as num?) ?? 0));
      setState(() => _scores = lista);
    });
  }

  void _escucharChat() {
    final stream = FirebaseService.chatStream(widget.salaId);
    if (stream == null) return;
    _chatSub = stream.listen((snap) {
      if (!mounted) return;
      final msgs = snap.docs.map((d) => d.data()).toList();
      setState(() {
        _mensajes = msgs;
        if (!_chatVisible) _mensajesNoLeidos = (_mensajesNoLeidos + 1).clamp(0, 99);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_chatScroll.hasClients) _chatScroll.animateTo(
          _chatScroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut,
        );
      });
    });
  }

  // ─── Iniciar partida ─────────────────────────────────────────
  Future<void> _iniciarPartida() async {
    if (!widget.esHost) return;
    if (kFirebaseEnabled && !_esLocal) {
      await FirebaseService.startGame(widget.salaId, _durMin);
    } else {
      _iniciarJuego();
    }
  }

  void _iniciarJuego({DateTime? terminaEn}) {
    final dur = terminaEn != null
        ? terminaEn.difference(DateTime.now()).inSeconds
        : _durMin * 60;
    setState(() {
      _fase = 'jugando';
      _segundosRestantes = dur.clamp(0, _durMin * 60);
      _terminaEn = terminaEn ?? DateTime.now().add(Duration(minutes: _durMin));
    });
    SoundPlayer.leccion(); // ¡La partida comienza!
    _iniciarTicker();
    _iniciarContador();
    // Sincronizar scores cada 5 segundos (solo Firebase)
    if (!_esLocal) _syncTimer = Timer.periodic(const Duration(seconds: 5), (_) => _sincronizar());
  }

  void _iniciarTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      final ingSeg = _negocios.fold(0.0, (s, n) => s + n.ingresoActual) * _bonusMult;
      final ganado = ingSeg * 0.1;
      setState(() {
        _dinero      += ganado;
        _totalGanado += ganado;
      });
    });
  }

  void _iniciarContador() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      final secs = _terminaEn != null
          ? _terminaEn!.difference(DateTime.now()).inSeconds
          : _segundosRestantes - 1;
      if (secs <= 0) {
        setState(() => _segundosRestantes = 0);
        _countdownTimer?.cancel();
        _terminarJuego();
      } else {
        setState(() => _segundosRestantes = secs);
      }
    });
  }

  Future<void> _sincronizar() async {
    final ingSeg = _negocios.fold(0.0, (s, n) => s + n.ingresoActual) * _bonusMult;
    final activos = _negocios.where((n) => n.comprado).length;
    await FirebaseService.updateScore(widget.salaId, _dinero, _totalGanado, ingSeg, activos);
  }

  Future<void> _terminarJuego() async {
    _ticker?.cancel();
    _syncTimer?.cancel();
    _countdownTimer?.cancel();
    if (!_esLocal) await _sincronizar();
    if (widget.esHost && kFirebaseEnabled && !_esLocal) await FirebaseService.endGame(widget.salaId);
    final nivel = nivelImperio(_totalGanado);
    await FirebaseService.updateLeaderboard(_totalGanado, nivel);
    _confettiCtrl.forward();
    SoundPlayer.victoria();
    if (mounted) setState(() { _fase = 'terminada'; _chatVisible = false; });
  }

  // ─── Comprar negocio ─────────────────────────────────────────
  void _comprar(int idx) {
    final n = _negocios[idx];
    final costo = n.costoSiguiente;
    if (_dinero < costo) {
      HapticFeedback.heavyImpact();
      SoundPlayer.error();
      return;
    }
    HapticFeedback.lightImpact();
    SoundPlayer.compra();
    setState(() {
      _dinero -= costo;
      _negocios[idx] = n.copyWith(nivel: n.nivel + 1);
    });
    if (!n.comprado) {
      setState(() => _leccionActual = _negocios[idx]);
    }
  }

  // ─── Chat ─────────────────────────────────────────────────────
  Future<void> _enviarMensaje() async {
    final txt = _chatCtrl.text.trim();
    if (txt.isEmpty) return;
    _chatCtrl.clear();
    if (kFirebaseEnabled && !_esLocal && FirebaseService.uid != null) {
      await FirebaseService.sendMessage(widget.salaId, txt);
    } else {
      // Modo local/web: agregar el mensaje directamente al estado local
      setState(() {
        _mensajes.add({
          'uid':         _miUid,
          'apodo':       _miApodo,
          'avatarIndex': _miAvatar,
          'texto':       txt,
        });
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_chatScroll.hasClients) _chatScroll.animateTo(
          _chatScroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut,
        );
      });
    }
  }

  void _abrirChat() {
    setState(() { _chatVisible = true; _mensajesNoLeidos = 0; });
  }

  // ══════════════════════════════════════════════════════════════
  //  BUILD
  // ══════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _fase != 'jugando',
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop && _fase == 'jugando') {
          final salir = await _confirmarSalida();
          if (salir && mounted) {
            await _terminarJuego();
            if (mounted) Navigator.pop(context);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.fondoOscuro,
        body: SafeArea(child: _buildBody()),
        floatingActionButton: (_fase != 'terminada' && !_chatVisible) ? _buildChatFab() : null,
      ),
    );
  }

  Widget _buildBody() {
    if (_chatVisible) return _buildChatPanel();
    switch (_fase) {
      case 'espera':    return _buildSalaEspera();
      case 'jugando':   return _buildJuego();
      case 'terminada': return _buildResultados();
      default:          return _buildSalaEspera();
    }
  }

  // ─────────────────────────────────────────────────────────────
  //  FASE 1: SALA DE ESPERA
  // ─────────────────────────────────────────────────────────────
  Widget _buildSalaEspera() {
    return Column(children: [
      // Header
      Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF1A0A3C), Color(0xFF0D0E1A)]),
        ),
        child: Row(children: [
          IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
          const Expanded(child: Text('🏙️ Sala de Imperio', style: AppTextStyles.heroTitle)),
        ]),
      ),
      Expanded(child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Código para compartir
          _buildCodigoCard(),
          const SizedBox(height: 20),

          // Duración
          _buildInfoRow('⏱️ Duración', '$_durMin minutos'),
          const SizedBox(height: 8),
          _buildInfoRow('🎮 Modo', 'Imperio Builder — ¿Quién gana más?'),
          const SizedBox(height: 8),
          _buildInfoRow('💡 Tu nivel', '${badgeNivel(nivelImperio(0))} ${tituloNivel(nivelImperio(0))} • Bonus ${_bonusMult}x'),
          const SizedBox(height: 24),

          // Lista de jugadores
          const Text('👥 Jugadoras conectadas:', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 10),
          if (_jugadores.isEmpty)
            _buildJugadoraCard(_miApodo, _miAvatar, true)
          else
            ..._jugadores.entries.map((e) =>
              _buildJugadoraCard(e.value['apodo'] as String? ?? 'Anónima',
                  (e.value['avatarIndex'] as int?) ?? 0,
                  e.key == _miUid)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(12)),
            child: const Row(children: [
              SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white38)),
              SizedBox(width: 12),
              Text('Esperando que se unan más amigas...', style: TextStyle(color: Colors.white54, fontSize: 13)),
            ]),
          ),
          const SizedBox(height: 32),

          // Botón iniciar (host)
          if (widget.esHost)
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: _iniciarPartida,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                elevation: 8, shadowColor: const Color(0xFF2E7D32),
              ),
              child: const Text('🚀 INICIAR PARTIDA', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w900)),
            ))
          else
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(14)),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.neonMorado)),
                SizedBox(width: 14),
                Text('Esperando que la anfitriona inicie...', style: TextStyle(color: Colors.white70)),
              ]),
            ),
        ]),
      )),
    ]);
  }

  Widget _buildCodigoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF2A0850), Color(0xFF1A0A3C)]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.6), width: 2),
        boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.3), blurRadius: 20)],
      ),
      child: Column(children: [
        const Text('Código de sala — comparte con tus amigas:', style: TextStyle(color: Colors.white70, fontSize: 13)),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(widget.codigo,
            style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: 8)),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: widget.codigo));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('¡Código copiado! 📋'), duration: Duration(seconds: 2)));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: AppColors.neonMorado.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.copy, color: AppColors.neonMorado, size: 20),
            ),
          ),
        ]),
        const SizedBox(height: 6),
        Text('Tu amiga abre Mi Imperio → Multijugador → ingresa este código',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.4), fontSize: 11),
          textAlign: TextAlign.center),
      ]),
    );
  }

  Widget _buildJugadoraCard(String apodo, int avatarIdx, bool esMia) {
    final ava = kAvataresSocial[avatarIdx.clamp(0, kAvataresSocial.length - 1)];
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: esMia ? AppColors.neonMorado.withValues(alpha: 0.2) : AppColors.fondoCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: esMia ? AppColors.neonMorado : Colors.white10),
      ),
      child: Row(children: [
        Text(ava, style: const TextStyle(fontSize: 26)),
        const SizedBox(width: 12),
        Expanded(child: Text(apodo, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700))),
        if (esMia) const Text('← TÚ', style: TextStyle(color: AppColors.neonMorado, fontSize: 11, fontWeight: FontWeight.w800)),
        const SizedBox(width: 6),
        const Icon(Icons.circle, color: Color(0xFF4CAF50), size: 8),
      ]),
    );
  }

  Widget _buildInfoRow(String label, String val) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 13)),
        const Spacer(),
        Text(val, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
      ]),
    );
  }

  // ─────────────────────────────────────────────────────────────
  //  FASE 2: JUGANDO
  // ─────────────────────────────────────────────────────────────
  Widget _buildJuego() {
    final mins = _segundosRestantes ~/ 60;
    final secs = _segundosRestantes % 60;
    final ingSeg = _negocios.fold(0.0, (s, n) => s + n.ingresoActual) * _bonusMult;

    return Stack(children: [
      Column(children: [
        // ── Top bar: timer + mini scores ──────────────────────
        _buildTopBar(mins, secs),
        _buildMiniLeaderboard(),

        // ── Juego principal ───────────────────────────────────
        Expanded(child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: _buildMiScore(ingSeg)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            sliver: SliverList(delegate: SliverChildBuilderDelegate(
              (_, i) => _buildNegocioCard(i),
              childCount: _negocios.length,
            )),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ])),
      ]),

      // ── Popup lección ─────────────────────────────────────
      if (_leccionActual != null) _buildLeccionPopup(),
    ]);
  }

  Widget _buildTopBar(int mins, int secs) {
    final urgente = _segundosRestantes < 30;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: urgente ? const Color(0xFF8B0000) : const Color(0xFF1A0A3C),
        border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
      ),
      child: Row(children: [
        // Timer
        Expanded(child: Row(children: [
          Icon(Icons.timer, color: urgente ? Colors.red[200] : Colors.white54, size: 18),
          const SizedBox(width: 6),
          Text('${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: urgente ? Colors.red[200] : Colors.white,
              fontSize: 22, fontWeight: FontWeight.w900,
            )),
        ])),
        // Bonus badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD700).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('⚡ ${_bonusMult}x', style: const TextStyle(color: Color(0xFFFFD700), fontSize: 12, fontWeight: FontWeight.w800)),
        ),
        const SizedBox(width: 8),
        // Jugadoras count
        Text('👥 ${max(_jugadores.length, 1)}', style: const TextStyle(color: Colors.white54, fontSize: 13)),
      ]),
    );
  }

  Widget _buildMiniLeaderboard() {
    if (_scores.isEmpty) {
      return Container(
        height: 40,
        color: AppColors.fondoCard,
        alignment: Alignment.center,
        child: const Text('Calculando ranking en tiempo real...', style: TextStyle(color: Colors.white30, fontSize: 11)),
      );
    }
    return Container(
      height: 44,
      color: const Color(0xFF100820),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        itemCount: _scores.length,
        itemBuilder: (_, i) {
          final s = _scores[i];
          final ava = kAvataresSocial[((s['avatarIndex'] as int?) ?? 0).clamp(0, kAvataresSocial.length - 1)];
          final total = (s['totalGanado'] as num?)?.toDouble() ?? 0;
          final esMio = (s['uid'] as String?) == _miUid;
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: esMio ? AppColors.neonMorado.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: esMio ? AppColors.neonMorado : Colors.transparent),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(['🥇','🥈','🥉','4️⃣','5️⃣','6️⃣'][i.clamp(0,5)], style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 4),
              Text(ava, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 4),
              Text(_fmt(total), style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildMiScore(double ingSeg) {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 12, 14, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF2A0850), Color(0xFF1A0A3C)]),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.4)),
      ),
      child: Row(children: [
        Text(kAvataresSocial[_miAvatar.clamp(0, kAvataresSocial.length - 1)], style: const TextStyle(fontSize: 32)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(_miApodo, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          Text('\$${_fmt(_dinero)}', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
          Text('+\$${_fmt(ingSeg)}/seg', style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 12)),
        ])),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('Total ganado:', style: TextStyle(color: Colors.white.withValues(alpha: 0.4), fontSize: 10)),
          Text('\$${_fmt(_totalGanado)}', style: const TextStyle(color: Color(0xFFFFD700), fontSize: 14, fontWeight: FontWeight.w800)),
        ]),
      ]),
    );
  }

  Widget _buildNegocioCard(int idx) {
    final n = _negocios[idx];
    final puedeComprar = _dinero >= n.costoSiguiente;
    final desbloqueado = idx == 0 || _negocios[idx - 1].comprado;

    if (!desbloqueado) return const SizedBox.shrink();

    return GestureDetector(
      onTap: puedeComprar ? () => _comprar(idx) : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: puedeComprar ? 1.0 : 0.6,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: n.comprado ? AppColors.fondoCard : AppColors.fondoCard.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: puedeComprar ? const Color(0xFF4CAF50) : Colors.white10,
              width: puedeComprar ? 1.5 : 1,
            ),
          ),
          child: Row(children: [
            // Emoji + nivel
            Stack(children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.07),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(n.emoji, style: const TextStyle(fontSize: 26))),
              ),
              if (n.comprado) Positioned(
                right: 0, bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(color: AppColors.neonMorado, borderRadius: BorderRadius.circular(6)),
                  child: Text('Nv.${n.nivel}', style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
                ),
              ),
            ]),
            const SizedBox(width: 10),
            // Info
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(n.nombre, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
              Text(n.categoria, style: const TextStyle(color: Colors.white38, fontSize: 10)),
              if (n.comprado)
                Text('+\$${_fmt(n.ingresoActual * _bonusMult)}/seg',
                  style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 11, fontWeight: FontWeight.w700)),
            ])),
            // Precio / upgrade
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(n.comprado ? 'SUBIR' : 'COMPRAR',
                style: TextStyle(
                  color: puedeComprar ? const Color(0xFF4CAF50) : Colors.white38,
                  fontSize: 10, fontWeight: FontWeight.w800,
                )),
              Text('\$${_fmt(n.costoSiguiente)}',
                style: TextStyle(
                  color: puedeComprar ? Colors.white : Colors.white38,
                  fontSize: 13, fontWeight: FontWeight.w900,
                )),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildLeccionPopup() {
    final l = _leccionActual!;
    return GestureDetector(
      onTap: () => setState(() => _leccionActual = null),
      child: Container(
        color: Colors.black.withValues(alpha: 0.75),
        child: Center(child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF2A0850), Color(0xFF1A0A3C)]),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.neonMorado, width: 2),
            boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.4), blurRadius: 30)],
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(l.emoji, style: const TextStyle(fontSize: 50)),
            const SizedBox(height: 12),
            Text('¡Negocio comprado!', style: const TextStyle(color: Colors.white70, fontSize: 13)),
            Text(l.nombre, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
            const Divider(color: Colors.white12, height: 24),
            Text(l.leccion, style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.5)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => _leccionActual = null),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonMorado, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text('¡Entendido!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
            ),
          ]),
        )),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  //  FASE 3: RESULTADOS
  // ─────────────────────────────────────────────────────────────
  Widget _buildResultados() {
    // Construir ranking con datos locales + Firestore
    final ranking = List<Map<String, dynamic>>.from(_scores);
    // Si no hay datos Firebase, mostrar solo el jugador actual
    if (ranking.isEmpty) {
      ranking.add({
        'uid': _miUid, 'apodo': _miApodo, 'avatarIndex': _miAvatar,
        'totalGanado': _totalGanado, 'dinero': _dinero,
      });
    }
    ranking.sort((a, b) => ((b['totalGanado'] as num?) ?? 0).compareTo((a['totalGanado'] as num?) ?? 0));
    final esGanadora = ranking.isNotEmpty && ranking[0]['uid'] == _miUid;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const SizedBox(height: 20),
        // Trophy + título
        Text(esGanadora ? '🏆' : '🎮', style: const TextStyle(fontSize: 70)),
        const SizedBox(height: 12),
        Text(esGanadora ? '¡GANASTE!' : '¡Buen juego!',
          style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        Text(esGanadora ? '¡Eres la Empresaria del Imperio! 👑' : 'Sigue practicando — serás imparable',
          style: AppTextStyles.caption, textAlign: TextAlign.center),
        const SizedBox(height: 30),

        // Podio
        if (ranking.length >= 3) _buildPodio(ranking),
        const SizedBox(height: 20),

        // Ranking completo
        const Align(alignment: Alignment.centerLeft,
          child: Text('📊 Ranking final:', style: AppTextStyles.sectionTitle)),
        const SizedBox(height: 12),
        ...List.generate(ranking.length, (i) {
          final r   = ranking[i];
          final ava = kAvataresSocial[((r['avatarIndex'] as int?) ?? 0).clamp(0, kAvataresSocial.length - 1)];
          final total = (r['totalGanado'] as num?)?.toDouble() ?? 0;
          final esMio = r['uid'] == _miUid;
          final posEmoji = ['🥇','🥈','🥉','4️⃣','5️⃣','6️⃣'][i.clamp(0,5)];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: esMio ? AppColors.neonMorado.withValues(alpha: 0.2) : AppColors.fondoCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: esMio ? AppColors.neonMorado : Colors.white10),
            ),
            child: Row(children: [
              Text(posEmoji, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 10),
              Text(ava, style: const TextStyle(fontSize: 26)),
              const SizedBox(width: 10),
              Expanded(child: Text(r['apodo'] as String? ?? 'Anónima',
                style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700))),
              Text('\$${_fmt(total)}', style: const TextStyle(color: Color(0xFFFFD700), fontSize: 16, fontWeight: FontWeight.w900)),
            ]),
          );
        }),
        const SizedBox(height: 24),

        // Mi resultado
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF2A0850), Color(0xFF1A0A3C)]),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.5)),
          ),
          child: Column(children: [
            const Text('Mi resultado en esta partida:', style: TextStyle(color: Colors.white60, fontSize: 12)),
            const SizedBox(height: 8),
            Text('\$${_fmt(_totalGanado)} ganados', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
            Text('${_negocios.where((n) => n.comprado).length} negocios activos', style: AppTextStyles.caption),
            const SizedBox(height: 12),
            Text('Nivel: ${badgeNivel(nivelImperio(_totalGanado))} ${tituloNivel(nivelImperio(_totalGanado))}',
              style: const TextStyle(color: Color(0xFFFFD700), fontSize: 14, fontWeight: FontWeight.w700)),
          ]),
        ),
        const SizedBox(height: 24),

        // Botones
        Row(children: [
          Expanded(child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white38),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: const Text('Salir', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
          )),
        ]),
        const SizedBox(height: 40),
      ]),
    );
  }

  Widget _buildPodio(List<Map<String, dynamic>> ranking) {
    Widget podioItem(int pos, Map<String, dynamic> r, double height) {
      final ava = kAvataresSocial[((r['avatarIndex'] as int?) ?? 0).clamp(0, kAvataresSocial.length - 1)];
      final total = (r['totalGanado'] as num?)?.toDouble() ?? 0;
      final colors = [const Color(0xFFFFD700), Colors.grey[400]!, const Color(0xFFCD7F32)];
      return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(ava, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 4),
        Text(r['apodo'] as String? ?? '?', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
        Text('\$${_fmt(total)}', style: TextStyle(color: colors[pos - 1], fontSize: 11, fontWeight: FontWeight.w900)),
        Container(
          width: 70, height: height,
          decoration: BoxDecoration(
            color: colors[pos - 1].withValues(alpha: 0.3),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            border: Border.all(color: colors[pos - 1].withValues(alpha: 0.6)),
          ),
          alignment: Alignment.center,
          child: Text(['🥇','🥈','🥉'][pos - 1], style: const TextStyle(fontSize: 24)),
        ),
      ]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        podioItem(2, ranking[1], 70),
        const SizedBox(width: 8),
        podioItem(1, ranking[0], 100),
        const SizedBox(width: 8),
        podioItem(3, ranking[2], 50),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  //  CHAT
  // ─────────────────────────────────────────────────────────────
  Widget _buildChatFab() {
    return FloatingActionButton(
      onPressed: _abrirChat,
      backgroundColor: AppColors.fondoCard,
      child: Stack(clipBehavior: Clip.none, children: [
        const Text('💬', style: TextStyle(fontSize: 24)),
        if (_mensajesNoLeidos > 0) Positioned(
          right: -6, top: -6,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Text('$_mensajesNoLeidos', style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
          ),
        ),
      ]),
    );
  }

  Widget _buildChatPanel() {
    return Column(children: [
      // Header
      Container(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
        color: AppColors.fondoCard,
        child: Row(children: [
          IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => setState(() => _chatVisible = false)),
          const Text('💬 Chat de la sala', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
        ]),
      ),
      // Mensajes
      Expanded(child: _mensajes.isEmpty
        ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('💬', style: TextStyle(fontSize: 40)),
            const SizedBox(height: 8),
            Text('Sé la primera en escribir', style: AppTextStyles.caption),
          ]))
        : ListView.builder(
            controller: _chatScroll,
            padding: const EdgeInsets.all(12),
            itemCount: _mensajes.length,
            itemBuilder: (_, i) {
              final m = _mensajes[i];
              final esMio = m['uid'] == _miUid;
              final ava = kAvataresSocial[((m['avatarIndex'] as int?) ?? 0).clamp(0, kAvataresSocial.length - 1)];
              return Align(
                alignment: esMio ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
                  decoration: BoxDecoration(
                    color: esMio ? AppColors.neonMorado.withValues(alpha: 0.3) : AppColors.fondoCard,
                    borderRadius: BorderRadius.circular(18).copyWith(
                      bottomRight: esMio ? const Radius.circular(4) : null,
                      bottomLeft: esMio ? null : const Radius.circular(4),
                    ),
                    border: Border.all(color: esMio ? AppColors.neonMorado.withValues(alpha: 0.4) : Colors.white10),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                    if (!esMio) Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(ava, style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 4),
                      Text(m['apodo'] as String? ?? 'Anónima',
                        style: const TextStyle(color: AppColors.neonMorado, fontSize: 11, fontWeight: FontWeight.w700)),
                    ]),
                    if (!esMio) const SizedBox(height: 4),
                    Text(m['texto'] as String? ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 14)),
                  ]),
                ),
              );
            },
          )),
      // Input
      SafeArea(
        top: false,
        child: Container(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
        color: AppColors.fondoCard,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if (_esLocal || !kFirebaseEnabled)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text('💡 Modo sin conexión — solo tú ves estos mensajes',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.4), fontSize: 11),
                textAlign: TextAlign.center),
            ),
          Row(children: [
            Expanded(child: TextField(
              controller: _chatCtrl,
              style: const TextStyle(color: Colors.white),
              maxLength: 80,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Escribe algo...',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true, fillColor: AppColors.fondoOscuro,
                counterText: '',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              onSubmitted: (_) => _enviarMensaje(),
            )),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _enviarMensaje,
              child: Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: AppColors.neonMorado, shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.4), blurRadius: 8)]),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ),
          ]),
        ]),
      )),
    ]);
  }

  // ─── Helpers ─────────────────────────────────────────────────
  Future<bool> _confirmarSalida() async {
    return await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        title: const Text('¿Salir de la partida?', style: TextStyle(color: Colors.white)),
        content: const Text('Tu progreso se contará en el ranking.', style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Quedarme', style: TextStyle(color: Colors.white70))),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Salir', style: TextStyle(color: Colors.red))),
        ],
      ),
    ) ?? false;
  }

  String _fmt(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(0)}K';
    return v.toStringAsFixed(0);
  }
}
