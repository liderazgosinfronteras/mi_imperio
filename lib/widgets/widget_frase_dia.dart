// lib/widgets/widget_frase_dia.dart
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../theme.dart';

// ─── Modelo de datos ─────────────────────────────────────────────────────────

class _FraseDia {
  final String texto;
  final String autora;
  final String emoji;
  final Color colorAccent;
  const _FraseDia(this.texto, this.autora, this.emoji, this.colorAccent);
}

const List<_FraseDia> _kFrases = [
  _FraseDia(
    'Tu libertad financiera no es un sueño, es un destino al que llegas un paso a la vez.',
    'Liderazgo Sin Fronteras', '🌟', AppColors.neonMorado,
  ),
  _FraseDia(
    'El dinero no te da felicidad, pero la libertad que compra, sí.',
    'LSF Finanzas', '💎', AppColors.neonAzul,
  ),
  _FraseDia(
    'No trabajas para el dinero. Haces que el dinero trabaje para ti.',
    'Robert Kiyosaki', '💰', AppColors.neonVerde,
  ),
  _FraseDia(
    'Cada "no" que escuchas te acerca más al "sí" que cambiará tu vida.',
    'LSF', '🔥', AppColors.neonCoral,
  ),
  _FraseDia(
    'Si no encuentras la manera de ganar mientras duermes, trabajarás para siempre.',
    'Warren Buffett', '📈', AppColors.neonAmarillo,
  ),
  _FraseDia(
    'Tu red de contactos es tu patrimonio neto. Construye relaciones, no solo ventas.',
    'Porter Gale', '🤝', AppColors.neonRosa,
  ),
  _FraseDia(
    'El éxito no es el destino; es la persona en que te conviertes durante el viaje.',
    'LSF', '👑', AppColors.neonMorado,
  ),
  _FraseDia(
    'Una mujer con visión no pide permiso para brillar. Simplemente lo hace.',
    'LSF', '✨', AppColors.neonAzul,
  ),
  _FraseDia(
    'La diferencia entre donde estás y donde quieres estar es lo que haces hoy.',
    'LSF', '🚀', AppColors.neonVerde,
  ),
  _FraseDia(
    'No esperes el momento perfecto. Toma el momento y hazlo perfecto.',
    'LSF', '⏰', AppColors.neonCoral,
  ),
  _FraseDia(
    'Tu historia financiera puede cambiar hoy. Tú escribes el siguiente capítulo.',
    'LSF', '📖', AppColors.neonAmarillo,
  ),
  _FraseDia(
    'Las grandes oportunidades llegan disfrazadas de trabajo duro.',
    'Thomas Edison', '💡', AppColors.neonRosa,
  ),
  _FraseDia(
    'No se trata de tener tiempo. Se trata de crear tiempo para lo que de verdad importa.',
    'LSF', '🕐', AppColors.neonMorado,
  ),
  _FraseDia(
    'Una mujer emprendedora no teme al fracaso; lo usa como combustible.',
    'LSF', '⚡', AppColors.neonAzul,
  ),
  _FraseDia(
    'Tu mentalidad es tu activo más valioso. Cuídala y aliméntala cada mañana.',
    'LSF', '🧠', AppColors.neonVerde,
  ),
  _FraseDia(
    'La disciplina es el puente entre tus metas y tus logros.',
    'Jim Rohn', '🌉', AppColors.neonCoral,
  ),
  _FraseDia(
    'Rodéate de mujeres que ya tienen lo que tú quieres lograr.',
    'LSF Comunidad', '👯', AppColors.neonAmarillo,
  ),
  _FraseDia(
    'Cada peso que ahorras hoy es un paso de libertad hacia tu futuro.',
    'LSF', '🐷', AppColors.neonRosa,
  ),
  _FraseDia(
    'El éxito es la suma de pequeños esfuerzos repetidos día tras día.',
    'Robert Collier', '🏆', AppColors.neonMorado,
  ),
  _FraseDia(
    'No te compares con nadie. Tu camino es único; tu ritmo, tuyo.',
    'LSF', '🛤️', AppColors.neonAzul,
  ),
  _FraseDia(
    'La riqueza verdadera es tener tiempo para vivir como tú quieres.',
    'LSF', '🌴', AppColors.neonVerde,
  ),
  _FraseDia(
    'Invierte en ti primero. Tu aprendizaje es el motor de todo lo demás.',
    'LSF', '📚', AppColors.neonCoral,
  ),
  _FraseDia(
    'Haz hoy lo que los demás no quieren hacer. Mañana tendrás lo que ellos no pueden tener.',
    'LSF', '💪', AppColors.neonAmarillo,
  ),
  _FraseDia(
    'Tu negocio crece exactamente en la medida en que tú creces.',
    'LSF', '🌱', AppColors.neonRosa,
  ),
  _FraseDia(
    'Una venta es una semilla. Planta muchas y cosecha tu jardín de libertad.',
    'LSF Ventas', '🌻', AppColors.neonMorado,
  ),
  _FraseDia(
    'La consistencia supera al talento cuando el talento no es consistente.',
    'Tim Notke', '🎯', AppColors.neonAzul,
  ),
  _FraseDia(
    'Tu familia merece la mejor versión de ti: libre, próspera y llena de propósito.',
    'LSF', '❤️', AppColors.neonVerde,
  ),
  _FraseDia(
    'No eres demasiado grande para empezar pequeño. Eres demasiado poderosa para no empezar.',
    'LSF', '🦁', AppColors.neonCoral,
  ),
  _FraseDia(
    'La gratitud abre las puertas que el esfuerzo construye. Ambas son necesarias.',
    'LSF', '🙏', AppColors.neonAmarillo,
  ),
  _FraseDia(
    'Cada mañana tienes una nueva oportunidad de construir el Imperio que mereces.',
    'LSF', '🏰', AppColors.neonRosa,
  ),
];

