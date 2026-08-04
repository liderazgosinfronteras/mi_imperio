// lib/screens/pantalla_juego_cashflow.dart  — Cashflow 2026 Completo
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/firebase_service.dart';
import '../theme.dart';
import '../utils/sound_player.dart';

// ═══════════════════════════════════════════════════════════════
//  MODELOS
// ═══════════════════════════════════════════════════════════════
class CFProfesion {
  final String emoji, nombre;
  final int salario, impuestos, hipoteca, pagoAuto, tarjeta,
      prestamo, gastoOtros, ahorroInicial;
  const CFProfesion({
    required this.emoji, required this.nombre,
    required this.salario, required this.impuestos,
    required this.hipoteca, required this.pagoAuto,
    required this.tarjeta, required this.prestamo,
    required this.gastoOtros, required this.ahorroInicial,
  });
  int get totalGastos => impuestos + hipoteca + pagoAuto + tarjeta + prestamo + gastoOtros;
  int get cashflow => salario - totalGastos;
}

class CFActivo {
  final String nombre, emoji, tipo;
  int costo, ingresoPasivo, valorMercado;
  int? deuda;
  CFActivo({required this.nombre, required this.emoji, required this.tipo,
    required this.costo, required this.ingresoPasivo, required this.valorMercado, this.deuda});
}

class CFPasivo {
  final String nombre;
  final int deuda, pagomensual;
  const CFPasivo({required this.nombre, required this.deuda, required this.pagomensual});
}

class CFCarta {
  final String tipo, titulo, descripcion, emoji, leccion;
  final int costo, ingresoPasivo, valorMercado;
  final bool disponibleTodos;
  const CFCarta({
    required this.tipo, required this.titulo, required this.descripcion,
    required this.emoji, this.leccion = '', this.costo = 0,
    this.ingresoPasivo = 0, this.valorMercado = 0, this.disponibleTodos = true,
  });
}

enum EspacioTablero { payday, pequenoNegocio, granNegocio, pasivo, reduccion, caridad, bebe, mercado, sueno }

// ═══════════════════════════════════════════════════════════════
//  DATOS — PROFESIONES
// ═══════════════════════════════════════════════════════════════
const _profesiones = [
  CFProfesion(emoji:'👩‍🏫', nombre:'Maestra',       salario:3200,  impuestos:480,  hipoteca:700,  pagoAuto:200, tarjeta:60,  prestamo:100, gastoOtros:890,  ahorroInicial:800),
  CFProfesion(emoji:'👩‍💼', nombre:'Secretaria',     salario:2800,  impuestos:420,  hipoteca:600,  pagoAuto:150, tarjeta:50,  prestamo:80,  gastoOtros:750,  ahorroInicial:500),
  CFProfesion(emoji:'👩‍⚕️', nombre:'Enfermera',      salario:4500,  impuestos:720,  hipoteca:1000, pagoAuto:300, tarjeta:90,  prestamo:150, gastoOtros:1100, ahorroInicial:1200),
  CFProfesion(emoji:'👩‍🍳', nombre:'Chef',           salario:3500,  impuestos:560,  hipoteca:750,  pagoAuto:200, tarjeta:70,  prestamo:0,   gastoOtros:950,  ahorroInicial:900),
  CFProfesion(emoji:'👩‍💻', nombre:'Programadora',   salario:6200,  impuestos:1200, hipoteca:1400, pagoAuto:400, tarjeta:130, prestamo:200, gastoOtros:1470, ahorroInicial:1800),
  CFProfesion(emoji:'👩‍⚖️', nombre:'Abogada',        salario:7500,  impuestos:1800, hipoteca:1800, pagoAuto:600, tarjeta:200, prestamo:350, gastoOtros:1750, ahorroInicial:2200),
  CFProfesion(emoji:'👩‍🔬', nombre:'Doctora',        salario:9000,  impuestos:2200, hipoteca:2200, pagoAuto:700, tarjeta:250, prestamo:500, gastoOtros:2000, ahorroInicial:3000),
  CFProfesion(emoji:'👩‍🎨', nombre:'Artista',        salario:2200,  impuestos:320,  hipoteca:500,  pagoAuto:100, tarjeta:40,  prestamo:0,   gastoOtros:640,  ahorroInicial:400),
];

// ═══════════════════════════════════════════════════════════════
//  DATOS — CARTAS PEQUEÑOS NEGOCIOS
// ═══════════════════════════════════════════════════════════════
const _pequenos = [
  CFCarta(tipo:'pequeno', emoji:'🏠', titulo:'Casa de alquiler 2/1',
    descripcion:'Propiedad pequeña en barrio residencial. Alquilada por \$250/mes. Hipoteca: \$5,000.',
    leccion:'Los bienes raíces con flujo positivo son el activo más seguro para principiantes.',
    costo:3000, ingresoPasivo:250, valorMercado:25000),
  CFCarta(tipo:'pequeno', emoji:'📈', titulo:'Acciones TechCorp',
    descripcion:'12 acciones a \$1 c/u. La empresa paga dividendos trimestrales.',
    leccion:'Las acciones de dividendos convierten tu capital en ingresos recurrentes.',
    costo:12, ingresoPasivo:20, valorMercado:12),
  CFCarta(tipo:'pequeno', emoji:'💻', titulo:'Curso digital',
    descripcion:'Grabas un curso sobre tus habilidades. Plataforma lo vende 24/7.',
    leccion:'El conocimiento empaquetado es el activo de menor costo y mayor retorno.',
    costo:800, ingresoPasivo:120, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🏪', titulo:'Máquina expendedora',
    descripcion:'3 máquinas en oficinas corporativas. Flujo mensual garantizado.',
    leccion:'Negocios automáticos generan ingresos sin requerir tu presencia.',
    costo:2000, ingresoPasivo:150, valorMercado:2000),
  CFCarta(tipo:'pequeno', emoji:'📱', titulo:'App de recetas',
    descripcion:'App sencilla con suscripción mensual de \$2/usuario.',
    leccion:'Los modelos de suscripción crean ingresos predecibles y escalables.',
    costo:1500, ingresoPasivo:100, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🚗', titulo:'Auto de alquiler',
    descripcion:'Tu auto genera dinero en plataformas de alquiler cuando no lo usas.',
    leccion:'Los activos que ya posees pueden trabajar para ti.',
    costo:0, ingresoPasivo:180, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'📚', titulo:'Libro de finanzas',
    descripcion:'Regalías mensuales de tu libro publicado en Amazon.',
    leccion:'Crear una vez, cobrar indefinidamente: eso es ingreso residual.',
    costo:500, ingresoPasivo:60, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🌐', titulo:'Blog con anuncios',
    descripcion:'Blog de 10K visitas/mes monetizado con Google Ads.',
    leccion:'El contenido digital es un activo que trabaja mientras duermes.',
    costo:300, ingresoPasivo:40, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🏘️', titulo:'Duplex para alquiler',
    descripcion:'Vives en una mitad, alquilas la otra. Tu vecino paga tu hipoteca.',
    leccion:'House hacking: la estrategia que usan los ricos para vivir sin pagar renta.',
    costo:5000, ingresoPasivo:400, valorMercado:45000),
  CFCarta(tipo:'pequeno', emoji:'☕', titulo:'Kiosco de café',
    descripcion:'Kiosco en centro comercial operado por un empleado de tiempo parcial.',
    leccion:'Un negocio que funciona sin ti es un activo. Si no, es solo un trabajo.',
    costo:3500, ingresoPasivo:280, valorMercado:3500),
  CFCarta(tipo:'pequeno', emoji:'🧴', titulo:'Tienda online',
    descripcion:'Dropshipping de productos de bienestar. Sin inventario propio.',
    leccion:'El e-commerce permite vender globalmente con inversión mínima.',
    costo:1000, ingresoPasivo:90, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🎯', titulo:'Canal de YouTube',
    descripcion:'Canal de educación financiera con 50K suscriptores. AdSense mensual.',
    leccion:'Tu audiencia es tu activo más valioso. Construye, no alquiles atención.',
    costo:200, ingresoPasivo:70, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'👥', titulo:'Red de distribución',
    descripcion:'20 distribuidoras activas en tu equipo. Comisiones recurrentes automáticas cada mes.',
    leccion:'Una red bien entrenada trabaja para ti 24/7. Es el activo más escalable del mundo.',
    costo:500, ingresoPasivo:160, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🎤', titulo:'Taller mensual de finanzas',
    descripcion:'30 personas × \$60 = \$1,800. Una vez al mes en un café. Creció por referencias.',
    leccion:'Tu conocimiento empaquetado como evento genera ingresos recurrentes sin inventario.',
    costo:200, ingresoPasivo:80, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🧴', titulo:'Línea de productos propia',
    descripcion:'5 productos de bienestar con tu marca. Tu red los distribuye 24/7 sin que estés.',
    leccion:'Quien crea el producto captura el mayor margen de toda la cadena de valor.',
    costo:2500, ingresoPasivo:210, valorMercado:0),
  CFCarta(tipo:'pequeno', emoji:'🏋️', titulo:'Club de membresías',
    descripcion:'40 miembros activos a \$30/mes. Comunidad de bienestar y finanzas personales.',
    leccion:'Las membresías crean ingresos predecibles, retención alta y comunidad leal.',
    costo:2800, ingresoPasivo:250, valorMercado:2500),
  CFCarta(tipo:'pequeno', emoji:'📦', titulo:'Inventario al mayoreo',
    descripcion:'50 unidades al precio de costo. Tu red las vende al doble en 30 días.',
    leccion:'El margen wholesale-retail financia tu crecimiento sin recurrir a deuda externa.',
    costo:1500, ingresoPasivo:110, valorMercado:3000),
  CFCarta(tipo:'pequeno', emoji:'🤝', titulo:'Alianza de afiliados',
    descripcion:'3 socias refieren clientes a tu negocio. Pagas comisión solo cuando venden.',
    leccion:'Los afiliados convierten tus costos fijos de marketing en variables. Riesgo cero.',
    costo:0, ingresoPasivo:90, valorMercado:0),
];

