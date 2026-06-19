// lib/models/app_models.dart
import 'dart:math';

// ─────────────────────────────────────────────
//  ENUMS
// ─────────────────────────────────────────────
enum TipoLeccion { historia, quiz, reto }
enum EstadoLeccion { bloqueada, disponible, completada }
enum TipoMision { ventas, lecciones, diario, cashflow }

// ─────────────────────────────────────────────
//  LESSON MODEL
// ─────────────────────────────────────────────
class Leccion {
  final String id;
  final String titulo;
  final String emoji;
  final String descripcion;
  final TipoLeccion tipo;
  EstadoLeccion estado;
  final List<Pregunta> preguntas;
  final int gemasRecompensa;
  final int modulo;

  Leccion({
    required this.id,
    required this.titulo,
    required this.emoji,
    required this.descripcion,
    required this.tipo,
    required this.estado,
    required this.preguntas,
    this.gemasRecompensa = 10,
    this.modulo = 1,
  });
}

class Pregunta {
  final String enunciado;
  final List<String> opciones;
  final int respuestaCorrecta;
  final String explicacion;

  const Pregunta({
    required this.enunciado,
    required this.opciones,
    required this.respuestaCorrecta,
    required this.explicacion,
  });
}

// ─────────────────────────────────────────────
//  TRANSACTION MODEL
// ─────────────────────────────────────────────
class Transaccion {
  final String id;
  final double montoTotal;
  final double reinversion;
  final double estiloVida;
  final double cashflow;
  final DateTime fecha;
  final String descripcion;

  Transaccion({
    required this.montoTotal,
    required this.fecha,
    this.descripcion = '',
    String? id,
  })  : id = id ?? '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(999999)}',
        reinversion = montoTotal * 0.30,
        estiloVida = montoTotal * 0.40,
        cashflow = montoTotal * 0.30;
}

// ─────────────────────────────────────────────
//  JOURNAL ENTRY
// ─────────────────────────────────────────────
class EntradaGratitud {
  final String id;
  final String texto;
  final DateTime fecha;

  EntradaGratitud({required this.texto, required this.fecha})
      : id = DateTime.now().millisecondsSinceEpoch.toString();
}

// ─────────────────────────────────────────────
//  STOCK SIMULATION MODEL
// ─────────────────────────────────────────────
class AccionSimulada {
  final String nombre;
  final String ticker;
  final String emoji;
  double precio;
  double variacion;

  AccionSimulada({
    required this.nombre,
    required this.ticker,
    required this.emoji,
    required this.precio,
    required this.variacion,
  });
}

// ─────────────────────────────────────────────
//  MISION MODEL
// ─────────────────────────────────────────────
class Mision {
  final String id;
  final String titulo;
  final String descripcion;
  final String emoji;
  final TipoMision tipo;
  final double meta;       // valor objetivo (ej: $20, 2 lecciones, 3 diarios)
  double progreso;
  bool completada;
  final int gemasRecompensa;

  Mision({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.emoji,
    required this.tipo,
    required this.meta,
    this.progreso = 0,
    this.completada = false,
    this.gemasRecompensa = 25,
  });

  double get porcentaje => (progreso / meta).clamp(0.0, 1.0);
  bool get recienCompletada => progreso >= meta && !completada;
}

// ─────────────────────────────────────────────
//  META FINANCIERA MODEL
// ─────────────────────────────────────────────
class MetaFinanciera {
  final String id;
  final String nombre;
  final String emoji;
  final double montoObjetivo;
  double montoActual;
  final DateTime fechaCreacion;
  bool alcanzada;

  MetaFinanciera({
    required this.nombre,
    required this.emoji,
    required this.montoObjetivo,
    this.montoActual = 0,
    this.alcanzada = false,
  })  : id = DateTime.now().millisecondsSinceEpoch.toString(),
        fechaCreacion = DateTime.now();

