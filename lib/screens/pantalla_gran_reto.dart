// lib/screens/pantalla_gran_reto.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';
import 'pantalla_reto_nivel.dart';

// Gradientes únicos por módulo
const List<List<Color>> _kGradientes = [
  [Color(0xFF4A00E0), Color(0xFF7B2FF7)], // 0 Primeros Pasos
  [Color(0xFF0072FF), Color(0xFF00C6FF)], // 1 Mentalidad
  [Color(0xFF11998E), Color(0xFF38EF7D)], // 2 Desarrollo Personal
  [Color(0xFFFF6B35), Color(0xFFF7C59F)], // 3 Emprendimiento
  [Color(0xFF667EEA), Color(0xFF764BA2)], // 4 Hábitos
  [Color(0xFFFC466B), Color(0xFF3F5EFB)], // 5 Autoestima
  [Color(0xFFF953C6), Color(0xFFB91D73)], // 6 Empoderamiento
  [Color(0xFFF7971E), Color(0xFFFFD200)], // 7 Liderazgo
  [Color(0xFF56CCF2), Color(0xFF2F80ED)], // 8 Redes
  [Color(0xFF6B0AC9), Color(0xFFE040FB)], // 9 Maestría
];

class PantallaGranReto extends StatefulWidget {
  const PantallaGranReto({super.key});

  @override
  State<PantallaGranReto> createState() => _PantallaGranRetoState();
}

class _PantallaGranRetoState extends State<PantallaGranReto> {
  bool _showJournal = false;
  final _journalCtrl = TextEditingController();

