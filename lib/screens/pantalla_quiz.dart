// lib/screens/pantalla_quiz.dart — Quiz Financiero Caminito 🧠
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/app_provider.dart';
import '../theme.dart';
import '../utils/sound_player.dart';

// ══════════════════════════════════════════════════════════════
//  DATA MODELS
// ══════════════════════════════════════════════════════════════
class _PQ {
  final String texto, explicacion, emoji;
  final List<String> opciones;
  final int correcta;
  const _PQ({required this.texto, required this.explicacion, required this.emoji,
    required this.opciones, required this.correcta});
}

class _Nivel {
  final int id;
  final String titulo, emoji, descripcion, dificultad;
  final List<Color> gradiente;
  final List<_PQ> preguntas;
  const _Nivel({required this.id, required this.titulo, required this.emoji,
    required this.descripcion, required this.dificultad,
    required this.gradiente, required this.preguntas});
}

// Mezcla las opciones de una pregunta y actualiza el índice de la correcta
_PQ _shuffleOpciones(_PQ p, Random rng) {
  final indexed = p.opciones.asMap().entries.toList()..shuffle(rng);
  return _PQ(
    texto: p.texto,
    explicacion: p.explicacion,
    emoji: p.emoji,
    opciones: indexed.map((e) => e.value).toList(),
    correcta: indexed.indexWhere((e) => e.key == p.correcta),
  );
}

