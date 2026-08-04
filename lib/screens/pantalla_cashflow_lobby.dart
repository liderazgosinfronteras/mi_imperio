// lib/screens/pantalla_cashflow_lobby.dart — Lobby Multijugador Cashflow
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/firebase_service.dart';
import 'pantalla_juego_cashflow.dart';

class PantallaCashflowLobby extends StatefulWidget {
  const PantallaCashflowLobby({super.key});
  @override
  State<PantallaCashflowLobby> createState() => _PantallaCashflowLobbyState();
}

class _PantallaCashflowLobbyState extends State<PantallaCashflowLobby> {
  String _fase      = 'inicio'; // 'inicio' | 'lobby'
  bool   _cargando  = false;
  String _error     = '';
  String _roomId    = '';
  String _codigo    = '';
  bool   _esHost    = false;
  Map<String, Map<String, dynamic>> _jugadoras = {};

  final _apodoCtrl  = TextEditingController();
  final _codigoCtrl = TextEditingController();
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _roomSub;

  @override
  void initState() {
    super.initState();
    _apodoCtrl.text = FirebaseService.apodo ?? '';
  }

  @override
  void dispose() {
    _roomSub?.cancel();
    _apodoCtrl.dispose();
    _codigoCtrl.dispose();
    super.dispose();
  }

  // ─── Crear sala ──────────────────────────────────────────────
  Future<void> _crearSala() async {
    final apodo = _apodoCtrl.text.trim();
    if (apodo.isEmpty) { setState(() => _error = 'Ingresa tu nombre'); return; }
    setState(() { _cargando = true; _error = ''; });
    try {
      await FirebaseService.signInAnonymously(apodo, FirebaseService.avatar);
      final res = await FirebaseService.createCashflowRoom();
      if (!mounted) return;
      if (res.containsKey('error')) {
        setState(() { _cargando = false; _error = res['error'] as String; });
        return;
      }
      _roomId = res['roomId'] as String;
      _codigo = res['codigo'] as String;
      _esHost = true;
      _escucharSala();
      setState(() { _fase = 'lobby'; _cargando = false; });
    } catch (e) {
      if (!mounted) return;
      setState(() { _cargando = false; _error = 'Error inesperado: $e'; });
    }
  }

  // ─── Unirse a sala ───────────────────────────────────────────
  Future<void> _unirSala() async {
    final apodo = _apodoCtrl.text.trim();
    final cod   = _codigoCtrl.text.trim().toUpperCase();
    if (apodo.isEmpty) { setState(() => _error = 'Ingresa tu nombre'); return; }
    if (cod.length < 6) { setState(() => _error = 'El código debe tener 6 caracteres'); return; }
    setState(() { _cargando = true; _error = ''; });
    await FirebaseService.signInAnonymously(apodo, FirebaseService.avatar);
    final res = await FirebaseService.joinCashflowRoom(cod);
    if (!mounted) return;
    if (res.containsKey('error')) {
      setState(() { _cargando = false; _error = res['error'] as String; });
      return;
    }
    _roomId = res['roomId'] as String;
    _codigo = cod;
    _esHost = false;
    _escucharSala();
    setState(() { _fase = 'lobby'; _cargando = false; });
  }

  // ─── Escuchar sala Firestore ──────────────────────────────────
  void _escucharSala() {
    final stream = FirebaseService.cashflowRoomStream(_roomId);
    if (stream == null) {
      setState(() => _error = 'No se pudo conectar a Firebase.');
      return;
    }
    _roomSub = stream.listen(
      (snap) {
        if (!snap.exists || !mounted) return;
        final data = snap.data()!;
        final jugadoras = (data['jugadores'] as Map<String, dynamic>?)
            ?.map((k, v) => MapEntry(k, v as Map<String, dynamic>)) ?? {};
        setState(() => _jugadoras = jugadoras);
        if (data['estado'] == 'jugando') _lanzarJuego();
      },
      onError: (e) {
        if (!mounted) return;
        final msg = e.toString();
        if (msg.contains('PERMISSION_DENIED') || msg.contains('permission-denied')) {
          setState(() => _error = 'Sin permisos de lectura en Firebase. Ejecuta: firebase deploy --only firestore:rules');
        } else {
          setState(() => _error = 'Error en tiempo real: $msg');
        }
      },
    );
  }

