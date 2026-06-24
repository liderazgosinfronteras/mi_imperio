// lib/screens/pantalla_juego_vida.dart — El Juego de la Vida 2026
import 'dart:math';
import 'package:flutter/material.dart';
import '../theme.dart';

// ═══════════════════════════════════════════════════════════════
//  MODELOS
// ═══════════════════════════════════════════════════════════════
class VidaCarrera {
  final String emoji, nombre, descripcion;
  final int salario;
  final bool requiereUniv;
  const VidaCarrera({required this.emoji, required this.nombre, required this.salario,
    required this.descripcion, required this.requiereUniv});
}

enum VidaTipoCarta { cobro, oportunidad, crisis, familia, salud, inversion, logro }

class VidaCarta {
  final VidaTipoCarta tipo;
  final String emoji, titulo, descripcion, leccion;
  final int valor;
  final bool esPermanente;
  const VidaCarta({required this.tipo, required this.emoji, required this.titulo,
    required this.descripcion, required this.leccion, this.valor = 0, this.esPermanente = false});
}

class VidaEtapa {
  final String nombre, emoji, descripcion;
  final int espacios;
  const VidaEtapa({required this.nombre, required this.emoji, required this.descripcion, required this.espacios});
}

// ═══════════════════════════════════════════════════════════════
//  DATOS — CARRERAS
// ═══════════════════════════════════════════════════════════════
const _carrerasUniv = [
  VidaCarrera(emoji:'👩‍⚕️', nombre:'Médica',         salario:7500, descripcion:'Diagnóstico y tratamiento. Alta demanda, alta responsabilidad.', requiereUniv:true),
  VidaCarrera(emoji:'👩‍⚖️', nombre:'Abogada',        salario:6000, descripcion:'Derecho corporativo o familiar. Crecimiento por reputación.',    requiereUniv:true),
  VidaCarrera(emoji:'👩‍💻', nombre:'Ingeniera',      salario:5500, descripcion:'Tecnología y sistemas. Alta demanda global en 2026.',             requiereUniv:true),
  VidaCarrera(emoji:'👩‍🏫', nombre:'Psicóloga',      salario:4500, descripcion:'Salud mental y coaching. Sector en boom post-pandemia.',          requiereUniv:true),
  VidaCarrera(emoji:'📊',   nombre:'Contadora',      salario:4000, descripcion:'Finanzas empresariales. Trabajo estable y constante.',            requiereUniv:true),
];

const _carrerasTrabajo = [
  VidaCarrera(emoji:'🚀', nombre:'Emprendedora',    salario:3000, descripcion:'Negocio propio. Riesgo alto, potencial ilimitado.',               requiereUniv:false),
  VidaCarrera(emoji:'💄', nombre:'Esteticista',     salario:3500, descripcion:'Servicios de belleza. Alta demanda y propinas frecuentes.',       requiereUniv:false),
  VidaCarrera(emoji:'📱', nombre:'Creadora Digital',salario:3200, descripcion:'Contenido y redes sociales. Ingresos escalan con audiencia.',     requiereUniv:false),
  VidaCarrera(emoji:'🛠️', nombre:'Técnica',         salario:3800, descripcion:'Electricidad, plomería. Poca competencia, alta demanda.',         requiereUniv:false),
  VidaCarrera(emoji:'🏪', nombre:'Comerciante',     salario:3000, descripcion:'Tienda propia o mercado. Control total de tus ingresos.',         requiereUniv:false),
];

// ═══════════════════════════════════════════════════════════════
//  DATOS — ETAPAS
// ═══════════════════════════════════════════════════════════════
const _etapas = [
  VidaEtapa(nombre:'Joven Adulta',  emoji:'🌱', descripcion:'20-30 años. Construye tu base financiera.', espacios:25),
  VidaEtapa(nombre:'Independiente', emoji:'💪', descripcion:'30-40 años. Decisiones que definen tu futuro.', espacios:30),
  VidaEtapa(nombre:'Familia',       emoji:'👨‍👩‍👧', descripcion:'40-50 años. Equilibra familia y crecimiento.', espacios:30),
  VidaEtapa(nombre:'Consolidación', emoji:'🧠', descripcion:'50-60 años. Maximiza tu patrimonio.', espacios:25),
];

// ═══════════════════════════════════════════════════════════════
//  DATOS — CARTAS POR ETAPA
// ═══════════════════════════════════════════════════════════════
const _cartasEtapa0 = [ // Joven Adulta
  VidaCarta(tipo:VidaTipoCarta.cobro, emoji:'💰', titulo:'Cobras tu primer sueldo', descripcion:'Fin de mes. Recibes tu salario completo.', leccion:'El primer sueldo marca el inicio de tu historia financiera.', valor:0),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'📚', titulo:'Curso de habilidades', descripcion:'Inviertes \$500 en un curso que aumenta tu salario \$300/mes.', leccion:'La educación continua es la inversión con mayor retorno.', valor:300, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'🚗', titulo:'Accidente de auto', descripcion:'Sin seguro adecuado. Pagas \$2,000 de tu bolsillo.', leccion:'El seguro no es un gasto, es protección de tu patrimonio.', valor:-2000),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'💳', titulo:'Tarjeta de crédito', descripcion:'El banco te ofrece una tarjeta. ¿La usarás bien? Bonus de \$300.', leccion:'El crédito es una herramienta: úsalo bien o te controlará.', valor:300),
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'🏆', titulo:'Empleada del mes', descripcion:'Tu desempeño es reconocido. Bono especial de \$1,000.', leccion:'La excelencia siempre tiene recompensa económica.', valor:1000),
  VidaCarta(tipo:VidaTipoCarta.salud, emoji:'🏃', titulo:'Hábito de ejercicio', descripcion:'Reduces gastos médicos futuros. Ahorras \$200/mes en salud.', leccion:'Invertir en salud hoy ahorra miles en el futuro.', valor:200, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'📱', titulo:'Celular robado', descripcion:'Pierdes \$800. Sin seguro del dispositivo.', leccion:'Protege tus activos con seguros específicos.', valor:-800),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'🤝', titulo:'Red de contactos', descripcion:'Asistes a un evento de networking. Consigues cliente extra +\$500.', leccion:'Tu red de contactos vale más que tu título universitario.', valor:500),
];

