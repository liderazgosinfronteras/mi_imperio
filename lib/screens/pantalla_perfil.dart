// lib/screens/pantalla_perfil.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';

class PantallaPerfil extends StatefulWidget {
  const PantallaPerfil({super.key});
  @override
  State<PantallaPerfil> createState() => _PantallaPerfilState();
}

class _PantallaPerfilState extends State<PantallaPerfil> {
  int _tapCount = 0;
  bool _panelPadresVisible = false;

  void _onAvatarTap() {
    _tapCount++;
    if (_tapCount >= 7) {
      _tapCount = 0;
      _pedirPin();
    }
  }

  Future<void> _pedirPin() async {
    final app = Provider.of<AppProvider>(context, listen: false);
    final pinController = TextEditingController();
    final correcto = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('🔒 Panel de Padres', style: TextStyle(color: AppColors.textoBlanco)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ingresa el PIN de padres (default: 0000)', style: AppTextStyles.body),
            const SizedBox(height: 14),
            TextField(
              controller: pinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: const TextStyle(color: AppColors.textoBlanco, fontSize: 24, letterSpacing: 8),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(counterText: '', hintText: '••••'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, app.verificarPin(pinController.text)),
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
    pinController.dispose();
    if (!mounted) return;
    if (correcto == true) {
      HapticFeedback.heavyImpact();
      setState(() => _panelPadresVisible = !_panelPadresVisible);
    } else if (correcto == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('❌ PIN incorrecto'),
          backgroundColor: AppColors.neonRosa.withValues(alpha: 0.8),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) => Scaffold(
        backgroundColor: AppColors.fondoOscuro,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPerfilHeader(app),
                const SizedBox(height: 20),
                _buildXpBar(app),
                const SizedBox(height: 20),
                _buildEstadisticas(app),
                const SizedBox(height: 24),
                _buildGaleriaAvatares(app),
                if (_panelPadresVisible) ...[
                  const SizedBox(height: 24),
                  _buildPanelPadres(context, app),
                ],
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPerfilHeader(AppProvider app) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: _onAvatarTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: AppColors.gradienteHero),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.5), blurRadius: 30, spreadRadius: 5)],
              ),
              child: Center(child: Text(app.avatarActual, style: const TextStyle(fontSize: 58))),
            ),
          ),
          const SizedBox(height: 12),
          Text('Nivel ${app.nivelActual} · Emprendedora',
              style: const TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w800, fontSize: 15)),
          const SizedBox(height: 4),
          const Text('Toca 7 veces el avatar → Panel de Padres 🔒',
              style: TextStyle(color: AppColors.textoGris, fontSize: 11)),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  BARRA DE XP / NIVEL
  // ─────────────────────────────────────────────
  Widget _buildXpBar(AppProvider app) {
    final completadas = app.leccionesCompletadas;
    final total = app.lecciones.length;
    final pct = total == 0 ? 0.0 : completadas / total;

    return GlassCard(
      borderColor: AppColors.neonMorado.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '⭐ Nivel ${app.nivelActual}',
                style: const TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w800, fontSize: 16),
              ),
              Text(
                '$completadas / $total lecciones',
                style: AppTextStyles.caption,
              ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (_, c) => Stack(children: [
              Container(height: 10, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(5))),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                height: 10,
                width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(5.0, c.maxWidth),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppColors.gradienteHero),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.5), blurRadius: 8)],
                ),
              ),
            ]),
          ),
          const SizedBox(height: 8),
          Text(
            pct == 1.0
                ? '🏆 ¡Has completado todas las lecciones!'
                : 'Completa lecciones para subir de nivel',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }

  Widget _buildEstadisticas(AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('📊 Mis Logros', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
          children: [
            _buildStatCard('💰', '\$${app.totalVentas.toStringAsFixed(0)}', 'Vendido'),
            _buildStatCard('📚', '${app.leccionesCompletadas}', 'Lecciones'),
            _buildStatCard('🔥', '${app.racha}', 'Racha días'),
            _buildStatCard('💎', '${app.gemas}', 'Gemas'),
            _buildStatCard('📈', '\$${app.fondoCashflow.toStringAsFixed(0)}', 'Cashflow'),
            _buildStatCard('❤️', '${app.vidas}/5',
                app.tiempoHastaVida.isEmpty ? 'Vidas' : '⏱ ${app.tiempoHastaVida}'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String emoji, String valor, String label) {
    return GlassCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 4),
          Text(valor,
              style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w900, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(label, style: const TextStyle(color: AppColors.textoGris, fontSize: 10), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildGaleriaAvatares(AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('🦋 Mis Avatares', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 6),
        const Text('Gana gemas y completa lecciones para desbloquearlos', style: AppTextStyles.caption),
        const SizedBox(height: 14),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.85,
          children: app.avatares.map((av) => _buildAvatarCard(app, av)).toList(),
        ),
      ],
    );
  }

  Widget _buildAvatarCard(AppProvider app, AvatarItem av) {
    final esActual = app.avatarActual == av.emoji;
    final puedeDesbloquear = app.puedeDesbloquearAvatar(av);

    return GestureDetector(
      onTap: () {
        if (av.desbloqueado) {
          app.seleccionarAvatar(av.emoji);
        } else if (puedeDesbloquear) {
          _confirmarDesbloqueo(app, av);
        } else {
          _mostrarRequisitos(av);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: esActual ? AppColors.neonMorado.withValues(alpha: 0.15) : AppColors.fondoCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: esActual
                ? AppColors.neonMorado
                : av.desbloqueado
                    ? AppColors.fondoCardClaro
                    : const Color(0xFF1E2035),
            width: esActual ? 2 : 1,
          ),
          boxShadow: esActual ? [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.3), blurRadius: 12)] : [],
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(av.emoji,
                    style: TextStyle(fontSize: 30, color: av.desbloqueado ? null : Colors.white.withValues(alpha: 0.3))),
                if (!av.desbloqueado) const Text('🔒', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 4),
            Text(av.nombre,
                style: const TextStyle(color: AppColors.textoBlanco, fontSize: 9, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            if (!av.desbloqueado) ...[
              const SizedBox(height: 2),
              Text(
                av.costoGemas == 0 ? 'Nv.${av.nivelRequerido}' : '${av.costoGemas}💎',
                style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 9),
              ),
            ],
            if (esActual) const Text('✓ Activo', style: TextStyle(color: AppColors.neonMorado, fontSize: 9, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }

  void _confirmarDesbloqueo(AppProvider app, AvatarItem av) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('${av.emoji} ${av.nombre}', style: const TextStyle(color: AppColors.textoBlanco)),
        content: Text('¿Gastar ${av.costoGemas}💎 para desbloquear este avatar?\nTienes ${app.gemas} gemas.',
            style: AppTextStyles.body),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris))),
          ElevatedButton(
            onPressed: () {
              app.desbloquearAvatar(av.id);
              Navigator.pop(context);
            },
            child: Text('Comprar ${av.costoGemas}💎'),
          ),
        ],
      ),
    );
  }

  void _mostrarRequisitos(AvatarItem av) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(av.costoGemas > 0
          ? '🔒 Necesitas nivel ${av.nivelRequerido} y ${av.costoGemas}💎'
          : '🔒 Necesitas completar ${av.nivelRequerido - 1} lecciones para llegar al nivel ${av.nivelRequerido}'),
      backgroundColor: AppColors.fondoCard,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
  }

  // ─────────────────────────────────────────────
  //  PANEL DE PADRES (PIN protegido)
  // ─────────────────────────────────────────────
  Widget _buildPanelPadres(BuildContext context, AppProvider app) {
    final datos = app.exportarDatos();
    return GlassCard(
      borderColor: AppColors.neonAzul.withValues(alpha: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('👨', style: TextStyle(fontSize: 22)),
              SizedBox(width: 8),
              Text('Panel de Padres 🔒', style: AppTextStyles.cardTitle),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Toca 7 veces el avatar para cerrar', style: AppTextStyles.caption),
          const SizedBox(height: 16),
          _buildFilaStat('💰 Total vendido', '\$${app.totalVentas.toStringAsFixed(2)}'),
          _buildFilaStat('📈 Fondo Cashflow', '\$${app.fondoCashflow.toStringAsFixed(2)}'),
          _buildFilaStat('🔄 Fondo Reinversión', '\$${app.fondoReinversion.toStringAsFixed(2)}'),
          _buildFilaStat('🛍️ Estilo de Vida (total)', '\$${app.estiloVida.toStringAsFixed(2)}'),
          _buildFilaStat('🛍️ Gastos esta semana', '\$${app.estiloVidaSemana.toStringAsFixed(2)}'),
          _buildFilaStat('📚 Lecciones completadas', '${app.leccionesCompletadas} / ${app.lecciones.length}'),
          _buildFilaStat('✨ Entradas de diario', '${app.entradas.length}'),
          _buildFilaStat('🔥 Racha actual', '${app.racha} días'),
          _buildFilaStat('💎 Gemas acumuladas', '${app.gemas}'),
          _buildFilaStat('🏆 Nivel actual', '${app.nivelActual}'),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF252840)),
          const SizedBox(height: 12),

          // Cambiar PIN
          const Text('🔑 Cambiar PIN', style: AppTextStyles.cardTitle),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _cambiarPin(context, app),
              icon: const Icon(Icons.lock_outline, size: 16),
              label: const Text('Cambiar PIN de padres'),
              style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.neonAzul, side: const BorderSide(color: AppColors.neonAzul)),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF252840)),
          const SizedBox(height: 12),

          const Text('📋 Exportar datos', style: AppTextStyles.cardTitle),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(10)),
            child: Text(
              const JsonEncoder.withIndent('  ').convert(datos),
              style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: AppColors.textoSubtitulo),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: const JsonEncoder.withIndent('  ').convert(datos)));
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('📋 Datos copiados al portapapeles')));
              },
              icon: const Icon(Icons.copy, size: 16),
              label: const Text('Copiar al portapapeles'),
              style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.neonAzul, side: const BorderSide(color: AppColors.neonAzul)),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _confirmarReset(context, app),
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Resetear todo el progreso'),
              style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.neonRosa, side: const BorderSide(color: AppColors.neonRosa)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilaStat(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.body),
          Text(valor, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700, fontSize: 14)),
        ],
      ),
    );
  }

  Future<void> _cambiarPin(BuildContext context, AppProvider app) async {
    final ctrl1 = TextEditingController();
    final ctrl2 = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        title: const Text('🔑 Nuevo PIN', style: TextStyle(color: AppColors.textoBlanco)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: ctrl1,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'Nuevo PIN (4 dígitos)', counterText: ''),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ctrl2,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'Confirmar PIN', counterText: ''),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris))),
          ElevatedButton(
            onPressed: () {
              if (ctrl1.text.length == 4 && ctrl1.text == ctrl2.text) {
                app.cambiarPin(ctrl1.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('✅ PIN actualizado')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('⚠️ Los PINs no coinciden o son inválidos'),
                    backgroundColor: AppColors.neonRosa.withValues(alpha: 0.8),
                  ),
                );
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
    ctrl1.dispose();
    ctrl2.dispose();
  }

  void _confirmarReset(BuildContext context, AppProvider app) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        title: const Text('⚠️ Resetear progreso', style: TextStyle(color: AppColors.neonRosa)),
        content: const Text(
          'Esto borrará TODO: ventas, lecciones, gemas, racha, todo. El PIN de padres se conservará.\n\n¿Estás completamente seguro?',
          style: TextStyle(color: AppColors.textoSubtitulo),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris))),
          ElevatedButton(
            onPressed: () {
              app.resetearProgreso();
              Navigator.pop(context);
              setState(() => _panelPadresVisible = false);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonRosa),
            child: const Text('Sí, borrar todo'),
          ),
        ],
      ),
    );
  }
}