  double get porcentaje => (montoActual / montoObjetivo).clamp(0.0, 1.0);
  double get faltante => (montoObjetivo - montoActual).clamp(0.0, double.infinity);
}

// ─────────────────────────────────────────────
//  AVATAR MODEL
// ─────────────────────────────────────────────
class AvatarItem {
  final String id;
  final String emoji;
  final String nombre;
  final int costoGemas;
  final int nivelRequerido;
  bool desbloqueado;

  AvatarItem({
    required this.id,
    required this.emoji,
    required this.nombre,
    required this.costoGemas,
    required this.nivelRequerido,
    this.desbloqueado = false,
  });
}

// ─────────────────────────────────────────────
//  DATAPOINT para gráficas
// ─────────────────────────────────────────────
class PuntoGrafica {
  final DateTime fecha;
  final double cashflow;
  final double estiloVida;
  final double ventas;

  const PuntoGrafica({
    required this.fecha,
    required this.cashflow,
    required this.estiloVida,
    required this.ventas,
  });
}

// ═════════════════════════════════════════════
//  CATALOG: LECCIONES (18 total — módulo 1 + módulo 2)
// ═════════════════════════════════════════════
List<Leccion> crearLecciones() {
  return [
    // ── MÓDULO 1: FUNDAMENTOS ──────────────
    Leccion(
      id: 'l1', titulo: '¿Qué es el dinero?', emoji: '💰', modulo: 1,
      descripcion: 'Aprende el origen y poder del dinero',
      tipo: TipoLeccion.historia, estado: EstadoLeccion.disponible,
      gemasRecompensa: 10,
      preguntas: [
        const Pregunta(
          enunciado: '¿Para qué sirve principalmente el dinero?',
          opciones: ['Para coleccionar','Para intercambiar bienes y servicios','Solo para adultos','Para guardar bajo el colchón'],
          respuestaCorrecta: 1,
          explicacion: '¡Correcto! El dinero es un medio de intercambio que facilita el comercio entre personas.',
        ),
        const Pregunta(
          enunciado: '¿Cuál es la diferencia entre necesidad y deseo?',
          opciones: ['No hay diferencia','Las necesidades son esenciales para vivir; los deseos son extras','Los deseos son más importantes','Solo los adultos tienen necesidades'],
          respuestaCorrecta: 1,
          explicacion: '¡Exacto! Necesidades: comida, ropa, hogar. Deseos: juguetes, dulces, etc.',
        ),
      ],
    ),
    Leccion(
      id: 'l2', titulo: 'Ingresos vs Gastos', emoji: '⚖️', modulo: 1,
      descripcion: 'Entiende el flujo del dinero en tu vida',
      tipo: TipoLeccion.quiz, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 15,
      preguntas: [
        const Pregunta(
          enunciado: '¿Qué son los ingresos?',
          opciones: ['El dinero que gastas','El dinero que ganas o recibes','Las deudas que tienes','Los impuestos que pagas'],
          respuestaCorrecta: 1,
          explicacion: '¡Sí! Los ingresos son todo el dinero que entra a tu bolsillo: mesada, ventas, regalos, etc.',
        ),
        const Pregunta(
          enunciado: 'Si ganas \$20 y gastas \$25, ¿qué está pasando?',
          opciones: ['Estás ahorrando','Estás ganando dinero','Estás en déficit: ¡gastas más de lo que ganas!','Estás invirtiendo'],
          respuestaCorrecta: 2,
          explicacion: '¡Muy bien! Gastar más de lo que ganas crea deudas. ¡La clave es que tus ingresos sean mayores que tus gastos!',
        ),
      ],
    ),
    Leccion(
      id: 'l3', titulo: 'La Regla 30/40/30', emoji: '🎯', modulo: 1,
      descripcion: 'Tu fórmula secreta para manejar el dinero',
      tipo: TipoLeccion.historia, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 20,
      preguntas: [
        const Pregunta(
          enunciado: '¿Qué % va al Fondo de Reinversión?',
          opciones: ['40%','30%','20%','10%'],
          respuestaCorrecta: 1,
          explicacion: '¡Correcto! 30% siempre regresa a tu negocio. Así tu empresa puede crecer.',
        ),
        const Pregunta(
          enunciado: 'De \$100 en ventas, ¿cuánto va a Cashflow?',
          opciones: ['\$40','\$10','\$30','\$20'],
          respuestaCorrecta: 2,
          explicacion: '¡Exacto! \$30 van a tu Fondo Cashflow. Ese dinero trabaja para ti comprando fracciones de acciones.',
        ),
      ],
    ),
    Leccion(
      id: 'l4', titulo: '¿Qué son las acciones?', emoji: '📈', modulo: 1,
      descripcion: 'Sé dueña de empresas como Apple y Disney',
      tipo: TipoLeccion.historia, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 20,
      preguntas: [
        const Pregunta(
          enunciado: '¿Qué es una acción de una empresa?',
          opciones: ['Una deuda que tienes','Una pequeña parte de la propiedad de esa empresa','Un préstamo al banco','Un tipo de moneda'],
          respuestaCorrecta: 1,
          explicacion: '¡Genial! Al comprar una acción de Apple, ¡tú eres dueña de una pequeña parte de Apple!',
        ),
        const Pregunta(
          enunciado: '¿Por qué suben las acciones de una empresa?',
          opciones: ['Por arte de magia','Cuando la empresa gana más dinero y crece','Cuando llueve','Por el color de su logo'],
          respuestaCorrecta: 1,
          explicacion: '¡Sí! Cuando una empresa vende más y crece, más personas quieren sus acciones y el precio sube.',
        ),
      ],
    ),
    Leccion(
      id: 'l5', titulo: 'La Carrera de Ratas', emoji: '🐀', modulo: 1,
      descripcion: 'Entiende la trampa y cómo escapar de ella',
      tipo: TipoLeccion.reto, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 30,
      preguntas: [
        const Pregunta(
          enunciado: '¿Qué es la "Carrera de Ratas"?',
          opciones: ['Una competencia de atletismo','El ciclo de trabajar solo para pagar gastos, sin tiempo ni libertad','Un juego de video','Una película'],
          respuestaCorrecta: 1,
          explicacion: 'Robert Kiyosaki lo explica en "Padre Rico Padre Pobre". La trampa: trabajas, ganas, gastas todo, y necesitas trabajar más. ¡Tu Fondo Cashflow es la salida!',
        ),
        const Pregunta(
          enunciado: '¿Cuándo logras la Libertad Financiera?',
          opciones: ['Cuando tienes un trabajo estable','Cuando tu Ingreso Pasivo supera tus Gastos','Cuando cumples 18 años','Cuando tienes mucho efectivo'],
          respuestaCorrecta: 1,
          explicacion: '¡EXACTO! Cuando lo que genera tu dinero invertido supera lo que gastas, ¡eres LIBRE!',
        ),
      ],
    ),
    Leccion(
      id: 'l6', titulo: 'Tu Negocio de Emprendedora', emoji: '🚀', modulo: 1,
      descripcion: 'Estrategias para hacer crecer tus ventas',
      tipo: TipoLeccion.reto, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 25,
      preguntas: [
        const Pregunta(
          enunciado: '¿Cuál es la mejor manera de conseguir más clientes?',
          opciones: ['Esperar a que vengan solos','Ofrecer valor, pedir referidos y tener un producto excelente','Bajar los precios siempre','Solo vender a la familia'],
          respuestaCorrecta: 1,
          explicacion: '¡Emprendedora inteligente! El boca a boca es poderoso. Si tu producto es increíble, tus clientes traerán más clientes.',
        ),
        const Pregunta(
          enunciado: '¿Qué es el "margen de ganancia"?',
          opciones: ['El precio al que vendes','La diferencia entre lo que cobras y lo que te cuesta producir','El número de clientes','Los impuestos que pagas'],
          respuestaCorrecta: 1,
          explicacion: 'Si tu producto cuesta \$3 hacerlo y lo vendes en \$10, tu margen es \$7. ¡Siempre conoce tus números!',
        ),
      ],
    ),

    // ── MÓDULO 2: CRECIMIENTO ──────────────
    Leccion(
      id: 'l7', titulo: 'El Interés Compuesto', emoji: '⏰', modulo: 2,
      descripcion: 'La fuerza más poderosa del universo',
      tipo: TipoLeccion.historia, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 25,
      preguntas: [
        const Pregunta(
          enunciado: '\$100 al 10% anual durante 10 años... ¿cuánto tienes?',
          opciones: ['\$200 (doble lo que pusiste)','\$259 (el interés compuesto trabaja por ti)','\$110 (solo el primer año)','\$150 (la mitad más)'],
          respuestaCorrecta: 1,
          explicacion: '¡Exacto! Con el interés compuesto, ganas intereses SOBRE tus intereses. Einstein lo llamó "la octava maravilla del mundo" 🌍',
        ),
        const Pregunta(
          enunciado: '¿Qué es mejor para el interés compuesto?',
          opciones: ['Invertir \$1,000 a los 30 años','Invertir \$500 a los 15 años','Invertir \$100 mañana mismo','Esperar a ganar más para invertir'],
          respuestaCorrecta: 1,
          explicacion: '¡Sí! El tiempo es tu superpoder 🦸‍♀️. \$500 a los 15 pueden valer más que \$5,000 invertidos a los 35.',
        ),
      ],
    ),
    Leccion(
      id: 'l8', titulo: 'Activos vs Pasivos', emoji: '🏦', modulo: 2,
      descripcion: 'El secreto de los ricos según Kiyosaki',
      tipo: TipoLeccion.historia, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 25,
      preguntas: [
        const Pregunta(
          enunciado: '¿Qué es un ACTIVO según Robert Kiyosaki?',
          opciones: ['Todo lo que posees','Algo que pone dinero en tu bolsillo','Tu ropa y zapatos','Tu celular nuevo'],
          respuestaCorrecta: 1,
          explicacion: '¡Correcto! Un activo genera ingresos: acciones, un negocio, una propiedad rentada. ¡Colecciona activos, no cosas!',
        ),
        const Pregunta(
          enunciado: '¿Un carro nuevo es activo o pasivo?',
          opciones: ['Activo — porque vale dinero','Pasivo — porque genera gastos: gasolina, seguro, mantenimiento','Activo — porque te lleva al trabajo','Ninguno de los dos'],
          respuestaCorrecta: 1,
          explicacion: 'Exacto. A menos que uses el carro para ganar dinero (taxi, delivery), es un pasivo: saca dinero de tu bolsillo cada mes.',
        ),
      ],
    ),
    Leccion(
      id: 'l9', titulo: 'El Arte de Ahorrar', emoji: '🐷', modulo: 2,
      descripcion: 'Ahorrar no es suficiente — pero es el primer paso',
      tipo: TipoLeccion.quiz, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 20,
      preguntas: [
        const Pregunta(
          enunciado: 'Tienes \$50. ¿Cuál es la mejor decisión?',
          opciones: ['Gastar todo en ropa','Guardar \$50 bajo el colchón','Separar \$15 para invertir y guardar \$10 para emergencias','Prestárselo a un amigo'],
          respuestaCorrecta: 2,
          explicacion: '¡Excelente! Separar para inversión Y emergencias es la combinación ganadora. El ahorro bajo el colchón pierde valor con la inflación.',
        ),
        const Pregunta(
          enunciado: '¿Qué es la inflación?',
          opciones: ['Cuando los precios suben con el tiempo y el dinero vale menos','Cuando el banco te cobra por guardar dinero','Una enfermedad económica que solo afecta a adultos','Cuando ganas más dinero del esperado'],
          respuestaCorrecta: 0,
          explicacion: '¡Correcto! Por eso invertir es mejor que ahorrar: si el dinero "crece" menos que la inflación, en realidad estás perdiendo.',
        ),
      ],
    ),
    Leccion(
      id: 'l10', titulo: 'Presupuesto de Emprendedora', emoji: '📊', modulo: 2,
      descripcion: 'Planifica tus ingresos y gastos como pro',
      tipo: TipoLeccion.reto, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 30,
      preguntas: [
        const Pregunta(
          enunciado: 'Vendiste \$80 esta semana. Materiales costaron \$20. ¿Cuál es tu ganancia real?',
          opciones: ['\$80','\$60','\$40','\$100'],
          respuestaCorrecta: 1,
          explicacion: '¡Correcto! Ganancia = Ingresos - Costos. \$80 - \$20 = \$60. ¡Siempre resta los costos antes de celebrar!',
        ),
        const Pregunta(
          enunciado: '¿Para qué sirve un presupuesto?',
          opciones: ['Para demostrarle al banco que eres responsable','Para planear cuánto vas a ganar, gastar e invertir antes de que ocurra','Solo para empresas grandes','Para saber cuánto dinero tienes hoy'],
          respuestaCorrecta: 1,
          explicacion: 'Un presupuesto es un plan de vuelo para tu dinero. Sin él, el dinero desaparece sin que sepas cómo.',
        ),
      ],
    ),
    Leccion(
      id: 'l11', titulo: 'El Poder de Negociar', emoji: '🤝', modulo: 2,
      descripcion: 'La habilidad que vale más que un título',
      tipo: TipoLeccion.historia, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 25,
      preguntas: [
        const Pregunta(
          enunciado: 'Un proveedor te ofrece materiales a \$10 por unidad. ¿Qué haces?',
          opciones: ['Aceptas inmediatamente para no perder el trato','Preguntas si hay descuento por volumen o por pago adelantado','Buscas otro proveedor sin hablar','Le cuentas que tienes poco dinero'],
          respuestaCorrecta: 1,
          explicacion: '¡Emprendedora lista! Siempre hay margen de negociación. Pagar menos por materiales = más ganancia sin vender más.',
        ),
        const Pregunta(
          enunciado: '¿Cuál es la regla de oro de negociar?',
          opciones: ['Siempre exigir el precio más bajo posible','Buscar que ambas partes ganen — win-win','Nunca ceder en nada','Hablar más que la otra persona'],
          respuestaCorrecta: 1,
          explicacion: 'Las mejores negociaciones terminan con ambas partes felices. Si solo ganas tú, el proveedor no querrá volver a trabajar contigo.',
        ),
      ],
    ),
    Leccion(
      id: 'l12', titulo: 'Diversificación', emoji: '🌈', modulo: 2,
      descripcion: 'No pongas todos los huevos en una canasta',
      tipo: TipoLeccion.quiz, estado: EstadoLeccion.bloqueada,
      gemasRecompensa: 25,
      preguntas: [
        const Pregunta(
          enunciado: 'Tienes \$100 para invertir. ¿Qué es más seguro?',
          opciones: ['Poner los \$100 en una sola acción','Dividir \$25 en 4 empresas distintas','Guardar todo en efectivo','Invertir todo en tu propio negocio solamente'],
          respuestaCorrecta: 1,
          explicacion: '¡Correcto! Si una empresa cae, las otras pueden compensar. La diversificación reduce el riesgo sin reducir el potencial de ganancia.',
        ),
        const Pregunta(
          enunciado: '¿Qué significa "no pongas todos los huevos en una canasta"?',
          opciones: ['Que debes tener muchas mascotas','Que es mejor distribuir tus inversiones en varios lugares','Que debes comprar muchas canastas','Que los huevos son una buena inversión'],
          respuestaCorrecta: 1,
          explicacion: 'Si la canasta cae, pierdes todo. Si distribuyes los huevos en varias canastas, aunque una caiga, no pierdes todo. ¡Así funciona invertir!',
        ),
      ],
    ),
  ];
}