const _cartasEtapa1 = [ // Independiente
  VidaCarta(tipo:VidaTipoCarta.familia, emoji:'💍', titulo:'Propuesta de matrimonio', descripcion:'Recibes una propuesta. El matrimonio tiene impacto financiero real.', leccion:'El matrimonio une patrimonios. Habla de dinero antes de decir sí.', valor:0),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'🏠', titulo:'Comprar tu primera casa', descripcion:'Hipoteca de 20 años. Pagas \$1,200/mes pero construyes patrimonio.', leccion:'Una casa propia es pasivo que se vuelve activo si la pagas.', valor:-1200, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'📈', titulo:'Fondo de inversión', descripcion:'Inviertes \$3,000 en un fondo indexado. Crece 8% anual.', leccion:'El tiempo en el mercado vence al tiempo para entrar al mercado.', valor:3000),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'💼', titulo:'Pérdida de empleo', descripcion:'Reducción de personal. Usas tu fondo de emergencia 3 meses.', leccion:'Un fondo de emergencia de 6 meses es obligatorio, no opcional.', valor:-4500),
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'🚀', titulo:'Ascenso laboral', descripcion:'Tus resultados hablan. Aumentan tu salario \$800/mes permanente.', leccion:'El valor que generas determina lo que mereces ganar.', valor:800, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.salud, emoji:'🧘', titulo:'Seguro médico completo', descripcion:'Pagas \$400/mes pero te cubre todo. Inversión en tranquilidad.', leccion:'Sin seguro médico, una enfermedad puede destruir tu patrimonio.', valor:-400, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'💡', titulo:'Negocio paralelo', descripcion:'Lanzas un proyecto extra. Genera \$600/mes adicional.', leccion:'Una segunda fuente de ingresos acelera tu libertad financiera.', valor:600, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'🏦', titulo:'Deuda de tarjeta', descripcion:'Gastos emocionales acumulados. Deuda de \$3,500 al 28% anual.', leccion:'El interés compuesto en deudas te roba el futuro. Paga rápido.', valor:-3500),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'🌍', titulo:'Trabajo remoto internacional', descripcion:'Empresa extranjera te contrata. Salario en USD, +\$1,500/mes.', leccion:'El trabajo remoto democratiza el acceso a mejores salarios.', valor:1500, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'📜', titulo:'Certificación internacional', descripcion:'Inviertes \$1,000 en certificación. Aumenta tu valor \$500/mes.', leccion:'Las credenciales globales abren puertas que el diploma local no puede.', valor:500, esPermanente:true),
];

const _cartasEtapa2 = [ // Familia
  VidaCarta(tipo:VidaTipoCarta.familia, emoji:'👶', titulo:'Bebé en camino', descripcion:'Maternidad hermosa pero costosa. +\$800/mes permanente.', leccion:'Un hijo cuesta \$200,000+ hasta los 18 años. Planifica con anticipación.', valor:-800, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'🏫', titulo:'Colegio privado o público', descripcion:'Colegio privado: \$600/mes pero mejores oportunidades futuras.', leccion:'La educación de los hijos es la herencia más duradera.', valor:-600, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'🏥', titulo:'Enfermedad familiar', descripcion:'Tratamiento médico de familiar. \$8,000 no cubiertos por seguro.', leccion:'El seguro de vida y salud protege a toda tu familia, no solo a ti.', valor:-8000),
  VidaCarta(tipo:VidaTipoCarta.inversion, emoji:'🏘️', titulo:'Propiedad de inversión', descripcion:'Compras duplex para rentar. +\$700/mes ingreso pasivo.', leccion:'Los bienes raíces pueden financiar tu jubilación sin trabajar.', valor:700, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'🎯', titulo:'Socia del negocio', descripcion:'Te ofrecen ser socia. Inviertes \$5,000, ganas \$900/mes.', leccion:'Las sociedades bien elegidas multiplican tu capital y tu tiempo.', valor:900, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'⚖️', titulo:'Divorcio inesperado', descripcion:'División de bienes. Pierdes parte de tu patrimonio (\$10,000).', leccion:'Los acuerdos prematrimoniales y finanzas separadas son protección.', valor:-10000),
  VidaCarta(tipo:VidaTipoCarta.salud, emoji:'😰', titulo:'Burnout laboral', descripcion:'Exceso de trabajo. Tomas 2 meses de licencia. Pierdes \$6,000.', leccion:'Tu salud mental es el activo que protege todos los demás.', valor:-6000),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'📊', titulo:'Acciones de empresa familiar', descripcion:'Participación en empresa exitosa. +\$500/mes dividendos.', leccion:'Los dividendos son el salario que recibes sin trabajar un día más.', valor:500, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'🏅', titulo:'Premio empresarial', descripcion:'Tu empresa recibe reconocimiento. Contratos nuevos +\$2,000/mes.', leccion:'La reputación es el activo empresarial más difícil de construir.', valor:2000, esPermanente:true),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'🌪️', titulo:'Crisis económica', descripcion:'Recesión. Ingresos bajan 30% por 6 meses. Pérdida de \$12,000.', leccion:'Diversificar ingresos es el mejor seguro contra crisis económicas.', valor:-12000),
];

const _cartasEtapa3 = [ // Consolidación
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'🎓', titulo:'Hijos en universidad', descripcion:'Pagas \$4,000/año por 4 años. Gran inversión en su futuro.', leccion:'Financiar la educación de tus hijos es el mayor regalo de vida.', valor:-4000),
  VidaCarta(tipo:VidaTipoCarta.inversion, emoji:'📈', titulo:'Portfolio diversificado', descripcion:'20 años de inversión dan frutos. Tu portfolio vale \$80,000+.', leccion:'El tiempo es el ingrediente secreto de la riqueza.', valor:80000),
  VidaCarta(tipo:VidaTipoCarta.oportunidad, emoji:'🏖️', titulo:'Retiro anticipado', descripcion:'Tus ingresos pasivos cubren tu vida. Puedes retirarte ahora.', leccion:'La libertad financiera no tiene edad: es un número, no una fecha.', valor:0),
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'💎', titulo:'Venta de empresa', descripcion:'Vendes tu negocio por \$150,000. El trabajo de años cristalizado.', leccion:'Construir para vender es una estrategia de creación de riqueza.', valor:150000),
  VidaCarta(tipo:VidaTipoCarta.salud, emoji:'🧬', titulo:'Chequeo preventivo', descripcion:'Detección temprana de condición. Tratamiento \$2,000. Vida salvada.', leccion:'La medicina preventiva cuesta el 10% de la medicina curativa.', valor:-2000),
  VidaCarta(tipo:VidaTipoCarta.inversion, emoji:'🌿', titulo:'Terrenos rurales',  descripcion:'Compraste 5 acres hace 15 años por \$10,000. Hoy valen \$60,000.', leccion:'Los activos reales se aprecian con el tiempo. La tierra no caduca.', valor:60000),
  VidaCarta(tipo:VidaTipoCarta.crisis, emoji:'🔐', titulo:'Fraude financiero', descripcion:'Estafa de inversión. Pierdes \$5,000. Nunca inviertas sin investigar.', leccion:'Si suena demasiado bueno para ser verdad, es una trampa.', valor:-5000),
  VidaCarta(tipo:VidaTipoCarta.logro, emoji:'👑', titulo:'Mentora de otras mujeres', descripcion:'Tu experiencia tiene valor. Cobras \$200/hora de consultoría.', leccion:'El conocimiento acumulado puede generar ingresos hasta los 90 años.', valor:200, esPermanente:true),
];

