// lib/screens/pantalla_historial.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';

class PantallaHistorial extends StatelessWidget {
  const PantallaHistorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        return Scaffold(
          backgroundColor: AppColors.fondoOscuro,
          appBar: AppBar(
            title: const Text('📋 Historial de Ventas'),
            backgroundColor: AppColors.fondoOscuro,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: app.transacciones.isEmpty
              ? const Center(
                  child: Text(
                    'Aún no hay ventas registradas.',
                    style: AppTextStyles.body,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: app.transacciones.length,
                  itemBuilder: (context, i) {
                    final tx = app.transacciones[i];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _buildTarjeta(context, app, tx),
                    );
                  },
                ),
        );
      },
    );
  }

  Widget _buildTarjeta(BuildContext context, AppProvider app, Transaccion tx) {
    return Dismissible(
      key: Key(tx.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.neonRosa.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_outline, color: AppColors.neonRosa),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: AppColors.fondoCard,
            title: const Text('¿Eliminar venta?', style: TextStyle(color: AppColors.textoBlanco)),
            content: Text(
              'Se eliminará esta venta y se revertirán los fondos. ¿Segura?',
              style: AppTextStyles.body,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar', style: TextStyle(color: AppColors.textoGris)),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonRosa),
                child: const Text('Eliminar'),
              ),
            ],
          ),
        ) ??
            false;
      },
      onDismissed: (_) => app.eliminarTransaccion(tx.id),
      child: GlassCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.neonAmarillo.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('💵', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.descripcion.isNotEmpty ? tx.descripcion : 'Venta directa',
                    style: AppTextStyles.cardTitle,
                  ),
                  Text(_formatFecha(tx.fecha), style: AppTextStyles.caption),
                  const SizedBox(height: 4),
                  Text(
                    '🔄 \$${tx.reinversion.toStringAsFixed(2)}  📈 \$${tx.cashflow.toStringAsFixed(2)}  🛍️ \$${tx.estiloVida.toStringAsFixed(2)}',
                    style: const TextStyle(color: AppColors.textoGris, fontSize: 10),
                  ),
                ],
              ),
            ),
            Text(
              '\$${tx.montoTotal.toStringAsFixed(2)}',
              style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }

  String _formatFecha(DateTime fecha) {
    final diff = DateTime.now().difference(fecha);
    if (diff.inMinutes < 1) return 'Ahora mismo';
    if (diff.inHours < 1) return 'Hace ${diff.inMinutes}m';
    if (diff.inDays < 1) return 'Hace ${diff.inHours}h';
    if (diff.inDays == 1) return 'Ayer';
    return '${fecha.day}/${fecha.month}/${fecha.year}';
  }
}