// ─────────────────────────────────────────────
//  CATALOG: ACCIONES
// ─────────────────────────────────────────────
List<AccionSimulada> crearAcciones() {
  return [
    AccionSimulada(nombre: 'Apple', ticker: 'AAPL', emoji: '🍎', precio: 189.30, variacion: 1.2),
    AccionSimulada(nombre: 'Disney', ticker: 'DIS', emoji: '🏰', precio: 112.45, variacion: -0.8),
    AccionSimulada(nombre: 'Spotify', ticker: 'SPOT', emoji: '🎵', precio: 198.60, variacion: 2.3),
    AccionSimulada(nombre: 'Nike', ticker: 'NKE', emoji: '👟', precio: 94.20, variacion: 0.5),
    AccionSimulada(nombre: 'MrBeast', ticker: 'MBB', emoji: '🍔', precio: 45.80, variacion: 3.1),
  ];
}

// ─────────────────────────────────────────────
//  CATALOG: MISIONES SEMANALES
// ─────────────────────────────────────────────
List<Mision> crearMisionesSemanales() {
  return [
    Mision(id: 'm1', titulo: 'Vendedora de la Semana', descripcion: 'Registra al menos \$20 en ventas esta semana', emoji: '💵', tipo: TipoMision.ventas, meta: 20, gemasRecompensa: 30),
    Mision(id: 'm2', titulo: 'Estudiante Aplicada', descripcion: 'Completa 2 lecciones esta semana', emoji: '📚', tipo: TipoMision.lecciones, meta: 2, gemasRecompensa: 25),
    Mision(id: 'm3', titulo: 'Mente Positiva', descripcion: 'Escribe en tu diario 3 días esta semana', emoji: '✨', tipo: TipoMision.diario, meta: 3, gemasRecompensa: 20),
    Mision(id: 'm4', titulo: 'Inversora Estrella', descripcion: 'Acumula \$50 en tu Fondo Cashflow', emoji: '📈', tipo: TipoMision.cashflow, meta: 50, gemasRecompensa: 40),
  ];
}