// ═══════════════════════════════════════════════════════════════
//  OPCIONES DE CASA
// ═══════════════════════════════════════════════════════════════
class OpcionCasa {
  final String emoji, nombre, descripcion;
  final int precio, cuotaMensual, valorFuturo;
  const OpcionCasa({required this.emoji, required this.nombre, required this.descripcion,
    required this.precio, required this.cuotaMensual, required this.valorFuturo});
}

const _casas = [
  OpcionCasa(emoji:'🏠', nombre:'Apartamento pequeño',  precio:50000,  cuotaMensual:400,  valorFuturo:80000,  descripcion:'2 habitaciones, barrio tranquilo. Ideal para empezar.'),
  OpcionCasa(emoji:'🏡', nombre:'Casa familiar',        precio:120000, cuotaMensual:850,  valorFuturo:200000, descripcion:'3 hab. + jardín. Perfecta para cuando tengas familia.'),
  OpcionCasa(emoji:'🏘️', nombre:'Casa + apartamento',   precio:180000, cuotaMensual:1200, valorFuturo:320000, descripcion:'Vives en una parte y rentas la otra. ¡Estrategia!'),
  OpcionCasa(emoji:'🏰', nombre:'Casa de lujo',         precio:350000, cuotaMensual:2200, valorFuturo:500000, descripcion:'5 hab. en zona exclusiva. Alta cuota pero gran patrimonio.'),
];

// ═══════════════════════════════════════════════════════════════
//  WIDGET PRINCIPAL
// ═══════════════════════════════════════════════════════════════
class PantallaJuegoVida extends StatefulWidget {
  const PantallaJuegoVida({super.key});
  @override
  State<PantallaJuegoVida> createState() => _PantallaJuegoVidaState();
}

class _PantallaJuegoVidaState extends State<PantallaJuegoVida> with TickerProviderStateMixin {
  // ── Fase del juego
  String _fase = 'intro'; // intro | camino | carrera | vida | jubilacion
  bool _eligioUniversidad = false;
  VidaCarrera? _carrera;

  // ── Estado financiero
  int _efectivo = 2000;
  int _salario = 0;
  int _ingresoExtra = 0;
  int _gastosCasa = 0;
  int _gastosHijos = 0;
  int _gastosExtra = 0;
  int _patrimonio = 0;
  int _deudaEducacion = 0;

  // ── Vida personal
  bool _casada = false;
  int _hijos = 0;
  bool _tieneCasa = false;
  OpcionCasa? _casa;
  int _turno = 0;
  int _etapaActual = 0;
  int _posEnEtapa = 0;
  String _mensajeLog = '';
  VidaCarta? _cartaActual;
  bool _esperandoCarta = false;
  bool _esperandoDecision = false;
  String _tipoDecision = '';
  bool _mostrarEstado = false;
  List<String> _logros = [];
  List<VidaCarta> _ingresosExtra = [];

  // ── Ruleta
  late AnimationController _ruletaCtrl;
  late Animation<double> _ruletaAnim;
  int _ruletaValor = 0;
  bool _girando = false;
  double _ruletaAngulo = 0;

  final _rng = Random();
  final List<List<VidaCarta>> _mazos = [];

  @override
  void initState() {
    super.initState();
    _ruletaCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _ruletaAnim = CurvedAnimation(parent: _ruletaCtrl, curve: Curves.decelerate);
    _ruletaCtrl.addListener(() {
      setState(() { _ruletaAngulo = _ruletaAnim.value * _ruletaValor * 2 * pi * 3; });
    });
    _inicializarMazos();
  }

  void _inicializarMazos() {
    _mazos.clear();
    _mazos.add(List.from(_cartasEtapa0)..shuffle(_rng));
    _mazos.add(List.from(_cartasEtapa1)..shuffle(_rng));
    _mazos.add(List.from(_cartasEtapa2)..shuffle(_rng));
    _mazos.add(List.from(_cartasEtapa3)..shuffle(_rng));
  }

