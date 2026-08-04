// lib/models/imperio_model.dart — Shared model for Imperio Builder
import 'dart:math';

class IBNegocio {
  final String id, nombre, emoji, descripcion, leccion, categoria;
  final double costoBase, ingresoBase;
  final int nivelDesbloqueo;
  int nivel;

  IBNegocio({
    required this.id, required this.nombre, required this.emoji,
    required this.descripcion, required this.leccion, required this.categoria,
    required this.costoBase, required this.ingresoBase,
    this.nivelDesbloqueo = 0, this.nivel = 0,
  });

  bool get comprado => nivel > 0;
  // 1.7x por nivel hace que los upgrades avanzados sean significativamente más caros
  double get costoUpgrade => costoBase * pow(1.7, nivel);
  // Crecimiento lineal más controlado: 1+nivel*0.03 en vez de 0.05 (menos cuadrático)
  double get ingresoActual => comprado ? ingresoBase * nivel * (1 + nivel * 0.03) : 0;
  double get costoSiguiente => comprado ? costoUpgrade : costoBase;

  IBNegocio copyWith({int? nivel}) => IBNegocio(
    id: id, nombre: nombre, emoji: emoji, descripcion: descripcion,
    leccion: leccion, categoria: categoria, costoBase: costoBase,
    ingresoBase: ingresoBase, nivelDesbloqueo: nivelDesbloqueo,
    nivel: nivel ?? this.nivel,
  );

  Map<String, dynamic> toMap() => {'id': id, 'nivel': nivel};

  static IBNegocio fromMap(IBNegocio base, Map<String, dynamic> m) =>
      base.copyWith(nivel: (m['nivel'] as int?) ?? 0);
}

List<IBNegocio> crearNegocios() => [
  IBNegocio(
    id: 'limonada', emoji: '🍋', nombre: 'Puesto de Limonada', categoria: 'Starter',
    descripcion: 'Tu primer negocio. Vendes limonada en el barrio los fines de semana.',
    leccion: '💡 Todo millonario empezó vendiendo algo. El primer negocio enseña más que cualquier libro.',
    costoBase: 50, ingresoBase: 0.3,
  ),
  IBNegocio(
    id: 'stickers', emoji: '🎨', nombre: 'Venta de Stickers', categoria: 'Digital',
    descripcion: 'Diseñas stickers en Canva y los vendes por WhatsApp e Instagram.',
    leccion: '💡 La creatividad digital no requiere capital inicial. Solo un celular y una idea.',
    costoBase: 200, ingresoBase: 0.7, nivelDesbloqueo: 1,
  ),
  IBNegocio(
    id: 'cookies', emoji: '🍪', nombre: 'Repostería Casera', categoria: 'Comida',
    descripcion: 'Horneas galletas y pasteles para vender en el colegio y a vecinos.',
    leccion: '💡 Convertir una habilidad en ingreso = tu primer negocio real.',
    costoBase: 500, ingresoBase: 1.4, nivelDesbloqueo: 2,
  ),
  IBNegocio(
    id: 'youtube', emoji: '🎬', nombre: 'Canal de YouTube', categoria: 'Digital',
    descripcion: 'Subes videos de tus temas favoritos. Los anuncios te generan ingresos 24/7.',
    leccion: '💡 El contenido digital trabaja mientras duermes. Un video puede pagarte por años.',
    costoBase: 1500, ingresoBase: 2.5, nivelDesbloqueo: 3,
  ),
  IBNegocio(
    id: 'cafeteria', emoji: '☕', nombre: 'Cafetería', categoria: 'Local',
    descripcion: 'Abres una pequeña cafetería en tu barrio. El aroma atrae clientes todos los días.',
    leccion: '💡 Un local físico crea comunidad. Los clientes fieles son tu mejor publicidad.',
    costoBase: 5000, ingresoBase: 8.0, nivelDesbloqueo: 4,
  ),
  IBNegocio(
    id: 'tienda', emoji: '🏪', nombre: 'Tienda Online', categoria: 'Digital',
    descripcion: 'Tienda en Shopify o Mercado Libre. Vendes a todo el país sin salir de casa.',
    leccion: '💡 El e-commerce permite vender a miles de personas sin pagar renta de local.',
    costoBase: 15000, ingresoBase: 13.0, nivelDesbloqueo: 5,
  ),
  IBNegocio(
    id: 'app', emoji: '📱', nombre: 'App Móvil', categoria: 'Tech',
    descripcion: 'Lanzas una app sencilla. Millones de personas la descargan mientras duermes.',
    leccion: '💡 Un software se crea una vez y se vende infinitas veces. Eso se llama escala.',
    costoBase: 50000, ingresoBase: 40.0, nivelDesbloqueo: 6,
  ),
  IBNegocio(
    id: 'franquicia', emoji: '🍕', nombre: 'Franquicia de Comida', categoria: 'Local',
    descripcion: 'Compras una franquicia reconocida. El sistema ya está probado — solo opéralo.',
    leccion: '💡 Las franquicias eliminan el riesgo de inventar un modelo de negocio desde cero.',
    costoBase: 150000, ingresoBase: 60.0, nivelDesbloqueo: 7,
  ),
  IBNegocio(
    id: 'propiedad', emoji: '🏠', nombre: 'Propiedad de Alquiler', categoria: 'Inmuebles',
    descripcion: 'Compras un apartamento y lo alquilas. El inquilino paga tu hipoteca y más.',
    leccion: '💡 Bienes raíces = activo que sube de valor Y genera ingreso al mismo tiempo.',
    costoBase: 500000, ingresoBase: 180.0, nivelDesbloqueo: 8,
  ),
  IBNegocio(
    id: 'agencia', emoji: '💻', nombre: 'Agencia Digital', categoria: 'Tech',
    descripcion: 'Tu agencia maneja redes sociales de 20 empresas. El equipo trabaja, tú diriges.',
    leccion: '💡 Un equipo bien dirigido multiplica tu capacidad productiva por 10.',
    costoBase: 1500000, ingresoBase: 300.0, nivelDesbloqueo: 9,
  ),
  IBNegocio(
    id: 'edificio', emoji: '🏢', nombre: 'Edificio de Apartamentos', categoria: 'Inmuebles',
    descripcion: '20 apartamentos. 20 inquilinos pagando renta. Ingresos masivos cada mes.',
    leccion: '💡 La escala es la diferencia entre ricos y superricos.',
    costoBase: 5000000, ingresoBase: 900.0, nivelDesbloqueo: 10,
  ),
  IBNegocio(
    id: 'empresa', emoji: '🌍', nombre: 'Empresa Global', categoria: 'Corporativo',
    descripcion: 'Tu empresa opera en 15 países. Miles de empleados construyen tu legado.',
    leccion: '💡 Una empresa global es la cima de la creación de riqueza. ¿Cuál será la tuya?',
    costoBase: 20000000, ingresoBase: 2000.0, nivelDesbloqueo: 11,
  ),
];

