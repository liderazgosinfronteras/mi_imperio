// lib/screens/pantalla_estadisticas.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/app_models.dart';
import '../theme.dart';

class PantallaEstadisticas extends StatefulWidget {
  const PantallaEstadisticas({super.key});
  @override
  State<PantallaEstadisticas> createState() => _PantallaEstadisticasState();
}

class _PantallaEstadisticasState extends State<PantallaEstadisticas>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) => Scaffold(
        backgroundColor: AppColors.fondoOscuro,
        appBar: AppBar(
          backgroundColor: AppColors.fondoCard,
          elevation: 0,
          title: const Text('📊 Mis Estadísticas',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: TabBar(
            controller: _tab,
            indicatorColor: AppColors.neonMorado,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white38,
            tabs: const [
              Tab(text: '🎓 Aprendizaje'),
              Tab(text: '💰 Finanzas'),
              Tab(text: '🏆 Logros'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tab,
          children: [
            _buildAprendizaje(app),
            _buildFinanzas(app),
            _buildLogros(app),
          ],
        ),
      ),
    );
  }

  // ─── TAB 1: APRENDIZAJE ──────────────────────────────────────────
  Widget _buildAprendizaje(AppProvider app) {
    final completadas = app.leccionesCompletadas;
    final total = app.lecciones.length;
    final pct = total == 0 ? 0.0 : completadas / total;

    // Agrupar por módulo
    final porModulo = <int, _ModuloStats>{};
    for (final l in app.lecciones) {
      porModulo.putIfAbsent(l.modulo, () => _ModuloStats(l.modulo));
      porModulo[l.modulo]!.total++;
      if (l.estado == EstadoLeccion.completada) porModulo[l.modulo]!.completadas++;
    }
    final modulos = porModulo.values.toList()..sort((a, b) => a.modulo.compareTo(b.modulo));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCard(
          emoji: '📚',
          valor: '$completadas / $total',
          label: 'Lecciones completadas',
          pct: pct,
          color: AppColors.neonMorado,
        ),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _buildStatMini('🔥', '${app.racha}', 'Racha actual', AppColors.neonRosa)),
          const SizedBox(width: 12),
          Expanded(child: _buildStatMini('💎', '${app.gemas}', 'Gemas ganadas', AppColors.neonAmarillo)),
        ]),
        const SizedBox(height: 12),
        _buildStatRow('⭐ Nivel actual', '${app.nivelActual}', AppColors.neonMorado),
        const SizedBox(height: 20),
        const Text('📋 Progreso por módulo', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        ...modulos.map((m) => _buildModuloBar(m)),
        const SizedBox(height: 16),
        const Text('🎯 Tipos de lecciones completadas', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        _buildTipoBreakdown(app),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildModuloBar(_ModuloStats m) {
    final pct = m.total == 0 ? 0.0 : m.completadas / m.total;
    const names = {
      1: 'Módulo 1: Fundamentos',
      2: 'Módulo 2: Crecimiento',
      3: 'Módulo 3: Estrategia',
      4: 'Módulo 4: Avanzado',
    };
    const colors = {
      1: AppColors.neonVerde,
      2: AppColors.neonAzul,
      3: AppColors.neonMorado,
      4: Color(0xFFFF6B35),
    };
    final color = colors[m.modulo] ?? AppColors.neonMorado;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            names[m.modulo] ?? 'Módulo ${m.modulo}',
            style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 13),
          ),
          Text('${m.completadas}/${m.total}', style: AppTextStyles.caption),
        ]),
        const SizedBox(height: 8),
        LayoutBuilder(builder: (_, c) => Stack(children: [
          Container(height: 8, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(4))),
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            height: 8,
            width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(4.0, c.maxWidth),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
          ),
        ])),
      ]),
    );
  }

  Widget _buildTipoBreakdown(AppProvider app) {
    final totalByTipo = <TipoLeccion, int>{};
    final compByTipo = <TipoLeccion, int>{};
    for (final l in app.lecciones) {
      totalByTipo[l.tipo] = (totalByTipo[l.tipo] ?? 0) + 1;
      if (l.estado == EstadoLeccion.completada) {
        compByTipo[l.tipo] = (compByTipo[l.tipo] ?? 0) + 1;
      }
    }
    final tipos = [
      ('📖', 'Historia', TipoLeccion.historia, AppColors.neonAzul),
      ('🧠', 'Quiz', TipoLeccion.quiz, AppColors.neonMorado),
      ('⚡', 'Reto', TipoLeccion.reto, AppColors.neonRosa),
    ];
    return Row(
      children: tipos.map((t) {
        final tot = totalByTipo[t.$3] ?? 0;
        final comp = compByTipo[t.$3] ?? 0;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.fondoCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: t.$4.withValues(alpha: 0.4)),
            ),
            child: Column(children: [
              Text(t.$1, style: const TextStyle(fontSize: 22)),
              const SizedBox(height: 4),
              Text(t.$2, style: TextStyle(color: t.$4, fontSize: 11, fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text('$comp/$tot', style: TextStyle(color: t.$4, fontSize: 18, fontWeight: FontWeight.w900)),
            ]),
          ),
        );
      }).toList(),
    );
  }

  // ─── TAB 2: FINANZAS ─────────────────────────────────────────────
  Widget _buildFinanzas(AppProvider app) {
    final ventas = app.totalVentas;
    final cashflow = app.fondoCashflow;
    final reinversion = app.fondoReinversion;
    final estiloVida = app.estiloVida;
    final txs = app.transacciones;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCard(
          emoji: '💵',
          valor: '\$${_fmt(ventas)}',
          label: 'Total en ventas registradas',
          pct: null,
          color: AppColors.neonVerde,
        ),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _buildStatMini('📈', '\$${_fmt(cashflow)}', 'Cashflow', AppColors.neonMorado)),
          const SizedBox(width: 12),
          Expanded(child: _buildStatMini('🔄', '\$${_fmt(reinversion)}', 'Reinvertido', AppColors.neonAzul)),
        ]),
        const SizedBox(height: 12),
        _buildStatRow('🏠 Estilo de vida acumulado', '\$${_fmt(estiloVida)}', AppColors.neonRosa),
        if (ventas > 0) ...[
          const SizedBox(height: 20),
          const Text('📊 Distribución 30/40/30', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 12),
          _buildDistribucionChart(cashflow, reinversion, estiloVida, ventas),
        ],
        const SizedBox(height: 20),
        if (txs.isNotEmpty) ...[
          const Text('🕐 Historial de ventas', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 12),
          ...txs.reversed.take(15).map(_buildTransaccionCard),
        ] else
          _buildEmptyState('Sin ventas aún', 'Registra tus primeras ventas en la sección de Inicio'),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildDistribucionChart(double cf, double rv, double ev, double total) {
    final items = [
      ('📈 Cashflow (30%)', cf, AppColors.neonMorado),
      ('🔄 Reinversión (30%)', rv, AppColors.neonAzul),
      ('🏠 Estilo vida (40%)', ev, AppColors.neonRosa),
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: items.map((item) {
          final pct = total <= 0 ? 0.0 : (item.$2 / total).clamp(0.0, 1.0);
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(item.$1, style: TextStyle(color: item.$3, fontSize: 12, fontWeight: FontWeight.w700)),
                Text('\$${_fmt(item.$2)}', style: AppTextStyles.caption),
              ]),
              const SizedBox(height: 4),
              LayoutBuilder(builder: (_, c) => Stack(children: [
                Container(height: 10, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(5))),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  height: 10,
                  width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(4.0, c.maxWidth),
                  decoration: BoxDecoration(color: item.$3, borderRadius: BorderRadius.circular(5)),
                ),
              ])),
            ]),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransaccionCard(Transaccion t) {
    final fecha = '${t.fecha.day}/${t.fecha.month}/${t.fecha.year}';
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.2)),
      ),
      child: Row(children: [
        const Text('💵', style: TextStyle(fontSize: 22)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            t.descripcion.isEmpty ? 'Venta registrada' : t.descripcion,
            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Text(fecha, style: AppTextStyles.caption),
        ])),
        Text(
          '+\$${_fmt(t.montoTotal)}',
          style: const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w900, fontSize: 15),
        ),
      ]),
    );
  }

  // ─── TAB 3: LOGROS ───────────────────────────────────────────────
  Widget _buildLogros(AppProvider app) {
    final comp = app.leccionesCompletadas;
    final ventas = app.totalVentas;
    final racha = app.racha;
    final gemas = app.gemas;

    final logros = [
      _Logro('🌱', 'Primera lección', 'Completa tu primera lección', comp >= 1),
      _Logro('📚', 'Lectora aplicada', 'Completa 5 lecciones', comp >= 5),
      _Logro('🎓', 'Estudiante financiera', 'Completa 10 lecciones', comp >= 10),
      _Logro('🏅', 'Módulo 1 completo', 'Completa los 6 fundamentos', comp >= 6),
      _Logro('⭐', 'Módulo 2 completo', 'Completa 12 lecciones', comp >= 12),
      _Logro('🏆', 'Módulo 3 completo', 'Completa 18 lecciones', comp >= 18),
      _Logro('🚀', 'Maestra Total', 'Completa los 4 módulos (24)', comp >= 24),
      _Logro('💵', 'Primera venta', 'Registra tu primera venta', ventas >= 1),
      _Logro('💰', 'Pequeña empresaria', 'Acumula \$100 en ventas', ventas >= 100),
      _Logro('🏪', 'Emprendedora real', 'Acumula \$500 en ventas', ventas >= 500),
      _Logro('🏙️', 'Gran empresaria', 'Acumula \$2,000 en ventas', ventas >= 2000),
      _Logro('🔥', 'Racha x3', '3 días seguidos de racha', racha >= 3),
      _Logro('⚡', 'Racha semanal', 'Una semana completa (7 días)', racha >= 7),
      _Logro('🌟', 'Racha mensual', '30 días de racha consecutivos', racha >= 30),
      _Logro('💎', 'Coleccionista', 'Gana 100 gemas', gemas >= 100),
      _Logro('👑', 'Reina del Imperio', 'Gana 1,000 gemas', gemas >= 1000),
    ];

    final desbloqueados = logros.where((l) => l.desbloqueado).length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeroCard(
          emoji: '🏆',
          valor: '$desbloqueados / ${logros.length}',
          label: 'Logros desbloqueados',
          pct: desbloqueados / logros.length,
          color: AppColors.neonAmarillo,
        ),
        const SizedBox(height: 20),
        const Text('🏅 Todos los logros', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 12),
        ...logros.map(_buildLogroCard),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildLogroCard(_Logro logro) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: logro.desbloqueado ? const Color(0xFF0F2A0F) : AppColors.fondoCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: logro.desbloqueado ? AppColors.neonVerde.withValues(alpha: 0.5) : Colors.white10,
          width: logro.desbloqueado ? 1.5 : 1,
        ),
      ),
      child: Row(children: [
        Text(
          logro.desbloqueado ? logro.emoji : '🔒',
          style: TextStyle(
            fontSize: 28,
            color: logro.desbloqueado ? null : Colors.white24,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            logro.titulo,
            style: TextStyle(
              color: logro.desbloqueado ? Colors.white : Colors.white38,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(logro.descripcion, style: AppTextStyles.caption),
        ])),
        if (logro.desbloqueado)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.neonVerde.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('✅', style: TextStyle(fontSize: 14)),
          ),
      ]),
    );
  }

  // ─── SHARED WIDGETS ──────────────────────────────────────────────
  Widget _buildHeroCard({
    required String emoji,
    required String valor,
    required String label,
    required double? pct,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.2), color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(valor, style: TextStyle(color: color, fontSize: 26, fontWeight: FontWeight.w900)),
            Text(label, style: const TextStyle(color: Colors.white60, fontSize: 13)),
          ])),
        ]),
        if (pct != null) ...[
          const SizedBox(height: 14),
          LayoutBuilder(builder: (_, c) => Stack(children: [
            Container(height: 8, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(4))),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic,
              height: 8,
              width: pct <= 0 ? 0 : (c.maxWidth * pct).clamp(4.0, c.maxWidth),
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
            ),
          ])),
          const SizedBox(height: 6),
          Text(
            '${(pct * 100).toStringAsFixed(0)}% completado',
            style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ]),
    );
  }

  Widget _buildStatMini(String emoji, String valor, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 6),
        Text(valor, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w900)),
        Text(label, style: AppTextStyles.caption),
      ]),
    );
  }

  Widget _buildStatRow(String label, String valor, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        Text(valor, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w900)),
      ]),
    );
  }

  Widget _buildEmptyState(String titulo, String subtitulo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(child: Column(children: [
        const Text('📭', style: TextStyle(fontSize: 48)),
        const SizedBox(height: 12),
        Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(subtitulo, style: AppTextStyles.caption, textAlign: TextAlign.center),
      ])),
    );
  }

  String _fmt(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(1)}K';
    return v.toStringAsFixed(2);
  }
}

// ─── DATA CLASSES ─────────────────────────────────────────────────
class _ModuloStats {
  final int modulo;
  int total = 0;
  int completadas = 0;
  _ModuloStats(this.modulo);
}

class _Logro {
  final String emoji;
  final String titulo;
  final String descripcion;
  final bool desbloqueado;
  const _Logro(this.emoji, this.titulo, this.descripcion, this.desbloqueado);
}