  @override
  void dispose() {
    _ruletaCtrl.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────
  //  Cálculos
  // ─────────────────────────────────────────
  int get _totalIngresos => _salario + _ingresoExtra;
  int get _totalGastos   => _gastosCasa + _gastosHijos + _gastosExtra + (_deudaEducacion > 0 ? 500 : 0);
  int get _cashflow      => _totalIngresos - _totalGastos;
  int get _patrimonioNet => _patrimonio + _efectivo;
  int get _etapaEdad     => 20 + _etapaActual * 10;

  // ─────────────────────────────────────────
  //  GIRAR RULETA
  // ─────────────────────────────────────────
  Future<void> _girarRuleta() async {
    if (_girando || _esperandoCarta || _esperandoDecision) return;
    setState(() { _girando = true; _mensajeLog = ''; });
    final pasos = _rng.nextInt(6) + 1;
    setState(() { _ruletaValor = pasos; });
    await _ruletaCtrl.forward(from: 0);

    final etapaData = _etapas[_etapaActual];
    _posEnEtapa += pasos;
    _turno++;

    // Cobrar salario al pasar por cada espacio (simplificado)
    final cobros = pasos ~/ 3 + 1;
    for (int i = 0; i < cobros; i++) {
      _efectivo += _cashflow;
    }

    if (!mounted) return;
    setState(() {
      _girando = false;
      _mensajeLog = '🎡 Sacaste $pasos. Cobras \$${_cashflow * cobros} ($cobros pago${cobros > 1 ? 's' : ''}).';
    });

    // Avanzar etapa si se completó
    if (_posEnEtapa >= etapaData.espacios) {
      _posEnEtapa = 0;
      if (_etapaActual < _etapas.length - 1) {
        _etapaActual++;
        setState(() { _mensajeLog = '🎉 ¡Avanzas a la etapa: ${_etapas[_etapaActual].emoji} ${_etapas[_etapaActual].nombre}!'; });
      } else {
        // Jubilación
        await Future.delayed(const Duration(milliseconds: 800));
        _jubilar();
        return;
      }
    }

    // Sacar carta de la etapa actual
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    _sacarCarta();
  }

  void _sacarCarta() {
    if (_mazos[_etapaActual].isEmpty) {
      _mazos[_etapaActual] = List.from(_getCartasEtapa(_etapaActual))..shuffle(_rng);
    }
    final carta = _mazos[_etapaActual].removeLast();
    setState(() { _cartaActual = carta; _esperandoCarta = true; });
  }

  List<VidaCarta> _getCartasEtapa(int i) => [_cartasEtapa0, _cartasEtapa1, _cartasEtapa2, _cartasEtapa3][i];

  // ─────────────────────────────────────────
  //  APLICAR CARTA
  // ─────────────────────────────────────────
  void _aplicarCarta() {
    if (_cartaActual == null) return;
    final carta = _cartaActual!;
    String msg = '';

    switch (carta.tipo) {
      case VidaTipoCarta.cobro:
        final extra = carta.valor != 0 ? carta.valor : _cashflow;
        _efectivo += extra;
        msg = '💰 Cobras \$$extra extra.';
        break;

      case VidaTipoCarta.oportunidad:
      case VidaTipoCarta.logro:
      case VidaTipoCarta.inversion:
        if (carta.esPermanente && carta.valor > 0) {
          _ingresoExtra += carta.valor;
          _ingresosExtra.add(carta);
          msg = '📈 +\$${carta.valor}/mes permanente al flujo.';
        } else if (carta.esPermanente && carta.valor < 0) {
          _gastosExtra += carta.valor.abs();
          msg = '💸 -\$${carta.valor.abs()}/mes permanente a gastos.';
        } else if (carta.valor > 0) {
          if (carta.valor > 10000) {
            _patrimonio += carta.valor;
            msg = '🏆 +\$${carta.valor} sumados a tu patrimonio.';
          } else {
            _efectivo += carta.valor;
            msg = '💵 +\$${carta.valor} en efectivo.';
          }
        } else if (carta.valor < 0) {
          _efectivo = max(0, _efectivo + carta.valor);
          msg = '💸 Pagas \$${carta.valor.abs()}.';
        }
        if (carta.tipo == VidaTipoCarta.logro) _logros.add('${carta.emoji} ${carta.titulo}');
        break;

      case VidaTipoCarta.crisis:
        _efectivo = max(0, _efectivo + carta.valor);
        msg = '💸 Pagas \$${carta.valor.abs()} por esta crisis.';
        break;

      case VidaTipoCarta.familia:
        _esperandoDecision = true;
        _tipoDecision = carta.titulo.contains('matrimonio') ? 'matrimonio' : 'hijo';
        setState(() { _cartaActual = carta; _esperandoCarta = false; });
        return;

      case VidaTipoCarta.salud:
        if (carta.esPermanente && carta.valor > 0) {
          _ingresoExtra += carta.valor;
        } else if (carta.esPermanente && carta.valor < 0) {
          _gastosExtra += carta.valor.abs();
        } else if (carta.valor != 0) {
          _efectivo = max(0, _efectivo + carta.valor);
          msg = carta.valor > 0 ? '💚 Ahorras \$${carta.valor}/mes en salud.' : '🏥 Pagas \$${carta.valor.abs()} en salud.';
        }
        break;
    }

    setState(() {
      _mensajeLog = '$msg\n\n💡 ${carta.leccion}';
      _esperandoCarta = false;
      _cartaActual = null;
    });
  }

  void _tomarDecision(bool aceptar) {
    final carta = _cartaActual!;
    if (_tipoDecision == 'matrimonio') {
      if (aceptar) {
        _casada = true;
        _ingresoExtra += 1200;
        _gastosExtra += 800;
        _logros.add('💍 Matrimonio');
        setState(() { _mensajeLog = '💍 ¡Te casaste! +\$1,200/mes ingreso de pareja, +\$800/mes gastos compartidos.\n\n💡 ${carta.leccion}'; });
      } else {
        setState(() { _mensajeLog = '💔 Decidiste enfocarte en tus metas ahora. ¡Tu tiempo, tu decisión!\n\n💡 ${carta.leccion}'; });
      }
    } else {
      if (aceptar) {
        _hijos++;
        _gastosHijos += 700;
        _logros.add('👶 Maternidad');
        setState(() { _mensajeLog = '👶 ¡Bebé en camino! +\$700/mes en gastos permanentes.\n\n💡 ${carta.leccion}'; });
      } else {
        setState(() { _mensajeLog = '✨ Decidiste no tener hijos por ahora. Más capital para invertir.\n\n💡 ${carta.leccion}'; });
      }
    }
    setState(() { _esperandoDecision = false; _cartaActual = null; });
  }

  // ─────────────────────────────────────────
  //  COMPRAR CASA
  // ─────────────────────────────────────────
  void _comprarCasa(OpcionCasa casa) {
    _tieneCasa = true;
    _casa = casa;
    _gastosCasa = casa.cuotaMensual;
    _patrimonio += casa.precio;
    _logros.add('${casa.emoji} ${casa.nombre}');
    setState(() { _esperandoDecision = false; _mensajeLog = '🏠 ¡Compraste ${casa.nombre}! Cuota: \$${casa.cuotaMensual}/mes. Patrimonio +\$${casa.precio}.'; });
  }

  // ─────────────────────────────────────────
  //  JUBILACIÓN
  // ─────────────────────────────────────────
  void _jubilar() => setState(() => _fase = 'jubilacion');

  void _iniciarJuego(bool universidad) {
    setState(() {
      _eligioUniversidad = universidad;
      _fase = 'carrera';
      if (universidad) {
        _deudaEducacion = 20000;
        _efectivo = 500;
      } else {
        _efectivo = 3000;
      }
    });
  }

  void _elegirCarrera(VidaCarrera c) {
    setState(() {
      _carrera = c;
      _salario = c.salario;
      _fase = 'vida';
      _etapaActual = 0;
      _posEnEtapa = 0;
    });
  }

  void _reiniciar() {
    setState(() {
      _fase = 'intro'; _eligioUniversidad = false; _carrera = null;
      _efectivo = 2000; _salario = 0; _ingresoExtra = 0;
      _gastosCasa = 0; _gastosHijos = 0; _gastosExtra = 0;
      _patrimonio = 0; _deudaEducacion = 0;
      _casada = false; _hijos = 0; _tieneCasa = false; _casa = null;
      _turno = 0; _etapaActual = 0; _posEnEtapa = 0;
      _mensajeLog = ''; _cartaActual = null; _esperandoCarta = false;
      _esperandoDecision = false; _tipoDecision = '';
      _logros.clear(); _ingresosExtra.clear();
      _inicializarMazos();
    });
  }

  // ═══════════════════════════════════════════════════════════════
  //  BUILD
  // ═══════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(child: switch (_fase) {
        'intro'       => _buildIntro(),
        'carrera'     => _buildEligirCarrera(),
        'vida'        => _buildVida(),
        'jubilacion'  => _buildJubilacion(),
        _             => _buildIntro(),
      }),
    );
  }

  // ─────────────────────────────────────────
  //  PANTALLA INTRO
  // ─────────────────────────────────────────
  Widget _buildIntro() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco)),
        const SizedBox(height: 20),
        const Text('🎡 EL JUEGO DE LA VIDA', style: TextStyle(color: AppColors.textoBlanco, fontSize: 26, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        const Text('Educación Financiera 2026', style: AppTextStyles.body),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF0D47A1), Color(0xFF1565C0), Color(0xFF1976D2)]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('🎯 ¿CÓMO JUGAR?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
            SizedBox(height: 10),
            _InfoRow('🎡', 'Gira la ruleta (1-10) para avanzar en tu vida'),
            _InfoRow('🃏', 'Enfrenta eventos reales de cada etapa de tu vida'),
            _InfoRow('💰', 'Cobras tu salario con cada avance'),
            _InfoRow('🏠', 'Decide: matrimonio, hijos, casa, inversiones'),
            _InfoRow('🏆', 'Llega a la jubilación con el mayor patrimonio neto'),
          ]),
        ),
        const SizedBox(height: 24),
        const Text('¿Cuál es tu primer gran decisión?', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 14),
        // Universidad
        GestureDetector(
          onTap: () => _iniciarJuego(true),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF4A148C), Color(0xFF6A1B9A)]),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.5)),
            ),
            child: Row(children: [
              const Text('🎓', style: TextStyle(fontSize: 44)),
              const SizedBox(width: 16),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('IR A LA UNIVERSIDAD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                SizedBox(height: 4),
                Text('Deuda estudiantil: \$20,000', style: TextStyle(color: Colors.red, fontSize: 12)),
                Text('Acceso a carreras de alto salario', style: TextStyle(color: Colors.white70, fontSize: 12)),
                Text('Empieza con menos efectivo', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ])),
              const Icon(Icons.arrow_forward_ios, color: Colors.white54),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        // Trabajo directo
        GestureDetector(
          onTap: () => _iniciarJuego(false),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)]),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.neonVerde.withValues(alpha: 0.5)),
            ),
            child: Row(children: [
              const Text('💼', style: TextStyle(fontSize: 44)),
              const SizedBox(width: 16),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('TRABAJAR DIRECTO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                SizedBox(height: 4),
                Text('Sin deuda estudiantil', style: TextStyle(color: Colors.green, fontSize: 12)),
                Text('Empieza a ganar desde ya', style: TextStyle(color: Colors.white70, fontSize: 12)),
                Text('Salarios ligeramente menores', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ])),
              const Icon(Icons.arrow_forward_ios, color: Colors.white54),
            ]),
          ),
        ),
        const SizedBox(height: 20),
        GlassCard(
          borderColor: AppColors.neonAmarillo.withValues(alpha: 0.3),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('💡 Dato real', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800)),
            SizedBox(height: 6),
            Text('Un profesional universitario gana en promedio 84% más que alguien sin título — pero la deuda estudiantil tarda 10-15 años en recuperarse. ¡No hay respuesta correcta, depende de tu plan!', style: AppTextStyles.caption),
          ]),
        ),
        const SizedBox(height: 40),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  ELEGIR CARRERA
  // ─────────────────────────────────────────
  Widget _buildEligirCarrera() {
    final carreras = _eligioUniversidad ? _carrerasUniv : _carrerasTrabajo;
    final titulo = _eligioUniversidad ? '🎓 Elige tu carrera universitaria' : '💼 Elige tu camino profesional';
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(titulo, style: AppTextStyles.heroTitle),
        const SizedBox(height: 6),
        Text(_eligioUniversidad
          ? 'Estudiate 4 años. Deuda: \$20,000. Ahora escoge tu especialidad.'
          : 'Comienzas a trabajar de inmediato con \$3,000 ahorrados.',
          style: AppTextStyles.body),
        const SizedBox(height: 20),
        ...carreras.map((c) => GestureDetector(
          onTap: () => _elegirCarrera(c),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.fondoCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.neonAzul.withValues(alpha: 0.3)),
            ),
            child: Row(children: [
              Text(c.emoji, style: const TextStyle(fontSize: 34)),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c.nombre, style: AppTextStyles.cardTitle),
                Text(c.descripcion, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                _chip('💵 \$${c.salario}/mes', AppColors.neonVerde),
              ])),
              const Icon(Icons.arrow_forward_ios, color: AppColors.textoGris, size: 16),
            ]),
          ),
        )),
        const SizedBox(height: 40),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  PANTALLA DE VIDA
  // ─────────────────────────────────────────
  Widget _buildVida() {
    return Column(children: [
      _buildHeaderVida(),
      Expanded(
        child: _mostrarEstado ? _buildEstadoFinanciero() : SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(children: [
            _buildMapaEtapas(),
            const SizedBox(height: 14),
            _buildRuleta(),
            const SizedBox(height: 14),
            _buildStatsRow(),
            if (_mensajeLog.isNotEmpty) ...[const SizedBox(height: 10), _buildLog()],
            if (_esperandoCarta && _cartaActual != null) ...[const SizedBox(height: 12), _buildCarta()],
            if (_esperandoDecision) ...[const SizedBox(height: 12), _buildDecision()],
            if (!_esperandoCarta && !_esperandoDecision && !_tieneCasa && _etapaActual >= 1) ...[
              const SizedBox(height: 12), _buildOfertaCasa(),
            ],
            const SizedBox(height: 40),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildHeaderVida() {
    final etapa = _etapas[_etapaActual];
    final progresoGlobal = _etapaActual / _etapas.length;
    final progresoEtapa = etapa.espacios == 0 ? 0.0 : (_posEnEtapa / etapa.espacios).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      color: AppColors.fondoCard,
      child: Column(children: [
        Row(children: [
          GestureDetector(onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: AppColors.textoBlanco, size: 18)),
          const SizedBox(width: 8),
          Text('${etapa.emoji} ${etapa.nombre}', style: AppTextStyles.cardTitle),
          const Spacer(),
          Text('~${_etapaEdad} años', style: AppTextStyles.caption),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => setState(() => _mostrarEstado = !_mostrarEstado),
            child: Container(padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(8)),
              child: const Text('📋', style: TextStyle(fontSize: 16))),
          ),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('💰 \$$_efectivo', style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 12, fontWeight: FontWeight.w700)),
          Text('Turno $_turno', style: AppTextStyles.caption),
          Row(children: [
            if (_casada) const Text('💍 ', style: TextStyle(fontSize: 14)),
            if (_hijos > 0) Text('👶×$_hijos ', style: const TextStyle(fontSize: 12)),
            if (_tieneCasa) const Text('🏠', style: TextStyle(fontSize: 14)),
          ]),
        ]),
        const SizedBox(height: 5),
        // Progreso dentro de la etapa actual
        Row(children: [
          Expanded(child: LayoutBuilder(builder: (_, c) => Stack(children: [
            Container(height: 6, width: c.maxWidth, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(3))),
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              height: 6,
              width: (c.maxWidth * progresoEtapa).clamp(4.0, c.maxWidth),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF42A5F5), Color(0xFF90CAF9)]),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ]))),
          const SizedBox(width: 8),
          Text('$_posEnEtapa/${etapa.espacios}', style: const TextStyle(color: AppColors.textoGris, fontSize: 10)),
        ]),
        const SizedBox(height: 3),
        // Progreso global (qué etapa estás)
        LayoutBuilder(builder: (_, c) => Stack(children: [
          Container(height: 4, width: c.maxWidth, decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(2))),
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            height: 4,
            width: (c.maxWidth * progresoGlobal).clamp(2.0, c.maxWidth),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1565C0), Color(0xFF42A5F5)]),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ])),
      ]),
    );
  }

  Widget _buildMapaEtapas() {
    return Row(
      children: List.generate(_etapas.length, (i) {
        final e = _etapas[i];
        final esActual = i == _etapaActual;
        final pasada = i < _etapaActual;
        return Expanded(
          child: Row(children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: esActual ? const Color(0xFF1565C0).withValues(alpha: 0.3) : pasada ? AppColors.neonVerde.withValues(alpha: 0.1) : AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: esActual ? const Color(0xFF42A5F5) : pasada ? AppColors.neonVerde.withValues(alpha: 0.5) : Colors.transparent),
                ),
                child: Column(children: [
                  Text(pasada ? '✅' : e.emoji, style: const TextStyle(fontSize: 16)),
                  Text(e.nombre.split(' ').first, style: TextStyle(color: esActual ? Colors.white : AppColors.textoGris, fontSize: 9, fontWeight: esActual ? FontWeight.w800 : FontWeight.normal)),
                ]),
              ),
            ),
            if (i < _etapas.length - 1)
              Icon(Icons.arrow_forward, color: i < _etapaActual ? AppColors.neonVerde : AppColors.textoGris, size: 12),
          ]),
        );
      }),
    );
  }

  Widget _buildRuleta() {
    return Center(
      child: GestureDetector(
        onTap: _girando || _esperandoCarta || _esperandoDecision ? null : _girarRuleta,
        child: AnimatedBuilder(
          animation: _ruletaCtrl,
          builder: (_, __) => Column(children: [
            Container(
              width: 130, height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF0D47A1), Color(0xFF1565C0), Color(0xFF1976D2)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                boxShadow: [BoxShadow(color: const Color(0xFF1565C0).withValues(alpha: 0.6), blurRadius: 20, spreadRadius: 4)],
                border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),
              ),
              child: Stack(alignment: Alignment.center, children: [
                Transform.rotate(
                  angle: _ruletaAngulo,
                  child: CustomPaint(size: const Size(120, 120), painter: _RuletaPainter()),
                ),
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.fondoOscuro,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 1.5),
                  ),
                  child: Center(
                    child: Text(
                      _girando ? '?' : (_ruletaValor > 0 ? '$_ruletaValor' : '🎡'),
                      style: TextStyle(color: Colors.white, fontSize: _girando ? 20 : (_ruletaValor > 0 ? 22 : 16), fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 10),
            Text(
              _girando ? 'Girando...' : (_esperandoCarta || _esperandoDecision ? 'Responde la carta' : '¡GIRAR RULETA!'),
              style: TextStyle(
                color: _girando || _esperandoCarta || _esperandoDecision ? AppColors.textoGris : Colors.white,
                fontWeight: FontWeight.w900, fontSize: 14,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(children: [
      Expanded(child: _statCard('💵', 'Salario', '\$$_totalIngresos', AppColors.neonVerde)),
      const SizedBox(width: 8),
      Expanded(child: _statCard('💸', 'Gastos', '\$$_totalGastos', AppColors.neonRosa)),
      const SizedBox(width: 8),
      Expanded(child: _statCard('📊', 'Cashflow', '\$$_cashflow', _cashflow >= 0 ? AppColors.neonVerde : Colors.red)),
    ]);
  }

  Widget _statCard(String emoji, String label, String valor, Color color) => Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(color: color.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withValues(alpha: 0.3))),
    child: Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 18)),
      Text(valor, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 13)),
      Text(label, style: AppTextStyles.caption, textAlign: TextAlign.center),
    ]),
  );

  Widget _buildLog() => Container(
    width: double.infinity, padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.neonMorado.withValues(alpha: 0.3))),
    child: Text(_mensajeLog, style: const TextStyle(color: AppColors.textoBlanco, fontSize: 13, height: 1.5)),
  );

  Widget _buildCarta() {
    final carta = _cartaActual!;
    final color = _cartaTipoColor(carta.tipo);
    final label = _cartaTipoLabel(carta.tipo);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.fondoCard, borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 20)],
      ),
      child: Column(children: [
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
        const SizedBox(height: 10),
        Text(carta.emoji, style: const TextStyle(fontSize: 44)),
        const SizedBox(height: 10),
        Text(carta.titulo, style: const TextStyle(color: AppColors.textoBlanco, fontSize: 18, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text(carta.descripcion, style: AppTextStyles.body, textAlign: TextAlign.center),
        if (carta.valor != 0) ...[
          const SizedBox(height: 10),
          _chip(
            carta.valor > 0
              ? (carta.esPermanente ? '+\$${carta.valor}/mes' : '+\$${carta.valor}')
              : (carta.esPermanente ? '-\$${carta.valor.abs()}/mes' : 'Pagas \$${carta.valor.abs()}'),
            carta.valor > 0 ? AppColors.neonVerde : AppColors.neonRosa,
          ),
        ],
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            const Text('💡', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Expanded(child: Text(carta.leccion, style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 11, height: 1.4))),
          ]),
        ),
        const SizedBox(height: 14),
        SizedBox(width: double.infinity, child: GestureDetector(
          onTap: _aplicarCarta,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(gradient: const LinearGradient(colors: AppColors.gradienteHero), borderRadius: BorderRadius.circular(12)),
            child: const Center(child: Text('Continuar →', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15))),
          ),
        )),
      ]),
    );
  }

  Widget _buildDecision() {
    final carta = _cartaActual;
    if (_tipoDecision == 'matrimonio' && !_casada) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.neonRosa, width: 2)),
        child: Column(children: [
          const Text('💍 PROPUESTA DE MATRIMONIO', style: TextStyle(color: AppColors.neonRosa, fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1)),
          const SizedBox(height: 14),
          const Text('💍', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 10),
          const Text('¿Te casas?', style: TextStyle(color: AppColors.textoBlanco, fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text('Casarse suma \$1,200/mes de ingreso de pareja pero +\$800/mes en gastos compartidos. Neto: +\$400/mes.', style: AppTextStyles.body, textAlign: TextAlign.center),
          const SizedBox(height: 14),
          if (carta != null) Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(10)),
            child: Text('💡 ${carta.leccion}', style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 11, height: 1.4)),
          ),
          const SizedBox(height: 14),
          Row(children: [
            Expanded(child: _botonDecision('💔 No por ahora', AppColors.textoGris, () => _tomarDecision(false))),
            const SizedBox(width: 10),
            Expanded(child: _botonDecision('💍 ¡Sí acepto!', AppColors.neonRosa, () => _tomarDecision(true))),
          ]),
        ]),
      );
    }
    // Hijo
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.fondoCard, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFEC407A), width: 2)),
      child: Column(children: [
        const Text('👶 DECISIÓN FAMILIAR', style: TextStyle(color: Color(0xFFEC407A), fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1)),
        const SizedBox(height: 14),
        const Text('👶', style: TextStyle(fontSize: 44)),
        const SizedBox(height: 10),
        Text('¿Tener ${_hijos == 0 ? 'tu primer hijo' : 'otro hijo'}?', style: const TextStyle(color: AppColors.textoBlanco, fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        const Text('Un hijo aumenta tus gastos mensuales en \$700. Pero es una experiencia de vida invaluable.', style: AppTextStyles.body, textAlign: TextAlign.center),
        const SizedBox(height: 14),
        if (carta != null) Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: AppColors.neonAmarillo.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(10)),
          child: Text('💡 ${carta.leccion}', style: const TextStyle(color: AppColors.neonAmarillo, fontSize: 11, height: 1.4)),
        ),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(child: _botonDecision('❌ No aún', AppColors.textoGris, () => _tomarDecision(false))),
          const SizedBox(width: 10),
          Expanded(child: _botonDecision('👶 ¡Sí, adelante!', const Color(0xFFEC407A), () => _tomarDecision(true))),
        ]),
      ]),
    );
  }

  Widget _buildOfertaCasa() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.fondoCard, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neonAmarillo.withValues(alpha: 0.5)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('🏠 ¿COMPRAR TU CASA?', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        const Text('Comprar casa = cuota mensual, pero construyes patrimonio.', style: AppTextStyles.caption),
        const SizedBox(height: 12),
        ..._casas.map((c) => GestureDetector(
          onTap: _efectivo >= c.precio * 0.1 ? () => _comprarCasa(c) : null,
          child: Opacity(
            opacity: _efectivo >= c.precio * 0.1 ? 1.0 : 0.5,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.fondoCardClaro, borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.neonAmarillo.withValues(alpha: 0.2)),
              ),
              child: Row(children: [
                Text(c.emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(c.nombre, style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700, fontSize: 13)),
                  Text(c.descripcion, style: AppTextStyles.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Row(children: [
                    _chip('Cuota: \$${c.cuotaMensual}/mes', AppColors.neonRosa),
                    const SizedBox(width: 6),
                    _chip('Val: \$${c.valorFuturo}', AppColors.neonVerde),
                  ]),
                ])),
              ]),
            ),
          ),
        )),
        TextButton(
          onPressed: () => setState(() => _mensajeLog = '🏠 Decides seguir alquilando por ahora. ¡No hay apuro!'),
          child: const Text('No comprar ahora', style: TextStyle(color: AppColors.textoGris)),
        ),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  ESTADO FINANCIERO
  // ─────────────────────────────────────────
  Widget _buildEstadoFinanciero() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        GlassCard(borderColor: AppColors.neonVerde.withValues(alpha: 0.4), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('📋 ESTADO FINANCIERO', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 12),
          const Text('INGRESOS', style: TextStyle(color: AppColors.neonVerde, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
          const SizedBox(height: 6),
          _filaInfo('Salario ${_carrera?.nombre ?? ''}', '\$${_carrera?.salario ?? 0}'),
          if (_ingresoExtra > 0) _filaInfo('Ingresos extra / pasivos', '+\$$_ingresoExtra'),
          _filaInfo('TOTAL INGRESOS', '\$$_totalIngresos', bold: true),
          const Divider(color: AppColors.textoGris, height: 20),
          const Text('GASTOS', style: TextStyle(color: AppColors.neonRosa, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
          const SizedBox(height: 6),
          if (_gastosCasa > 0) _filaInfo('Hipoteca / ${_casa?.nombre ?? 'Casa'}', '\$$_gastosCasa'),
          if (_gastosHijos > 0) _filaInfo('Hijos ($_hijos)', '\$$_gastosHijos'),
          if (_gastosExtra > 0) _filaInfo('Otros gastos', '\$$_gastosExtra'),
          if (_deudaEducacion > 0) _filaInfo('Cuota deuda universitaria', '\$500'),
          _filaInfo('TOTAL GASTOS', '\$$_totalGastos', bold: true),
          const Divider(color: AppColors.textoGris, height: 20),
          _filaInfo('💰 CASHFLOW MENSUAL', '\$$_cashflow', bold: true, color: _cashflow >= 0 ? AppColors.neonVerde : Colors.red),
        ])),
        const SizedBox(height: 12),
        GlassCard(borderColor: AppColors.neonAmarillo.withValues(alpha: 0.4), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('PATRIMONIO', style: TextStyle(color: AppColors.neonAmarillo, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
          const SizedBox(height: 8),
          _filaInfo('Efectivo / Ahorros', '\$$_efectivo'),
          if (_tieneCasa && _casa != null) _filaInfo('Valor inmueble', '\$${_casa!.valorFuturo}'),
          if (_patrimonio > 0) _filaInfo('Inversiones / Activos', '\$$_patrimonio'),
          if (_deudaEducacion > 0) _filaInfo('Deuda estudiantil', '-\$$_deudaEducacion'),
          _filaInfo('PATRIMONIO NETO', '\$$_patrimonioNet', bold: true, color: AppColors.neonAmarillo),
        ])),
        if (_logros.isNotEmpty) ...[
          const SizedBox(height: 12),
          GlassCard(borderColor: AppColors.neonMorado.withValues(alpha: 0.4), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('🏆 LOGROS', style: TextStyle(color: AppColors.neonMorado, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1)),
            const SizedBox(height: 8),
            ..._logros.map((l) => Padding(padding: const EdgeInsets.symmetric(vertical: 2), child: Text('• $l', style: AppTextStyles.caption))),
          ])),
        ],
        const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: _botonDecision('← Volver al Juego', AppColors.neonAzul, () => setState(() => _mostrarEstado = false))),
        const SizedBox(height: 40),
      ]),
    );
  }

  // ─────────────────────────────────────────
  //  JUBILACIÓN
  // ─────────────────────────────────────────
  Widget _buildJubilacion() {
    final patrimonioCasa = _tieneCasa && _casa != null ? _casa!.valorFuturo : 0;
    final totalFinal = _efectivo + patrimonioCasa + _patrimonio;
    final nivel = totalFinal >= 500000 ? '👑 Millonaria' : totalFinal >= 200000 ? '🌟 Próspera' : totalFinal >= 80000 ? '✅ Estable' : '📈 En crecimiento';
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('🏖️', style: TextStyle(fontSize: 70)),
          const SizedBox(height: 16),
          const Text('¡LLEGASTE A LA\nJUBILACIÓN!', style: TextStyle(color: AppColors.neonAmarillo, fontSize: 28, fontWeight: FontWeight.w900, height: 1.2), textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(nivel, style: const TextStyle(color: AppColors.textoBlanco, fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
          GlassCard(borderColor: AppColors.neonVerde.withValues(alpha: 0.5), child: Column(children: [
            const Text('📊 Tu Historia Financiera', style: AppTextStyles.cardTitle),
            const SizedBox(height: 12),
            _filaInfo('Carrera', '${_carrera?.emoji ?? ''} ${_carrera?.nombre ?? ''}'),
            _filaInfo('Camino', _eligioUniversidad ? '🎓 Universidad' : '💼 Trabajo directo'),
            if (_casada) _filaInfo('Estado civil', '💍 Casada'),
            if (_hijos > 0) _filaInfo('Hijos', '👶 × $_hijos'),
            if (_tieneCasa && _casa != null) _filaInfo('Vivienda', '${_casa!.emoji} ${_casa!.nombre}'),
            _filaInfo('Logros obtenidos', '${_logros.length}'),
            _filaInfo('Turnos jugados', '$_turno'),
          ])),
          const SizedBox(height: 12),
          GlassCard(borderColor: AppColors.neonAmarillo.withValues(alpha: 0.5), child: Column(children: [
            const Text('💰 Patrimonio Final', style: AppTextStyles.sectionTitle),
            const SizedBox(height: 10),
            _filaInfo('Efectivo y ahorros', '\$$_efectivo'),
            if (patrimonioCasa > 0) _filaInfo('Valor inmueble', '\$$patrimonioCasa'),
            if (_patrimonio > 0) _filaInfo('Inversiones', '\$$_patrimonio'),
            const Divider(color: AppColors.textoGris, height: 20),
            _filaInfo('🏆 TOTAL', '\$$totalFinal', bold: true, color: AppColors.neonAmarillo),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: AppColors.neonVerde.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
              child: Text('Cashflow mensual en jubilación: \$$_cashflow',
                style: TextStyle(color: _cashflow > 0 ? AppColors.neonVerde : AppColors.neonRosa, fontWeight: FontWeight.w800, fontSize: 13), textAlign: TextAlign.center),
            ),
          ])),
          const SizedBox(height: 16),
          GlassCard(borderColor: AppColors.neonAzul.withValues(alpha: 0.3), child: const Column(children: [
            Text('🎓 Lecciones del Juego', style: AppTextStyles.cardTitle),
            SizedBox(height: 10),
            Text('• Las decisiones de los 20s determinan tu jubilación', style: AppTextStyles.body),
            SizedBox(height: 4),
            Text('• Casa + inversiones + negocio = patrimonio sólido', style: AppTextStyles.body),
            SizedBox(height: 4),
            Text('• La educación continua sube el salario permanentemente', style: AppTextStyles.body),
            SizedBox(height: 4),
            Text('• Los seguros protegen el patrimonio de las crisis', style: AppTextStyles.body),
            SizedBox(height: 4),
            Text('• El tiempo en los mercados supera al timing perfecto', style: AppTextStyles.body),
          ])),
          const SizedBox(height: 24),
          SizedBox(width: double.infinity, child: NeonButton(label: 'Jugar de Nuevo', emoji: '🔄', onPressed: _reiniciar, gradientColors: [const Color(0xFF0D47A1), const Color(0xFF1976D2)])),
          const SizedBox(height: 12),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Volver a la Academia', style: TextStyle(color: AppColors.textoGris))),
          const SizedBox(height: 40),
        ]),
      )),
    );
  }

  // ─────────────────────────────────────────
  //  HELPERS
  // ─────────────────────────────────────────
  Color _cartaTipoColor(VidaTipoCarta t) => switch (t) {
    VidaTipoCarta.cobro     => AppColors.neonVerde,
    VidaTipoCarta.oportunidad => const Color(0xFF42A5F5),
    VidaTipoCarta.logro     => AppColors.neonAmarillo,
    VidaTipoCarta.inversion => AppColors.neonVerde,
    VidaTipoCarta.crisis    => AppColors.neonRosa,
    VidaTipoCarta.familia   => const Color(0xFFEC407A),
    VidaTipoCarta.salud     => const Color(0xFF66BB6A),
  };

  String _cartaTipoLabel(VidaTipoCarta t) => switch (t) {
    VidaTipoCarta.cobro     => '💰 INGRESO',
    VidaTipoCarta.oportunidad => '🚀 OPORTUNIDAD',
    VidaTipoCarta.logro     => '🏆 LOGRO',
    VidaTipoCarta.inversion => '📈 INVERSIÓN',
    VidaTipoCarta.crisis    => '⚠️ CRISIS',
    VidaTipoCarta.familia   => '👨‍👩‍👧 FAMILIA',
    VidaTipoCarta.salud     => '💚 SALUD',
  };

  Widget _chip(String label, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
    child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700)),
  );

  Widget _filaInfo(String label, String valor, {bool bold = false, Color? color}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: bold ? const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w800) : AppTextStyles.caption),
      Text(valor, style: TextStyle(color: color ?? AppColors.textoBlanco, fontWeight: bold ? FontWeight.w900 : FontWeight.w600, fontSize: bold ? 14 : 12)),
    ]),
  );

  Widget _botonDecision(String label, Color color, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(border: Border.all(color: color), borderRadius: BorderRadius.circular(12), color: color.withValues(alpha: 0.1)),
      child: Center(child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 13))),
    ),
  );
}