// ─── Hitos / Milestones ────────────────────────────────────────
const kHitos = [
  (1000.0,    '🌱', 'Primer Mil',    '¡Tu primer \$1,000! La mayoría nunca llega aquí. Tú sí.'),
  (10000.0,   '⭐', 'Emprendedora',  '¡\$10,000! Ya piensas diferente al promedio.'),
  (50000.0,   '💎', 'Inversora',     '¡\$50,000! Estás construyendo activos reales.'),
  (100000.0,  '🚀', 'Six Figures',   '¡\$100,000! Menos del 5% de la gente llega aquí.'),
  (500000.0,  '🏆', 'Medio Millón',  '¡Medio millón! La libertad financiera está cerca.'),
  (1000000.0, '👑', '¡MILLONARIA!',  '¡\$1,000,000! ¡LO LOGRASTE! ¡Millonaria a los 20!'),
];

// ─── Nivel e Imperio ──────────────────────────────────────────
int nivelImperio(double total) {
  if (total >= 1000000) return 6;
  if (total >= 100000)  return 5;
  if (total >= 50000)   return 4;
  if (total >= 10000)   return 3;
  if (total >= 1000)    return 2;
  return 1;
}

double bonusMultiplier(double total) {
  switch (nivelImperio(total)) {
    case 6: return 1.5;
    case 5: return 1.3;
    case 4: return 1.2;
    case 3: return 1.1;
    case 2: return 1.05;
    default: return 1.0;
  }
}

String tituloNivel(int nivel) => const [
  '', 'Rookie', 'Emprendedora', 'Inversora', 'Empresaria', 'Millonaria', '👑 Leyenda'
][nivel];

String badgeNivel(int nivel) => const ['', '🌱', '⭐', '💎', '🚀', '🏆', '👑'][nivel];

// Avatares disponibles en la app social
const kAvataresSocial = ['👸','🦊','⭐','🦋','🐉','🌙','💎','🔥','👑','🎭','🌸','🦁','🧙'];