// ══════════════════════════════════════════════════════════════
//  100 PREGUNTAS — 10 NIVELES × 10 PREGUNTAS
// ══════════════════════════════════════════════════════════════
final List<_Nivel> _niveles = [

  // ── NIVEL 1: Conceptos Básicos ────────────────────────────
  _Nivel(
    id: 0, titulo: 'Conceptos Básicos', emoji: '💰',
    descripcion: 'El ABC del dinero y las finanzas personales',
    dificultad: '⭐ Principiante',
    gradiente: const [Color(0xFF11998E), Color(0xFF38EF7D)],
    preguntas: const [
      _PQ(
        emoji: '💰', texto: '¿Para qué sirve principalmente el dinero?',
        opciones: ['Para coleccionarlo','Para intercambiar bienes y servicios','Solo para los adultos','Para guardarlo bajo el colchón'],
        correcta: 1,
        explicacion: 'El dinero es un medio de intercambio que facilita el comercio entre personas. Sin dinero, usaríamos el trueque.',
      ),
      _PQ(
        emoji: '🛍️', texto: '¿Cuál es la diferencia entre una necesidad y un deseo?',
        opciones: ['No hay diferencia','Las necesidades son esenciales para vivir; los deseos son extras','Los deseos son más importantes','Solo los ricos tienen deseos'],
        correcta: 1,
        explicacion: 'Necesidades: comida, vivienda, ropa básica. Deseos: artículos de lujo, entretenimiento. Conocer la diferencia es clave para un presupuesto sano.',
      ),
      _PQ(
        emoji: '📉', texto: '¿Qué es la inflación?',
        opciones: ['Cuando el banco te da más dinero','Cuando los precios suben y tu dinero compra menos','Cuando ganas más salario','Una forma de inversión'],
        correcta: 1,
        explicacion: 'La inflación reduce el poder de compra de tu dinero. Si tienes \$100 bajo el colchón un año, en realidad valen menos al final del año.',
      ),
      _PQ(
        emoji: '🧮', texto: 'Si ganas \$500 al mes y gastas \$600, ¿qué está pasando?',
        opciones: ['Estás ahorrando \$100','Estás en déficit: gastas más de lo que ganas','Estás invirtiendo bien','Estás pagando deudas correctamente'],
        correcta: 1,
        explicacion: 'Gastar más de lo que ganas crea deudas. El primer paso es que tus ingresos sean MAYORES que tus gastos.',
      ),
      _PQ(
        emoji: '🏦', texto: '¿Qué es el presupuesto personal?',
        opciones: ['Una cuenta bancaria especial','Un plan de cuánto vas a ganar, gastar e invertir','Un tipo de préstamo','Un estado de cuenta'],
        correcta: 1,
        explicacion: 'El presupuesto te da el control de tu dinero ANTES de que lo gastes. Sin plan, el dinero desaparece sin que sepas a dónde fue.',
      ),
      _PQ(
        emoji: '💵', texto: '¿Cuál de estos es un ejemplo de ingreso?',
        opciones: ['Pagar la renta','Comprar comida','Cobrar por una venta LSF','Pagar los servicios del hogar'],
        correcta: 2,
        explicacion: 'El ingreso es todo el dinero que ENTRA a tu bolsillo: ventas, comisiones, bonos, premios de LSF.',
      ),
      _PQ(
        emoji: '🏪', texto: '¿Cuál de estos es un ejemplo de gasto?',
        opciones: ['Recibir comisión mensual','Cobrar a un cliente','Pagar el inventario de productos','Recibir un bono de liderazgo'],
        correcta: 2,
        explicacion: 'El gasto es todo el dinero que SALE de tu bolsillo. El inventario es un gasto del negocio, aunque después lo recuperes con ventas.',
      ),
      _PQ(
        emoji: '📊', texto: 'El dinero que te queda después de pagar todos tus gastos se llama:',
        opciones: ['Deuda','Inversión','Flujo de efectivo positivo','Préstamo bancario'],
        correcta: 2,
        explicacion: 'Flujo de efectivo positivo = Ingresos - Gastos > 0. Es la señal de que tu negocio es saludable.',
      ),
      _PQ(
        emoji: '🌱', texto: '¿Cuál es el primer paso hacia la independencia financiera?',
        opciones: ['Ganar mucho dinero','Gastar menos de lo que ganas','Invertir en la bolsa inmediatamente','Pedir un préstamo para invertir'],
        correcta: 1,
        explicacion: 'Gastar menos de lo que ganas crea un excedente que puedes invertir o ahorrar. Sin ese excedente, no hay punto de partida.',
      ),
      _PQ(
        emoji: '🎯', texto: '¿Qué es el patrimonio neto?',
        opciones: ['Todo el dinero que ganas en un mes','Lo que posees menos lo que debes','El total de tus deudas','Tu salario anual'],
        correcta: 1,
        explicacion: 'Patrimonio neto = Activos - Pasivos (deudas). Si tienes \$10,000 en activos y \$3,000 en deudas, tu patrimonio es \$7,000.',
      ),
    ],
  ),

  // ── NIVEL 2: Ingresos y Presupuesto ──────────────────────
  _Nivel(
    id: 1, titulo: 'Ingresos y Presupuesto', emoji: '⚖️',
    descripcion: 'Domina tu flujo de dinero cada mes',
    dificultad: '⭐ Principiante',
    gradiente: const [Color(0xFF0072FF), Color(0xFF00C6FF)],
    preguntas: const [
      _PQ(
        emoji: '💼', texto: '¿Qué son los ingresos activos?',
        opciones: ['Dinero que ganas mientras duermes','Dinero que ganas solo cuando trabajas directamente','Intereses de inversiones','Dividendos de acciones'],
        correcta: 1,
        explicacion: 'Ingresos activos requieren tu tiempo directo: ventas, trabajo, servicios. El objetivo es también crear ingresos PASIVOS.',
      ),
      _PQ(
        emoji: '🛌', texto: '¿Qué son los ingresos pasivos?',
        opciones: ['Dinero que recibes sin trabajar activamente, como renta o dividendos','El sueldo mensual de un trabajo','Las comisiones de ventas directas','Los bonos anuales de desempeño'],
        correcta: 0,
        explicacion: 'Los ingresos pasivos llegan aunque no estés trabajando activamente: renta de una propiedad, dividendos de acciones, regalías.',
      ),
      _PQ(
        emoji: '📋', texto: '¿Cuál es la regla básica del presupuesto 50/30/20?',
        opciones: ['50% ahorro, 30% entretenimiento, 20% gastos básicos','50% necesidades, 30% deseos, 20% ahorro e inversión','50% inversión, 30% gastos, 20% deudas','50% trabajo, 30% familia, 20% hobbies'],
        correcta: 1,
        explicacion: 'La regla 50/30/20: 50% para necesidades básicas, 30% para lo que deseas, y 20% para ahorro e inversión.',
      ),
      _PQ(
        emoji: '🎯', texto: 'En LSF, la regla es 30% reinversión, 40% estilo de vida, 30% cashflow. ¿Cuánto va al negocio de \$300 en ventas?',
        opciones: ['\$40','\$90','\$120','\$60'],
        correcta: 1,
        explicacion: '30% de \$300 = \$90 van de regreso al negocio como reinversión. Así el negocio sigue creciendo.',
      ),
      _PQ(
        emoji: '💸', texto: '¿Cuál es la diferencia entre gastos fijos y variables?',
        opciones: ['No hay diferencia','Los fijos cambian cada mes; los variables son iguales siempre','Los fijos son iguales cada mes; los variables cambian','Los fijos son más importantes'],
        correcta: 2,
        explicacion: 'Gastos fijos: renta, seguros (iguales cada mes). Variables: comida, entretenimiento (cambian). Conocerlos te ayuda a presupuestar mejor.',
      ),
      _PQ(
        emoji: '📅', texto: '¿Cada cuánto deberías revisar tu presupuesto?',
        opciones: ['Solo cuando tengas problemas de dinero','Al menos una vez al mes','Una vez al año','Solo cuando cambie tu trabajo'],
        correcta: 1,
        explicacion: 'Revisar el presupuesto mensualmente te permite ajustar, detectar fugas de dinero y celebrar avances hacia tus metas.',
      ),
      _PQ(
        emoji: '🧾', texto: '¿Qué es un gasto hormiga?',
        opciones: ['Gastos muy grandes y raros','Pequeños gastos frecuentes que suman mucho al mes','Impuestos que pagas','Gastos del gobierno'],
        correcta: 1,
        explicacion: 'Los gastos hormiga (café diario, snacks, apps) parecen insignificantes pero suman \$50-\$200 al mes. ¡Identifícalos y elimínalos!',
      ),
      _PQ(
        emoji: '🔢', texto: 'Vendiste \$200 esta semana. Materiales costaron \$50. ¿Cuál es tu ganancia real?',
        opciones: ['\$200','\$250','\$150','\$100'],
        correcta: 2,
        explicacion: 'Ganancia = Ingresos - Costos. \$200 - \$50 = \$150. Siempre resta los costos antes de calcular tu ganancia real.',
      ),
      _PQ(
        emoji: '🏆', texto: '¿Qué es el margen de ganancia?',
        opciones: ['El precio de venta de tu producto','La diferencia entre lo que cobras y lo que te cuesta producir, en porcentaje','El número de clientes que tienes','Los impuestos que pagas al gobierno'],
        correcta: 1,
        explicacion: 'Si tu producto cuesta \$3 y lo vendes en \$10, tu margen es \$7/\$10 = 70%. ¡Siempre conoce tus márgenes!',
      ),
      _PQ(
        emoji: '📈', texto: '¿Cuál es la forma más efectiva de aumentar tu flujo de efectivo?',
        opciones: ['Solo reducir gastos','Solo aumentar ventas','Aumentar ingresos Y reducir gastos innecesarios al mismo tiempo','Pedir un préstamo'],
        correcta: 2,
        explicacion: 'La combinación más poderosa: más ingresos + menos gastos innecesarios = más dinero disponible para invertir y crecer.',
      ),
    ],
  ),

  // ── NIVEL 3: Ahorro Inteligente ────────────────────────────
  _Nivel(
    id: 2, titulo: 'Ahorro Inteligente', emoji: '🐷',
    descripcion: 'El primer paso hacia la libertad financiera',
    dificultad: '⭐⭐ Básico+',
    gradiente: const [Color(0xFFFC466B), Color(0xFF3F5EFB)],
    preguntas: const [
      _PQ(
        emoji: '🐷', texto: '¿Cuál es el objetivo principal del fondo de emergencia?',
        opciones: ['Invertir en la bolsa','Cubrir gastos imprevistos sin endeudarte','Pagar vacaciones','Comprar lujos cuando quieras'],
        correcta: 1,
        explicacion: 'El fondo de emergencia es tu red de seguridad. Sin él, un gasto inesperado (enfermedad, reparación) te obliga a endeudarte.',
      ),
      _PQ(
        emoji: '💰', texto: '¿Cuántos meses de gastos debe tener tu fondo de emergencia?',
        opciones: ['1 semana','1 mes','3 a 6 meses','10 años'],
        correcta: 2,
        explicacion: 'Los expertos recomiendan 3-6 meses de gastos básicos. Así si pierdes un ingreso, tienes tiempo para recuperarte sin pánico.',
      ),
      _PQ(
        emoji: '🏦', texto: 'El dinero del fondo de emergencia debe estar:',
        opciones: ['Invertido en acciones de alto riesgo','En criptomonedas para que crezca rápido','En un lugar seguro y de fácil acceso, como una cuenta de ahorro','Bajo el colchón en efectivo'],
        correcta: 2,
        explicacion: 'Debe ser ACCESIBLE (no en inversiones que tarden en liberar) y SEGURO (no en activos volátiles). Una cuenta de ahorro bancaria es ideal.',
      ),
      _PQ(
        emoji: '📊', texto: 'El ahorro bajo el colchón pierde valor porque:',
        opciones: ['Los billetes se deterioran físicamente','La inflación hace que ese dinero compre menos con el tiempo','Los bancos te cobran por no depositar','Es ilegal guardar efectivo en casa'],
        correcta: 1,
        explicacion: 'Si la inflación es 5% anual, tus \$1,000 bajo el colchón compran lo mismo que \$950 al año siguiente. ¡El dinero estático retrocede!',
      ),
      _PQ(
        emoji: '🎯', texto: '¿Cuál es la estrategia "págate primero a ti misma"?',
        opciones: ['Gastar en lo que quieras antes de pagar cuentas','Separar tu porcentaje de ahorro/inversión en cuanto entra el dinero, antes de gastar','Comprar ropa nueva el primer día del mes','Pagar deudas antes de comer'],
        correcta: 1,
        explicacion: '¡Este es el hábito más poderoso! Apenas llegue tu dinero, separa automáticamente tu ahorro e inversión. Lo que queda es para gastos.',
      ),
      _PQ(
        emoji: '🚗', texto: 'Quieres comprar un auto de \$15,000. La forma más inteligente es:',
        opciones: ['Pedir un crédito al banco inmediatamente','Ahorrar \$5,000 y pedir crédito por \$10,000 con buena tasa','Usar la tarjeta de crédito al máximo','Conseguir el auto más caro porque "te lo mereces"'],
        correcta: 1,
        explicacion: 'El enganche reduce el monto del crédito y los intereses totales. Ahorrar primero demuestra disciplina y te ahorra dinero.',
      ),
      _PQ(
        emoji: '💎', texto: 'Si ahorras \$100 al mes durante 12 meses, ¿cuánto tienes?',
        opciones: ['\$100','\$1,000','\$1,200','\$2,400'],
        correcta: 2,
        explicacion: '\$100 × 12 meses = \$1,200. La constancia transforma pequeñas cantidades en montos significativos.',
      ),
      _PQ(
        emoji: '🌟', texto: '¿Qué es el ahorro automático?',
        opciones: ['Que el banco ahorre por ti sin pedirte nada','Configurar transferencias automáticas a tu cuenta de ahorro cada quincena','Usar una app que ahorra tus monedas del cambio','Ahorrar solo cuando tienes dinero extra'],
        correcta: 1,
        explicacion: 'El ahorro automático elimina la tentación de gastar. Programas la transferencia y el dinero desaparece de tu cuenta de gastos antes de que te acostumbres a él.',
      ),
      _PQ(
        emoji: '🏆', texto: '¿Cuál es la diferencia entre ahorrar e invertir?',
        opciones: ['Son exactamente lo mismo','Ahorrar es guardar dinero seguro (bajo rendimiento); invertir es arriesgar para ganar más','Invertir es más seguro que ahorrar','Solo los ricos pueden invertir'],
        correcta: 1,
        explicacion: 'Ahorrar = preservar. Invertir = hacer crecer. Necesitas ambos: ahorro para emergencias, inversión para construir riqueza a largo plazo.',
      ),
      _PQ(
        emoji: '⏰', texto: '¿A qué edad es mejor empezar a ahorrar e invertir?',
        opciones: ['A los 40, cuando ya tienes dinero','A los 30, cuando tienes trabajo estable','¡Lo antes posible! El tiempo es tu mayor aliado','A los 60, cerca de la jubilación'],
        correcta: 2,
        explicacion: '¡El tiempo es tu superpoder! \$1,000 invertidos a los 20 años valen MUCHO más a los 65 que \$1,000 invertidos a los 45, gracias al interés compuesto.',
      ),
    ],
  ),

  // ── NIVEL 4: Deudas y Crédito ──────────────────────────────
  _Nivel(
    id: 3, titulo: 'Deudas y Crédito', emoji: '💳',
    descripcion: 'Usa el crédito a tu favor, no en tu contra',
    dificultad: '⭐⭐ Básico+',
    gradiente: const [Color(0xFFFF6B35), Color(0xFFF7C59F)],
    preguntas: const [
      _PQ(
        emoji: '💳', texto: '¿Cuál es la diferencia entre deuda buena y deuda mala?',
        opciones: ['Toda deuda es mala','La deuda buena te ayuda a generar más dinero; la mala financia consumo','La deuda buena tiene tasa de interés alta','La deuda mala es la del banco'],
        correcta: 1,
        explicacion: 'Deuda buena: invertir en un negocio que genera más que el costo del préstamo. Deuda mala: financiar vacaciones, ropa o lujos con crédito.',
      ),
      _PQ(
        emoji: '📊', texto: '¿Qué es la tasa de interés en un crédito?',
        opciones: ['El tiempo para pagar','El costo que pagas por usar dinero prestado','El seguro del préstamo','La comisión del banco por abrirte la cuenta'],
        correcta: 1,
        explicacion: 'Si pides \$1,000 a 20% anual, después de un año debes \$1,200. La tasa es el "precio" del dinero prestado.',
      ),
      _PQ(
        emoji: '💸', texto: 'Tienes una deuda de \$5,000 al 30% anual y un ahorro de \$5,000. ¿Qué conviene más?',
        opciones: ['Dejar el ahorro intacto e ir pagando la deuda a plazos','Usar el ahorro para pagar la deuda inmediatamente','Invertir el ahorro y pagar la deuda mínimos','Pedir otro préstamo para pagar el primero'],
        correcta: 1,
        explicacion: 'Si tu ahorro gana 5% y tu deuda cobra 30%, pagas más de lo que ganas. Eliminar la deuda de alto interés es la mejor "inversión".',
      ),
      _PQ(
        emoji: '🏦', texto: '¿Qué factores afectan tu historial crediticio?',
        opciones: ['Solo el dinero que tienes en el banco','Pagos a tiempo, deuda usada vs límite, antigüedad del crédito, tipos de crédito','Solo si eres mayor de 30 años','El color de tu tarjeta de crédito'],
        correcta: 1,
        explicacion: 'Tu historial crediticio determina a qué tasas de interés puedes acceder. Buen historial = mejores condiciones de crédito.',
      ),
      _PQ(
        emoji: '🎯', texto: 'La estrategia "bola de nieve" para pagar deudas consiste en:',
        opciones: ['Pagar todas las deudas en partes iguales','Pagar primero la deuda de mayor saldo','Pagar primero la deuda más pequeña, y al liquidarla usar ese pago para la siguiente','Ignorar las deudas pequeñas'],
        correcta: 2,
        explicacion: 'Pagar la más pequeña primero da motivación. Luego ese dinero liberado ataca la siguiente. ¡La bola de nieve crece con cada deuda liquidada!',
      ),
      _PQ(
        emoji: '❗', texto: '¿Cuál es el mayor riesgo de las tarjetas de crédito?',
        opciones: ['Que te la roben','Que solo funcionen en grandes tiendas','Pagar solo el mínimo y acumular intereses que multiplican la deuda','Que caduquen rápido'],
        correcta: 2,
        explicacion: 'Si debes \$1,000 al 40% y solo pagas el mínimo, puedes tardar AÑOS en liquidar y terminar pagando el doble o más.',
      ),
      _PQ(
        emoji: '📱', texto: '¿Qué porcentaje máximo de tu límite de crédito debes usar para proteger tu historial?',
        opciones: ['100% — para eso es el límite','75%','50%','30% o menos'],
        correcta: 3,
        explicacion: 'Usar más del 30% de tu límite afecta negativamente tu puntaje de crédito. Mantente por debajo del 30% para un historial excelente.',
      ),
      _PQ(
        emoji: '🚨', texto: 'Una amiga te ofrece un préstamo "sin intereses" a cambio de venderte su inventario. ¿Qué debes evaluar?',
        opciones: ['Aceptar inmediatamente, ¡es gratis!','Los costos reales del inventario, si puedes venderlo y el impacto en la relación','Rechazarlo siempre','Solo aceptar si firma un contrato notarial'],
        correcta: 1,
        explicacion: 'Mezclar dinero y amistad es riesgoso. Evalúa si realmente puedes vender ese inventario y si el precio es justo antes de aceptar.',
      ),
      _PQ(
        emoji: '💰', texto: '¿Cuándo usar la tarjeta de crédito de forma inteligente?',
        opciones: ['Para comprar cosas que no puedo pagar de contado','Solo para emergencias absolutas','Para compras que pagaré en su totalidad antes de la fecha límite','Para aprovechar el crédito disponible al máximo'],
        correcta: 2,
        explicacion: 'La tarjeta como herramienta: la usas, acumulas puntos/millas, y la pagas completa. Así no pagas intereses y te beneficias de los rewards.',
      ),
      _PQ(
        emoji: '🔑', texto: 'La clave para manejar bien las deudas es:',
        opciones: ['Nunca endeudarte','Endeudarte solo en deudas que generan más de lo que cuestan','Usar todo el crédito disponible','Pedir prestado a amigos en lugar de bancos'],
        correcta: 1,
        explicacion: 'El crédito es una herramienta. Usada estratégicamente (negocio, educación, propiedades que generan ingreso) construye riqueza. Usada para consumo, la destruye.',
      ),
    ],
  ),

  // ── NIVEL 5: Activos y Pasivos ────────────────────────────
  _Nivel(
    id: 4, titulo: 'Activos y Pasivos', emoji: '🏦',
    descripcion: 'El secreto de los ricos según Kiyosaki',
    dificultad: '⭐⭐⭐ Intermedio',
    gradiente: const [Color(0xFF667EEA), Color(0xFF764BA2)],
    preguntas: const [
      _PQ(
        emoji: '🏦', texto: '¿Qué es un ACTIVO según Robert Kiyosaki?',
        opciones: ['Todo lo que posees y tiene valor','Algo que PONE dinero en tu bolsillo','Tu ropa y zapatos de diseñador','Tu celular nuevo de \$1,500'],
        correcta: 1,
        explicacion: 'Un activo genera ingresos: acciones, negocio, propiedad rentada. ¡Ricos coleccionan activos, no cosas!',
      ),
      _PQ(
        emoji: '🚗', texto: '¿Un auto nuevo es activo o pasivo (según Kiyosaki)?',
        opciones: ['Activo — porque vale dinero','Pasivo — porque genera gastos: seguro, gasolina, mantenimiento','Activo — te lleva al trabajo','Activo si cuesta más de \$20,000'],
        correcta: 1,
        explicacion: 'A menos que uses el auto para ganar dinero (taxi, delivery), es un pasivo: saca dinero de tu bolsillo cada mes.',
      ),
      _PQ(
        emoji: '🏠', texto: '¿Tu casa en la que vives es un activo o pasivo?',
        opciones: ['Siempre activo — ¡es una propiedad!','Depende: si la rentas parcialmente es activo; si solo vives ahí, es un pasivo','Siempre pasivo','Solo activo si vale más de \$200,000'],
        correcta: 1,
        explicacion: 'Tu casa principal SACA dinero de tu bolsillo (hipoteca, mantenimiento, impuestos). Una propiedad que rentas METE dinero = activo.',
      ),
      _PQ(
        emoji: '📱', texto: 'Compraste un celular nuevo a crédito para "trabajar mejor". ¿Es activo o pasivo?',
        opciones: ['Activo — lo usas para el negocio','Pasivo — la deuda del crédito te quita más de lo que el celular genera','Activo si tiene buena cámara','Depende de la marca'],
        correcta: 1,
        explicacion: 'El celular no genera ingresos por sí solo; el crédito sí genera gastos (intereses). Evalúa si el ROI (retorno) supera el costo antes de comprar.',
      ),
      _PQ(
        emoji: '📈', texto: '¿Cuál de estos es un ACTIVO claro?',
        opciones: ['Zapatos de diseñador en tu clóset','Bolso de lujo de \$3,000','Acciones de una empresa que paga dividendos','Colección de ropa de temporada'],
        correcta: 2,
        explicacion: 'Las acciones que pagan dividendos te generan ingresos periódicos. Eso las convierte en activos según la definición de Kiyosaki.',
      ),
      _PQ(
        emoji: '🏋️', texto: 'Una membresía de gimnasio que no usas es:',
        opciones: ['Un activo para tu salud','Un pasivo: pagas pero no generas valor','Neutral, no cuenta','Un activo si vas a yoga'],
        correcta: 1,
        explicacion: 'Las membresías no usadas son pasivos puros: dinero que sale sin beneficio. Cancélalas y usa ese dinero para invertir.',
      ),
      _PQ(
        emoji: '💡', texto: 'Una distribuidora LSF exitosa construye activos cuando:',
        opciones: ['Compra mucho inventario al inicio','Gasta en imagen y ropa para presentaciones','Usa sus comisiones para comprar acciones o propiedades que generan ingresos','Solo ahorra en el banco'],
        correcta: 2,
        explicacion: 'Tu negocio LSF genera ingreso activo. Cuando conviertes esas ganancias en activos (acciones, propiedades, negocios), creas ingreso PASIVO.',
      ),
      _PQ(
        emoji: '🔄', texto: 'Los ricos se vuelven más ricos porque:',
        opciones: ['Trabajan más horas','Sus activos generan dinero que usan para comprar más activos','Tienen suerte','Heredan más'],
        correcta: 1,
        explicacion: 'El ciclo virtuoso: activos → ingresos pasivos → más activos → más ingresos. La clave es empezar con el primer activo, por pequeño que sea.',
      ),
      _PQ(
        emoji: '📊', texto: '¿Cuál es el objetivo financiero principal según la filosofía Cashflow?',
        opciones: ['Tener el sueldo más alto posible','Que tus ingresos pasivos superen tus gastos totales','Ahorrar el 50% de tu sueldo','Pagar todas tus deudas antes de invertir'],
        correcta: 1,
        explicacion: 'Cuando tus activos generan más ingresos pasivos que lo que gastas, ¡eres financieramente libre! No necesitas trabajar para vivir.',
      ),
      _PQ(
        emoji: '🌟', texto: '¿Cuál es el primer activo que una emprendedora de red de mercadeo puede construir?',
        opciones: ['Una mansión','Un equipo de distribuidoras que generan comisiones residuales','Acciones de Apple','Un fondo de inversión de \$100,000'],
        correcta: 1,
        explicacion: 'En LSF, tu equipo es tu activo más poderoso. Cuando duplicas y entrenas líderes, sus ventas generan comisiones para ti. ¡Eso es ingreso pasivo de red!',
      ),
    ],
  ),

  // ── NIVEL 6: Interés Compuesto ────────────────────────────
  _Nivel(
    id: 5, titulo: 'Interés Compuesto', emoji: '⏰',
    descripcion: 'La octava maravilla del mundo según Einstein',
    dificultad: '⭐⭐⭐ Intermedio',
    gradiente: const [Color(0xFF4A00E0), Color(0xFF7B2FF7)],
    preguntas: const [
      _PQ(
        emoji: '⏰', texto: '¿Qué es el interés compuesto?',
        opciones: ['Pagar intereses a múltiples bancos','Ganar intereses sobre tu capital Y sobre los intereses acumulados','Interés que se cobra al consumidor','Un tipo de préstamo complejo'],
        correcta: 1,
        explicacion: 'Einstein lo llamó "la octava maravilla del mundo". Ganas intereses sobre intereses. Con el tiempo, tu dinero crece de forma exponencial, no lineal.',
      ),
      _PQ(
        emoji: '🧮', texto: '\$100 al 10% anual durante 10 años ¿cuánto te da con interés compuesto?',
        opciones: ['\$200 (solo el doble)','\$259 (el interés trabaja sobre sí mismo)','\$110 (solo el primer año)','\$150 (la mitad más)'],
        correcta: 1,
        explicacion: 'Con interés simple serían \$200. Con compuesto: \$259. La diferencia parece poca, pero a 30 años es de \$1,745 vs \$400. ¡El tiempo multiplica el efecto!',
      ),
      _PQ(
        emoji: '🌱', texto: '¿Qué tiene mayor impacto en el interés compuesto?',
        opciones: ['La cantidad inicial que inviertes','El tiempo que mantienes la inversión','La tasa de interés exacta','El banco donde inviertes'],
        correcta: 1,
        explicacion: 'El tiempo es tu mayor aliado. \$1,000 a los 20 años pueden valer más que \$10,000 a los 50, gracias al interés compuesto.',
      ),
      _PQ(
        emoji: '📊', texto: 'Si inviertes \$200 al mes desde los 25 años al 8% anual, a los 65 tendrías aproximadamente:',
        opciones: ['\$96,000 (lo que pusiste)','\$200,000','\$702,000','\$1,000,000'],
        correcta: 2,
        explicacion: '¡\$702,000! Solo aportaste \$96,000 (200×12×40 años). El interés compuesto generó más de \$600,000 adicionales. Así funciona la magia del tiempo.',
      ),
      _PQ(
        emoji: '📅', texto: '¿Qué es la "regla del 72"?',
        opciones: ['Una regla sobre impuestos','Divide 72 entre la tasa de interés para saber cuántos años tarda en duplicarse tu dinero','El porcentaje máximo recomendado de inversión','La edad ideal para jubilarse'],
        correcta: 1,
        explicacion: 'Al 8% anual: 72÷8 = 9 años para duplicar. Al 6%: 72÷6 = 12 años. ¡Una herramienta mental rápida para evaluar inversiones!',
      ),
      _PQ(
        emoji: '🚀', texto: '¿Qué es "frecuencia de capitalización"?',
        opciones: ['Cada cuánto revisas tus inversiones','Qué tan seguido se calculan y suman los intereses: diario, mensual, anual','El número de inversiones que tienes','La frecuencia de retiros permitidos'],
        correcta: 1,
        explicacion: 'Más frecuente = más interés compuesto. Capitalización diaria genera más que mensual, que a su vez genera más que anual.',
      ),
      _PQ(
        emoji: '❗', texto: 'El interés compuesto también funciona EN TU CONTRA cuando:',
        opciones: ['Inviertes en acciones de alto riesgo','Tienes deudas de tarjeta de crédito que no pagas completas','Retiras dinero de tu inversión','Cambias de banco'],
        correcta: 1,
        explicacion: '¡El arma de doble filo! Si debes \$1,000 al 30% y no pagas, al año debes \$1,300, luego sobre esos \$1,300 se calculan intereses. La deuda explota igual.',
      ),
      _PQ(
        emoji: '💰', texto: 'Empezar a invertir 5 años antes puede significar:',
        opciones: ['Apenas un poco más al final','Decenas o cientos de miles de dólares adicionales al jubilarte','Solo 5% más de retorno','La misma cantidad, el tiempo no importa tanto'],
        correcta: 1,
        explicacion: 'Los primeros años son los más poderosos. Un dólar invertido a los 20 vale el doble que uno invertido a los 27 (al 10% anual). ¡Empieza HOY!',
      ),
      _PQ(
        emoji: '🌟', texto: 'Para aprovechar el interés compuesto, lo más importante es:',
        opciones: ['Tener mucho dinero para empezar','Encontrar la mejor acción del mercado','Reinvertir los rendimientos en lugar de gastarlos','Hacer grandes depósitos esporádicos'],
        correcta: 2,
        explicacion: 'El secreto es REINVERTIR. Si ganas dividendos o intereses y los gastas, cortas el ciclo. Si los reinviertes, la bola de nieve crece exponencialmente.',
      ),
      _PQ(
        emoji: '🦋', texto: 'Para una distribuidora LSF, ¿cómo aplica el interés compuesto al negocio?',
        opciones: ['Solo aplica en inversiones bancarias','Cuando reinviertes comisiones para entrenar más distribuidoras, tu red crece exponencialmente','Es un concepto solo para Wall Street','Solo cuando tienes 10 años en la empresa'],
        correcta: 1,
        explicacion: 'Cada distribuidora entrenada puede entrenar más. Tu red crece de forma compuesta: 1→2→4→8→16. ¡El interés compuesto del liderazgo!',
      ),
    ],
  ),

  // ── NIVEL 7: Inversiones y Mercado ────────────────────────
  _Nivel(
    id: 6, titulo: 'Inversiones y Mercado', emoji: '📈',
    descripcion: 'Haz que tu dinero trabaje para ti',
    dificultad: '⭐⭐⭐ Intermedio',
    gradiente: const [Color(0xFFF7971E), Color(0xFFFFD200)],
    preguntas: const [
      _PQ(
        emoji: '📈', texto: '¿Qué es una acción de una empresa?',
        opciones: ['Una deuda que tienes con la empresa','Una pequeña parte de la propiedad de esa empresa','Un préstamo que le das a la empresa','Un tipo de cuenta bancaria especial'],
        correcta: 1,
        explicacion: 'Al comprar una acción de Apple, ¡eres dueña de una fracción de Apple! Si la empresa crece, el valor de tu acción sube.',
      ),
      _PQ(
        emoji: '🏦', texto: '¿Qué son los dividendos?',
        opciones: ['El precio de la acción','Parte de las ganancias de la empresa que se reparten entre los accionistas','Las deudas de la empresa','Los impuestos que paga la empresa'],
        correcta: 1,
        explicacion: 'Los dividendos son ingreso pasivo: la empresa comparte sus utilidades contigo. Empresas como Coca-Cola o Johnson & Johnson pagan dividendos cada trimestre.',
      ),
      _PQ(
        emoji: '🌐', texto: '¿Qué es diversificar una cartera de inversión?',
        opciones: ['Invertir todo en la mejor acción del momento','Distribuir el dinero en diferentes activos para reducir el riesgo','Cambiar de inversiones cada semana','Invertir solo en empresas locales'],
        correcta: 1,
        explicacion: '"No pongas todos los huevos en la misma canasta." Si un sector cae, tus otras inversiones te protegen. Diversificación = gestión de riesgo.',
      ),
      _PQ(
        emoji: '📊', texto: '¿Qué es un fondo indexado (ETF o índice)?',
        opciones: ['Un fondo administrado por un experto muy costoso','Una inversión que replica un índice como el S&P 500, comprando múltiples acciones automáticamente','Una cuenta de ahorros especial','Un tipo de seguro de vida'],
        correcta: 1,
        explicacion: 'Un ETF del S&P 500 te da exposición a las 500 empresas más grandes de EE.UU. a bajo costo. Warren Buffett recomienda esta estrategia para la mayoría.',
      ),
      _PQ(
        emoji: '🎯', texto: 'La diferencia entre especulación e inversión es:',
        opciones: ['La especulación siempre pierde y la inversión siempre gana','La inversión se basa en análisis y tiempo; la especulación es apostar a corto plazo','Son exactamente lo mismo','La especulación solo la hacen bancos'],
        correcta: 1,
        explicacion: 'Invertir en una empresa sólida por 10 años = inversión. Comprar cripto esperando subida de precio en 1 semana = especulación. El riesgo es muy diferente.',
      ),
      _PQ(
        emoji: '📉', texto: '¿Cómo debes reaccionar cuando el mercado de valores baja un 20%?',
        opciones: ['Vender todo inmediatamente para evitar más pérdidas','Mantener la calma y seguir invirtiendo: los mercados siempre se recuperan históricamente','Retirar todo y guardarlo en cash','Nunca volver a invertir en acciones'],
        correcta: 1,
        explicacion: '¡Compra más a precio de descuento! Los inversores como Warren Buffett hacen fortuna en las caídas. A largo plazo, el S&P 500 siempre ha subido.',
      ),
      _PQ(
        emoji: '💎', texto: '¿Qué son los bienes raíces como inversión?',
        opciones: ['Solo para millonarios','Comprar propiedades que generan renta o se aprecian con el tiempo','Una inversión demasiado complicada para emprendedoras','Solo vale la pena en ciudades grandes'],
        correcta: 1,
        explicacion: 'Bienes raíces = activo que puede generar renta mensual (ingreso pasivo) y apreciarse de valor. El financiamiento bancario permite acceder con poco capital inicial.',
      ),
      _PQ(
        emoji: '🌍', texto: '¿Qué es el riesgo en inversiones?',
        opciones: ['Siempre perder el dinero','La posibilidad de que el rendimiento real sea diferente al esperado (positiva o negativamente)','Algo que solo los pobres tienen','Un gasto extra del banco'],
        correcta: 1,
        explicacion: 'A mayor potencial de rendimiento, mayor riesgo. Acciones = más riesgo, más rendimiento. Bonos del gobierno = menos riesgo, menos rendimiento. Elige según tu tolerancia.',
      ),
      _PQ(
        emoji: '🚀', texto: '¿Qué es el DCA (Dollar Cost Averaging)?',
        opciones: ['Comprar solo cuando el mercado está en mínimos','Invertir una cantidad fija periódicamente, sin importar si el mercado sube o baja','Comprar y vender el mismo día','Una estrategia solo para expertos'],
        correcta: 1,
        explicacion: 'Invertir \$100 cada mes reduce el riesgo de "entrar en el peor momento". Compras más cuando baja y menos cuando sube, promediando el costo.',
      ),
      _PQ(
        emoji: '🌟', texto: '¿Por qué los fondos de índice superan a la mayoría de los gestores de fondos activos?',
        opciones: ['Porque el gobierno los subsidia','Por sus menores comisiones y el hecho de que pocos gestores vencen al mercado consistentemente','Porque solo compran empresas famosas','Porque el gobierno garantiza sus rendimientos'],
        correcta: 1,
        explicacion: 'Estudios muestran que +80% de los fondos activos no superan al índice en 10 años, ¡y cobran más! Los fondos índice tienen comisiones de 0.03%-0.2% vs 1-2% activos.',
      ),
    ],
  ),

  // ── NIVEL 8: Flujo de Efectivo ─────────────────────────────
  _Nivel(
    id: 7, titulo: 'Flujo de Efectivo', emoji: '🚀',
    descripcion: 'Domina el juego del Cashflow y la libertad',
    dificultad: '⭐⭐⭐⭐ Avanzado',
    gradiente: const [Color(0xFF56CCF2), Color(0xFF2F80ED)],
    preguntas: const [
      _PQ(
        emoji: '🐀', texto: '¿Qué es la "Carrera de Ratas" de Robert Kiyosaki?',
        opciones: ['Una competencia de atletismo empresarial','El ciclo de trabajar solo para pagar gastos, sin avanzar hacia la libertad financiera','Un juego de mesa educativo','Una película sobre finanzas'],
        correcta: 1,
        explicacion: 'Trabajas → ganas → gastas → necesitas trabajar más. Esa trampa es la Carrera de Ratas. Salir requiere construir activos que generen más que tus gastos.',
      ),
      _PQ(
        emoji: '🏆', texto: '¿Cuándo logras la libertad financiera?',
        opciones: ['Cuando tienes trabajo estable de por vida','Cuando tus ingresos pasivos superan todos tus gastos mensuales','Cuando cumples 65 años','Cuando tienes \$1,000,000 ahorrados'],
        correcta: 1,
        explicacion: '¡EXACTO! Si gastas \$2,000/mes y tus activos generan \$2,001 pasivos, eres LIBRE. No necesitas trabajar para sobrevivir.',
      ),
      _PQ(
        emoji: '💰', texto: '¿Qué significa estar en la "Pista Rápida" del Cashflow?',
        opciones: ['Trabajar más horas para ganar más','Tener múltiples fuentes de ingreso pasivo que crecen sin tu tiempo directo','Ahorrar agresivamente el 90% del sueldo','Invertir en acciones de alto riesgo'],
        correcta: 1,
        explicacion: 'La Pista Rápida: tus activos y negocios trabajan por ti. Tu tiempo queda libre mientras el dinero fluye. Es el objetivo del juego Cashflow de Kiyosaki.',
      ),
      _PQ(
        emoji: '📊', texto: 'En el juego Cashflow, ¿cuál es el estado financiero más importante a monitorear?',
        opciones: ['El balance general de activos','El flujo de efectivo mensual: cuánto entra vs cuánto sale','El precio de las acciones','La cantidad de tarjetas de crédito'],
        correcta: 1,
        explicacion: 'El flujo de efectivo positivo mensual es la columna vertebral de la libertad financiera. Es el indicador que debes aumentar continuamente.',
      ),
      _PQ(
        emoji: '🎯', texto: 'Una distribuidora de LSF tiene ingresos de \$1,500/mes. Aplica 30/40/30. ¿Cuánto va al fondo Cashflow para invertir?',
        opciones: ['\$600','\$150','\$450','\$300'],
        correcta: 2,
        explicacion: '30% de \$1,500 = \$450 van al fondo Cashflow para construir activos. Así, mientras trabajas en ventas, tu dinero también trabaja en inversiones.',
      ),
      _PQ(
        emoji: '🔄', texto: '¿Por qué se llama "Cashflow" y no solo "inversión"?',
        opciones: ['Porque es un juego de mesa','Porque el objetivo es el FLUJO CONTINUO de dinero, no solo acumular un capital grande','Porque lo inventó un banco','Por el nombre del creador del sistema LSF'],
        correcta: 1,
        explicacion: 'Cashflow = flujo de efectivo. El objetivo no es solo tener dinero, sino que el dinero FLUYA hacia ti de forma continua y pasiva.',
      ),
      _PQ(
        emoji: '💎', texto: 'Para aumentar tu cashflow mensual, ¿cuál es la estrategia más efectiva?',
        opciones: ['Pedir un aumento de sueldo','Comprar activos que generan ingreso recurrente (acciones con dividendos, propiedades, negocios)','Trabajar fines de semana','Reducir todos tus gastos a cero'],
        correcta: 1,
        explicacion: 'Cada activo que compras agrega una nueva corriente de cashflow. Con el tiempo, cientos de pequeñas corrientes forman un río de ingresos pasivos.',
      ),
      _PQ(
        emoji: '🏠', texto: 'Una propiedad rentada que genera \$800/mes y tiene gastos de \$500/mes, aporta al cashflow:',
        opciones: ['\$800 mensuales','\$300 mensuales positivos','\$0 porque hay hipoteca','\$1,300 mensuales'],
        correcta: 1,
        explicacion: '\$800 renta - \$500 gastos (hipoteca, mantenimiento, impuestos) = \$300 de cashflow positivo mensual. Así funciona la inversión en bienes raíces.',
      ),
      _PQ(
        emoji: '📱', texto: '¿Cómo las líderes LSF pueden crear cashflow residual?',
        opciones: ['Vendiendo más productos personalmente cada mes','Construyendo un equipo de distribuidoras que generan comisiones residuales de sus ventas','Trabajando 80 horas a la semana','Comprando más inventario'],
        correcta: 1,
        explicacion: 'El residual LSF: cuando tus distribuidoras venden, tú ganas comisión sin vender directamente. Con un equipo de 50 personas, tienes 50 fuentes de ingreso.',
      ),
      _PQ(
        emoji: '🌟', texto: '¿Cuál es la mentalidad correcta sobre el dinero para lograr cashflow libre?',
        opciones: ['El dinero es escaso y debo guardarlo todo','El dinero es una herramienta: lo hago trabajar para generar más dinero','El dinero es malo y no debo hablar de él','Necesito ganar mucho antes de pensar en invertir'],
        correcta: 1,
        explicacion: 'El dinero es neutral. Quienes lo hacen crecer lo ven como un empleado: trabaja para ellos, genera más dinero, que a su vez genera más. Cambia la mentalidad, cambia el resultado.',
      ),
    ],
  ),

  // ── NIVEL 9: Red de Mercadeo LSF ──────────────────────────
  _Nivel(
    id: 8, titulo: 'Red de Mercadeo LSF', emoji: '🦋',
    descripcion: 'Domina los fundamentos del negocio de red',
    dificultad: '⭐⭐⭐⭐ Avanzado',
    gradiente: const [Color(0xFFF953C6), Color(0xFFB91D73)],
    preguntas: const [
      _PQ(
        emoji: '🦋', texto: '¿Cuál es la diferencia entre marketing de red legítimo y una pirámide ilegal?',
        opciones: ['No hay diferencia, son lo mismo','En el network marketing legítimo, el ingreso viene de ventas reales de productos; en la pirámide, del reclutamiento puro','La pirámide tiene menos niveles','El network marketing solo opera en EE.UU.'],
        correcta: 1,
        explicacion: 'MLM legítimo = productos de valor + ventas reales como base. Pirámide = el dinero viene principalmente de reclutar, no de vender. Siempre evalúa el producto.',
      ),
      _PQ(
        emoji: '🌐', texto: '¿Qué es el ingreso residual en una red de mercadeo?',
        opciones: ['El ingreso de tus ventas directas del mes','Las comisiones que ganas de las ventas de tu equipo sin trabajar directamente en esas ventas','Los bonos de inicio rápido','Las ganancias de los productos que uses tú misma'],
        correcta: 1,
        explicacion: 'El residual es el "Santo Grial" del MLM: tu equipo vende → tú ganas. Con 50 distribuidoras activas, tienes 50 fuentes de ingreso pasivo.',
      ),
      _PQ(
        emoji: '🎯', texto: '¿Cuál es la clave del crecimiento exponencial en redes de mercadeo?',
        opciones: ['Vender la mayor cantidad posible tú sola','La duplicación: enseñar a otros a hacer lo que haces para que ellos también lo enseñen','Tener el catálogo más variado','Aparecer en redes sociales todos los días'],
        correcta: 1,
        explicacion: 'Duplicación exponencial: 1→2→4→8→16→32. Si entrenas 2 líderes que entrenan 2 cada uno, en pocos niveles tienes cientos de distribuidoras activas.',
      ),
      _PQ(
        emoji: '💼', texto: 'Para que una red de mercadeo sea sostenible, ¿qué porcentaje de ingresos debe venir de ventas a clientes finales vs del reclutamiento?',
        opciones: ['0% ventas, 100% reclutamiento','La mayoría (más del 50%) debe venir de ventas a consumidores reales fuera de la red','50% cada uno exactamente','El reclutamiento es siempre la única fuente'],
        correcta: 1,
        explicacion: 'Una red sana tiene clientes reales que compran porque les encanta el producto, no solo distribuidoras que compran para cumplir cuotas.',
      ),
      _PQ(
        emoji: '📱', texto: '¿Cuál es la forma más efectiva de hacer crecer tu negocio LSF en redes sociales?',
        opciones: ['Publicar solo fotos de productos y precios','Compartir tu historia, valor educativo y transformaciones reales; construir confianza antes de vender','Enviar mensajes masivos de "¡Únete a mi equipo!"','Solo publicar cuando tengas un nuevo producto'],
        correcta: 1,
        explicacion: 'La gente compra a quienes conoce, le cae bien y confía. Primero da valor, comparte tu historia, educa. Las ventas y reclutamientos siguen naturalmente.',
      ),
      _PQ(
        emoji: '💡', texto: 'El "consumo propio" en MLM (autoconsumo) es importante porque:',
        opciones: ['Es la única forma de ganar dinero','Te da conocimiento real del producto para hablar con autenticidad, y en algunos planes suma a tu volumen','Es obligatorio para todas las distribuidoras','Es la parte más lucrativa del negocio'],
        correcta: 1,
        explicacion: 'Cuando usas y amas el producto, tu entusiasmo es genuino. Los clientes detectan la autenticidad. Además, en muchos planes tu consumo suma a tus puntos.',
      ),
      _PQ(
        emoji: '🏆', texto: 'Para escalar rangos en LSF, lo más importante es:',
        opciones: ['Ser la que más vende personalmente','Desarrollar líderes en tu equipo que repliquen tu éxito','Tener el mejor catálogo','Hacer el mayor número de publicaciones en Instagram'],
        correcta: 1,
        explicacion: 'Los rangos altos se logran con LÍDERES bajo ti, no solo con tus ventas personales. Tu éxito se mide por cuántos líderes has creado.',
      ),
      _PQ(
        emoji: '📊', texto: '¿Cómo calculas el ROI de tu inversión en LSF?',
        opciones: ['No se puede calcular','(Ingresos totales - Costos totales: inventario, viajes, capacitaciones) / Costos × 100','Solo contando las ventas directas','El ROI no aplica a negocios de red'],
        correcta: 1,
        explicacion: 'ROI = (Ganancias netas / Inversión) × 100. Si invertiste \$500 en materiales y ganaste \$1,500, tu ROI es 200%. ¡Conoce tus números siempre!',
      ),
      _PQ(
        emoji: '🌟', texto: 'Las líderes de red más exitosas se distinguen porque:',
        opciones: ['Trabajan solas sin depender de su equipo','Invierten en su propia educación y en el desarrollo de sus distribuidoras constantemente','Tienen el mayor inventario acumulado','Compiten con otras líderes de la misma empresa'],
        correcta: 1,
        explicacion: 'El liderazgo es la habilidad #1 en MLM. Leer, capacitarse, ir a eventos y aplicar esas herramientas en el desarrollo de tu equipo es lo que separa líderes de vendedoras.',
      ),
      _PQ(
        emoji: '🎯', texto: 'La diferencia entre una distribuidora y una líder en LSF es:',
        opciones: ['Solo el tiempo en la empresa','La líder vende más producto','La líder se enfoca en desarrollar a otros, crea líderes y construye un equipo que funciona sin su presencia constante','La líder tiene un rango especial asignado por la empresa'],
        correcta: 2,
        explicacion: 'Una distribuidora es esencial para las ventas. Una líder multiplica su impacto desarrollando a otros para que también sean líderes. La red crece exponencialmente.',
      ),
    ],
  ),

  // ── NIVEL 10: Libertad Financiera ─────────────────────────
  _Nivel(
    id: 9, titulo: 'Libertad Financiera', emoji: '🏆',
    descripcion: 'El nivel maestro: diseña tu vida ideal',
    dificultad: '⭐⭐⭐⭐⭐ Maestra',
    gradiente: const [Color(0xFF6B0AC9), Color(0xFFE040FB)],
    preguntas: const [
      _PQ(
        emoji: '🏆', texto: '¿Cuál es la definición más completa de libertad financiera?',
        opciones: ['Tener un millón de dólares guardados','Poder elegir cómo, cuándo y con quién trabajas porque tus activos cubren tu estilo de vida','No tener ninguna deuda','Retirarte a los 65 años'],
        correcta: 1,
        explicacion: 'La libertad financiera es una condición: tienes OPCIONES. Puedes trabajar porque lo amas, no porque lo necesitas. El dinero es la herramienta, no el objetivo final.',
      ),
      _PQ(
        emoji: '🎯', texto: '¿Qué es el número de libertad financiera (FI Number)?',
        opciones: ['Tu meta de ahorro total','El monto de activos necesario para que tus rendimientos cubran todos tus gastos anuales indefinidamente','Tu salario ideal','El precio de la casa de tus sueños'],
        correcta: 1,
        explicacion: 'Si gastas \$24,000/año y obtienes 4% anual de tus inversiones, necesitas \$600,000 en activos (\$24,000 ÷ 0.04). Ese es tu número de libertad.',
      ),
      _PQ(
        emoji: '📊', texto: '¿Qué es la "regla del 4%"?',
        opciones: ['Ahorrar 4% del sueldo','Retiras 4% de tu portafolio cada año y estadísticamente no lo agotas en 30+ años','Invertir 4% en acciones de riesgo','Pagar 4% en comisiones al asesor financiero'],
        correcta: 1,
        explicacion: 'Estudios históricos muestran que retirar 4% anual de un portafolio diversificado rara vez agota el capital en 30 años. Es la base para calcular tu número de libertad.',
      ),
      _PQ(
        emoji: '🌍', texto: 'Las 4 fuentes de ingreso más comunes en personas financieramente libres son:',
        opciones: ['Solo acciones y bienes raíces','Negocio, bienes raíces, mercado de valores y regalías/propiedad intelectual','Solo trabajo y ahorro','Lotería, herencias, premios y trabajo extra'],
        correcta: 1,
        explicacion: 'La diversificación de fuentes de ingreso es el escudo: si un sector cae, otros te sostienen. Las 4 pilares clásicos de la riqueza sostenible.',
      ),
      _PQ(
        emoji: '🧠', texto: '¿Cuál es la mentalidad clave que separa a los ricos de los que luchan financieramente?',
        opciones: ['Tener suerte o conectes familiares','Ver el dinero como herramienta, tomar responsabilidad total y buscar soluciones en lugar de excusas','Ser naturalmente inteligentes en matemáticas','Haber estudiado en las mejores universidades'],
        correcta: 1,
        explicacion: 'La mentalidad es el activo más valioso. "No puedo pagarlo" vs "¿Cómo puedo pagarlo?" — La pregunta que haces cambia el resultado que obtienes.',
      ),
      _PQ(
        emoji: '⚡', texto: 'El concepto FIRE (Financial Independence, Retire Early) significa:',
        opciones: ['Poner a trabajar el dinero en inversiones muy riesgosas','Lograr independencia financiera suficiente para jubilarse décadas antes del tiempo convencional','Un tipo de inversión en energía','Una estrategia de solo ahorro sin inversión'],
        correcta: 1,
        explicacion: 'FIRE: vivir con menos, invertir agresivamente el excedente, lograr que tus activos cubran tus gastos, y así poder "retirarte" a los 35-45 años si lo deseas.',
      ),
      _PQ(
        emoji: '🌱', texto: '¿Cómo afecta el estilo de vida al tiempo para alcanzar la libertad financiera?',
        opciones: ['No afecta, solo importa cuánto ganas','Más gasto = más activos necesitas = más tarda. Menos gasto = llegas antes y necesitas menos','Solo importa el rendimiento de las inversiones','La inflación es el único factor que importa'],
        correcta: 1,
        explicacion: 'Doble impacto: más gastos → necesitas más activos Y ahorras menos. Reducir gastos es la palanca más poderosa para acelerar la libertad financiera.',
      ),
      _PQ(
        emoji: '💼', texto: 'La estrategia de "múltiples fuentes de ingreso" te protege porque:',
        opciones: ['Trabajas más y ganas más','Si una fuente falla, las demás te sostienen; además, diversifica tu riesgo de ingreso','Pagas menos impuestos con muchas empresas','Te hace aparecer más exitosa ante otros'],
        correcta: 1,
        explicacion: 'El millonario promedio tiene 7 fuentes de ingreso. Una sola fuente es un punto de falla. Construye otras mientras mantienes las actuales.',
      ),
      _PQ(
        emoji: '🏆', texto: 'Una vez que alcanzas la libertad financiera, ¿cuál es la trampa más común?',
        opciones: ['Que no hay trampas, ya ganaste','Lifestyle inflation: aumentar el gasto al aumentar los ingresos, rompiendo el equilibrio de cashflow','Invertir demasiado conservadoramente','Trabajar demasiado por hábito'],
        correcta: 1,
        explicacion: 'El "inflación de estilo de vida" destruye fortunas: ganas más → gastas más → nunca acumulas suficiente. El secreto: mantener gastos razonables aunque los ingresos crezcan.',
      ),
      _PQ(
        emoji: '🦋', texto: 'Para una líder LSF, ¿cómo se ve la libertad financiera completa?',
        opciones: ['Dejar de trabajar en LSF cuando tenga suficiente dinero','Construir un equipo que funciona sin su presencia + activos de inversión que cubren su vida = elegir trabajar porque lo ama, no porque lo necesita','Solo depender del ingreso residual de LSF','Alcanzar el rango más alto de la empresa'],
        correcta: 1,
        explicacion: 'La libertad real combina: ingreso residual LSF (su equipo trabaja) + activos financieros (inversiones). Así tiene total libertad de tiempo y nunca depende de una sola fuente.',
      ),
    ],
  ),
];