// ─────────────────────────────────────────
//  PINTOR DE RULETA
// ─────────────────────────────────────────
class _RuletaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const sections = 10;
    const angleStep = 2 * pi / sections;
    final colors = [
      const Color(0xFF1565C0), const Color(0xFF1976D2), const Color(0xFF0D47A1),
      const Color(0xFF1E88E5), const Color(0xFF1565C0), const Color(0xFF283593),
      const Color(0xFF1976D2), const Color(0xFF0D47A1), const Color(0xFF1565C0), const Color(0xFF1E88E5),
    ];
    final paint = Paint()..style = PaintingStyle.fill;
    final borderPaint = Paint()..color = Colors.white.withValues(alpha: 0.15) ..style = PaintingStyle.stroke ..strokeWidth = 0.5;
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < sections; i++) {
      final startAngle = i * angleStep - pi / 2;
      paint.color = colors[i % colors.length];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, angleStep, true, paint);
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, angleStep, true, borderPaint);

      final textAngle = startAngle + angleStep / 2;
      final textRadius = radius * 0.68;
      final x = center.dx + textRadius * cos(textAngle);
      final y = center.dy + textRadius * sin(textAngle);

      textPainter.text = TextSpan(text: '${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900));
      textPainter.layout();
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(textAngle + pi / 2);
      textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// Helper widget
class _InfoRow extends StatelessWidget {
  final String emoji, texto;
  const _InfoRow(this.emoji, this.texto);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Row(children: [
      Text(emoji, style: const TextStyle(fontSize: 16)),
      const SizedBox(width: 8),
      Expanded(child: Text(texto, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4))),
    ]),
  );
}