// ─── Widget principal ─────────────────────────────────────────────────────────

class WidgetFraseDia extends StatefulWidget {
  const WidgetFraseDia({super.key});

  @override
  State<WidgetFraseDia> createState() => _WidgetFraseDiaState();
}

class _WidgetFraseDiaState extends State<WidgetFraseDia>
    with TickerProviderStateMixin {
  late int _index;
  bool _hearted = false;
  bool _showFloatingHeart = false;

  // Brillo pulsante del borde
  late AnimationController _glowCtrl;
  late Animation<double> _glowAnim;

  // Rebote del corazón
  late AnimationController _heartCtrl;
  late Animation<double> _heartScale;

  // Flotado del emoji
  late AnimationController _emojiCtrl;
  late Animation<double> _emojiFloat;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    _index = dayOfYear % _kFrases.length;

    _glowCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1700))
      ..repeat(reverse: true);
    _glowAnim = Tween<double>(begin: 0.25, end: 0.85)
        .animate(CurvedAnimation(parent: _glowCtrl, curve: Curves.easeInOut));

    _heartCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _heartScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.6), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.6, end: 0.85), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.85, end: 1.0), weight: 30),
    ]).animate(_heartCtrl);

    _emojiCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);
    _emojiFloat = Tween<double>(begin: -3.0, end: 3.0)
        .animate(CurvedAnimation(parent: _emojiCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _glowCtrl.dispose();
    _heartCtrl.dispose();
    _emojiCtrl.dispose();
    super.dispose();
  }

  void _siguiente() => setState(() {
        _index = (_index + 1) % _kFrases.length;
        _hearted = false;
      });

  void _anterior() => setState(() {
        _index = (_index - 1 + _kFrases.length) % _kFrases.length;
        _hearted = false;
      });

  void _onHeart() {
    setState(() {
      _hearted = !_hearted;
      if (_hearted) _showFloatingHeart = true;
    });
    _heartCtrl.forward(from: 0);
    if (_hearted) {
      Future.delayed(const Duration(milliseconds: 1100), () {
        if (mounted) setState(() => _showFloatingHeart = false);
      });
    }
  }

  void _compartir() {
    final f = _kFrases[_index];
    Share.share('"${f.texto}"\n— ${f.autora}\n\n✨ Mi Imperio · Liderazgo Sin Fronteras');
  }

  @override
  Widget build(BuildContext context) {
    final frase = _kFrases[_index];
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;

    return GestureDetector(
      onHorizontalDragEnd: (d) {
        if ((d.primaryVelocity ?? 0) < -150) _siguiente();
        if ((d.primaryVelocity ?? 0) > 150) _anterior();
      },
      child: AnimatedBuilder(
        animation: _glowAnim,
        builder: (context, child) => Container(
          decoration: BoxDecoration(
            color: AppColors.fondoCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: frase.colorAccent.withValues(alpha: _glowAnim.value),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: frase.colorAccent.withValues(alpha: _glowAnim.value * 0.22),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: child,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(frase, dayOfYear),
                  const SizedBox(height: 16),
                  _buildCuerpo(frase),
                  const SizedBox(height: 18),
                  _buildAcciones(),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      '← desliza para cambiar →',
                      style: TextStyle(
                          color: AppColors.textoGris,
                          fontSize: 10,
                          letterSpacing: 0.5),
                    ),
                  ),
                ],
              ),
              if (_showFloatingHeart)
                const Positioned(
                  right: 56,
                  bottom: 44,
                  child: _FloatingHeart(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(_FraseDia frase, int dayOfYear) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AnimatedBuilder(
              animation: _emojiFloat,
              builder: (_, __) => Transform.translate(
                offset: Offset(0, _emojiFloat.value),
                child: Text(frase.emoji, style: const TextStyle(fontSize: 22)),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Frase del Día',
              style: TextStyle(
                color: AppColors.textoGris,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        _Pill(label: 'Día $dayOfYear', color: frase.colorAccent),
      ],
    );
  }

  Widget _buildCuerpo(_FraseDia frase) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.07, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
          child: child,
        ),
      ),
      child: Column(
        key: ValueKey(_index),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"${frase.texto}"',
            style: const TextStyle(
              color: AppColors.textoBlanco,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.65,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '— ${frase.autora}',
            style: TextStyle(
              color: frase.colorAccent,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcciones() {
    return Row(
      children: [
        GestureDetector(
          onTap: _onHeart,
          child: AnimatedBuilder(
            animation: _heartScale,
            builder: (_, child) =>
                Transform.scale(scale: _heartScale.value, child: child),
            child: _HeartPill(active: _hearted),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: _compartir,
          child: const _IconBtn(icon: Icons.ios_share_rounded),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: _anterior,
          child: const _IconBtn(icon: Icons.chevron_left),
        ),
        const SizedBox(width: 4),
        Text(
          '${_index + 1}/${_kFrases.length}',
          style: const TextStyle(
              color: AppColors.textoGris,
              fontSize: 11,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: _siguiente,
          child: const _IconBtn(icon: Icons.chevron_right),
        ),
      ],
    );
  }
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

class _Pill extends StatelessWidget {
  final String label;
  final Color color;
  const _Pill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontSize: 11, fontWeight: FontWeight.w800)),
    );
  }
}

class _HeartPill extends StatelessWidget {
  final bool active;
  const _HeartPill({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active
            ? AppColors.neonRosa.withValues(alpha: 0.15)
            : AppColors.fondoCardClaro,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: active
              ? AppColors.neonRosa.withValues(alpha: 0.5)
              : const Color(0xFF252840),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(active ? '❤️' : '🤍', style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            active ? '¡Me inspira!' : 'Me inspira',
            style: TextStyle(
              color: active ? AppColors.neonRosa : AppColors.textoGris,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  const _IconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.fondoCardClaro,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: AppColors.textoGris, size: 18),
    );
  }
}

// ─── Corazones flotantes ─────────────────────────────────────────────────────

class _FloatingHeart extends StatefulWidget {
  const _FloatingHeart();

  @override
  State<_FloatingHeart> createState() => _FloatingHeartState();
}

class _FloatingHeartState extends State<_FloatingHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => Transform.translate(
        offset: Offset(0, -50 * _ctrl.value),
        child: Opacity(
          opacity: (1 - _ctrl.value).clamp(0.0, 1.0),
          child: const Text('❤️❤️', style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
