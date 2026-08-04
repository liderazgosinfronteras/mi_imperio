// lib/screens/pantalla_social.dart — Hub Multijugador
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/imperio_model.dart';
import '../providers/app_provider.dart';
import '../services/firebase_service.dart';
import '../theme.dart';
import 'pantalla_login.dart';
import 'pantalla_sala_multi.dart';
import 'pantalla_amigas.dart';

class PantallaSocial extends StatefulWidget {
  const PantallaSocial({super.key});
  @override
  State<PantallaSocial> createState() => _PantallaSocialState();
}

class _PantallaSocialState extends State<PantallaSocial>
    with SingleTickerProviderStateMixin {
  late TabController _tab;
  final _codigoCtrl = TextEditingController();
  int _duracion = 10;
  bool _creando = false;
  bool _uniendose = false;
  String? _errorCodigo;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _publicarStats());
  }

  Future<void> _publicarStats() async {
    if (!mounted) return;
    final ok = await FirebaseService.ensureInit();
    if (!ok || !mounted) return;
    final app = context.read<AppProvider>();
    await FirebaseService.publicarEstadisticas(
      nivel:     app.nivelActual,
      cashflow:  app.fondoCashflow,
      lecciones: app.leccionesCompletadas,
      gemas:     app.gemas,
    );
  }

  @override
  void dispose() {
    _tab.dispose();
    _codigoCtrl.dispose();
    super.dispose();
  }

  Future<void> _crearSala() async {
    setState(() => _creando = true);
    final result = await FirebaseService.createRoom(_duracion);
    if (!mounted) return;
    setState(() => _creando = false);
    if (result.containsKey('error')) {
      _showError(result['error'] as String);
      return;
    }
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => PantallaSalaMulti(
        salaId:     result['salaId'] as String,
        codigo:     result['codigo'] as String,
        esHost:     true,
        duracionMin: _duracion,
      ),
    ));
  }

  Future<void> _unirse() async {
    final codigo = _codigoCtrl.text.trim().toUpperCase();
    if (codigo.length != 6) {
      setState(() => _errorCodigo = 'El código tiene 6 caracteres');
      return;
    }
    setState(() { _uniendose = true; _errorCodigo = null; });
    final result = await FirebaseService.joinRoom(codigo);
    if (!mounted) return;
    setState(() => _uniendose = false);
    if (result.containsKey('error')) {
      setState(() => _errorCodigo = result['error'] as String);
      return;
    }
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => PantallaSalaMulti(
        salaId:      result['salaId'] as String,
        codigo:      codigo,
        esHost:      false,
        duracionMin: result['duracionMin'] as int,
      ),
    ));
  }

  void _showError(String msg) {
    showDialog(context: context, builder: (_) => AlertDialog(
      backgroundColor: AppColors.fondoCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Row(children: [
        Text('⚠️ '), Text('Error', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
      ]),
      content: Text(msg, style: const TextStyle(color: Colors.white70, height: 1.5)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Entendido', style: TextStyle(color: AppColors.neonMorado)),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Guard: si no tiene perfil → mostrar login primero
    if (!FirebaseService.tienePerfilCompleto) {
      return PantallaLogin(onDone: () => setState(() {}));
    }
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      appBar: AppBar(
        backgroundColor: AppColors.fondoCard,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('🌐 Multijugador', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        bottom: TabBar(
          controller: _tab,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white38,
          indicatorColor: AppColors.neonMorado,
          tabs: const [Tab(text: '🏆 Ranking'), Tab(text: '🎮 Jugar')],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PantallaAmigas())),
            icon: const Text('👯', style: TextStyle(fontSize: 22)),
            tooltip: 'Mis Amigas',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tab,
        children: [_buildLeaderboard(), _buildJugar()],
      ),
    );
  }

  // ─── LEADERBOARD ──────────────────────────────────────────────
  Widget _buildLeaderboard() {
    return FutureBuilder<bool>(
      future: FirebaseService.ensureInit(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircularProgressIndicator(color: AppColors.neonMorado),
            SizedBox(height: 16),
            Text('Conectando al ranking...', style: AppTextStyles.caption),
          ]));
        }
        final fbOk = snap.data ?? false;
        if (!fbOk) return _buildLeaderboardLocal();

        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseService.leaderboardStream(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: AppColors.neonMorado));
            }
            if (snap.hasError) return _buildLeaderboardLocal();
            final docs = snap.data?.docs ?? [];
            if (docs.isEmpty) {
              return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('🏆', style: TextStyle(fontSize: 60)),
                const SizedBox(height: 16),
                const Text('Sé la primera en el ranking', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Juega Imperio Builder para aparecer aquí', style: AppTextStyles.caption),
              ]));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: docs.length,
              itemBuilder: (_, i) => _buildRankCard(i + 1, docs[i].data(), docs[i].id),
            );
          },
        );
      },
    );
  }

  Widget _buildLeaderboardLocal() {
    return FutureBuilder<double>(
      future: _cargarScoreLocal(),
      builder: (ctx, snap) {
        final score = snap.data ?? 0;
        final nivel = nivelImperio(score);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            const SizedBox(height: 20),
            const Text('🏆', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 12),
            const Text('Tu Imperio', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
            const SizedBox(height: 20),
            if (score > 0) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF4A1080), Color(0xFF2A0850)]),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.neonMorado, width: 2),
                ),
                child: Column(children: [
                  Text(kAvataresSocial[FirebaseService.avatar.clamp(0, kAvataresSocial.length - 1)],
                    style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(FirebaseService.apodo ?? 'Tú',
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 4),
                  Text('${badgeNivel(nivel)} ${tituloNivel(nivel)}',
                    style: const TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  Text(_fmt(score),
                    style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 38, fontWeight: FontWeight.w900)),
                  const Text('acumulados en Imperio Builder', style: AppTextStyles.caption),
                ]),
              ),
              const SizedBox(height: 16),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(16)),
                child: const Text('Juega Imperio Builder para aparecer en el ranking.',
                  style: AppTextStyles.body, textAlign: TextAlign.center),
              ),
              const SizedBox(height: 16),
            ],
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1035),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white12),
              ),
              child: const Row(children: [
                Text('🌐', style: TextStyle(fontSize: 20)),
                SizedBox(width: 10),
                Expanded(child: Text(
                  'El ranking global sincroniza automáticamente cuando el servidor esté disponible.',
                  style: AppTextStyles.caption,
                )),
              ]),
            ),
          ]),
        );
      },
    );
  }

  Future<double> _cargarScoreLocal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('ib_total') ?? 0;
  }

  Widget _buildRankCard(int pos, Map<String, dynamic> d, String uid) {
    final esMio = uid == FirebaseService.uid;
    final avatar = kAvataresSocial[(d['avatarIndex'] as int? ?? 0).clamp(0, kAvataresSocial.length - 1)];
    final apodo  = d['apodo'] as String? ?? 'Anónima';
    final total  = (d['totalImperio'] as num?)?.toDouble() ?? 0;
    final nivel  = d['nivel'] as int? ?? 1;
    final posEmoji = pos == 1 ? '🥇' : pos == 2 ? '🥈' : pos == 3 ? '🥉' : '#$pos';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: esMio
            ? const LinearGradient(colors: [Color(0xFF4A1080), Color(0xFF2A0850)])
            : null,
        color: esMio ? null : AppColors.fondoCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: esMio ? AppColors.neonMorado : Colors.white10,
          width: esMio ? 2 : 1,
        ),
      ),
      child: Row(children: [
        SizedBox(width: 36, child: Text(posEmoji, style: const TextStyle(fontSize: 20))),
        Text(avatar, style: const TextStyle(fontSize: 28)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(apodo, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: AppColors.neonMorado.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)),
              child: Text('${badgeNivel(nivel)} ${tituloNivel(nivel)}',
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
            ),
          ]),
          Text('\$${_fmt(total)} acumulados', style: AppTextStyles.caption),
        ])),
        if (esMio) const Text('← TÚ', style: TextStyle(color: AppColors.neonMorado, fontSize: 11, fontWeight: FontWeight.w800)),
      ]),
    );
  }

  // ─── JUGAR (Crear / Unirse) ────────────────────────────────────
  Widget _buildJugar() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // ── Mi perfil ───────────────────────────────────────
        _buildMiPerfil(),
        const SizedBox(height: 24),


        // ── Crear sala ────────────────────────────────────
        const Text('🎮 Crear partida', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        Text('Tus amigas entran con el código que recibirán', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        _buildDuracionSelector(),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _creando ? null : _crearSala,
            icon: _creando
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('🏙️', style: TextStyle(fontSize: 20)),
            label: const Text('CREAR SALA', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // ── Unirse ────────────────────────────────────────
        const Text('🔑 Unirse a una sala', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        Text('Pídele el código de 6 letras a quien creó la sala', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.fondoCard,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _errorCodigo != null ? Colors.redAccent : AppColors.neonMorado.withValues(alpha: 0.4)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: TextField(
                controller: _codigoCtrl,
                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 4),
                textCapitalization: TextCapitalization.characters,
                maxLength: 6,
                decoration: const InputDecoration(
                  hintText: 'ABC123',
                  hintStyle: TextStyle(color: Colors.white24, letterSpacing: 4, fontSize: 22),
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: _uniendose ? null : _unirse,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neonMorado,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: _uniendose
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('ENTRAR', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white)),
          ),
        ]),
        if (_errorCodigo != null) ...[
          const SizedBox(height: 6),
          Text(_errorCodigo!, style: const TextStyle(color: Colors.redAccent, fontSize: 13)),
        ],
        const SizedBox(height: 40),
      ]),
    );
  }

  Widget _buildMiPerfil() {
    final avatar = kAvataresSocial[FirebaseService.avatar.clamp(0, kAvataresSocial.length - 1)];
    final apodo  = FirebaseService.apodo ?? 'Anónima';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF2A0850), Color(0xFF1A0A3C)]),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.5), width: 1.5),
      ),
      child: Row(children: [
        Text(avatar, style: const TextStyle(fontSize: 40)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(apodo, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
          Text('Tu perfil de competidora', style: AppTextStyles.caption),
        ])),
        TextButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => PantallaLogin(onDone: () { Navigator.pop(context); setState(() {}); }),
          )),
          child: const Text('Cambiar', style: TextStyle(color: AppColors.neonMorado, fontSize: 13)),
        ),
      ]),
    );
  }

  Widget _buildDuracionSelector() {
    final opciones = [5, 10, 15, 30];
    return Row(children: opciones.map((d) {
      final sel = d == _duracion;
      return Expanded(child: GestureDetector(
        onTap: () => setState(() => _duracion = d),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: sel ? AppColors.neonMorado : AppColors.fondoCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: sel ? AppColors.neonMorado : Colors.white12),
          ),
          child: Column(children: [
            Text('$d', style: TextStyle(color: sel ? Colors.white : Colors.white54, fontSize: 20, fontWeight: FontWeight.w900)),
            Text('min', style: TextStyle(color: sel ? Colors.white70 : Colors.white24, fontSize: 11)),
          ]),
        ),
      ));
    }).toList());
  }


  String _fmt(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(0)}K';
    return v.toStringAsFixed(0);
  }
}

