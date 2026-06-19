// lib/screens/pantalla_educacion.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';
import 'pantalla_leccion.dart';

class PantallaEducacion extends StatefulWidget {
  const PantallaEducacion({super.key});

  @override
  State<PantallaEducacion> createState() => _PantallaEducacionState();
}

class _PantallaEducacionState extends State<PantallaEducacion> {
  bool _showJournal = false;
  final _journalController = TextEditingController();

  @override
  void dispose() {
    _journalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        return Scaffold(
          backgroundColor: AppColors.fondoOscuro,
          body: SafeArea(
            child: _showJournal
                ? _buildJournalView(app)
                : _buildMapView(app),
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  //  LESSON MAP (Duolingo style)
  // ─────────────────────────────────────────────
  Widget _buildMapView(AppProvider app) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildMapHeader(app)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildStreakBanner(app),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildLessonNode(app, index);
              },
              childCount: app.lecciones.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildJournalCard(app),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }

  Widget _buildMapHeader(AppProvider app) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('📚 Academia del Dinero', style: AppTextStyles.heroTitle),
                  Text('Aprende • Gana • Crece', style: AppTextStyles.body),
                ],
              ),
              GlassCard(
                padding: const EdgeInsets.all(12),
                borderColor: AppColors.neonAmarillo.withValues(alpha: 0.5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('💎', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 6),
                    Text(
                      '${app.gemas}',
                      style: const TextStyle(
                        color: AppColors.neonAmarillo,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStreakBanner(AppProvider app) {
    return GlassCard(
      borderColor: AppColors.neonCoral.withValues(alpha: 0.4),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text('🔥', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¡Racha de ${app.racha} días!',
                style: const TextStyle(
                  color: AppColors.neonCoral,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                'Completa una lección hoy para seguir',
                style: AppTextStyles.caption,
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.neonCoral.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${app.vidas}❤️',
              style: const TextStyle(
                color: AppColors.neonCoral,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  LESSON NODE
  // ─────────────────────────────────────────────
  Widget _buildLessonNode(AppProvider app, int index) {
    final leccion = app.lecciones[index];
    final isLeft = index % 2 == 0;
    final isCompleted = leccion.estado == EstadoLeccion.completada;
    final isAvailable = leccion.estado == EstadoLeccion.disponible;
    final isLocked = leccion.estado == EstadoLeccion.bloqueada;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          // Connector line
          if (index > 0) _buildConnector(isLeft, isCompleted),
          // Node + Card
          Row(
            mainAxisAlignment:
                isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              if (!isLeft) const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: GestureDetector(
                  onTap: isLocked
                      ? () => _showLockedMessage()
                      : () => _abrirLeccion(index),
                  child: _buildLessonCard(leccion, isCompleted, isAvailable, isLocked),
                ),
              ),
              if (isLeft) const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConnector(bool isLeft, bool isCompleted) {
    return Padding(
      padding: EdgeInsets.only(
        left: isLeft ? 40 : 0,
        right: isLeft ? 0 : 40,
        bottom: 4,
      ),
      child: Container(
        height: 24,
        width: 3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isCompleted
                ? [AppColors.neonVerde, AppColors.neonAzul]
                : [AppColors.fondoCardClaro, AppColors.fondoCard],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildLessonCard(
      Leccion leccion, bool isCompleted, bool isAvailable, bool isLocked) {
    Color borderColor;
    List<Color> iconGradient;
    Color textColor;

    if (isCompleted) {
      borderColor = AppColors.neonVerde;
      iconGradient = AppColors.gradienteGreen;
      textColor = AppColors.neonVerde;
    } else if (isAvailable) {
      borderColor = AppColors.neonMorado;
      iconGradient = AppColors.gradienteHero;
      textColor = AppColors.textoBlanco;
    } else {
      borderColor = const Color(0xFF2E3150);
      iconGradient = [AppColors.fondoCardClaro, AppColors.fondoCard];
      textColor = AppColors.textoGris;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: isAvailable
            ? [
                BoxShadow(
                  color: AppColors.neonMorado.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Emoji circle
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: iconGradient),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  isLocked ? '🔒' : leccion.emoji,
                  style: const TextStyle(fontSize: 26),
                ),
              ),
            ),
            const SizedBox(width: 14),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _tipoLabel(leccion.tipo),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: borderColor,
                          letterSpacing: 1,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '+${leccion.gemasRecompensa}💎',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.neonAmarillo,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    leccion.titulo,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                  Text(leccion.descripcion, style: AppTextStyles.caption),
                  if (isCompleted)
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        '✅ ¡Completada!',
                        style: TextStyle(
                          color: AppColors.neonVerde,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  if (isAvailable && !isCompleted)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: AppColors.gradienteHero),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'EMPEZAR →',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  GRATITUDE JOURNAL
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
                    Text(
                      '3 cosas buenas de hoy → +8💎',
                      style: AppTextStyles.caption,
                    ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('💬 Entradas recientes:', style: AppTextStyles.caption),
                const SizedBox(height: 8),
                ...app.entradas.take(3).map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        '• ${e.texto}',
                        style: AppTextStyles.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              ],
            ),
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
                const Text(
                  '¿Por qué estás agradecida hoy?',
                  style: AppTextStyles.cardTitle,
                ),
                const SizedBox(height: 6),
                const Text(
                  'Escribe al menos 3 cosas positivas que pasaron hoy o que tienes en tu vida.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _journalController,
                  maxLines: 6,
                  style: const TextStyle(color: AppColors.textoBlanco, height: 1.5),
                  decoration: const InputDecoration(
                    hintText:
                        'Ejemplo:\n1. Logré hacer una venta hoy 🎉\n2. Mi familia está sana\n3. Aprendí algo nuevo...',
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
                if (_journalController.text.trim().isNotEmpty) {
                  app.agregarEntradaGratitud(_journalController.text.trim());
                  _journalController.clear();
                  setState(() => _showJournal = false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Row(
                        children: [
                          Text('🌟 '),
                          Text(
                            '¡Entrada guardada! +8 Gemas',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
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
  //  HELPERS
  // ─────────────────────────────────────────────
  String _tipoLabel(TipoLeccion tipo) {
    switch (tipo) {
      case TipoLeccion.historia:
        return 'LECCIÓN';
      case TipoLeccion.quiz:
        return 'QUIZ';
      case TipoLeccion.reto:
        return 'RETO';
    }
  }

  void _showLockedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('🔒 Completa la lección anterior para desbloquear'),
        backgroundColor: AppColors.fondoCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // FIX: muestra diálogo si no hay vidas antes de entrar
  void _abrirLeccion(int index) {
    final app = Provider.of<AppProvider>(context, listen: false);

    if (!app.puedeJugar) {
      _mostrarSinVidas(app);
      return;
    }

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PantallaLeccion(leccionIndex: index),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            )),
            child: child,
          );
        },
      ),
    );
  }

  void _mostrarSinVidas(AppProvider app) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.fondoCard,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('💔 Sin Vidas',
            style: TextStyle(color: AppColors.textoBlanco)),
        content: Text(
          app.puedeRestaurarVidas
              ? '¡Se acabaron tus vidas! ¿Usas 30💎 para recuperarlas?\nTienes ${app.gemas} gemas.'
              : '¡Se acabaron tus vidas y no tienes suficientes gemas (necesitas 30💎)!\nRegistra ventas en la Tienda para ganar más gemas.',
          style: AppTextStyles.body,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar',
                style: TextStyle(color: AppColors.textoGris)),
          ),
          if (app.puedeRestaurarVidas)
            ElevatedButton(
              onPressed: () {
                app.restaurarVidas();
                Navigator.pop(context);
              },
              child: const Text('Restaurar 30💎'),
            ),
        ],
      ),
    );
  }
}
