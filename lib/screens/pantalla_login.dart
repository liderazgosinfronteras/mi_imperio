// lib/screens/pantalla_login.dart — Perfil Social (primera vez)
import 'package:flutter/material.dart';
import '../models/imperio_model.dart';
import '../services/firebase_service.dart';
import '../theme.dart';

class PantallaLogin extends StatefulWidget {
  final VoidCallback onDone;
  const PantallaLogin({super.key, required this.onDone});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin>
    with SingleTickerProviderStateMixin {
  final _ctrl    = TextEditingController();
  int  _avatar   = 0;
  bool _cargando = false;
  String? _error;
  late AnimationController _pulseCtrl;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  Future<void> _confirmar() async {
    final apodo = _ctrl.text.trim();
    if (apodo.length < 2) {
      setState(() => _error = 'Mínimo 2 letras en tu apodo');
      return;
    }
    setState(() { _cargando = true; _error = null; });
    await FirebaseService.signInAnonymously(apodo, _avatar);
    if (mounted) widget.onDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              // ── Hero ──────────────────────────────────────────
              AnimatedBuilder(
                animation: _pulseCtrl,
                builder: (_, __) => Transform.scale(
                  scale: 1.0 + _pulseCtrl.value * 0.05,
                  child: const Text('🏙️', style: TextStyle(fontSize: 80)),
                ),
              ),
              const SizedBox(height: 16),
              const Text('¡Bienvenida al Imperio!', style: AppTextStyles.heroTitle, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(
                'Elige tu avatar y apodo.\nCompite con tus amigas del colegio.',
                style: AppTextStyles.caption,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // ── Grid avatares ─────────────────────────────────
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Elige tu personaje:', style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, crossAxisSpacing: 10, mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: kAvataresSocial.length,
                itemBuilder: (_, i) {
                  final sel = i == _avatar;
                  return GestureDetector(
                    onTap: () => setState(() => _avatar = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: sel ? AppColors.neonMorado.withValues(alpha: 0.25) : AppColors.fondoCard,
                        border: Border.all(
                          color: sel ? AppColors.neonMorado : Colors.white12,
                          width: sel ? 2.5 : 1,
                        ),
                        boxShadow: sel ? [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.4), blurRadius: 12)] : [],
                      ),
                      child: Center(child: Text(kAvataresSocial[i], style: const TextStyle(fontSize: 28))),
                    ),
                  );
                },
              ),
              const SizedBox(height: 28),

              // ── Apodo ─────────────────────────────────────────
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Tu apodo de guerrera:', style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.5)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    Text(kAvataresSocial[_avatar], style: const TextStyle(fontSize: 26)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _ctrl,
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                        maxLength: 12,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: 'Tu nombre aquí...',
                          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3)),
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        onSubmitted: (_) => _confirmar(),
                      ),
                    ),
                  ],
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 16),
                  const SizedBox(width: 6),
                  Text(_error!, style: const TextStyle(color: Colors.redAccent, fontSize: 13)),
                ]),
              ],
              const SizedBox(height: 36),

              // ── Botón ─────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _cargando ? null : _confirmar,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: AppColors.neonMorado,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    elevation: 8,
                    shadowColor: AppColors.neonMorado.withValues(alpha: 0.5),
                  ),
                  child: _cargando
                      ? const SizedBox(width: 24, height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                      : const Text('¡EMPEZAR A COMPETIR! 🚀',
                          style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
                ),
              ),
              const SizedBox(height: 16),
              Text('Tus datos se guardan en tu celular.\nNo necesitas email ni contraseña.',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.35), fontSize: 12),
                textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