// ═══════════════════════════════════════════════════════════════
//  DATOS — CARTAS GRANDES NEGOCIOS
// ═══════════════════════════════════════════════════════════════
const _grandes = [
  CFCarta(tipo:'grande', emoji:'🏢', titulo:'Edificio de apartamentos 8 unidades',
    descripcion:'8 apartamentos a \$600/mes c/u. Administradora cobra 10%. Hipoteca: \$80,000.',
    leccion:'A mayor escala, mayor eficiencia. Un edificio es más eficiente que 8 casas.',
    costo:15000, ingresoPasivo:1800, valorMercado:120000),
  CFCarta(tipo:'grande', emoji:'🏭', titulo:'Mini bodega de almacenaje',
    descripcion:'20 unidades de almacenaje alquiladas a empresas locales.',
    leccion:'Bienes raíces comerciales tienen mayor retorno que los residenciales.',
    costo:20000, ingresoPasivo:2200, valorMercado:180000),
  CFCarta(tipo:'grande', emoji:'⛽', titulo:'Estación de servicio',
    descripcion:'Estación franquiciada. El operador paga regalías mensuales.',
    leccion:'Las franquicias eliminan el riesgo de probar un modelo de negocio nuevo.',
    costo:30000, ingresoPasivo:2800, valorMercado:250000),
  CFCarta(tipo:'grande', emoji:'🏨', titulo:'Boutique hotel 10 habitaciones',
    descripcion:'Hotel en zona turística. Ocupación promedio 70%. Administrado.',
    leccion:'El turismo bien administrado genera los mayores retornos en bienes raíces.',
    costo:50000, ingresoPasivo:4500, valorMercado:400000),
  CFCarta(tipo:'grande', emoji:'🌿', titulo:'Terreno con arrendamiento',
    descripcion:'10 acres arrendados a empresa agrícola por 20 años.',
    leccion:'La tierra es el único activo que no se puede fabricar más.',
    costo:25000, ingresoPasivo:1500, valorMercado:200000),
  CFCarta(tipo:'grande', emoji:'💊', titulo:'Franquicia de farmacia',
    descripcion:'Farmacia de barrio con dueño operando. Tú recibes utilidades.',
    leccion:'Negocios de salud son resistentes a recesiones económicas.',
    costo:40000, ingresoPasivo:3200, valorMercado:320000),
  CFCarta(tipo:'grande', emoji:'🌐', titulo:'Plataforma de cursos online',
    descripcion:'500 estudiantes a \$30/mes. Automatizado con videos pregrabados y soporte IA.',
    leccion:'La tecnología escala tu conocimiento a costo marginal cero. Una vez, cobras siempre.',
    costo:18000, ingresoPasivo:1500, valorMercado:50000),
  CFCarta(tipo:'grande', emoji:'🏪', titulo:'Centro comercial 8 locales',
    descripcion:'8 locales comerciales con contratos de 3 años. Administrado por agencia especializada.',
    leccion:'Los bienes raíces comerciales generan el doble del retorno que los residenciales.',
    costo:35000, ingresoPasivo:2600, valorMercado:280000),
  CFCarta(tipo:'grande', emoji:'📡', titulo:'Agencia de marketing digital',
    descripcion:'10 clientes corporativos. Staff de 4 personas. Tú solo supervisas resultados.',
    leccion:'Un negocio que funciona sin ti es un activo. Un negocio que depende de ti, es un trabajo.',
    costo:22000, ingresoPasivo:2000, valorMercado:80000),
];

// ═══════════════════════════════════════════════════════════════
//  DATOS — PASIVOS / DOODADS
// ═══════════════════════════════════════════════════════════════
const _pasivos = [
  CFCarta(tipo:'pasivo', emoji:'🚗', titulo:'Nuevo auto de lujo',
    descripcion:'¡Sucumbiste al auto nuevo! Préstamo de \$12,000 a 60 meses.',
    leccion:'Un auto NUNCA es un activo. Es la deuda favorita de los pobres.',
    costo:2000, ingresoPasivo:-100),
  CFCarta(tipo:'pasivo', emoji:'🏖️', titulo:'Vacaciones en el Caribe',
    descripcion:'Viaje de lujo que no tenías presupuestado. \$3,000 a tarjeta.',
    leccion:'Gasta lo que sobra después de ahorrar, no lo que falta después de gastar.',
    costo:3000, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'👗', titulo:'Shopping sin control',
    descripcion:'Una tarde de compras emocionales. \$800 a la tarjeta.',
    leccion:'El marketing está diseñado para que gastes en lo que no necesitas.',
    costo:800, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'🏥', titulo:'Emergencia médica',
    descripcion:'Sin seguro médico adecuado. Factura de \$2,500.',
    leccion:'El fondo de emergencia protege tus activos de los gastos inesperados.',
    costo:2500, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'📱', titulo:'Celular último modelo',
    descripcion:'El más nuevo, sin necesitarlo. \$1,200 a crédito.',
    leccion:'Cada compra a crédito te hace trabajar más horas para el banco.',
    costo:1200, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'🎰', titulo:'Apuesta perdedora',
    descripcion:'Invertiste en cripto sin investigar. Perdiste \$2,000.',
    leccion:'Especular sin conocimiento no es invertir, es apostar.',
    costo:2000, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'🍕', titulo:'Restaurante de moda',
    descripcion:'Salidas frecuentes a restaurantes caros. \$500 extra este mes.',
    leccion:'Los pequeños gastos diarios destruyen más capital que los grandes.',
    costo:500, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'🎮', titulo:'Consola + juegos',
    descripcion:'Consola nueva y 5 juegos. \$900 a la tarjeta.',
    leccion:'El entretenimiento tiene un costo de oportunidad: ese dinero podría invertirse.',
    costo:900, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'📦', titulo:'Inventario sin rotar',
    descripcion:'Compraste de más. No se vendió. \$1,500 bloqueados sin generar retorno.',
    leccion:'Solo invierte en inventario que ya puedas vender. El flujo antes que el stock.',
    costo:1500, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'🎊', titulo:'Evento de lanzamiento caro',
    descripcion:'El evento de tu negocio costó \$1,800 más de lo planeado. A la tarjeta.',
    leccion:'Los eventos de marketing deben generar más ingresos de los que cuestan.',
    costo:1800, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'✈️', titulo:'Retiro de bienestar urgente',
    descripcion:'Retiro de 5 días para "recargarte". \$2,200 que no tenías presupuestados.',
    leccion:'El autocuidado es esencial — planifícalo como inversión, no como impulso.',
    costo:2200, ingresoPasivo:0),
  CFCarta(tipo:'pasivo', emoji:'👜', titulo:'Inversión de imagen personal',
    descripcion:'Ropa de marca, bolso, accesorios. \$1,100 porque "la imagen vende".',
    leccion:'La imagen importa, pero solo vende si hay sustancia detrás. No pongas el carro delante del caballo.',
    costo:1100, ingresoPasivo:0),
];

// ═══════════════════════════════════════════════════════════════
//  DATOS — CARTAS DE MERCADO
// ═══════════════════════════════════════════════════════════════
const _mercado = [
  CFCarta(tipo:'mercado', emoji:'📊', titulo:'Boom inmobiliario',
    descripcion:'¡El mercado sube! Tus propiedades valen 20% más. Puedes vender o refinanciar.',
    leccion:'Los ciclos de mercado son predecibles. Compra cuando baja, vende cuando sube.',
    valorMercado:20),
  CFCarta(tipo:'mercado', emoji:'📉', titulo:'Corrección del mercado',
    descripcion:'Caída del 15% en valores. Tus propiedades bajan de precio temporalmente.',
    leccion:'Las caídas del mercado son oportunidades de compra, no de pánico.',
    valorMercado:-15),
  CFCarta(tipo:'mercado', emoji:'💹', titulo:'Tasas de interés bajas',
    descripcion:'El banco central baja tasas. Más personas pueden comprar propiedades.',
    leccion:'Las tasas bajas facilitan el apalancamiento inteligente.',
    valorMercado:10),
  CFCarta(tipo:'mercado', emoji:'🏗️', titulo:'Boom de construcción',
    descripcion:'Nueva zona industrial cerca. Tu terreno o duplex vale 30% más.',
    leccion:'La ubicación estratégica multiplica el valor de tus activos.',
    valorMercado:30),
  CFCarta(tipo:'mercado', emoji:'🌱', titulo:'Economía en recuperación',
    descripcion:'Los activos recuperan valor después de la corrección. Propiedades +12%.',
    leccion:'Quien mantiene sus activos durante las crisis triunfa en la recuperación.',
    valorMercado:12),
  CFCarta(tipo:'mercado', emoji:'🌪️', titulo:'Crisis económica global',
    descripcion:'Los mercados caen fuerte. Tus activos bajan 20% temporalmente.',
    leccion:'Las crisis son el precio de entrada a la riqueza futura. Quien mantiene, gana.',
    valorMercado:-20),
  CFCarta(tipo:'mercado', emoji:'🏆', titulo:'Política de inversión favorable',
    descripcion:'Incentivos fiscales para inversionistas. Tus activos suben 25% de valor.',
    leccion:'La educación financiera te permite aprovechar cada ventana de oportunidad.',
    valorMercado:25),
];

// ═══════════════════════════════════════════════════════════════
//  SUEÑOS DE LA PISTA RÁPIDA
// ═══════════════════════════════════════════════════════════════
const _suenos = [
  '🏝️ Retirarte a una isla tropical',
  '🌍 Viajar el mundo 6 meses al año',
  '🏠 Casa propia sin hipoteca',
  '🎓 Pagar la universidad de tus hijos',
  '❤️ Fundar una organización sin fines de lucro',
  '🚀 Lanzar tu startup soñada',
];

// ═══════════════════════════════════════════════════════════════
//  TABLERO — ESPACIOS
// ═══════════════════════════════════════════════════════════════
const _tableroRuedaRata = [
  EspacioTablero.payday,
  EspacioTablero.pequenoNegocio,
  EspacioTablero.pasivo,
  EspacioTablero.pequenoNegocio,
  EspacioTablero.payday,
  EspacioTablero.pasivo,
  EspacioTablero.granNegocio,
  EspacioTablero.bebe,
  EspacioTablero.payday,
  EspacioTablero.pequenoNegocio,
  EspacioTablero.reduccion,
  EspacioTablero.pasivo,
  EspacioTablero.caridad,
  EspacioTablero.pequenoNegocio,
  EspacioTablero.payday,
  EspacioTablero.mercado,
  EspacioTablero.pasivo,
  EspacioTablero.granNegocio,
  EspacioTablero.pequenoNegocio,
  EspacioTablero.payday,
];

const _tableroRapida = [
  EspacioTablero.payday,
  EspacioTablero.granNegocio,
  EspacioTablero.payday,
  EspacioTablero.mercado,
  EspacioTablero.granNegocio,
  EspacioTablero.payday,
  EspacioTablero.sueno,
  EspacioTablero.granNegocio,
  EspacioTablero.payday,
  EspacioTablero.mercado,
  EspacioTablero.sueno,
  EspacioTablero.granNegocio,
];

// ═══════════════════════════════════════════════════════════════
//  WIDGET PRINCIPAL
// ═══════════════════════════════════════════════════════════════
class PantallaJuegoCashflow extends StatefulWidget {
  final String? roomId;
  final bool    esHost;
  const PantallaJuegoCashflow({super.key, this.roomId, this.esHost = false});
  @override
  State<PantallaJuegoCashflow> createState() => _PantallaJuegoCashflowState();
}

