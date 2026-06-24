// lib/screens/pantalla_amigas.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/imperio_model.dart';
import '../services/firebase_service.dart';
import '../theme.dart';
import 'pantalla_login.dart';

class PantallaAmigas extends StatefulWidget {
  const PantallaAmigas({super.key});
  @override
  State<PantallaAmigas> createState() => _PantallaAmigasState();
}

class _PantallaAmigasState extends State<PantallaAmigas> {
  final _codigoCtrl = TextEditingController();
  String? _miCodigo;
  bool _cargandoCodigo = false;
  bool _agregando = false;
  String? _errorCodigo;

  @override
  void initState() {
    super.initState();
    _cargarMiCodigo();
  }

  @override
  void dispose() {
    _codigoCtrl.dispose();
    super.dispose();
  }

  Future<void> _cargarMiCodigo() async {
    setState(() => _cargandoCodigo = true);
    final codigo = await FirebaseService.obtenerCodigoAmiga();
    if (mounted) setState(() { _miCodigo = codigo; _cargandoCodigo = false; });
  }

  Future<void> _agregarAmiga() async {
    final codigo = _codigoCtrl.text.trim().toUpperCase();
    if (codigo.length != 6) {
      setState(() => _errorCodigo = 'El código tiene 6 caracteres');
      return;
    }
    setState(() { _agregando = true; _errorCodigo = null; });
    final result = await FirebaseService.agregarAmiga(codigo);
    if (!mounted) return;
    setState(() => _agregando = false);
    if (result.containsKey('error')) {
      setState(() => _errorCodigo = result['error'] as String);
    } else {
      _codigoCtrl.clear();
      final apodo = result['apodo'] as String;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('¡$apodo agregada como amiga! 🎉'),
        backgroundColor: AppColors.neonVerde,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!FirebaseService.tienePerfilCompleto) {
      return Scaffold(
        backgroundColor: AppColors.fondoOscuro,
        body: SafeArea(child: PantallaLogin(onDone: () => setState(() {}))),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      appBar: AppBar(
        backgroundColor: AppColors.fondoCard,
        elevation: 0,
        title: const Text('👯 Sistema de Amigas',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildMiCodigo(),
          const SizedBox(height: 24),
          _buildAgregarAmiga(),
          const SizedBox(height: 24),
          _buildListaAmigas(),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }

  // ─── Mi código ───────────────────────────────────────────────────
  Widget _buildMiCodigo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2A0850), Color(0xFF1A0A3C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.4), width: 1.5),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('🔑 Tu código de amiga', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 4),
        Text('Comparte este código para que te agreguen', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        if (_cargandoCodigo)
          const Center(child: CircularProgressIndicator(color: AppColors.neonMorado))
        else if (_miCodigo != null) ...[
          Row(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  _miCodigo!,
                  style: const TextStyle(
                    color: AppColors.neonMorado,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _miCodigo!));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('¡Código copiado!'),
                  backgroundColor: AppColors.neonVerde,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.neonMorado,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Icon(Icons.copy, color: Colors.white, size: 22),
            ),
          ]),
          const SizedBox(height: 10),
          Text(
            'Tus amigas deben ingresar este código en la sección "Agregar amiga"',
            style: AppTextStyles.caption,
            textAlign: TextAlign.center,
          ),
        ] else
          Text('No se pudo obtener tu código. ¿Tienes perfil creado?', style: AppTextStyles.caption),
      ]),
    );
  }

  // ─── Agregar amiga ───────────────────────────────────────────────
  Widget _buildAgregarAmiga() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('➕ Agregar amiga', style: AppTextStyles.sectionTitle),
      const SizedBox(height: 4),
      Text('Ingresa el código de tu amiga para conectar', style: AppTextStyles.caption),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.fondoCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _errorCodigo != null ? Colors.redAccent : AppColors.neonMorado.withValues(alpha: 0.4),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: TextField(
              controller: _codigoCtrl,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 4),
              textCapitalization: TextCapitalization.characters,
              maxLength: 6,
              onChanged: (_) => setState(() => _errorCodigo = null),
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
          onPressed: _agregando ? null : _agregarAmiga,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.neonVerde,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          child: _agregando
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
              : const Text('AGREGAR', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 12)),
        ),
      ]),
      if (_errorCodigo != null) ...[
        const SizedBox(height: 6),
        Text(_errorCodigo!, style: const TextStyle(color: Colors.redAccent, fontSize: 13)),
      ],
    ]);
  }

  // ─── Lista de amigas ─────────────────────────────────────────────
  Widget _buildListaAmigas() {
    if (!kFirebaseEnabled) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.fondoCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(children: [
          const Text('👯 Mis amigas', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 16),
          Text('Activa Firebase para usar el sistema de amigas', style: AppTextStyles.caption, textAlign: TextAlign.center),
        ]),
      );
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('👯 Mis amigas', style: AppTextStyles.sectionTitle),
      const SizedBox(height: 12),
      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseService.amigasStream(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(color: AppColors.neonMorado),
            ));
          }
          final docs = snap.data?.docs ?? [];
          if (docs.isEmpty) {
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.fondoCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white10),
              ),
              child: Center(child: Column(children: [
                const Text('👋', style: TextStyle(fontSize: 40)),
                const SizedBox(height: 12),
                const Text('Aún no tienes amigas',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text('Comparte tu código y agrega el de ellas', style: AppTextStyles.caption),
              ])),
            );
          }
          return Column(
            children: docs.map((doc) => _buildAmigaCard(doc.id)).toList(),
          );
        },
      ),
    ]);
  }

  Widget _buildAmigaCard(String amigoUid) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: FirebaseService.obtenerPerfilAmiga(amigoUid),
      builder: (context, snap) {
        if (!snap.hasData) {
          return const SizedBox(
            height: 70,
            child: Center(child: CircularProgressIndicator(color: AppColors.neonMorado, strokeWidth: 2)),
          );
        }
        final d = snap.data ?? {};
        final apodo = d['apodo'] as String? ?? 'Amiga';
        final avatarIdx = (d['avatarIndex'] as int? ?? 0).clamp(0, kAvataresSocial.length - 1);
        final avatar = kAvataresSocial[avatarIdx];
        final nivel = d['nivel'] as int? ?? 1;
        final cashflow = (d['cashflow'] as num?)?.toDouble() ?? 0;
        final lecciones = d['lecciones'] as int? ?? 0;
        final gemas = d['gemas'] as int? ?? 0;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.fondoCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.2)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(avatar, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(apodo, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.neonMorado.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${badgeNivel(nivel)} ${tituloNivel(nivel)}',
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ),
              ])),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              _buildStatChip('📚', '$lecciones\nlecciones', AppColors.neonAzul),
              const SizedBox(width: 8),
              _buildStatChip('💎', '$gemas\ngemas', AppColors.neonAmarillo),
              const SizedBox(width: 8),
              _buildStatChip('💰', '\$${_fmt(cashflow)}\ncashflow', AppColors.neonVerde),
            ]),
          ]),
        );
      },
    );
  }

  Widget _buildStatChip(String emoji, String valor, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 2),
          Text(
            valor,
            style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }

  String _fmt(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(0)}K';
    return v.toStringAsFixed(0);
  }
}