// ─────────────────────────────────────────────
//  CATALOG: AVATARES
// ─────────────────────────────────────────────
List<AvatarItem> crearAvatares() {
  // Nivel máximo con 12 lecciones = 13 (nivel = completadas + 1)
  return [
    AvatarItem(id: 'av1', emoji: '🦋', nombre: 'Mariposa', costoGemas: 0, nivelRequerido: 1, desbloqueado: true),
    AvatarItem(id: 'av2', emoji: '🐝', nombre: 'Abeja Trabajadora', costoGemas: 50, nivelRequerido: 2),
    AvatarItem(id: 'av3', emoji: '🦊', nombre: 'Zorra Astuta', costoGemas: 80, nivelRequerido: 3),
    AvatarItem(id: 'av4', emoji: '🦅', nombre: 'Águila Emprendedora', costoGemas: 120, nivelRequerido: 5),
    AvatarItem(id: 'av5', emoji: '🐉', nombre: 'Dragón de Cashflow', costoGemas: 200, nivelRequerido: 7),
    AvatarItem(id: 'av6', emoji: '👑', nombre: 'Reina del Imperio', costoGemas: 350, nivelRequerido: 9),
    AvatarItem(id: 'av7', emoji: '🌟', nombre: 'Estrella de Negocios', costoGemas: 500, nivelRequerido: 11),
    AvatarItem(id: 'av8', emoji: '💎', nombre: 'Diamante Financiero', costoGemas: 800, nivelRequerido: 13),
  ];
}