class _PantallaJuegoCashflowState extends State<PantallaJuegoCashflow>
    with TickerProviderStateMixin {
  // ── Estado del juego
  CFProfesion? _prof;
  int _efectivo = 0;
  int _ingresoPasivo = 0;
  int _gastosExtra = 0;       // bebés / pasivos con cuota
  int _pagosPasivos = 0;      // cuotas de nuevos pasivos
  final List<CFActivo> _activos = [];
  final List<CFPasivo> _pasivosLista = [];

  // ── Control de flujo
  bool _enPistaRapida = false;
  bool _gano = false;
  bool _reducido = false;       // downsized: pierde 2 pagos
  bool _caridad = false;        // ganó dados extra
  int _turnosReducido = 0;
  int _posicion = 0;
  int _turno = 0;
  bool _esperandoCarta = false;
  CFCarta? _cartaActual;
  String _mensajeLog = '';
  String _sueno = '';
  bool _ofreciendoPrestamo = false;
  CFCarta? _cartaParaPrestamo;
  bool _mostrarEstadoFinanciero = false;

  // ── Animaciones
  late AnimationController _diceCtrl;
  late AnimationController _cardCtrl;
  late Animation<double> _cardAnim;
  late AnimationController _victoriaCtrl;
  int _dadoValor = 0;
  bool _tirandoDado = false;

  final _rng = Random();
  List<CFCarta> _mazoPequeno = [];
  List<CFCarta> _mazoGrande  = [];
  List<CFCarta> _mazoPasivo  = [];
  List<CFCarta> _mazoMercado = [];

  // ── Multijugador ─────────────────────────────────────────────
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _roomSub;
  Map<String, Map<String, dynamic>> _otrasJugadoras = {};
  bool _mostrarLeaderboard = false;
  bool get _esMulti => widget.roomId != null;
  String _turnoActualUid = '';
  bool _turnoCompleto = false;
  bool get _esMiTurno => !_esMulti || _turnoActualUid.isEmpty || _turnoActualUid == FirebaseService.uid;

  @override
  void initState() {
    super.initState();
    _diceCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _cardCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _cardAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOutBack));
    _victoriaCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));
    _refillMazos();
    if (!_esMulti) _cargarEstado();
    if (_esMulti) _escucharRoom();
  }

  @override
  void dispose() {
    if (!_esMulti) _guardarEstado();
    _roomSub?.cancel();
    _diceCtrl.dispose();
    _cardCtrl.dispose();
    _victoriaCtrl.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────
  //  MULTIJUGADOR
  // ─────────────────────────────────────────
  void _escucharRoom() {
    final stream = FirebaseService.cashflowRoomStream(widget.roomId!);
    if (stream == null) return;
    _roomSub = stream.listen((snap) {
      if (!snap.exists || !mounted) return;
      final data = snap.data()!;
      final jugadoras = (data['jugadores'] as Map<String, dynamic>?)
          ?.map((k, v) => MapEntry(k, v as Map<String, dynamic>)) ?? {};
      jugadoras.remove(FirebaseService.uid);
      final nuevoTurno = data['turnoActualUid'] as String? ?? '';
      if (mounted) setState(() {
        _otrasJugadoras = jugadoras;
        // Si el turno cambió a nosotras, limpiar _turnoCompleto para poder tirar
        if (nuevoTurno == FirebaseService.uid && nuevoTurno != _turnoActualUid) {
          _turnoCompleto = false;
        }
        _turnoActualUid = nuevoTurno;
      });
    });
  }

  Future<void> _pasarTurno() async {
    if (!_esMulti) return;
    // Lista ordenada de todos los UIDs (yo + las demás)
    final todos = ([FirebaseService.uid!, ..._otrasJugadoras.keys]).toList()..sort();
    final idx = todos.indexOf(_turnoActualUid);
    final siguiente = todos[(idx + 1) % todos.length];
    setState(() => _turnoCompleto = false);
    await FirebaseService.pasarTurnoCashflow(widget.roomId!, siguiente);
  }

  Future<void> _sincronizarMulti() async {
    if (!_esMulti || _prof == null) return;
    await FirebaseService.updateCashflowState(widget.roomId!, {
      'posicion':      _posicion,
      'efectivo':      _efectivo,
      'ingresoPasivo': _ingresoPasivo,
      'gastosMes':     _totalGastos,
      'profNombre':    _prof!.nombre,
      'profIndex':     _profesiones.indexOf(_prof!),
      'rapida':        _enPistaRapida,
      'gano':          _gano,
      'turno':         _turno,
      'pctLibertad':   _pctLibertad,
      'ultimoEvento':  _mensajeLog.length > 80 ? _mensajeLog.substring(0, 80) : _mensajeLog,
    });
  }

  // ─────────────────────────────────────────
  //  PERSISTENCIA
  // ─────────────────────────────────────────
  Future<void> _guardarEstado() async {
    if (_esMulti || _prof == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cf_prof', _profesiones.indexOf(_prof!));
    await prefs.setInt('cf_efectivo', _efectivo);
    await prefs.setInt('cf_pasivo', _ingresoPasivo);
    await prefs.setInt('cf_extras', _gastosExtra);
    await prefs.setInt('cf_pagos', _pagosPasivos);
    await prefs.setBool('cf_rapida', _enPistaRapida);
    await prefs.setBool('cf_gano', _gano);
    await prefs.setInt('cf_pos', _posicion);
    await prefs.setInt('cf_turno', _turno);
    await prefs.setBool('cf_reducido', _reducido);
    await prefs.setInt('cf_turnosRed', _turnosReducido);
    await prefs.setString('cf_sueno', _sueno);
    await prefs.setString('cf_activos', jsonEncode(_activos.map((a) => {
      'nombre': a.nombre, 'emoji': a.emoji, 'tipo': a.tipo,
      'costo': a.costo, 'ingreso': a.ingresoPasivo,
      'valor': a.valorMercado, 'deuda': a.deuda,
    }).toList()));
    await prefs.setString('cf_pasivos_lista', jsonEncode(_pasivosLista.map((p) => {
      'nombre': p.nombre, 'deuda': p.deuda, 'pago': p.pagomensual,
    }).toList()));
  }

  Future<void> _cargarEstado() async {
    final prefs = await SharedPreferences.getInstance();
    final profIndex = prefs.getInt('cf_prof') ?? -1;
    if (profIndex < 0 || profIndex >= _profesiones.length) return;

    final activos = <CFActivo>[];
    final pasivosList = <CFPasivo>[];
    try {
      for (final a in jsonDecode(prefs.getString('cf_activos') ?? '[]') as List) {
        activos.add(CFActivo(
          nombre: a['nombre'], emoji: a['emoji'], tipo: a['tipo'],
          costo: a['costo'], ingresoPasivo: a['ingreso'],
          valorMercado: a['valor'], deuda: a['deuda'],
        ));
      }
      for (final p in jsonDecode(prefs.getString('cf_pasivos_lista') ?? '[]') as List) {
        pasivosList.add(CFPasivo(nombre: p['nombre'], deuda: p['deuda'], pagomensual: p['pago']));
      }
    } catch (_) {}

    if (!mounted) return;
    setState(() {
      _prof           = _profesiones[profIndex];
      _efectivo       = prefs.getInt('cf_efectivo') ?? _profesiones[profIndex].ahorroInicial;
      _ingresoPasivo  = prefs.getInt('cf_pasivo') ?? 0;
      _gastosExtra    = prefs.getInt('cf_extras') ?? 0;
      _pagosPasivos   = prefs.getInt('cf_pagos') ?? 0;
      _enPistaRapida  = prefs.getBool('cf_rapida') ?? false;
      _gano           = prefs.getBool('cf_gano') ?? false;
      _posicion       = prefs.getInt('cf_pos') ?? 0;
      _turno          = prefs.getInt('cf_turno') ?? 0;
      _reducido       = prefs.getBool('cf_reducido') ?? false;
      _turnosReducido = prefs.getInt('cf_turnosRed') ?? 0;
      _sueno          = prefs.getString('cf_sueno') ?? '';
      _activos.addAll(activos);
      _pasivosLista.addAll(pasivosList);
    });
  }

  void _refillMazos() {
    _mazoPequeno = List.from(_pequenos)..shuffle(_rng);
    _mazoGrande  = List.from(_grandes)..shuffle(_rng);
    _mazoPasivo  = List.from(_pasivos)..shuffle(_rng);
    _mazoMercado = List.from(_mercado)..shuffle(_rng);
  }

  CFCarta _sacarDe(List<CFCarta> mazo, List<CFCarta> fuente) {
    if (mazo.isEmpty) { mazo.addAll(fuente); mazo.shuffle(_rng); }
    return mazo.removeLast();
  }

  // ─────────────────────────────────────────
  //  Cálculos financieros
  // ─────────────────────────────────────────
  int get _totalGastos => (_prof?.totalGastos ?? 0) + _gastosExtra + _pagosPasivos;
  int get _salario     => _prof?.salario ?? 0;
  int get _cashflow    => _salario - _totalGastos + _ingresoPasivo;
  double get _pctLibertad => _totalGastos == 0 ? 0 : (_ingresoPasivo / _totalGastos).clamp(0.0, 1.0);
  bool get _esLibre    => _ingresoPasivo >= _totalGastos;

  // ─────────────────────────────────────────
  //  ELEGIR PROFESIÓN
  // ─────────────────────────────────────────
  void _elegir(CFProfesion p) {
    setState(() {
      _prof = p;
      _efectivo = p.ahorroInicial;
      _sueno = _suenos[_rng.nextInt(_suenos.length)];
      _posicion = 0;
      _turno = 0;
    });
    _sincronizarMulti();
  }

  // ─────────────────────────────────────────
  //  TIRAR DADO
  // ─────────────────────────────────────────
  Future<void> _tirarDado() async {
    if (_tirandoDado || _esperandoCarta || !_esMiTurno || _turnoCompleto) return;
    setState(() { _tirandoDado = true; _mensajeLog = ''; });
    _diceCtrl.forward(from: 0);
    SoundPlayer.dado();

    // Animación de dado
    for (int i = 0; i < 8; i++) {
      await Future.delayed(const Duration(milliseconds: 60));
      if (!mounted) return;
      setState(() { _dadoValor = _rng.nextInt(6) + 1; });
    }

    final pasos = _caridad ? _rng.nextInt(6) + _rng.nextInt(6) + 2 : _rng.nextInt(6) + 1;
    final tablero = _enPistaRapida ? _tableroRapida : _tableroRuedaRata;
    _posicion = (_posicion + pasos) % tablero.length;
    final espacio = tablero[_posicion];

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    setState(() {
      _tirandoDado = false;
      _caridad = false;
      _turno++;
    });

    await _procesarEspacio(espacio);
  }

  // ─────────────────────────────────────────
  //  PROCESAR ESPACIO DEL TABLERO
  // ─────────────────────────────────────────
  Future<void> _procesarEspacio(EspacioTablero espacio) async {
    if (_reducido && _turnosReducido < 2) {
      setState(() {
        _turnosReducido++;
        _mensajeLog = '⛔ Estás reducida (${ _turnosReducido}/2 turnos). Sin cobro.';
        if (_turnosReducido >= 2) { _reducido = false; _turnosReducido = 0; }
      });
      return;
    }

    switch (espacio) {
      case EspacioTablero.payday:
        final cobro = _cashflow;
        final anteriorEfectivo = _efectivo;
        if (cobro > 0) SoundPlayer.payday(); else SoundPlayer.pasivo();
        setState(() {
          _efectivo += cobro;
          if (cobro < 0) {
            _mensajeLog = '⚠️ DÍA DE PAGO — tus gastos superan tus ingresos.\n'
                '-\$${cobro.abs()} (Gastos \$$_totalGastos > Ingresos \${_salario + _ingresoPasivo})\n'
                '${_efectivo < 0 ? "🔴 Deuda acumulada: \$${_efectivo.abs()}. ¡Pide un préstamo!" : "Saldo: \$$_efectivo"}';
          } else if (anteriorEfectivo < 0) {
            _mensajeLog = '💰 DÍA DE PAGO +\$$cobro\nTu deuda bajó de \$${anteriorEfectivo.abs()} a '
                '${_efectivo < 0 ? "deuda \$${_efectivo.abs()}" : "saldo positivo \$$_efectivo ✅"}';
          } else {
            _mensajeLog = '💰 ¡DÍA DE PAGO! +\$$cobro\n(Salario \$$_salario + Pasivo \$$_ingresoPasivo - Gastos \$$_totalGastos)';
          }
          if (_esMulti) _turnoCompleto = true;
        });
        if (_esLibre && !_enPistaRapida) _escaparRueda();
        _guardarEstado();
        _sincronizarMulti();
        break;

      case EspacioTablero.pequenoNegocio:
        final c = _sacarDe(_mazoPequeno, _pequenos);
        setState(() { _cartaActual = c; _esperandoCarta = true; });
        _cardCtrl.forward(from: 0);
        break;

      case EspacioTablero.granNegocio:
        final c = _sacarDe(_mazoGrande, _grandes);
        setState(() { _cartaActual = c; _esperandoCarta = true; });
        _cardCtrl.forward(from: 0);
        break;

      case EspacioTablero.pasivo:
        final c = _sacarDe(_mazoPasivo, _pasivos);
        setState(() { _cartaActual = c; _esperandoCarta = true; });
        _cardCtrl.forward(from: 0);
        break;

      case EspacioTablero.reduccion:
        SoundPlayer.pasivo();
        setState(() {
          _reducido = true;
          _turnosReducido = 0;
          _mensajeLog = '📉 REDUCCIÓN DE PERSONAL\nPerdes los próximos 2 cobros de sueldo. Usa tus ahorros.';
          if (_esMulti) _turnoCompleto = true;
        });
        _guardarEstado();
        _sincronizarMulti();
        break;

      case EspacioTablero.caridad:
        final donacion = (_salario * 0.10).round();
        SoundPlayer.venta();
        setState(() {
          _efectivo = max(0, _efectivo - donacion);
          _caridad = true;
          _mensajeLog = '❤️ CARIDAD — Donas \$$donacion (10% de tu salario).\n¡Pero obtienes DADOS DOBLES en tu próxima tirada!';
          if (_esMulti) _turnoCompleto = true;
        });
        _guardarEstado();
        _sincronizarMulti();
        break;

      case EspacioTablero.bebe:
        final extra = 200 + _rng.nextInt(3) * 100;
        SoundPlayer.leccion();
        setState(() {
          _gastosExtra += extra;
          _mensajeLog = '👶 ¡BEBÉ!\nTus gastos mensuales aumentan \$$extra permanentemente.\n¡Necesitas más activos ahora!';
          if (_esMulti) _turnoCompleto = true;
        });
        _guardarEstado();
        _sincronizarMulti();
        break;

      case EspacioTablero.mercado:
        final c = _sacarDe(_mazoMercado, _mercado);
        setState(() { _cartaActual = c; _esperandoCarta = true; });
        _cardCtrl.forward(from: 0);
        break;

      case EspacioTablero.sueno:
        const costSueno = 50000;
        if (_efectivo >= costSueno) {
          SoundPlayer.victoria();
          setState(() {
            _efectivo -= costSueno;
            _mensajeLog = '🏆 ¡Compraste tu sueño: $_sueno!\n¡GANASTE el juego!';
          });
          _ganarJuego();
        } else {
          setState(() {
            _mensajeLog = '🌟 CUADRO DE SUEÑO: $_sueno\n\n'
                'Necesitas \$$costSueno para comprarlo.\n'
                'Te faltan \$${costSueno - _efectivo}.\n'
                '¡Sigue acumulando activos en la pista rápida!';
          });
        }
        break;
    }
  }

  // ─────────────────────────────────────────
  //  APLICAR CARTA
  // ─────────────────────────────────────────
  void _aplicarCarta({bool comprar = true, bool pedirPrestamo = false}) {
    if (_cartaActual == null) return;
    final carta = _cartaActual!;

    if (!comprar && carta.tipo != 'pasivo' && carta.tipo != 'mercado' && carta.tipo != 'bebe') {
      setState(() {
        _esperandoCarta = false; _cartaActual = null; _mensajeLog = '⏩ Pasaste la oportunidad.';
        if (_esMulti) _turnoCompleto = true;
      });
      return;
    }

    switch (carta.tipo) {
      case 'pequeno':
      case 'grande':
        int pagoEfectivo = carta.costo;
        int deuda = 0;
        if (pedirPrestamo) {
          deuda = (carta.costo * 0.80).round();
          pagoEfectivo = carta.costo - deuda;
        }
        if (_efectivo >= pagoEfectivo) {
          _efectivo -= pagoEfectivo;
          _ingresoPasivo += carta.ingresoPasivo;
          final cuota = pedirPrestamo ? (deuda * 0.01).round() : 0;
          if (pedirPrestamo && cuota > 0) {
            _pagosPasivos += cuota;
            _pasivosLista.add(CFPasivo(nombre: 'Préstamo ${carta.titulo}', deuda: deuda, pagomensual: cuota));
          }
          _activos.add(CFActivo(
            nombre: carta.titulo, emoji: carta.emoji, tipo: carta.tipo,
            costo: carta.costo, ingresoPasivo: carta.ingresoPasivo,
            valorMercado: carta.valorMercado > 0 ? carta.valorMercado : carta.costo,
            deuda: deuda > 0 ? deuda : null,
          ));
          SoundPlayer.compra();
          setState(() {
            _mensajeLog = '✅ Compraste: ${carta.titulo}\n+\$${carta.ingresoPasivo}/mes ingreso pasivo'
                + (pedirPrestamo ? '\n💳 Préstamo: \$$deuda | Cuota: \$$cuota/mes' : '')
                + '\n\n💡 ${carta.leccion}';
            _esperandoCarta = false;
            _cartaActual = null;
            _ofreciendoPrestamo = false;
          });
          if (_esLibre) _escaparRueda();
        } else {
          // Ofrecer préstamo si no puede pagar
          setState(() {
            _ofreciendoPrestamo = true;
            _cartaParaPrestamo = carta;
          });
        }
        break;

      case 'pasivo':
        SoundPlayer.pasivo();
        setState(() {
          _efectivo -= carta.costo;   // puede quedar negativo → deuda
          if (carta.ingresoPasivo < 0) _pagosPasivos += carta.ingresoPasivo.abs();
          _mensajeLog = _efectivo < 0
              ? '💸 Pagaste \$${carta.costo} — quedaste en deuda \$${_efectivo.abs()}.\n¡Usa el préstamo del banco para salir!\n\n💡 ${carta.leccion}'
              : '💸 Pagaste \$${carta.costo}\n\n💡 ${carta.leccion}';
          _esperandoCarta = false;
          _cartaActual = null;
        });
        break;

      case 'mercado':
        final pct = carta.valorMercado / 100;
        for (final a in _activos) {
          if (a.valorMercado > 0) a.valorMercado = (a.valorMercado * (1 + pct)).round();
        }
        if (pct > 0) SoundPlayer.correcto(); else SoundPlayer.error();
        setState(() {
          _mensajeLog = pct > 0
              ? '📊 ${carta.titulo}: Propiedades +${carta.valorMercado}%\n\n💡 ${carta.leccion}'
              : '📉 ${carta.titulo}: Propiedades ${carta.valorMercado}%\n\n💡 ${carta.leccion}';
          _esperandoCarta = false;
          _cartaActual = null;
        });
        break;
    }
    _guardarEstado();
    _sincronizarMulti();
    if (_esMulti && !_esperandoCarta) setState(() => _turnoCompleto = true);
  }

  void _escaparRueda() {
    SoundPlayer.nivel();
    setState(() {
      _enPistaRapida = true;
      _posicion = 0;
      _mensajeLog = '🏆 ¡SALISTE DE LA RUEDA DE LA RATA!\n¡Tu ingreso pasivo supera tus gastos!\nBienvenida a la PISTA RÁPIDA.';
    });
    _guardarEstado();
    _sincronizarMulti();
  }

  void _ganarJuego() {
    setState(() => _gano = true);
    _victoriaCtrl.repeat(reverse: true);
    _guardarEstado();
    _sincronizarMulti();
  }

  Future<void> _reiniciar() async {
    _victoriaCtrl.stop();
    _victoriaCtrl.reset();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cf_prof');
    if (!mounted) return;
    setState(() {
      _prof = null; _efectivo = 0; _ingresoPasivo = 0;
      _gastosExtra = 0; _pagosPasivos = 0;
      _activos.clear(); _pasivosLista.clear();
      _enPistaRapida = false; _gano = false; _reducido = false;
      _turnosReducido = 0; _posicion = 0; _turno = 0;
      _esperandoCarta = false; _cartaActual = null;
      _ofreciendoPrestamo = false; _cartaParaPrestamo = null;
      _mensajeLog = ''; _sueno = '';
      _refillMazos();
    });
  }

  // ═══════════════════════════════════════════════════════════════
  //  BUILD
  // ═══════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    if (_prof == null) return _buildSeleccion();
    if (_gano)        return _buildVictoria();
    return _buildJuego();
  }

  // ─────────────────────────────────────────
  //  SELECCIÓN DE PROFESIÓN
  // ─────────────────────────────────────────
  Widget _buildSeleccion() {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A0A1A), Color(0xFF1A0A3C)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 20),
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const Text('🎯', style: TextStyle(fontSize: 40)),
                  const SizedBox(width: 14),
                  const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('CASHFLOW 2026', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 1)),
                    Text('El juego de educación financiera', style: TextStyle(color: Colors.white54, fontSize: 13)),
                  ]),
                ]),
                const SizedBox(height: 16),
                Row(children: [
                  _miniGoal('🐀', 'Escapa la\nRueda'),
                  _miniGoalArrow(),
                  _miniGoal('🚀', 'Pista\nRápida'),
                  _miniGoalArrow(),
                  _miniGoal('🏆', 'Cumple tu\nSueño'),
                ]),
              ]),
            ),
            // Lista de profesiones
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                children: [
                  const Text('Elige tu profesión:', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 12),
                  ...List.generate(_profesiones.length, (i) => _buildProfCard(_profesiones[i])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniGoal(String emoji, String label) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 10), textAlign: TextAlign.center),
      ]),
    ),
  );

  Widget _miniGoalArrow() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 6),
    child: Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 12),
  );

  Widget _buildProfCard(CFProfesion p) {
    final cfColor = p.cashflow >= 1000 ? AppColors.neonVerde
        : p.cashflow >= 500 ? AppColors.neonAmarillo
        : AppColors.neonRosa;
    return GestureDetector(
      onTap: () => _elegir(p),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.fondoCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: cfColor.withValues(alpha: 0.35)),
          boxShadow: [BoxShadow(color: cfColor.withValues(alpha: 0.08), blurRadius: 12)],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Cabecera con emoji grande
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [cfColor.withValues(alpha: 0.18), AppColors.fondoCard],
                begin: Alignment.centerLeft,
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(children: [
              Container(
                width: 64, height: 64,
                decoration: BoxDecoration(
                  color: cfColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: cfColor.withValues(alpha: 0.5)),
                ),
                child: Center(child: Text(p.emoji, style: const TextStyle(fontSize: 36))),
              ),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(p.nombre, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text('Salario base: \$${p.salario}/mes', style: const TextStyle(color: Colors.white54, fontSize: 12)),
              ])),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('\$${p.cashflow}', style: TextStyle(color: cfColor, fontSize: 24, fontWeight: FontWeight.w900)),
                Text('cashflow', style: TextStyle(color: cfColor.withValues(alpha: 0.7), fontSize: 10, fontWeight: FontWeight.w700)),
              ]),
            ]),
          ),
          // Stats inferiores
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 2, 14, 14),
            child: Row(children: [
              _profStatBox('💵', 'Salario', '\$${p.salario}', AppColors.neonVerde),
              const SizedBox(width: 6),
              _profStatBox('💸', 'Gastos', '\$${p.totalGastos}', AppColors.neonRosa),
              const SizedBox(width: 6),
              _profStatBox('💰', 'Ahorro ini.', '\$${p.ahorroInicial}', AppColors.neonAzul),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _profStatBox(String emoji, String label, String valor, Color color) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 2),
        Text(valor, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 11)),
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 9), textAlign: TextAlign.center),
      ]),
    ),
  );

  // ─────────────────────────────────────────
  //  JUEGO PRINCIPAL
  // ─────────────────────────────────────────
  Widget _buildJuego() {
    final hayOverlay = (_esperandoCarta && _cartaActual != null) ||
        (_ofreciendoPrestamo && _cartaParaPrestamo != null);
    return Scaffold(
      backgroundColor: const Color(0xFF061206),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            if (_mostrarEstadoFinanciero)
              Expanded(child: _buildEstadoFinanciero())
            else
              Expanded(
                child: Stack(
                  children: [
                    // ── Contenido principal ──────────────────────
                    Column(children: [
                      Builder(builder: (ctx) {
                        final sz = MediaQuery.of(ctx).size;
                        final board = min(sz.width - 16.0, sz.height * 0.50).clamp(180.0, 480.0);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 6, 8, 0),
                          child: Center(
                            child: SizedBox(width: board, height: board, child: _buildTablero()),
                          ),
                        );
                      }),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Column(children: [
                            _buildStatsRow(),
                            if (_mensajeLog.isNotEmpty && !hayOverlay) ...[
                              const SizedBox(height: 8),
                              _buildLog(),
                            ],
                            if (_efectivo < 0 && !hayOverlay) ...[
                              const SizedBox(height: 8),
                              _buildPrestamoEmergencia(),
                            ],
                            if (_activos.isNotEmpty && !hayOverlay) ...[
                              const SizedBox(height: 8),
                              _buildActivosList(),
                            ],
                            const SizedBox(height: 20),
                          ]),
                        ),
                      ),
                    ]),

                    // ── Overlay carta / préstamo ──────────────────
                    if (hayOverlay)
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Fondo semitransparente
                            Expanded(child: GestureDetector(
                              onTap: () {}, behavior: HitTestBehavior.opaque,
                              child: Container(color: Colors.black.withValues(alpha: 0.45)),
                            )),
                            // Panel que sube desde abajo
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height * 0.66,
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFF0D1F0E),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                border: Border(top: BorderSide(color: Color(0xFFFFD700), width: 2)),
                              ),
                              child: Column(mainAxisSize: MainAxisSize.min, children: [
                                // Manija
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                                  child: Container(width: 44, height: 4,
                                    decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2))),
                                ),
                                Flexible(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
                                    child: _ofreciendoPrestamo && _cartaParaPrestamo != null
                                      ? _buildOfertaPrestamo()
                                      : (_cartaActual != null
                                        ? ScaleTransition(scale: _cardAnim, child: _buildCarta(_cartaActual!))
                                        : const SizedBox.shrink()),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),

                    // ── Badge multijugador ────────────────────────
                    if (_esMulti && !hayOverlay)
                      Positioned(
                        top: 8, right: 10,
                        child: GestureDetector(
                          onTap: () => setState(() => _mostrarLeaderboard = !_mostrarLeaderboard),
                          child: Stack(clipBehavior: Clip.none, children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0A2A0B),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: const Color(0xFFFFD700), width: 1.5),
                              ),
                              child: const Text('👥', style: TextStyle(fontSize: 18)),
                            ),
                            Positioned(
                              top: -4, right: -4,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(color: Color(0xFFFFD700), shape: BoxShape.circle),
                                child: Text('${_otrasJugadoras.length + 1}',
                                  style: const TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.w900)),
                              ),
                            ),
                          ]),
                        ),
                      ),

                    // ── Leaderboard overlay multijugador ──────────
                    if (_esMulti && _mostrarLeaderboard && !hayOverlay)
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () => setState(() => _mostrarLeaderboard = false),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.7),
                            child: Center(child: _buildLeaderboardMulti()),
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

  Widget _buildLeaderboardMulti() {
    final todas = <Map<String, dynamic>>[
      {
        'apodo': FirebaseService.apodo ?? 'Tú',
        'pctLibertad': _pctLibertad,
        'rapida': _enPistaRapida,
        'gano': _gano,
        'ingresoPasivo': _ingresoPasivo,
        'esYo': true,
      },
      ..._otrasJugadoras.values.map((j) => {...j, 'esYo': false}),
    ];
    todas.sort((a, b) => ((b['pctLibertad'] as num?) ?? 0)
        .compareTo((a['pctLibertad'] as num?) ?? 0));

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF0A2A0B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFFD700), width: 2),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: Color(0xFF0D3B0F),
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('🏆 Clasificación en Vivo', style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.w900, fontSize: 14)),
            ]),
          ),
          ...todas.asMap().entries.map((e) {
            final pos = e.key + 1;
            final j   = e.value;
            final apodo  = j['apodo'] as String? ?? 'Jugadora';
            final pct    = (j['pctLibertad'] as num?)?.toDouble() ?? 0.0;
            final rapida = j['rapida'] as bool? ?? false;
            final gano   = j['gano'] as bool? ?? false;
            final esYo   = j['esYo'] as bool? ?? false;
            final medal  = pos == 1 ? '🥇' : pos == 2 ? '🥈' : pos == 3 ? '🥉' : '▸';
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: esYo ? const Color(0xFFFFD700).withValues(alpha: 0.1) : Colors.transparent,
                border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.06))),
              ),
              child: Row(children: [
                Text(medal, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(apodo + (esYo ? ' (tú)' : ''),
                    style: TextStyle(color: esYo ? const Color(0xFFFFD700) : Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
                  Text(gano ? '🏆 ¡Ganó!' : rapida ? '🚀 Pista Rápida' : '🐀 Rueda Rata',
                    style: const TextStyle(color: Colors.white54, fontSize: 10)),
                ])),
                Text('${(pct * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: pct >= 1 ? const Color(0xFF4CAF50) : Colors.white70,
                    fontWeight: FontWeight.w900, fontSize: 14)),
              ]),
            );
          }),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TextButton(
              onPressed: () => setState(() => _mostrarLeaderboard = false),
              child: const Text('Cerrar', style: TextStyle(color: Colors.white38)),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildHeader() {
    final pct = _pctLibertad;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      decoration: const BoxDecoration(
        color: Color(0xFF0A1F0B),
        border: Border(bottom: BorderSide(color: Color(0xFFFFD700), width: 0.5)),
      ),
      child: Column(children: [
        Row(children: [
          GestureDetector(onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 18)),
          const SizedBox(width: 8),
          Text('${_prof!.emoji} ${_prof!.nombre}', style: AppTextStyles.cardTitle),
          if (_enPistaRapida) ...[
            const SizedBox(width: 8),
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(10)),
              child: const Text('🚀 PISTA RÁPIDA', style: TextStyle(color: AppColors.neonAmarillo, fontSize: 13, fontWeight: FontWeight.w900))),
          ],
          const Spacer(),
          GestureDetector(
            onTap: () => setState(() => _mostrarEstadoFinanciero = !_mostrarEstadoFinanciero),
            child: Container(padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(8)),
              child: const Text('📊', style: TextStyle(fontSize: 18))),
          ),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(_enPistaRapida ? '🚀 Pista Rápida' : '🐀 Rueda de la Rata',
            style: const TextStyle(color: AppColors.textoGris, fontSize: 13)),
          Text('${(pct * 100).toStringAsFixed(0)}% libre',
            style: TextStyle(color: pct >= 1 ? AppColors.neonVerde : AppColors.neonMorado, fontSize: 13, fontWeight: FontWeight.w700)),
          const Text('🏆 Libertad', style: TextStyle(color: AppColors.textoGris, fontSize: 13)),
        ]),
        const SizedBox(height: 4),
        LayoutBuilder(builder: (_, c) => Stack(children: [
          Container(height: 8, width: c.maxWidth, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(4))),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            height: 8,
            width: pct <= 0 ? 2 : (c.maxWidth * pct).clamp(5.0, c.maxWidth),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.gradienteHero),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ])),
        const SizedBox(height: 6),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            _efectivo < 0 ? '🔴 -\$${_efectivo.abs()} DEUDA' : '💰 \$$_efectivo efectivo',
            style: TextStyle(color: _efectivo < 0 ? Colors.redAccent : AppColors.neonAmarillo, fontSize: 14, fontWeight: FontWeight.w700),
          ),
          Text('Turno $_turno', style: AppTextStyles.caption),
          Text(_enPistaRapida ? '🎯 ${_sueno}' : '💡 ¡Acumula activos!',
            style: const TextStyle(color: AppColors.textoGris, fontSize: 12), overflow: TextOverflow.ellipsis),
        ]),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  TABLERO RECTANGULAR (nuevo)
  // ─────────────────────────────────────────
  Widget _buildTablero() {
    final tablero = _enPistaRapida ? _tableroRapida : _tableroRuedaRata;
    final bool isRatRace = !_enPistaRapida;
    final int nTop  = isRatRace ? 6 : 4;
    final int nSide = isRatRace ? 4 : 2;

    // Top: indices 0 .. nTop-1, L→R
    final topIdx  = List.generate(nTop,  (i) => i);
    // Right: indices nTop .. nTop+nSide-1, T→B
    final rightIdx = List.generate(nSide, (i) => nTop + i);
    // Bottom: indices nTop+nSide .. nTop+nSide+nTop-1, displayed L→R (reversed from flow)
    final botStart = nTop + nSide;
    final botIdx  = List.generate(nTop,  (i) => botStart + nTop - 1 - i);
    // Left: indices total-nSide .. total-1, displayed T→B (reversed from flow)
    final leftStart = nTop + nSide + nTop;
    final leftIdx = List.generate(nSide, (i) => leftStart + nSide - 1 - i);

    return LayoutBuilder(builder: (context, constraints) {
      final cellSize = constraints.maxWidth / nTop;
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0A2A0B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFD700), width: 2),
          boxShadow: [
            BoxShadow(color: const Color(0xFF2E7D32).withValues(alpha: 0.6), blurRadius: 20, spreadRadius: 2),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(children: topIdx.map((i) => _buildCell(i, tablero[i], cellSize)).toList()),
            SizedBox(
              height: cellSize * nSide,
              child: Row(children: [
                Column(children: leftIdx.map((i) => _buildCell(i, tablero[i], cellSize)).toList()),
                Expanded(child: _buildBoardCenter(cellSize)),
                Column(children: rightIdx.map((i) => _buildCell(i, tablero[i], cellSize)).toList()),
              ]),
            ),
            Row(children: botIdx.map((i) => _buildCell(i, tablero[i], cellSize)).toList()),
          ]),
        ),
      );
    });
  }

  Widget _buildCell(int idx, EspacioTablero espacio, double size) {
    final esActual = idx == _posicion;
    final (emoji, color) = _espacioInfo(espacio);
    final label = _espacioShortLabel(espacio);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      width: size, height: size,
      decoration: BoxDecoration(
        color: esActual ? color.withValues(alpha: 0.38) : const Color(0xFF0A2A0B),
        border: Border.all(color: const Color(0xFF1B5E20), width: 0.5),
        boxShadow: esActual ? [BoxShadow(color: color.withValues(alpha: 0.85), blurRadius: 14, spreadRadius: 2)] : null,
      ),
      child: Stack(children: [
        // Franja de color en la parte superior (estilo tablero clásico)
        Positioned(top: 0, left: 0, right: 0,
          child: Container(
            height: size * 0.28,
            color: esActual ? color : color.withValues(alpha: 0.80),
          ),
        ),
        // Número del espacio
        Positioned(top: 1, left: 2,
          child: Text('${idx + 1}',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.90),
              fontSize: size * 0.17,
              fontWeight: FontWeight.w900,
              shadows: const [Shadow(blurRadius: 2, color: Colors.black)],
            ),
          ),
        ),
        // Emoji + etiqueta debajo de la franja
        Positioned.fill(
          top: size * 0.28,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(emoji, style: TextStyle(fontSize: size * 0.33, height: 1.0)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Text(label,
                style: TextStyle(
                  color: esActual ? Colors.white : Colors.white.withValues(alpha: 0.85),
                  fontSize: size * 0.13,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.clip,
              ),
            ),
          ]),
        ),
        // Token del jugador con animación de pulso
        if (esActual)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _diceCtrl,
              builder: (_, __) {
                if (_tirandoDado) {
                  return Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Transform.rotate(
                        angle: _diceCtrl.value * 6.28,
                        child: Text('⚡', style: TextStyle(fontSize: size * 0.26)),
                      ),
                    ),
                  );
                }
                final pulse = 0.85 + 0.15 * (_diceCtrl.isAnimating ? _diceCtrl.value : 0);
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Transform.scale(
                      scale: pulse,
                      child: Text('🐭', style: TextStyle(fontSize: size * 0.32)),
                    ),
                  ),
                );
              },
            ),
          ),
      ]),
    );
  }

  Widget _buildBoardCenter(double cellSize) {
    final diceEmoji = _dadoValor > 0 ? _dadoEmoji(_dadoValor) : '🎲';
    final pct = _pctLibertad;
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xFF061206),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.55), width: 1),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(_enPistaRapida ? '🚀' : '🐀', style: TextStyle(fontSize: cellSize * 0.30)),
        Text(
          _enPistaRapida ? 'PISTA\nRÁPIDA' : 'RUEDA\nDE LA RATA',
          style: TextStyle(
            color: _enPistaRapida ? const Color(0xFFFFD700) : const Color(0xFF81C784),
            fontSize: 10.0, fontWeight: FontWeight.w900, height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        AnimatedBuilder(
          animation: _diceCtrl,
          builder: (_, __) => Transform.rotate(
            angle: _diceCtrl.value * 4 * 3.14159,
            child: Text(diceEmoji, style: TextStyle(fontSize: cellSize * 0.50)),
          ),
        ),
        if (_dadoValor > 0 && !_tirandoDado)
          Text('+$_dadoValor', style: const TextStyle(color: Color(0xFFFFD700), fontSize: 15, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        if (!_esperandoCarta && !_ofreciendoPrestamo)
          if (_esMulti && !_esMiTurno)
            // No es mi turno
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white24),
              ),
              child: const Text('⏳ Turno\ncontraria', style: TextStyle(color: Colors.white54, fontSize: 9, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
            )
          else if (_esMulti && _turnoCompleto)
            // Mi turno terminó, esperar confirmación
            GestureDetector(
              onTap: _pasarTurno,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF0D47A1), Color(0xFF1976D2)]),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.7)),
                  boxShadow: [BoxShadow(color: const Color(0xFF1976D2).withValues(alpha: 0.5), blurRadius: 8)],
                ),
                child: const Text('✅ PASAR\nTURNO', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
              ),
            )
          else
            // Mi turno activo — botón dado normal
            GestureDetector(
              onTap: _tirandoDado ? null : _tirarDado,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  gradient: _tirandoDado
                    ? const LinearGradient(colors: [Color(0xFF424242), Color(0xFF616161)])
                    : const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF4CAF50)]),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.7)),
                  boxShadow: _tirandoDado ? null : [BoxShadow(color: const Color(0xFF4CAF50).withValues(alpha: 0.5), blurRadius: 8)],
                ),
                child: Text(
                  _tirandoDado ? '🎲...' : (_caridad ? '🎲×2' : '🎲 TIRAR'),
                  style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
                ),
              ),
            ),
        const SizedBox(height: 5),
        Text('${(pct * 100).toStringAsFixed(0)}% libre',
          style: TextStyle(
            color: pct >= 1 ? const Color(0xFF4CAF50) : Colors.white38,
            fontSize: 10, fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          width: 54, height: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: pct.clamp(0.0, 1.0),
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text('T$_turno', style: const TextStyle(color: Colors.white24, fontSize: 10)),
      ]),
    );
  }

  String _espacioShortLabel(EspacioTablero e) => switch (e) {
    EspacioTablero.payday         => 'DÍA\nDE\nPAGO',
    EspacioTablero.pequenoNegocio => 'NEG.\nPEQ.',
    EspacioTablero.granNegocio    => 'NEG.\nGRD.',
    EspacioTablero.pasivo         => 'GASTO\nINES.',
    EspacioTablero.reduccion      => 'BAJA\nEMPL.',
    EspacioTablero.caridad        => 'CARI-\nDAD',
    EspacioTablero.bebe           => 'BEBÉ',
    EspacioTablero.mercado        => 'MERC.',
    EspacioTablero.sueno          => 'SUEÑO',
  };

  (String, Color) _espacioInfo(EspacioTablero e) => switch (e) {
    EspacioTablero.payday         => ('💰', const Color(0xFF2E7D32)),
    EspacioTablero.pequenoNegocio => ('💼', const Color(0xFF1565C0)),
    EspacioTablero.granNegocio    => ('🏢', const Color(0xFF6A1B9A)),
    EspacioTablero.pasivo         => ('💸', const Color(0xFFC62828)),
    EspacioTablero.reduccion      => ('📉', const Color(0xFF546E7A)),
    EspacioTablero.caridad        => ('❤️', const Color(0xFFE65100)),
    EspacioTablero.bebe           => ('👶', const Color(0xFFAD1457)),
    EspacioTablero.mercado        => ('📊', const Color(0xFFEF6C00)),
    EspacioTablero.sueno          => ('🌟', const Color(0xFFFFD700)),
  };

  Widget _buildStatsRow() {
    return Row(children: [
      Expanded(child: _statCard('📈', 'Pasivo/mes', '\$$_ingresoPasivo', AppColors.neonVerde)),
      const SizedBox(width: 8),
      Expanded(child: _statCard('💸', 'Gastos/mes', '\$$_totalGastos', AppColors.neonRosa)),
      const SizedBox(width: 8),
      Expanded(child: _statCard(
        _cashflow >= 0 ? '📊' : '⚠️', 'Cashflow',
        '\$$_cashflow', _cashflow >= 0 ? AppColors.neonVerde : Colors.red,
      )),
    ]);
  }

  Widget _statCard(String emoji, String label, String valor, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        Text(valor, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 16)),
        Text(label, style: AppTextStyles.caption, textAlign: TextAlign.center),
      ]),
    );
  }

  Widget _buildLog() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.fondoCardClaro,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.3)),
      ),
      child: Text(_mensajeLog, style: const TextStyle(color: AppColors.textoBlanco, fontSize: 15, height: 1.5)),
    );
  }

  Widget _buildCarta(CFCarta carta) {
    final (color, tipoLabel) = _cartaColor(carta.tipo);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color, width: 2),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.35), blurRadius: 24, spreadRadius: 1)],
      ),
      child: Column(children: [
        // Franja superior de color por tipo
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color.withValues(alpha: 0.45), color.withValues(alpha: 0.15)]),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: Text(tipoLabel, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 1.5), textAlign: TextAlign.center),
        ),
        // Cuerpo
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
          child: Column(children: [
            Text(carta.emoji, style: const TextStyle(fontSize: 64)),
            const SizedBox(height: 12),
            Text(carta.titulo, style: const TextStyle(color: AppColors.textoBlanco, fontSize: 22, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(carta.descripcion, style: AppTextStyles.body, textAlign: TextAlign.center),
            if (carta.tipo == 'pequeno' || carta.tipo == 'grande') ...[
              const SizedBox(height: 14),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _chip('💵 Costo \$${carta.costo}', AppColors.neonRosa),
                const SizedBox(width: 10),
                _chip('+\$${carta.ingresoPasivo}/mes', AppColors.neonVerde),
              ]),
              if (carta.valorMercado > 0) ...[
                const SizedBox(height: 8),
                _chip('🏠 Valor mercado \$${carta.valorMercado}', AppColors.neonAzul),
              ],
            ],
            if (carta.tipo == 'pasivo') ...[
              const SizedBox(height: 14),
              _chip('💸 Pierdes \$${carta.costo}', AppColors.neonRosa),
            ],
            if (carta.leccion.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.neonAmarillo.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.neonAmarillo.withValues(alpha: 0.2)),
                ),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('💡', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 10),
                  Expanded(child: Text(carta.leccion, style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 14, height: 1.5))),
                ]),
              ),
            ],
            const SizedBox(height: 16),
            if ((carta.tipo == 'pequeno' || carta.tipo == 'grande') && !_ofreciendoPrestamo)
              Row(children: [
                Expanded(child: _botonCarta('⏩ Pasar', AppColors.textoGris, () => _aplicarCarta(comprar: false))),
                const SizedBox(width: 10),
                Expanded(child: _botonCarta(
                  _efectivo >= carta.costo ? '✅ Comprar \$${carta.costo}' : '❌ Sin fondos',
                  _efectivo >= carta.costo ? AppColors.neonVerde : Colors.grey,
                  _efectivo >= carta.costo ? () => _aplicarCarta() : () => _ofrecerPrestamo(carta),
                )),
              ]),
            if (carta.tipo == 'pasivo')
              _botonCarta('Aceptar gasto', AppColors.neonRosa, () => _aplicarCarta()),
            if (carta.tipo == 'mercado')
              _botonCarta('Entendido', AppColors.neonAmarillo, () => _aplicarCarta()),
          ]),
        ),
      ]),
    );
  }

  void _ofrecerPrestamo(CFCarta carta) {
    setState(() { _ofreciendoPrestamo = true; _cartaParaPrestamo = carta; });
  }

  Widget _buildOfertaPrestamo() {
    final carta = _cartaParaPrestamo!;
    final deuda = (carta.costo * 0.80).round();
    final propio = carta.costo - deuda;
    final cuota = (deuda * 0.01).round();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neonAmarillo.withValues(alpha: 0.5)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('🏦 PRÉSTAMO BANCARIO', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        const Text('No tienes suficiente efectivo, pero el banco te puede financiar el 80%:', style: AppTextStyles.caption),
        const SizedBox(height: 10),
        _filaInfo('💵 Tu aporte (20%)', '\$$propio'),
        _filaInfo('🏦 Préstamo banco (80%)', '\$$deuda'),
        _filaInfo('💸 Cuota mensual (1%)', '\$$cuota/mes'),
        _filaInfo('📈 Ingreso pasivo', '+\$${carta.ingresoPasivo}/mes'),
        const SizedBox(height: 4),
        Text(
          _cashflow - cuota + carta.ingresoPasivo > 0
            ? '✅ Con el préstamo tu cashflow queda: \$${_cashflow - cuota + carta.ingresoPasivo}/mes'
            : '⚠️ El préstamo dejaría cashflow negativo. Cuidado.',
          style: TextStyle(
            color: _cashflow - cuota + carta.ingresoPasivo > 0 ? AppColors.neonVerde : Colors.orange,
            fontSize: 12, fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: _botonCarta('❌ Pasar', AppColors.textoGris, () {
            setState(() { _ofreciendoPrestamo = false; _esperandoCarta = false; _cartaActual = null; _cartaParaPrestamo = null; _mensajeLog = '⏩ Pasaste la oportunidad.'; });
          })),
          const SizedBox(width: 10),
          if (_efectivo >= propio)
            Expanded(child: _botonCarta('✅ Acepto préstamo', AppColors.neonVerde, () => _aplicarCarta(pedirPrestamo: true))),
        ]),
      ]),
    );
  }

  String _dadoEmoji(int n) => ['⚀','⚁','⚂','⚃','⚄','⚅'][n.clamp(1,6)-1];

  Widget _buildActivosList() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('🏦 Mis Activos', style: AppTextStyles.sectionTitle),
      const SizedBox(height: 8),
      ..._activos.map((a) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.fondoCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.3)),
        ),
        child: Row(children: [
          Text(a.emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(a.nombre, style: AppTextStyles.cardTitle),
            if (a.deuda != null)
              Text('Deuda: \$${a.deuda}', style: const TextStyle(color: AppColors.neonRosa, fontSize: 11)),
          ])),
          Text('+\$${a.ingresoPasivo}/mes', style: const TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w700, fontSize: 12)),
        ]),
      )),
    ]);
  }

  // ─────────────────────────────────────────
  //  ESTADO FINANCIERO (al tap 📊)
  // ─────────────────────────────────────────
  Widget _buildEstadoFinanciero() {
    final p = _prof!;
    final totalIngresos = _salario + _ingresoPasivo;
    final pct = _pctLibertad;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        // ── Barra de libertad financiera
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0A2A0B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.4)),
          ),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('🎯 LIBERTAD FINANCIERA', style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 0.5)),
              Text('${(pct * 100).toStringAsFixed(1)}%', style: TextStyle(
                color: pct >= 1 ? AppColors.neonVerde : const Color(0xFFFFD700),
                fontWeight: FontWeight.w900, fontSize: 16,
              )),
            ]),
            const SizedBox(height: 10),
            LayoutBuilder(builder: (_, c) => Stack(children: [
              Container(height: 12, width: c.maxWidth, decoration: BoxDecoration(
                color: Colors.white12, borderRadius: BorderRadius.circular(6))),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                height: 12,
                width: (c.maxWidth * pct).clamp(4.0, c.maxWidth),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: pct >= 1
                      ? [const Color(0xFF2E7D32), const Color(0xFF4CAF50)]
                      : [const Color(0xFF1565C0), const Color(0xFF7B1FA2)],
                  ),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(
                    color: (pct >= 1 ? AppColors.neonVerde : AppColors.neonMorado).withValues(alpha: 0.6),
                    blurRadius: 8,
                  )],
                ),
              ),
            ])),
            const SizedBox(height: 8),
            Text(
              pct >= 1
                ? '🏆 ¡Logrado! Tu pasivo supera todos tus gastos'
                : 'Pasivo \$$_ingresoPasivo cubre ${(pct * 100).toStringAsFixed(0)}% de \$$_totalGastos en gastos',
              style: TextStyle(color: pct >= 1 ? AppColors.neonVerde : Colors.white54, fontSize: 11, height: 1.3),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
        const SizedBox(height: 12),

        // ── Barras de flujo mensual
        GlassCard(
          borderColor: AppColors.neonVerde.withValues(alpha: 0.4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('📋 FLUJO MENSUAL', style: AppTextStyles.sectionTitle),
            const SizedBox(height: 14),
            const Text('INGRESOS', style: TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
            const SizedBox(height: 8),
            _barraComparativa('💵 Salario', p.salario, max(totalIngresos, 1), AppColors.neonVerde),
            const SizedBox(height: 6),
            _barraComparativa('📈 Ingreso Pasivo', _ingresoPasivo, max(totalIngresos, 1), AppColors.neonAzul),
            _filaInfo('TOTAL INGRESOS', '\$$totalIngresos', bold: true),
            const Divider(color: AppColors.textoGris, height: 20),
            const Text('GASTOS', style: TextStyle(color: AppColors.neonRosa, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
            const SizedBox(height: 8),
            _barraComparativa('🏛️ Impuestos', p.impuestos, max(_totalGastos, 1), AppColors.neonRosa),
            const SizedBox(height: 4),
            _barraComparativa('🏠 Hipoteca/Renta', p.hipoteca, max(_totalGastos, 1), AppColors.neonRosa),
            const SizedBox(height: 4),
            _barraComparativa('🚗 Auto', p.pagoAuto, max(_totalGastos, 1), Colors.orange),
            const SizedBox(height: 4),
            _barraComparativa('💳 Tarjeta', p.tarjeta, max(_totalGastos, 1), Colors.orange),
            if (p.prestamo > 0) ...[
              const SizedBox(height: 4),
              _barraComparativa('🎓 Préstamo est.', p.prestamo, max(_totalGastos, 1), Colors.deepOrange),
            ],
            const SizedBox(height: 4),
            _barraComparativa('📦 Otros', p.gastoOtros, max(_totalGastos, 1), Colors.redAccent),
            if (_gastosExtra > 0) ...[
              const SizedBox(height: 4),
              _barraComparativa('👶 Bebés/Extras', _gastosExtra, max(_totalGastos, 1), Colors.pink),
            ],
            if (_pagosPasivos > 0) ...[
              const SizedBox(height: 4),
              _barraComparativa('🏦 Cuotas préstamos', _pagosPasivos, max(_totalGastos, 1), Colors.red),
            ],
            _filaInfo('TOTAL GASTOS', '\$$_totalGastos', bold: true),
            const Divider(color: AppColors.textoGris, height: 20),
            _filaInfo('💰 CASHFLOW MENSUAL', '\$$_cashflow', bold: true,
              color: _cashflow >= 0 ? AppColors.neonVerde : Colors.red),
          ]),
        ),
        const SizedBox(height: 12),
        if (_activos.isNotEmpty) GlassCard(
          borderColor: AppColors.neonAzul.withValues(alpha: 0.4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('ACTIVOS', style: TextStyle(color: AppColors.neonAzul, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1)),
            const SizedBox(height: 8),
            ..._activos.map((a) => _filaInfo('${a.emoji} ${a.nombre}', '+\$${a.ingresoPasivo}/mes')),
          ]),
        ),
        if (_pasivosLista.isNotEmpty) ...[
          const SizedBox(height: 12),
          GlassCard(
            borderColor: AppColors.neonRosa.withValues(alpha: 0.4),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('PASIVOS', style: TextStyle(color: AppColors.neonRosa, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1)),
              const SizedBox(height: 8),
              ..._pasivosLista.map((pa) => _filaInfo(pa.nombre, 'Deuda: \$${pa.deuda} | Cuota: \$${pa.pagomensual}/mes')),
            ]),
          ),
        ],
        const SizedBox(height: 12),
        GlassCard(
          borderColor: AppColors.neonAmarillo.withValues(alpha: 0.4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('BALANCE GENERAL', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1)),
            const SizedBox(height: 8),
            _filaInfo('Efectivo', '\$$_efectivo'),
            _filaInfo('Valor activos', '\${_activos.fold(0, (s, a) => s + a.valorMercado)}'),
            _filaInfo('Deudas totales', '-\${_pasivosLista.fold(0, (s, p) => s + p.deuda)}'),
            _filaInfo('PATRIMONIO NETO', '\${_efectivo + _activos.fold(0,(s,a)=>s+a.valorMercado) - _pasivosLista.fold(0,(s,p)=>s+p.deuda)}', bold: true, color: AppColors.neonAmarillo),
          ]),
        ),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: _botonCarta('← Volver al Juego', AppColors.neonMorado,
          () => setState(() => _mostrarEstadoFinanciero = false))),
        const SizedBox(height: 40),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  VICTORIA
  // ─────────────────────────────────────────
  Widget _buildVictoria() {
    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _victoriaCtrl,
          builder: (context, _) {
            final pulse = 0.92 + 0.08 * _victoriaCtrl.value;
            final glow  = 0.35 + 0.55 * _victoriaCtrl.value;
            return Stack(
              children: [
                // Estrellas animadas de fondo
                ..._buildEstrellasFondo(),
                // Scroll principal
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  child: Column(children: [
                    const SizedBox(height: 16),
                    // Trofeo animado con glow
                    Transform.scale(
                      scale: pulse,
                      child: Container(
                        width: 140, height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [Color(0xFFFFD700), Color(0xFFFF8C00), Color(0xFF8B6914)],
                          ),
                          boxShadow: [BoxShadow(
                            color: const Color(0xFFFFD700).withValues(alpha: glow),
                            blurRadius: 50, spreadRadius: 12,
                          )],
                        ),
                        child: const Center(child: Text('🏆', style: TextStyle(fontSize: 72))),
                      ),
                    ),
                    const SizedBox(height: 22),
                    // Título con gradiente
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFFFD700), Color(0xFFFFFFFF), Color(0xFFFFD700)],
                      ).createShader(bounds),
                      child: const Text('¡LIBERTAD\nFINANCIERA!',
                        style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w900, height: 1.1, letterSpacing: 1),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Cumpliste tu sueño: $_sueno',
                      style: const TextStyle(color: Colors.white60, fontSize: 15, height: 1.4),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Stats en 3 tarjetas
                    Row(children: [
                      _victoriaStatCard('📈', 'Pasivo/mes', '\$$_ingresoPasivo', const Color(0xFF4CAF50)),
                      const SizedBox(width: 8),
                      _victoriaStatCard('🎯', '% Libertad', '${(_pctLibertad * 100).toStringAsFixed(0)}%', const Color(0xFFFFD700)),
                      const SizedBox(width: 8),
                      _victoriaStatCard('🏦', 'Activos', '${_activos.length}', const Color(0xFF2196F3)),
                    ]),
                    const SizedBox(height: 16),
                    // Resumen detallado
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D1F0E),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.35), width: 1.5),
                      ),
                      child: Column(children: [
                        const Text('📊 Tu Camino a la Libertad', style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.w900, fontSize: 14, letterSpacing: 0.5)),
                        const SizedBox(height: 14),
                        _victoriaFila('👩 Profesión', '${_prof!.emoji} ${_prof!.nombre}'),
                        _victoriaFila('🎲 Turnos jugados', '$_turno turnos'),
                        _victoriaFila('💵 Salario inicial', '\$${_prof!.salario}/mes'),
                        _victoriaFila('📈 Ingreso pasivo final', '\$$_ingresoPasivo/mes'),
                        _victoriaFila('💸 Gastos mensuales', '\$$_totalGastos/mes'),
                        _victoriaFila('✨ Excedente mensual', '\$${_ingresoPasivo - _totalGastos}/mes'),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF4CAF50).withValues(alpha: 0.3)),
                          ),
                          child: const Row(children: [
                            Text('🚀', style: TextStyle(fontSize: 22)),
                            SizedBox(width: 10),
                            Expanded(child: Text(
                              '¡Tu ingreso pasivo supera tus gastos!\nEso es la LIBERTAD FINANCIERA real.',
                              style: TextStyle(color: Color(0xFF81C784), fontSize: 12, height: 1.4),
                            )),
                          ]),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 14),
                    // Lecciones aprendidas
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A0A3C),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFF9C27B0).withValues(alpha: 0.35)),
                      ),
                      child: Column(children: [
                        const Text('💡 Lo que aprendiste hoy', style: TextStyle(color: Color(0xFFCE93D8), fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 0.5)),
                        const SizedBox(height: 12),
                        _leccionItem('Los activos ponen dinero en tu bolsillo sin que trabajes'),
                        _leccionItem('Los pasivos te quitan dinero cada mes, aunque no lo veas'),
                        _leccionItem('Libertad = Ingreso Pasivo ≥ Gastos Totales'),
                        _leccionItem('El apalancamiento inteligente acelera la riqueza'),
                        _leccionItem('Tu red y tu conocimiento son los mejores activos'),
                      ]),
                    ),
                    const SizedBox(height: 24),
                    // Botón principal
                    GestureDetector(
                      onTap: _reiniciar,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF4CAF50)]),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFFFFD700), width: 1.5),
                          boxShadow: [BoxShadow(color: const Color(0xFF4CAF50).withValues(alpha: 0.45), blurRadius: 16)],
                        ),
                        child: const Center(child: Text('🔄 Jugar de Nuevo', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900))),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('← Volver a Juegos', style: TextStyle(color: Colors.white38, fontSize: 13)),
                    ),
                    const SizedBox(height: 20),
                  ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildEstrellasFondo() {
    const posiciones = [
      [30.0, 40.0], [310.0, 55.0], [175.0, 20.0],
      [70.0, 130.0], [340.0, 145.0], [45.0, 210.0],
      [370.0, 230.0], [140.0, 190.0], [250.0, 270.0],
      [200.0, 70.0], [100.0, 290.0], [300.0, 320.0],
    ];
    return posiciones.asMap().entries.map((e) {
      final offset  = (e.key * 0.25) % 1.0;
      final animVal = (_victoriaCtrl.value + offset) % 1.0;
      final opacity = (animVal < 0.5 ? animVal * 2 : (1 - animVal) * 2).clamp(0.0, 1.0);
      final emojis  = ['⭐', '✨', '🌟', '💫'];
      final emoji   = emojis[e.key % emojis.length];
      return Positioned(
        left: e.value[0],
        top:  e.value[1],
        child: Opacity(opacity: opacity, child: Text(emoji, style: const TextStyle(fontSize: 14))),
      );
    }).toList();
  }

  Widget _victoriaStatCard(String emoji, String label, String valor, Color color) => Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 4),
        Text(valor, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 15)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 9), textAlign: TextAlign.center),
      ]),
    ),
  );

  Widget _victoriaFila(String label, String valor) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
      Text(valor, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    ]),
  );

  Widget _leccionItem(String texto) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('✓ ', style: TextStyle(color: Color(0xFF81C784), fontWeight: FontWeight.w900, fontSize: 13)),
      Expanded(child: Text(texto, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4))),
    ]),
  );

  // ─────────────────────────────────────────
  //  PRÉSTAMO DE EMERGENCIA (cuando efectivo < 0)
  // ─────────────────────────────────────────
  Widget _buildPrestamoEmergencia() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.redAccent.withValues(alpha: 0.5)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          Text('🏦', style: TextStyle(fontSize: 18)),
          SizedBox(width: 8),
          Text('BANCO DE EMERGENCIA', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w900, fontSize: 13)),
        ]),
        const SizedBox(height: 6),
        Text('Estás en deuda \$${_efectivo.abs()}. Pide \$1,000 al banco con cuota de \$100/mes.',
            style: const TextStyle(color: Colors.white60, fontSize: 12, height: 1.4)),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: _botonCarta('Pedir \$1,000 al banco (+\$100/mes gasto)', Colors.redAccent, () {
            setState(() {
              _efectivo += 1000;
              _pagosPasivos += 100;
              _pasivosLista.add(const CFPasivo(nombre: '🏦 Préstamo emergencia', deuda: 1000, pagomensual: 100));
              _mensajeLog = '🏦 Préstamo de \$1,000 recibido.\nTus gastos aumentan \$100/mes.\n¡Prioridad: construir activos para salir de la deuda!';
            });
            _guardarEstado();
          }),
        ),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  HELPERS
  // ─────────────────────────────────────────
  Widget _barraComparativa(String label, int valor, int maximo, Color color) {
    final pct = (valor / maximo).clamp(0.0, 1.0);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 11)),
        Text('\$$valor', style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 11)),
      ]),
      const SizedBox(height: 3),
      LayoutBuilder(builder: (_, c) => Stack(children: [
        Container(height: 5, width: c.maxWidth, decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(3))),
        Container(
          height: 5,
          width: (c.maxWidth * pct).clamp(2.0, c.maxWidth),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            boxShadow: [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 4)],
          ),
        ),
      ])),
    ]);
  }

  (Color, String) _cartaColor(String tipo) => switch (tipo) {
    'pequeno' => (AppColors.neonAzul,    '💼 PEQUEÑO NEGOCIO'),
    'grande'  => (AppColors.neonMorado,  '🏢 GRAN NEGOCIO'),
    'pasivo'  => (AppColors.neonRosa,    '💸 GASTO INESPERADO'),
    'mercado' => (AppColors.neonAmarillo,'📊 EVENTO DE MERCADO'),
    _         => (AppColors.neonVerde,   '💰 DÍA DE PAGO'),
  };

  Widget _chip(String label, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
    child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700)),
  );

  Widget _filaInfo(String label, String valor, {bool bold = false, Color? color}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: bold ? const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w800) : AppTextStyles.caption),
      Text(valor, style: TextStyle(color: color ?? AppColors.textoBlanco, fontWeight: bold ? FontWeight.w900 : FontWeight.w600, fontSize: bold ? 14 : 12)),
    ]),
  );

  Widget _botonCarta(String label, Color color, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
        color: color.withValues(alpha: 0.1),
      ),
      child: Center(child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 13))),
    ),
  );
}