  // ─── Iniciar (solo host) ─────────────────────────────────────
  Future<void> _iniciarPartida() async {
    if (!_esHost) return;
    setState(() => _cargando = true);
    await FirebaseService.startCashflowRoom(_roomId);
    if (mounted) setState(() => _cargando = false);
  }

  void _lanzarJuego() {
    _roomSub?.cancel();
    if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) => PantallaJuegoCashflow(roomId: _roomId, esHost: _esHost),
    ));
  }

  // ════════════════════════════════════════════════════════════════
  //  BUILD
  // ════════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061206),
      body: SafeArea(
        child: _fase == 'lobby' ? _buildLobby() : _buildInicio(),
      ),
    );
  }

  // ─── Pantalla inicio: crear o unirse ─────────────────────────
  Widget _buildInicio() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 20),

        // Header visual
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF0A2A0B),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFFFD700), width: 2),
            boxShadow: [BoxShadow(color: const Color(0xFF2E7D32).withValues(alpha: 0.4), blurRadius: 16)],
          ),
          child: const Column(children: [
            Text('🎯', style: TextStyle(fontSize: 52)),
            SizedBox(height: 8),
            Text('CASHFLOW MULTIJUGADOR', style: TextStyle(color: Color(0xFFFFD700), fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1)),
            SizedBox(height: 4),
            Text('Hasta 6 jugadoras · En tiempo real', style: TextStyle(color: Colors.white38, fontSize: 11)),
          ]),
        ),
        const SizedBox(height: 28),

        // Nombre
        _label('Tu nombre en el juego'),
        const SizedBox(height: 8),
        _input(controller: _apodoCtrl, hint: 'Ej: María 🌟'),
        const SizedBox(height: 20),

        // Crear sala
        _boton(
          label: '🏠 Crear Sala Nueva',
          color: const Color(0xFF1B5E20),
          color2: const Color(0xFF4CAF50),
          onTap: _cargando ? null : _crearSala,
        ),
        const SizedBox(height: 20),

        // Separador
        Row(children: [
          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.15))),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text('ó únete a una sala existente', style: TextStyle(color: Colors.white38, fontSize: 11)),
          ),
          Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.15))),
        ]),
        const SizedBox(height: 20),

        // Código
        _label('Código de sala (6 caracteres)'),
        const SizedBox(height: 8),
        _inputCodigo(),
        const SizedBox(height: 12),
        _boton(
          label: '🚪 Unirse a Sala',
          color: const Color(0xFF0A2A0B),
          color2: const Color(0xFF0A2A0B),
          borde: const Color(0xFFFFD700),
          labelColor: const Color(0xFFFFD700),
          onTap: _cargando ? null : _unirSala,
        ),

        // Error
        if (_error.isNotEmpty) ...[
          const SizedBox(height: 16),
          _errorWidget(_error),
        ],

        // Firebase hint
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF0A1F0B),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: const Text(
            '💡 Requiere conexión a internet. Funciona en web, Android e iPhone.',
            style: TextStyle(color: Colors.white38, fontSize: 10, height: 1.5),
          ),
        ),
        const SizedBox(height: 40),
      ]),
    );
  }

  // ─── Lobby: lista de jugadoras ────────────────────────────────
  Widget _buildLobby() {
    final lista = _jugadoras.entries.toList();
    final miUid = FirebaseService.uid ?? '';
    return Column(children: [
      // Header
      Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        decoration: const BoxDecoration(
          color: Color(0xFF0A1F0B),
          border: Border(bottom: BorderSide(color: Color(0xFFFFD700), width: 0.5)),
        ),
        child: Row(children: [
          GestureDetector(
            onTap: () { _roomSub?.cancel(); setState(() { _fase = 'inicio'; _jugadoras = {}; }); },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          const Text('Sala de Cashflow', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
          const Spacer(),
          if (_esHost)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text('HOST', style: TextStyle(color: Color(0xFFFFD700), fontSize: 10, fontWeight: FontWeight.w900)),
            ),
        ]),
      ),

      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            // Código prominente
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF0A2A0B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFFD700), width: 2),
              ),
              child: Column(children: [
                const Text('Código para compartir', style: TextStyle(color: Colors.white54, fontSize: 11)),
                const SizedBox(height: 6),
                Text(_codigo, style: const TextStyle(
                  color: Color(0xFFFFD700), fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: 8,
                )),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: _codigo));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('✅ Código copiado'), duration: Duration(seconds: 1)),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
                    ),
                    child: const Text('📋 Copiar código', style: TextStyle(color: Colors.white60, fontSize: 12, fontWeight: FontWeight.w600)),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20),

            // Lista jugadoras
            Row(children: [
              Text('Jugadoras (${lista.length}/6)', style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w700)),
              const Spacer(),
              const Icon(Icons.circle, color: Color(0xFF4CAF50), size: 8),
              const SizedBox(width: 4),
              const Text('En línea', style: TextStyle(color: Colors.white38, fontSize: 10)),
            ]),
            const SizedBox(height: 10),
            ...lista.map((e) {
              final j     = e.value;
              final apodo = j['apodo'] as String? ?? 'Jugadora';
              final esYo  = e.key == miUid;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A2A0B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: esYo ? const Color(0xFFFFD700) : Colors.white.withValues(alpha: 0.1)),
                ),
                child: Row(children: [
                  const Text('👩', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 12),
                  Expanded(child: Text(apodo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14))),
                  if (esYo) const Text('(tú) ', style: TextStyle(color: Color(0xFFFFD700), fontSize: 11)),
                  const Icon(Icons.circle, color: Color(0xFF4CAF50), size: 9),
                ]),
              );
            }),

            const SizedBox(height: 24),

            // Botón iniciar / esperar
            if (_esHost)
              _boton(
                label: _cargando ? '⏳ Iniciando...' : '🚀 ¡Iniciar Partida! (${lista.length} jugadora${lista.length != 1 ? "s" : ""})',
                color: lista.isNotEmpty ? const Color(0xFF1B5E20) : const Color(0xFF2A2A2A),
                color2: lista.isNotEmpty ? const Color(0xFF4CAF50) : const Color(0xFF3A3A3A),
                onTap: _cargando || lista.isEmpty ? null : _iniciarPartida,
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A2A0B),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFFFD700))),
                  SizedBox(width: 12),
                  Text('Esperando que el host inicie la partida...', style: TextStyle(color: Colors.white54, fontSize: 12)),
                ]),
              ),

            if (_error.isNotEmpty) ...[const SizedBox(height: 12), _errorWidget(_error)],
            const SizedBox(height: 40),
          ]),
        ),
      ),
    ]);
  }

  // ─── Helpers visuales ────────────────────────────────────────
  Widget _label(String text) => Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w600));

  Widget _input({required TextEditingController controller, required String hint}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: const Color(0xFF0A2A0B),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFFD700))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFFD700))),
      ),
    );
  }

  Widget _inputCodigo() {
    return TextField(
      controller: _codigoCtrl,
      textCapitalization: TextCapitalization.characters,
      style: const TextStyle(color: Color(0xFFFFD700), letterSpacing: 6, fontSize: 22, fontWeight: FontWeight.w900),
      maxLength: 6,
      decoration: InputDecoration(
        hintText: 'ABCD12',
        hintStyle: const TextStyle(color: Colors.white24, letterSpacing: 4, fontSize: 18),
        counterText: '',
        filled: true,
        fillColor: const Color(0xFF0A2A0B),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFFD700))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFFD700), width: 2)),
      ),
      onChanged: (_) => setState(() => _error = ''),
    );
  }

  Widget _boton({
    required String label,
    required Color color,
    required Color color2,
    Color borde = const Color(0xFFFFD700),
    Color labelColor = Colors.white,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color, color2]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borde, width: 1.5),
          boxShadow: onTap != null ? [BoxShadow(color: color2.withValues(alpha: 0.35), blurRadius: 10)] : null,
        ),
        child: Center(child: Text(label, style: TextStyle(color: labelColor, fontSize: 15, fontWeight: FontWeight.w900))),
      ),
    );
  }

  Widget _errorWidget(String msg) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red.withValues(alpha: 0.4)),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('⚠️', style: TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Expanded(child: Text(msg, style: const TextStyle(color: Colors.redAccent, fontSize: 12, height: 1.4))),
      ]),
    );
  }
}
