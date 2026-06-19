// lib/screens/pantalla_metas.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';

class PantallaMetas extends StatefulWidget {
  const PantallaMetas({super.key});
  @override
  State<PantallaMetas> createState() => _PantallaMetasState();
}

class _PantallaMetasState extends State<PantallaMetas> {
  final _nombreCtrl = TextEditingController();
  final _montoCtrl = TextEditingController();
  String _emojiSeleccionado = '🎯';
  bool _mostrandoFormulario = false;

  final List<String> _emojisDisponibles = ['🎯','🎮','👟','👜','📱','🎧','🚲','✈️','📚','🎨','🍕','💻','🏖️','🎸','⌚','🎁'];

  @override
  void dispose() { _nombreCtrl.dispose(); _montoCtrl.dispose(); super.dispose(); }

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
                _buildHeader(app),
                const SizedBox(height: 20),
                if (_mostrandoFormulario) _buildFormulario(app),
                if (!_mostrandoFormulario) _buildBotonAgregar(),
                const SizedBox(height: 20),
                if (app.metas.isEmpty && !_mostrandoFormulario) _buildEstadoVacio(),
                ...app.metas.map((meta) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildTarjetaMeta(context, app, meta),
                )),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppProvider app) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('🏆 Mis Metas', style: AppTextStyles.heroTitle),
        Text(
          'Tu Fondo Cashflow: \$${app.fondoCashflow.toStringAsFixed(2)}',
          style: const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildBotonAgregar() {
    return GestureDetector(
      onTap: () => setState(() => _mostrandoFormulario = true),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.4), width: 1.5, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.neonMorado.withValues(alpha: 0.05),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, color: AppColors.neonMorado, size: 22),
            SizedBox(width: 8),
            Text('Agregar nueva meta', style: TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w700, fontSize: 15)),
          ],
        ),
      ),
    );
  }

  Widget _buildFormulario(AppProvider app) {
    return GlassCard(
      borderColor: AppColors.neonMorado.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('✨ Nueva Meta', style: AppTextStyles.cardTitle),
          const SizedBox(height: 16),
          // Selector de emoji
          const Text('Elige un emoji:', style: AppTextStyles.caption),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: _emojisDisponibles.map((e) => GestureDetector(
              onTap: () => setState(() => _emojiSeleccionado = e),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: e == _emojiSeleccionado ? AppColors.neonMorado.withValues(alpha: 0.2) : AppColors.fondoCardClaro,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: e == _emojiSeleccionado ? AppColors.neonMorado : Colors.transparent, width: 2),
                ),
                child: Center(child: Text(e, style: const TextStyle(fontSize: 22))),
              ),
            )).toList(),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nombreCtrl,
            style: const TextStyle(color: AppColors.textoBlanco),
            decoration: const InputDecoration(labelText: 'Nombre de tu meta', hintText: 'Ej: Mis AirPods Pro'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _montoCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w800, fontSize: 20),
            decoration: const InputDecoration(labelText: 'Monto objetivo', prefixIcon: Padding(padding: EdgeInsets.all(14), child: Text('\$', style: TextStyle(color: AppColors.neonVerde, fontSize: 20, fontWeight: FontWeight.w900)))),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => setState(() { _mostrandoFormulario = false; _nombreCtrl.clear(); _montoCtrl.clear(); }),
                  child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeonButton(
                  label: 'Crear Meta',
                  emoji: '🎯',
                  isSmall: true,
                  onPressed: () {
                    final nombre = _nombreCtrl.text.trim();
                    final monto = double.tryParse(_montoCtrl.text.trim());
                    if (nombre.isEmpty || monto == null || monto <= 0) return;
                    app.agregarMeta(nombre, _emojiSeleccionado, monto);
                    setState(() { _mostrandoFormulario = false; _nombreCtrl.clear(); _montoCtrl.clear(); _emojiSeleccionado = '🎯'; });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEstadoVacio() {
    return GlassCard(
      child: Column(
        children: [
          const Text('🎯', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 12),
          const Text('¡Agrega tu primera meta!', style: AppTextStyles.cardTitle, textAlign: TextAlign.center),
          const SizedBox(height: 6),
          const Text('¿Qué quieres comprar o lograr con tu dinero? Ponle un nombre y un precio, y la app te dirá cuándo lo alcanzas.', style: AppTextStyles.body, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildTarjetaMeta(BuildContext context, AppProvider app, MetaFinanciera meta) {
    final pct = meta.porcentaje;
    final alcanzada = meta.alcanzada;

    return Dismissible(
      key: Key(meta.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(color: AppColors.neonRosa.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.delete_outline, color: AppColors.neonRosa),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: AppColors.fondoCard,
            title: const Text('¿Eliminar meta?', style: TextStyle(color: AppColors.textoBlanco)),
            content: Text('Se eliminará "${meta.nombre}". ¿Segura?', style: AppTextStyles.body),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris))),
              ElevatedButton(onPressed: () => Navigator.pop(context, true), style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonRosa), child: const Text('Eliminar')),
            ],
          ),
        ) ?? false;
      },
      onDismissed: (_) => app.eliminarMeta(meta.id),
      child: GlassCard(
        borderColor: alcanzada ? AppColors.neonVerde.withValues(alpha: 0.5) : AppColors.fondoCardClaro,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(meta.emoji, style: const TextStyle(fontSize: 32)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(meta.nombre, style: AppTextStyles.cardTitle),
                      Text('Objetivo: \$${meta.montoObjetivo.toStringAsFixed(2)}', style: AppTextStyles.caption),
                    ],
                  ),
                ),
                if (alcanzada)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: AppColors.neonVerde.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.4))),
                    child: const Text('¡Logrado! 🎉', style: TextStyle(color: AppColors.neonVerde, fontSize: 12, fontWeight: FontWeight.w700)),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$${meta.montoActual.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w900, fontSize: 15)),
                      Text('faltan \$${meta.faltante.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.textoGris, fontSize: 11)),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 12),
            LayoutBuilder(builder: (_, c) => Stack(children: [
              Container(height: 10, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(5))),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800), curve: Curves.easeOutCubic,
                height: 10,
                width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(5.0, c.maxWidth),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: alcanzada ? AppColors.gradienteGreen : AppColors.gradienteHero),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(color: (alcanzada ? AppColors.neonVerde : AppColors.neonMorado).withValues(alpha: 0.4), blurRadius: 6)],
                ),
              ),
            ])),
            const SizedBox(height: 6),
            Text(
              alcanzada ? '¡Tu Fondo Cashflow alcanzó esta meta! 🦋' : '${(pct * 100).toStringAsFixed(0)}% de tu meta — sigue vendiendo',
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: 4),
            const Text('Desliza ← para eliminar', style: TextStyle(color: AppColors.textoGris, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
