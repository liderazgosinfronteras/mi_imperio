// lib/screens/pantalla_biblioteca.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/libro_model.dart';
import '../theme.dart';
import 'pantalla_libro_detalle.dart';

class PantallaBiblioteca extends StatelessWidget {
  const PantallaBiblioteca({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        final libros = app.libros;
        final categorias = CategoriaLibro.values;

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(app)),
            for (final cat in categorias)
              if (libros.any((l) => l.categoria == cat))
                _buildCategorySection(context, cat, libros, app),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        );
      },
    );
  }

  Widget _buildHeader(AppProvider app) {
    final total = app.libros.length;
    final completados = app.libros.where((l) => l.estado == EstadoLibro.completado).length;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A0A3C), Color(0xFF0D0E1A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📚 Biblioteca', style: AppTextStyles.heroTitle),
          const Text('200 libros · Resúmenes + Preguntas', style: AppTextStyles.body),
          const SizedBox(height: 16),
          GlassCard(
            padding: const EdgeInsets.all(14),
            borderColor: AppColors.neonVerde.withValues(alpha: 0.4),
            child: Row(
              children: [
                const Text('📖', style: TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$completados / $total libros leídos',
                        style: const TextStyle(
                          color: AppColors.textoBlanco,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: total == 0 ? 0 : completados / total,
                          backgroundColor: AppColors.fondoCardClaro,
                          valueColor: const AlwaysStoppedAnimation(AppColors.neonVerde),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '+${completados * 50}💎',
                  style: const TextStyle(
                    color: AppColors.neonAmarillo,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
    BuildContext context,
    CategoriaLibro cat,
    List<Libro> libros,
    AppProvider app,
  ) {
    final librosCategoria = libros.where((l) => l.categoria == cat).toList();
    final completados = librosCategoria.where((l) => l.estado == EstadoLibro.completado).length;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: Row(
              children: [
                Text(cat.icono, style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    cat.nombre,
                    style: AppTextStyles.sectionTitle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.fondoCardClaro,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$completados/${librosCategoria.length}',
                    style: const TextStyle(
                      color: AppColors.textoGris,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: librosCategoria.length,
              itemBuilder: (context, i) =>
                  _LibroCard(libro: librosCategoria[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _LibroCard extends StatelessWidget {
  final Libro libro;
  const _LibroCard({required this.libro});

  @override
  Widget build(BuildContext context) {
    final isCompletado = libro.estado == EstadoLibro.completado;
    final isEnProgreso = libro.estado == EstadoLibro.enProgreso;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => PantallaLibroDetalle(libro: libro)),
      ),
      child: Container(
        width: 145,
        margin: const EdgeInsets.only(right: 12, bottom: 4),
        decoration: BoxDecoration(
          color: AppColors.fondoCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isCompletado
                ? AppColors.neonVerde
                : isEnProgreso
                    ? AppColors.neonMorado
                    : const Color(0xFF252840),
            width: 1.5,
          ),
          boxShadow: isCompletado || isEnProgreso
              ? [
                  BoxShadow(
                    color: (isCompletado ? AppColors.neonVerde : AppColors.neonMorado)
                        .withValues(alpha: 0.25),
                    blurRadius: 12,
                  )
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(libro.emoji, style: const TextStyle(fontSize: 32)),
                  if (isCompletado)
                    const Text('✅', style: TextStyle(fontSize: 16))
                  else if (isEnProgreso)
                    const Text('📖', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                libro.titulo,
                style: TextStyle(
                  color: isCompletado ? AppColors.neonVerde : AppColors.textoBlanco,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                libro.autor,
                style: AppTextStyles.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    libro.anio,
                    style: const TextStyle(
                      color: AppColors.textoGris,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '+${libro.gemasRecompensa}💎',
                    style: const TextStyle(
                      color: AppColors.neonAmarillo,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