  @override
  void dispose() {
    _journalCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        if (_showJournal) return _buildJournalView(app);
        return _buildRetoMap(app);
      },
    );
  }

  // ─────────────────────────────────────────────
  //  MAPA PRINCIPAL
  // ─────────────────────────────────────────────
  Widget _buildRetoMap(AppProvider app) {
    final modulos = app.retoModulos;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildHeader(app, modulos)),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, i) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _ModuloCard(
                  modulo: modulos[i],
                  index: i,
                  progreso: app.progresoModulo(i),
                  desbloqueado: app.moduloRetoDesbloqueado(i),
                  gradiente: _kGradientes[i],
                  onTap: () => _abrirModulo(app, i),
                ),
              ),
              childCount: modulos.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: _buildJournalCard(app),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  HEADER
  // ─────────────────────────────────────────────
  Widget _buildHeader(AppProvider app, List<RetoModulo> modulos) {
    final totalPreguntas = modulos.fold<int>(0, (s, m) => s + m.preguntas.length);
    final totalRespondidas = app.totalNivelesRetoCompletados;
    final pct = totalPreguntas == 0 ? 0.0 : (totalRespondidas / totalPreguntas).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
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
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🌍 El Gran Reto', style: AppTextStyles.heroTitle),
                    Text('Explora el mundo con tu conocimiento',
                        style: AppTextStyles.body),
                  ],
                ),
              ),
              GlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                borderColor: AppColors.neonAmarillo.withValues(alpha: 0.5),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Text('💎', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 6),
                  Text('${app.gemas}',
                      style: const TextStyle(
                          color: AppColors.neonAmarillo,
                          fontSize: 18,
                          fontWeight: FontWeight.w900)),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$totalRespondidas / $totalPreguntas preguntas',
                style: const TextStyle(
                    color: AppColors.textoGris,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '${(pct * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                    color: _pctColor(pct),
                    fontSize: 12,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 8,
              backgroundColor: AppColors.fondoCardClaro,
              valueColor: AlwaysStoppedAnimation<Color>(_pctColor(pct)),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('🔥', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 4),
              Text('Racha ${app.racha} días',
                  style: const TextStyle(
                      color: AppColors.neonCoral,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          if (app.granRetoCompleto) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF6B0AC9), Color(0xFFFFB300)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.6)),
                boxShadow: [BoxShadow(color: const Color(0xFFFFD700).withValues(alpha: 0.3), blurRadius: 16)],
              ),
              child: Row(children: [
                const Text('🏆', style: TextStyle(fontSize: 38)),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('¡CAMPEONA MUNDIAL!',
                        style: TextStyle(color: Color(0xFFFFD700), fontSize: 15, fontWeight: FontWeight.w900)),
                    SizedBox(height: 4),
                    Text('Completaste los 10 módulos de El Gran Reto.\n¡Eres una maestra de las finanzas! 🦋',
                        style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
                  ]),
                ),
              ]),
            ),
          ],
        ],
      ),
    );
  }

  Color _pctColor(double pct) {
    if (pct < 0.3) return AppColors.neonCoral;
    if (pct < 0.7) return AppColors.neonAmarillo;
    return AppColors.neonVerde;
  }

  // ─────────────────────────────────────────────
  //  JOURNAL CARD
  // ─────────────────────────────────────────────
  Widget _buildJournalCard(AppProvider app) {
    return GlassCard(
      borderColor: AppColors.neonRosa.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('✨', style: TextStyle(fontSize: 28)),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Diario de Gratitud', style: AppTextStyles.cardTitle),
                    Text('3 cosas buenas de hoy → +8💎',
                        style: AppTextStyles.caption),
                  ],
                ),
              ),
              if (app.diarioHoyCompletado)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.neonVerde.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('✅', style: TextStyle(fontSize: 18)),
                ),
            ],
          ),
          const SizedBox(height: 14),
          if (!app.diarioHoyCompletado)
            NeonButton(
              label: 'Escribir Gratitud',
              emoji: '📝',
              onPressed: () => setState(() => _showJournal = true),
              gradientColors: [AppColors.neonRosa, const Color(0xFFFF4466)],
            )
          else
            ...app.entradas.take(2).map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('• ${e.texto}',
                      style: AppTextStyles.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                )),
        ],
      ),
    );
  }

  Widget _buildJournalView(AppProvider app) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _showJournal = false),
                child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco),
              ),
              const SizedBox(width: 10),
              const Text('✨ Diario de Gratitud', style: AppTextStyles.sectionTitle),
            ],
          ),
          const SizedBox(height: 24),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('¿Por qué estás agradecida hoy?',
                    style: AppTextStyles.cardTitle),
                const SizedBox(height: 6),
                const Text(
                  'Escribe al menos 3 cosas positivas de hoy.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _journalCtrl,
                  maxLines: 6,
                  style: const TextStyle(color: AppColors.textoBlanco, height: 1.5),
                  decoration: const InputDecoration(
                    hintText:
                        '1. Logré algo importante hoy...\n2. Estoy agradecida por...\n3. Aprendí que...',
                    hintStyle: TextStyle(color: AppColors.textoGris),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: NeonButton(
              label: 'Guardar Entrada (+8💎)',
              emoji: '🌟',
              onPressed: () {
                if (_journalCtrl.text.trim().isNotEmpty) {
                  app.agregarEntradaGratitud(_journalCtrl.text.trim());
                  _journalCtrl.clear();
                  setState(() => _showJournal = false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('🌟 ¡Entrada guardada! +8 Gemas',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      backgroundColor: AppColors.fondoCard,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  NAVEGACIÓN
  // ─────────────────────────────────────────────
  void _abrirModulo(AppProvider app, int idx) {
    final modulo = app.retoModulos[idx];
    if (!app.moduloRetoDesbloqueado(idx)) {
      final nombrePrev = app.retoModulos[idx - 1].nombre;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('🔒 Completa "$nombrePrev" primero'),
          backgroundColor: AppColors.fondoCard,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (modulo.preguntas.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('📚 ${modulo.nombre} necesita más libros para activarse'),
          backgroundColor: AppColors.fondoCard,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (app.progresoModulo(idx) >= modulo.preguntas.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ ¡${modulo.pais} ya desbloqueado! Próximamente podrás repetirlo.'),
          backgroundColor: AppColors.fondoCard,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (ctx, anim, _) => PantallaRetoNivel(moduloId: idx),
      transitionsBuilder: (ctx, anim, _, child) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
        child: child,
      ),
    ));
  }
}

// ─────────────────────────────────────────────
//  MÓDULO CARD
// ─────────────────────────────────────────────
class _ModuloCard extends StatelessWidget {
  final RetoModulo modulo;
  final int index;
  final int progreso;
  final bool desbloqueado;
  final List<Color> gradiente;
  final VoidCallback onTap;

  const _ModuloCard({
    required this.modulo,
    required this.index,
    required this.progreso,
    required this.desbloqueado,
    required this.gradiente,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final total = modulo.preguntas.length;
    final completado = total > 0 && progreso >= total;
    final pct = total == 0 ? 0.0 : (progreso / total).clamp(0.0, 1.0);
    final enCurso = progreso > 0 && !completado;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: desbloqueado ? 1.0 : 0.45,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: completado
                ? const LinearGradient(
                    colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : LinearGradient(
                    colors: gradiente,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            boxShadow: desbloqueado && !completado
                ? [
                    BoxShadow(
                      color: gradiente[0].withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: number + module name + lock/check
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${(index + 1).toString().padLeft(2, '0')}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(modulo.emoji, style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        modulo.nombre,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    if (!desbloqueado)
                      const Text('🔒', style: TextStyle(fontSize: 20))
                    else if (completado)
                      const Text('✅', style: TextStyle(fontSize: 20)),
                  ],
                ),
                const SizedBox(height: 8),
                // Difficulty + destination
                Row(
                  children: [
                    Text(
                      modulo.dificultad,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(modulo.bandera, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 4),
                    Text(
                      modulo.pais,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                if (completado) ...[
                  const SizedBox(height: 12),
                  Center(
                    child: Text(modulo.paisEmoji,
                        style: const TextStyle(fontSize: 32)),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      '¡${modulo.pais} desbloqueado!',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Center(
                    child: Text(
                      modulo.paisDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                          fontSize: 11),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 12),
                  // Progress dots (10 milestones)
                  _buildMilestoneDots(pct),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$progreso / $total preguntas',
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      if (desbloqueado)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.4)),
                          ),
                          child: Text(
                            enCurso ? 'CONTINUAR →' : 'COMENZAR →',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMilestoneDots(double pct) {
    return Row(
      children: List.generate(10, (i) {
        final filled = pct >= (i + 1) / 10;
        final current = !filled && pct >= i / 10 && pct > 0;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 6,
              decoration: BoxDecoration(
                color: filled
                    ? Colors.white
                    : current
                        ? Colors.white.withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        );
      }),
    );
  }
}