// ══════════════════════════════════════════════════════════════
//  PANTALLA PRINCIPAL — CAMINITO MAP
// ══════════════════════════════════════════════════════════════
class PantallaQuiz extends StatefulWidget {
  const PantallaQuiz({super.key});
  @override
  State<PantallaQuiz> createState() => _PantallaQuizState();
}

class _PantallaQuizState extends State<PantallaQuiz> with TickerProviderStateMixin {
  List<int> _mejorPuntaje = List.filled(10, 0);
  List<bool>  _completados  = List.filled(10, false);
  bool _cargando = true;

  // Estado del quiz activo
  int? _nivelActivo;
  late List<_PQ> _preguntas;
  int  _idx       = 0;
  int  _puntaje   = 0;
  int? _elegida;
  bool _respondio = false;
  bool _terminado = false;
  int  _tiempo    = 30;
  Timer? _timer;
  late AnimationController _barCtrl;
  late AnimationController _cardCtrl;
  late Animation<double>   _cardAnim;
  late AnimationController _victoriaCtrl;

  @override
  void initState() {
    super.initState();
    _barCtrl      = AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _cardCtrl     = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _cardAnim     = CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOut);
    _victoriaCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _cargarProgreso();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _barCtrl.dispose();
    _cardCtrl.dispose();
    _victoriaCtrl.dispose();
    super.dispose();
  }

  Future<void> _cargarProgreso() async {
    final prefs = await SharedPreferences.getInstance();
    final comp  = List<bool>.generate(10, (i) => prefs.getBool('qfin_comp_$i') ?? false);
    final pts   = List<int>.generate(10, (i) => prefs.getInt('qfin_pts_$i') ?? 0);
    if (mounted) setState(() { _completados = comp; _mejorPuntaje = pts; _cargando = false; });
  }

  Future<void> _guardarProgreso(int nivel, int puntaje) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('qfin_comp_$nivel', true);
    if (puntaje > (_mejorPuntaje[nivel])) {
      await prefs.setInt('qfin_pts_$nivel', puntaje);
    }
  }

  bool _nivelDesbloqueado(int i) => i == 0 || _completados[i - 1];

  void _abrirNivel(int i) {
    if (!_nivelDesbloqueado(i)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('🔒 Completa el Nivel $i primero'),
        backgroundColor: AppColors.fondoCard,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
      return;
    }
    final nivel = _niveles[i];
    final rand = Random();
    // Mezcla opciones dentro de cada pregunta Y luego mezcla el orden de preguntas
    final preguntas = nivel.preguntas.map((p) => _shuffleOpciones(p, rand)).toList()..shuffle(rand);
    setState(() {
      _nivelActivo = i;
      _preguntas   = preguntas;
      _idx         = 0;
      _puntaje     = 0;
      _elegida     = null;
      _respondio   = false;
      _terminado   = false;
    });
    _cardCtrl.forward(from: 0);
    _iniciarTimer();
  }

  void _cerrarQuiz() {
    _timer?.cancel();
    _barCtrl.stop();
    _victoriaCtrl.stop();
    _victoriaCtrl.reset();
    setState(() => _nivelActivo = null);
    _cargarProgreso();
  }

  // ── QUIZ LOGIC ─────────────────────────────────────────────
  void _iniciarTimer() {
    _timer?.cancel();
    setState(() => _tiempo = 30);
    _barCtrl.forward(from: 0);
    bool _beeped = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_tiempo <= 1) { _timer?.cancel(); _responder(-1); }
      else {
        setState(() => _tiempo--);
        if (_tiempo <= 10 && !_beeped) { _beeped = true; SoundPlayer.tiempo(); }
      }
    });
  }

  void _responder(int idx) {
    if (_respondio) return;
    _timer?.cancel();
    _barCtrl.stop();
    final p = _preguntas[_idx];
    final correcta = idx == p.correcta;
    final bonus = ((_tiempo / 30) * 50).round();
    if (idx == -1) {
      SoundPlayer.error(); // tiempo agotado
    } else if (correcta) {
      SoundPlayer.correcto();
    } else {
      SoundPlayer.error();
    }
    setState(() {
      _elegida   = idx;
      _respondio = true;
      if (correcta) _puntaje += 100 + bonus;
    });
  }

  void _siguiente() {
    if (_idx >= _preguntas.length - 1) {
      _finalizarNivel();
      return;
    }
    setState(() { _idx++; _elegida = null; _respondio = false; });
    _cardCtrl.forward(from: 0);
    _iniciarTimer();
  }

  Future<void> _finalizarNivel() async {
    setState(() => _terminado = true);
    _victoriaCtrl.repeat(reverse: true);
    SoundPlayer.nivel();
    final nivel = _nivelActivo!;
    await _guardarProgreso(nivel, _puntaje);
    final comp = List<bool>.from(_completados);
    comp[nivel] = true;
    final pts = List<int>.from(_mejorPuntaje);
    if (_puntaje > pts[nivel]) pts[nivel] = _puntaje;
    if (mounted) {
      setState(() { _completados = comp; _mejorPuntaje = pts; });
      // Acreditar gemas al perfil: mínimo 5, máximo 50
      final gemasGanadas = (_puntaje ~/ 100).clamp(5, 50);
      Provider.of<AppProvider>(context, listen: false).agregarGemasQuiz(gemasGanadas);
    }
  }

  // ══════════════════════════════════════════════════════════
  //  BUILD
  // ══════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: _cargando
          ? const Center(child: CircularProgressIndicator(color: AppColors.neonMorado))
          : _nivelActivo == null
            ? _buildCaminito()
            : _terminado
              ? _buildResultados()
              : _buildQuiz(),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════
  //  CAMINITO MAP
  // ══════════════════════════════════════════════════════════
  Widget _buildCaminito() {
    final completados = _completados.where((c) => c).length;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildCaminitoHeader(completados)),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => _buildNivelCard(i),
              childCount: _niveles.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }

  Widget _buildCaminitoHeader(int completados) {
    final pct = completados / 10.0;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A0A3C), Color(0xFF0D0E1A)],
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('🧠 Quiz Financiero', style: AppTextStyles.heroTitle),
            Text('Progresa por 10 niveles · 100 preguntas',
              style: AppTextStyles.body),
          ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.neonAmarillo.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.neonAmarillo.withValues(alpha: 0.4)),
            ),
            child: Text('$completados/10 ✅',
              style: const TextStyle(color: AppColors.neonAmarillo,
                fontSize: 15, fontWeight: FontWeight.w900)),
          ),
        ]),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('$completados / 10 niveles completados',
            style: const TextStyle(color: AppColors.textoGris, fontSize: 12, fontWeight: FontWeight.w600)),
          Text('${(pct * 100).round()}%',
            style: TextStyle(color: _pctColor(pct), fontSize: 12, fontWeight: FontWeight.w800)),
        ]),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: pct, minHeight: 8,
            backgroundColor: AppColors.fondoCardClaro,
            valueColor: AlwaysStoppedAnimation<Color>(_pctColor(pct)),
          ),
        ),
      ]),
    );
  }

  Color _pctColor(double pct) {
    if (pct < 0.3) return AppColors.neonCoral;
    if (pct < 0.7) return AppColors.neonAmarillo;
    return AppColors.neonVerde;
  }

  Widget _buildNivelCard(int i) {
    final nivel       = _niveles[i];
    final completado  = _completados[i];
    final desbloq     = _nivelDesbloqueado(i);
    final enCurso     = desbloq && !completado;
    final pts         = _mejorPuntaje[i];

    // Alternating offset for caminito feel
    final offset = i.isEven ? 0.0 : 24.0;

    return Padding(
      padding: EdgeInsets.only(bottom: 14, left: offset, right: i.isEven ? 24.0 : 0),
      child: GestureDetector(
        onTap: () => _abrirNivel(i),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: desbloq ? 1.0 : 0.4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: completado
                ? const LinearGradient(
                    colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                    begin: Alignment.topLeft, end: Alignment.bottomRight)
                : LinearGradient(
                    colors: nivel.gradiente,
                    begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: desbloq && !completado
                ? [BoxShadow(color: nivel.gradiente[0].withValues(alpha: 0.4),
                    blurRadius: 16, offset: const Offset(0, 4))]
                : [],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  // Número
                  Container(
                    width: 32, height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(
                      '${(i + 1).toString().padLeft(2, '0')}',
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900),
                    )),
                  ),
                  const SizedBox(width: 10),
                  Text(nivel.emoji, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(nivel.titulo,
                    style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800))),
                  if (!desbloq)
                    const Text('🔒', style: TextStyle(fontSize: 18))
                  else if (completado)
                    const Text('✅', style: TextStyle(fontSize: 18)),
                ]),
                const SizedBox(height: 6),
                Text(nivel.descripcion,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12)),
                const SizedBox(height: 8),
                Row(children: [
                  Text(nivel.dificultad,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 11)),
                  const Spacer(),
                  if (completado && pts > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('⭐ $pts pts',
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                    )
                  else if (desbloq)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
                      ),
                      child: Text(enCurso ? 'COMENZAR →' : 'REPETIR →',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
                    ),
                ]),
                // Milestone dots
                const SizedBox(height: 10),
                _buildMilestoneDots(completado ? 1.0 : 0.0),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMilestoneDots(double pct) {
    return Row(
      children: List.generate(10, (i) {
        final filled  = pct >= (i + 1) / 10;
        final current = !filled && pct >= i / 10 && pct > 0;
        return Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 5,
            decoration: BoxDecoration(
              color: filled ? Colors.white
                : current ? Colors.white.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ));
      }),
    );
  }

  // ══════════════════════════════════════════════════════════
  //  QUIZ SCREEN
  // ══════════════════════════════════════════════════════════
  Widget _buildQuiz() {
    final p     = _preguntas[_idx];
    final nivel = _niveles[_nivelActivo!];
    return Column(children: [
      // Header
      Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [nivel.gradiente[0].withValues(alpha: 0.9), const Color(0xFF0D0E1A)]),
        ),
        child: Column(children: [
          Row(children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white54),
              onPressed: _cerrarQuiz,
            ),
            Expanded(child: LinearProgressIndicator(
              value: (_idx + 1) / _preguntas.length,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(nivel.gradiente[1]),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            )),
            const SizedBox(width: 8),
            Text('${_idx + 1}/${_preguntas.length}',
              style: const TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w700)),
          ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Nivel badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('${nivel.emoji} ${nivel.titulo}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
            ),
            // Timer
            AnimatedBuilder(
              animation: _barCtrl,
              builder: (_, __) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: _tiempo <= 10 ? Colors.red.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.timer, size: 14,
                    color: _tiempo <= 10 ? Colors.red[300] : Colors.white54),
                  const SizedBox(width: 4),
                  Text('$_tiempo s',
                    style: TextStyle(
                      color: _tiempo <= 10 ? Colors.red[300] : Colors.white,
                      fontWeight: FontWeight.w900, fontSize: 13)),
                ]),
              ),
            ),
            // Puntos
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('⭐ $_puntaje',
                style: const TextStyle(color: Color(0xFFFFD700),
                  fontWeight: FontWeight.w900, fontSize: 13)),
            ),
          ]),
        ]),
      ),

      // Pregunta
      Expanded(child: FadeTransition(
        opacity: _cardAnim,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const SizedBox(height: 12),
            Text(p.emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [nivel.gradiente[0].withValues(alpha: 0.3), const Color(0xFF1A1035)]),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: nivel.gradiente[0].withValues(alpha: 0.5)),
              ),
              child: Text(p.texto,
                style: const TextStyle(color: Colors.white, fontSize: 17,
                  fontWeight: FontWeight.w700, height: 1.5),
                textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            ...List.generate(p.opciones.length, (i) => _buildOpcion(p, i, nivel)),
            if (_respondio) ...[
              const SizedBox(height: 16),
              _buildExplicacion(p),
              const SizedBox(height: 16),
              SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: _siguiente,
                style: ElevatedButton.styleFrom(
                  backgroundColor: nivel.gradiente[0],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  _idx < _preguntas.length - 1 ? '→ SIGUIENTE PREGUNTA' : '🏆 VER RESULTADO',
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)),
              )),
            ],
          ]),
        ),
      )),
    ]);
  }

  Widget _buildOpcion(_PQ p, int i, _Nivel nivel) {
    Color color, border;
    Widget? icon;
    if (!_respondio) {
      color  = _elegida == i ? nivel.gradiente[0].withValues(alpha: 0.3) : AppColors.fondoCard;
      border = _elegida == i ? nivel.gradiente[0] : Colors.white12;
      icon   = null;
    } else {
      if (i == p.correcta) {
        color = const Color(0xFF1B5E20); border = const Color(0xFF4CAF50);
        icon  = const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 20);
      } else if (i == _elegida && i != p.correcta) {
        color = const Color(0xFF7F0000); border = Colors.red;
        icon  = const Icon(Icons.cancel, color: Colors.red, size: 20);
      } else {
        color = AppColors.fondoCard; border = Colors.white10; icon = null;
      }
    }
    final letras = ['A', 'B', 'C', 'D'];
    return GestureDetector(
      onTap: !_respondio ? () => _responder(i) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Row(children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(
              color: border.withValues(alpha: 0.3), shape: BoxShape.circle),
            child: Center(child: Text(letras[i],
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900))),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(p.opciones[i],
            style: const TextStyle(color: Colors.white, fontSize: 14))),
          if (icon != null) icon,
        ]),
      ),
    );
  }

  Widget _buildExplicacion(_PQ p) {
    final correcto = _elegida == p.correcta;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: correcto ? const Color(0xFF1B5E20) : const Color(0xFF3A1A0A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: correcto ? const Color(0xFF4CAF50) : Colors.orange),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(correcto ? '✅' : '💡', style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            correcto
              ? '¡Correcto! +${100 + ((_tiempo / 30) * 50).round()} pts'
              : 'Respuesta correcta: ${p.opciones[p.correcta]}',
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(p.explicacion,
            style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
        ])),
      ]),
    );
  }

  // ══════════════════════════════════════════════════════════
  //  RESULTADOS
  // ══════════════════════════════════════════════════════════
  Widget _buildResultados() {
    final nivel  = _niveles[_nivelActivo!];
    final maxPts = _preguntas.length * 150;
    final pct    = _puntaje / maxPts;
    final (badgeEmoji, badgeTitulo, badgeDesc) = pct >= 0.9
      ? ('🏆', '¡Maestra del Nivel!', '¡Dominas este tema por completo!')
      : pct >= 0.7
        ? ('💎', '¡Experta!', 'Excelente conocimiento. ¡Sigue así!')
        : pct >= 0.5
          ? ('⭐', 'Aprendiz', 'Buen intento. ¡Revisa las respuestas!')
          : ('🌱', 'Sigue Practicando', 'Completa más niveles y vuelve a intentarlo.');

    final nivelSiguiente = _nivelActivo! + 1;
    final hayNext = nivelSiguiente < _niveles.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        const SizedBox(height: 24),
        // Badge nivel
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: nivel.gradiente),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('${nivel.emoji} ${nivel.titulo}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
        ),
        const SizedBox(height: 20),
        AnimatedBuilder(
          animation: _victoriaCtrl,
          builder: (_, __) => Transform.scale(
            scale: 1.0 + _victoriaCtrl.value * 0.08,
            child: Text(badgeEmoji, style: const TextStyle(fontSize: 80)),
          ),
        ),
        const SizedBox(height: 12),
        Text(badgeTitulo,
          style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900)),
        const SizedBox(height: 6),
        Text(badgeDesc, style: AppTextStyles.caption, textAlign: TextAlign.center),
        const SizedBox(height: 28),
        // Score ring
        Container(
          width: 150, height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: nivel.gradiente[0], width: 4),
            gradient: RadialGradient(
              colors: [nivel.gradiente[0].withValues(alpha: 0.3), const Color(0xFF1A0A3C)]),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('$_puntaje',
              style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900)),
            const Text('PUNTOS',
              style: TextStyle(color: Colors.white38, fontSize: 11, letterSpacing: 2)),
          ]),
        ),
        const SizedBox(height: 24),
        // Stats
        Row(children: [
          _statCard('Correctas', '${(_puntaje ~/ 100).clamp(0, _preguntas.length)}/${_preguntas.length}', '✅'),
          const SizedBox(width: 12),
          _statCard('Precisión', '${(pct * 100).round()}%', '🎯'),
        ]),
        const SizedBox(height: 24),
        // Botones
        if (hayNext && _completados[_nivelActivo!]) ...[
          SizedBox(width: double.infinity, child: ElevatedButton(
            onPressed: () {
              _victoriaCtrl.stop();
              _victoriaCtrl.reset();
              _abrirNivel(nivelSiguiente);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _niveles[nivelSiguiente].gradiente[0],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: Text('→ SIGUIENTE NIVEL: ${_niveles[nivelSiguiente].titulo.toUpperCase()}',
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900)),
          )),
          const SizedBox(height: 10),
        ],
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () {
            _victoriaCtrl.stop();
            _victoriaCtrl.reset();
            _abrirNivel(_nivelActivo!);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: nivel.gradiente[0].withValues(alpha: 0.5),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: const Text('🔄 REPETIR NIVEL',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
        )),
        const SizedBox(height: 10),
        TextButton(
          onPressed: _cerrarQuiz,
          child: const Text('← Volver al Caminito',
            style: TextStyle(color: Colors.white54, fontSize: 14)),
        ),
      ]),
    );
  }

  Widget _statCard(String label, String valor, String emoji) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 4),
        Text(valor,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
        Text(label, style: AppTextStyles.caption),
      ]),
    ));
  }
}
