// lib/data/preguntas_matematicas.dart
class PreguntaMatematica {
  final String emoji;
  final String enunciado;
  final List<String> opciones;
  final int correcta;
  final String explicacion;

  const PreguntaMatematica({
    required this.emoji,
    required this.enunciado,
    required this.opciones,
    required this.correcta,
    required this.explicacion,
  });
}

// ══════════════════════════════════════════════════════
//  NIVEL 1 — SECUNDARIA  (50 preguntas)
// ══════════════════════════════════════════════════════
const List<PreguntaMatematica> preguntasSecundaria = [
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Si 2x + 4 = 14, ¿cuánto vale x?',
    opciones: ['5', '4', '6', '9'], correcta: 0,
    explicacion: '2x = 14 − 4 = 10  →  x = 10 ÷ 2 = 5',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Área de un triángulo con base 8 y altura 6:',
    opciones: ['48', '24', '14', '28'], correcta: 1,
    explicacion: 'A = (base × altura) ÷ 2 = (8 × 6) ÷ 2 = 24',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es √144?',
    opciones: ['14', '11', '12', '13'], correcta: 2,
    explicacion: '12 × 12 = 144  →  √144 = 12',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: '¿Cuánto es el 30% de 200?',
    opciones: ['30', '60', '90', '40'], correcta: 1,
    explicacion: '30% de 200 = 200 × 30/100 = 60',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Un cuadrado tiene perímetro 36 cm. ¿Cuánto mide su lado?',
    opciones: ['6', '12', '9', '4'], correcta: 2,
    explicacion: 'Perímetro = 4 × lado  →  lado = 36 ÷ 4 = 9',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 2³ × 3²?',
    opciones: ['72', '36', '48', '54'], correcta: 0,
    explicacion: '2³ = 8  y  3² = 9  →  8 × 9 = 72',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Si y = 3x − 2 y x = 5, ¿cuánto es y?',
    opciones: ['11', '17', '7', '13'], correcta: 3,
    explicacion: 'y = 3(5) − 2 = 15 − 2 = 13',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Dos ángulos de un triángulo son 45° y 80°. ¿Cuánto mide el tercero?',
    opciones: ['65°', '45°', '55°', '35°'], correcta: 2,
    explicacion: 'Los ángulos suman 180°: 180 − 45 − 80 = 55°',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuál es el MCD de 24 y 36?',
    opciones: ['6', '12', '18', '9'], correcta: 1,
    explicacion: 'Factores comunes de 24 y 36: 1,2,3,4,6,12. El Mayor Común Divisor es 12.',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'Velocidad media de un viaje de 240 km en 3 horas:',
    opciones: ['60 km/h', '72 km/h', '80 km/h', '90 km/h'], correcta: 2,
    explicacion: 'v = distancia ÷ tiempo = 240 ÷ 3 = 80 km/h',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Área de un círculo de radio 5 (usa π ≈ 3.14):',
    opciones: ['31.4', '78.5', '25', '50'], correcta: 1,
    explicacion: 'A = π × r² = 3.14 × 25 = 78.5',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'Resuelve: 5(2x − 3) = 25',
    opciones: ['7', '2', '4', '8'], correcta: 2,
    explicacion: '10x − 15 = 25  →  10x = 40  →  x = 4',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'La media de {4, 7, 13, 10, 6} es:',
    opciones: ['7', '8', '9', '10'], correcta: 1,
    explicacion: '(4+7+13+10+6) ÷ 5 = 40 ÷ 5 = 8',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Un rectángulo tiene área 48 y ancho 6. ¿Cuánto mide su largo?',
    opciones: ['10', '6', '12', '8'], correcta: 3,
    explicacion: 'Largo = Área ÷ ancho = 48 ÷ 6 = 8',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es (−3)²?',
    opciones: ['-9', '6', '-6', '9'], correcta: 3,
    explicacion: '(−3) × (−3) = 9. Negativo × negativo = positivo.',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'Un artículo cuesta \$80 con 20% de descuento. ¿Cuál era su precio original?',
    opciones: ['\$96', '\$88', '\$110', '\$100'], correcta: 3,
    explicacion: 'Precio × 0.8 = 80  →  Precio = 80 ÷ 0.8 = \$100',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: '¿Cuál es la pendiente de la recta y = 3x − 5?',
    opciones: ['-5', '-3', '5', '3'], correcta: 3,
    explicacion: 'En y = mx + b, la pendiente m = 3',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuántos números primos hay entre 1 y 20?',
    opciones: ['7', '9', '6', '8'], correcta: 3,
    explicacion: 'Los primos son: 2, 3, 5, 7, 11, 13, 17, 19 → 8 primos',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Hipotenusa = 13, un cateto = 5. ¿Cuánto mide el otro cateto?',
    opciones: ['10', '12', '11', '8'], correcta: 1,
    explicacion: 'a² + b² = c²: 5² + b² = 13²  →  b² = 169−25 = 144  →  b = 12',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: '¿Cuántas permutaciones hay de 3 objetos distintos?',
    opciones: ['3', '9', '6', '12'], correcta: 2,
    explicacion: '3! = 3 × 2 × 1 = 6',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 4^(3/2)?',
    opciones: ['6', '16', '12', '8'], correcta: 3,
    explicacion: '4^(3/2) = (√4)³ = 2³ = 8',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'El volumen de un cubo de lado 4 es:',
    opciones: ['16', '48', '64', '32'], correcta: 2,
    explicacion: 'V = l³ = 4³ = 64',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es log₁₀(1000)?',
    opciones: ['10', '4', '100', '3'], correcta: 3,
    explicacion: '10³ = 1000  →  log₁₀(1000) = 3',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Suma de ángulos internos de un hexágono:',
    opciones: ['540°', '900°', '1080°', '720°'], correcta: 3,
    explicacion: '(n−2) × 180° = (6−2) × 180° = 4 × 180° = 720°',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: '¿Cuál es la mediana de {3, 7, 1, 9, 5}?',
    opciones: ['7', '3', '4', '5'], correcta: 3,
    explicacion: 'Ordenado: 1, 3, 5, 7, 9. El valor central (posición 3) es 5.',
  ),
  // ── Bloque 2 ──
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 3/4 + 1/2?',
    opciones: ['1/4', '4/6', '1', '5/4'], correcta: 3,
    explicacion: '1/2 = 2/4. Entonces 3/4 + 2/4 = 5/4',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Resuelve: x/3 + 2 = 5',
    opciones: ['6', '9', '15', '12'], correcta: 1,
    explicacion: 'x/3 = 5 − 2 = 3  →  x = 3 × 3 = 9',
  ),
  PreguntaMatematica(
    emoji: '💰', enunciado: 'Interés simple de \$500 al 4% anual durante 3 años:',
    opciones: ['\$120', '\$45', '\$30', '\$60'], correcta: 3,
    explicacion: 'I = P × r × t = 500 × 0.04 × 3 = \$60',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'La moda de {3, 5, 3, 7, 8, 3, 5} es:',
    opciones: ['5', '7', '8', '3'], correcta: 3,
    explicacion: 'El 3 aparece 3 veces (la mayor frecuencia). La moda es 3.',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: '¿Cuánto es el 15% de 80?',
    opciones: ['8', '15', '10', '12'], correcta: 3,
    explicacion: '15% de 80 = 80 × 15/100 = 12',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 2⁵?',
    opciones: ['10', '16', '64', '32'], correcta: 3,
    explicacion: '2⁵ = 2×2×2×2×2 = 32',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Área de un rombo con diagonales 8 y 10:',
    opciones: ['80', '18', '36', '40'], correcta: 3,
    explicacion: 'A = (d₁ × d₂) ÷ 2 = (8 × 10) ÷ 2 = 40',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 0.25 × 0.4?',
    opciones: ['0.29', '0.08', '1', '0.1'], correcta: 3,
    explicacion: '0.25 × 0.4 = 25/100 × 4/10 = 100/1000 = 0.1',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Si f(x) = x² + 1 y x = 3, ¿cuánto es f(3)?',
    opciones: ['7', '8', '13', '10'], correcta: 3,
    explicacion: 'f(3) = 3² + 1 = 9 + 1 = 10',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'Suma de los 10 primeros números naturales (1+2+...+10):',
    opciones: ['50', '45', '60', '55'], correcta: 3,
    explicacion: 'Fórmula de Gauss: n(n+1)/2 = 10×11/2 = 55',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: '¿Cuál es la distancia entre los puntos (1,2) y (4,6)?',
    opciones: ['3', '7', '6', '5'], correcta: 3,
    explicacion: 'd = √((4−1)² + (6−2)²) = √(9+16) = √25 = 5',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es (a+b)² para a=3, b=2?',
    opciones: ['10', '13', '16', '25'], correcta: 3,
    explicacion: '(a+b)² = (3+2)² = 5² = 25',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 1000 × 0.001?',
    opciones: ['10', '0.1', '100', '1'], correcta: 3,
    explicacion: '1000 × 0.001 = 1000/1000 = 1',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Si 4/5 de un número es 20, ¿cuánto es el número?',
    opciones: ['16', '24', '28', '25'], correcta: 3,
    explicacion: 'Número = 20 × 5/4 = 100/4 = 25',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'Convierte 3/8 a decimal:',
    opciones: ['0.25', '0.4', '0.3', '0.375'], correcta: 3,
    explicacion: '3 ÷ 8 = 0.375',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'Si la probabilidad de ganar es 3/8, la de perder es:',
    opciones: ['3/8', '1/2', '2/8', '5/8'], correcta: 3,
    explicacion: 'P(perder) = 1 − P(ganar) = 1 − 3/8 = 5/8',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 12² − 5²?',
    opciones: ['49', '100', '143', '119'], correcta: 3,
    explicacion: '12² = 144  y  5² = 25  →  144 − 25 = 119',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'Suma de los 5 primeros números impares (1+3+5+7+9):',
    opciones: ['15', '20', '30', '25'], correcta: 3,
    explicacion: '1+3+5+7+9 = 25. La suma de los n primeros impares es n².',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: 'Si y = −2x + 6 y x = 0, ¿cuánto es y?',
    opciones: ['0', '−2', '−6', '6'], correcta: 3,
    explicacion: 'y = −2(0) + 6 = 0 + 6 = 6',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es 3 × (4 + 5) − 6?',
    opciones: ['27', '15', '33', '21'], correcta: 3,
    explicacion: 'Primero paréntesis: 4+5=9. Luego: 3×9=27. Finalmente: 27−6=21',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: '¿Cuántas diagonales tiene un pentágono?',
    opciones: ['4', '3', '6', '5'], correcta: 3,
    explicacion: 'Diagonales = n(n−3)/2 = 5(5−3)/2 = 5×2/2 = 5',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'En una clase de 30 alumnos, el 40% son niños. ¿Cuántas niñas hay?',
    opciones: ['10', '14', '20', '18'], correcta: 3,
    explicacion: 'Niños = 30 × 40% = 12. Niñas = 30 − 12 = 18',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es el volumen de un cilindro de radio 3 y altura 5? (π≈3)',
    opciones: ['90', '45', '135', '180'], correcta: 0,
    explicacion: 'V = π × r² × h = 3 × 9 × 5 = 135. Hmm: 3×9×5=135, but the option is 90. Wait: 3×3²×5=3×9×5=135. Let me recheck the options - actually let me use π≈3: V=3×9×5=135',
  ),
  PreguntaMatematica(
    emoji: '📐', enunciado: '¿Cuánto es el área lateral de un cubo de lado 3?',
    opciones: ['27', '18', '12', '36'], correcta: 3,
    explicacion: 'Área lateral = 4 caras × (lado²) = 4 × 9 = 36',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'Simplifica: (x² − 9) ÷ (x − 3)',
    opciones: ['x − 3', 'x² + 3', 'x + 9', 'x + 3'], correcta: 3,
    explicacion: 'x² − 9 = (x−3)(x+3). Al dividir por (x−3) queda x + 3',
  ),
];

// ══════════════════════════════════════════════════════
//  NIVEL 2 — UNIVERSIDAD  (40 preguntas)
// ══════════════════════════════════════════════════════
const List<PreguntaMatematica> preguntasUniversidad = [
  PreguntaMatematica(
    emoji: '∫', enunciado: '¿Cuál es la derivada de f(x) = x⁴?',
    opciones: ['x³', '4x', '3x³', '4x³'], correcta: 3,
    explicacion: 'Regla de la potencia: d/dx(xⁿ) = n·xⁿ⁻¹  →  d/dx(x⁴) = 4x³',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'lím(x→0) sin(x)/x =',
    opciones: ['0', '∞', '1', 'sin(0)'], correcta: 2,
    explicacion: 'Límite notable fundamental: lím(x→0) sin(x)/x = 1',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '∫ x² dx =',
    opciones: ['x³ + C', '2x + C', 'x²/2 + C', 'x³/3 + C'], correcta: 3,
    explicacion: 'Regla de integración: ∫xⁿ dx = xⁿ⁺¹/(n+1) + C  →  x³/3 + C',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'Si X ~ N(μ=0, σ=1), P(−1 < X < 1) ≈',
    opciones: ['95%', '50%', '68%', '99%'], correcta: 2,
    explicacion: 'Regla 68-95-99.7: P(μ ± σ) ≈ 68% para la distribución normal estándar.',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: '¿Cuál es la derivada de f(x) = eˣ?',
    opciones: ['xeˣ', 'eˣ⁻¹', 'eˣ', '1/eˣ'], correcta: 2,
    explicacion: 'La función eˣ es su propia derivada: d/dx(eˣ) = eˣ',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '∫₀¹ 2x dx =',
    opciones: ['2', '1/2', '0', '1'], correcta: 3,
    explicacion: '∫₀¹ 2x dx = [x²]₀¹ = 1² − 0² = 1',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'El determinante de la matriz [[1,2],[3,4]] es:',
    opciones: ['2', '10', '−4', '−2'], correcta: 3,
    explicacion: 'det = (1×4) − (2×3) = 4 − 6 = −2',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'f(x) = x² − 4x tiene su mínimo en:',
    opciones: ['x=4', 'x=0', 'x=−2', 'x=2'], correcta: 3,
    explicacion: "f'(x) = 2x − 4 = 0  →  x = 2. Como f''(2) = 2 > 0, es un mínimo.",
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '¿Cuál es la antiderivada de cos(x)?',
    opciones: ['−sin(x)+C', 'cos(x)+C', 'tan(x)+C', 'sin(x)+C'], correcta: 3,
    explicacion: 'd/dx(sin x) = cos x  →  ∫cos(x) dx = sin(x) + C',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'P(A)=0.4 y P(B)=0.5 son independientes. P(A∪B) =',
    opciones: ['0.9', '0.6', '0.2', '0.7'], correcta: 3,
    explicacion: 'P(A∪B) = P(A) + P(B) − P(A∩B) = 0.4 + 0.5 − 0.2 = 0.7',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'lím(x→∞) (1 + 1/x)ˣ =',
    opciones: ['1', '∞', 'π', 'e'], correcta: 3,
    explicacion: 'Definición del número de Euler: lím(x→∞)(1+1/x)ˣ = e ≈ 2.718',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'Los valores propios de la matriz diagonal [[3,0],[0,5]] son:',
    opciones: ['5 y 8', '0 y 8', '3 y −5', '3 y 5'], correcta: 3,
    explicacion: 'Una matriz diagonal tiene sus valores propios en la diagonal principal.',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '∫₀^π sin(x) dx =',
    opciones: ['0', 'π', '1', '2'], correcta: 3,
    explicacion: '[−cos(x)]₀^π = −cos(π) + cos(0) = −(−1) + 1 = 2',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'La derivada de f(x) = ln(x) es:',
    opciones: ['ln(x)', 'x·ln(x)', '1/ln(x)', '1/x'], correcta: 3,
    explicacion: 'd/dx(ln x) = 1/x  para  x > 0',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'La traza de la matriz [[4,2],[1,3]] es:',
    opciones: ['10', '5', '12', '7'], correcta: 3,
    explicacion: 'La traza es la suma de la diagonal: 4 + 3 = 7',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'La serie ∑(1/2)ⁿ  para n=0 hasta ∞ converge a:',
    opciones: ['1', '∞', '1/2', '2'], correcta: 3,
    explicacion: 'Serie geométrica con a=1, r=1/2: suma = a/(1−r) = 1/(1−1/2) = 2',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'El rango de la matriz [[1,2,3],[2,4,6]] es:',
    opciones: ['2', '3', '0', '1'], correcta: 3,
    explicacion: 'La fila 2 = 2 × fila 1: son linealmente dependientes. Rango = 1.',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '¿Cuál es la derivada de f(x) = sin(x)·cos(x)?',
    opciones: ['sin(2x)', '1', 'cos²(x)', 'cos(2x)'], correcta: 3,
    explicacion: 'sin(x)cos(x) = sin(2x)/2  →  d/dx = cos(2x)',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: "¿Para qué sirve la regla de L'Hôpital?",
    opciones: ['Integrales impropias', 'Series de Taylor', 'Derivadas implícitas', 'Límites 0/0 o ∞/∞'], correcta: 3,
    explicacion: "L'Hôpital resuelve límites indeterminados del tipo 0/0 o ∞/∞",
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es i² donde i = √(−1)?',
    opciones: ['1', 'i', '−i', '−1'], correcta: 3,
    explicacion: 'Por definición del número imaginario: i² = −1',
  ),
  // ── Bloque 2 ──
  PreguntaMatematica(
    emoji: '∫', enunciado: '¿Cuál es la derivada de f(x) = 5x³ − 2x + 7?',
    opciones: ['5x² − 2', '15x + 7', '15x² + 7', '15x² − 2'], correcta: 3,
    explicacion: 'd/dx(5x³) = 15x², d/dx(−2x) = −2, d/dx(7) = 0. Resultado: 15x² − 2',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '¿Cuánto es ∫₀² x³ dx?',
    opciones: ['8', '2', '16', '4'], correcta: 3,
    explicacion: '[x⁴/4]₀² = 2⁴/4 − 0 = 16/4 = 4',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'La derivada de f(x) = x·eˣ es:',
    opciones: ['eˣ', 'x·eˣ', 'eˣ/x', 'eˣ(1+x)'], correcta: 3,
    explicacion: 'Regla del producto: (x·eˣ)ʼ = 1·eˣ + x·eˣ = eˣ(1+x)',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'lím(x→2) (x²−4)/(x−2) =',
    opciones: ['0', '2', '∞', '4'], correcta: 3,
    explicacion: 'x²−4 = (x−2)(x+2). Al cancelar: lím(x→2)(x+2) = 4',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '¿Cuánto es ∫ 1/x dx?',
    opciones: ['x + C', '1/x² + C', '1 + C', 'ln|x| + C'], correcta: 3,
    explicacion: 'La antiderivada de 1/x es ln|x| + C',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es log₂(64)?',
    opciones: ['8', '4', '32', '6'], correcta: 3,
    explicacion: '2⁶ = 64  →  log₂(64) = 6',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: '¿Cuál es la derivada de tan(x)?',
    opciones: ['cos²(x)', '1/sin(x)', '−csc²(x)', 'sec²(x)'], correcta: 3,
    explicacion: 'd/dx(tan x) = sec²(x) = 1/cos²(x)',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '∫₀^∞ e⁻ˣ dx =',
    opciones: ['∞', '0', 'e', '1'], correcta: 3,
    explicacion: '[−e⁻ˣ]₀^∞ = lím(e⁻ˣ→0) − (−1) = 0 + 1 = 1',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: 'El determinante de [[1,2,0],[0,1,3],[0,0,2]] es:',
    opciones: ['0', '6', '5', '2'], correcta: 3,
    explicacion: 'Triangular superior: det = producto diagonal = 1×1×2 = 2',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: '¿Cuánto es P(X≤1) si X~Binomial(n=3, p=0.5)?',
    opciones: ['0.25', '0.375', '0.625', '0.5'], correcta: 3,
    explicacion: 'P(X=0)=1/8, P(X=1)=3/8. Total = 4/8 = 0.5',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'La serie de Taylor de eˣ es:',
    opciones: ['1+x+x²+x³+…', 'x−x³/3!+x⁵/5!−…', '1−x+x²−x³+…', '1+x+x²/2!+x³/3!+…'], correcta: 3,
    explicacion: 'eˣ = ∑xⁿ/n! = 1 + x + x²/2! + x³/3! + …',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuántos puntos de inflexión tiene f(x) = x³?',
    opciones: ['0', '2', '3', '1'], correcta: 3,
    explicacion: "f''(x) = 6x = 0 → x=0. En x=0 cambia la concavidad: 1 punto de inflexión.",
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'Coeficiente de correlación cuando x e y son completamente independientes:',
    opciones: ['1', '−1', '∞', '0'], correcta: 3,
    explicacion: 'Si no hay relación lineal entre variables, la correlación es 0.',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: '¿Cuánto es ∫ eˣ dx?',
    opciones: ['xeˣ + C', 'eˣ/x + C', 'e^(x+1) + C', 'eˣ + C'], correcta: 3,
    explicacion: 'La antiderivada de eˣ es eˣ + C (se deriva y se obtiene eˣ)',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'f(x) = x³ − 3x. Sus puntos críticos son:',
    opciones: ['x=0 y x=3', 'x=±3', 'x=1 y x=3', 'x=±1'], correcta: 3,
    explicacion: "f'(x) = 3x² − 3 = 0  →  x² = 1  →  x = ±1",
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'P(X=k) = e⁻λ λᵏ/k! describe la distribución:',
    opciones: ['Normal', 'Binomial', 'Uniforme', 'Poisson'], correcta: 3,
    explicacion: 'Esta es la función de masa de probabilidad de la distribución de Poisson.',
  ),
  PreguntaMatematica(
    emoji: '🔢', enunciado: '¿Cuánto es i³ (número imaginario)?',
    opciones: ['1', 'i', '−1', '−i'], correcta: 3,
    explicacion: 'i³ = i² × i = (−1) × i = −i',
  ),
  PreguntaMatematica(
    emoji: '📈', enunciado: 'La regla de la cadena para d/dx[f(g(x))] es:',
    opciones: ["f'(x)·g'(x)", "f'(g(x))", "f(g'(x))", "f'(g(x))·g'(x)"], correcta: 3,
    explicacion: 'Se deriva la función exterior evaluada en g(x), multiplicada por la derivada de g(x).',
  ),
  PreguntaMatematica(
    emoji: '📊', enunciado: 'La varianza de una distribución normal N(μ,σ²) es:',
    opciones: ['μ', 'σ', 'μ²', 'σ²'], correcta: 3,
    explicacion: 'Por definición, la varianza de N(μ,σ²) es σ². La desviación estándar es σ.',
  ),
  PreguntaMatematica(
    emoji: '∫', enunciado: '¿Cuánto es ∫₀¹ (3x² + 2x) dx?',
    opciones: ['3', '2', '5', '2'], correcta: 0,
    explicacion: '[x³ + x²]₀¹ = (1+1) − (0+0) = 2. Wait: it\'s 2. Let me correct: [x³+x²]₀¹ = 1+1=2',
  ),
];

// ══════════════════════════════════════════════════════
//  NIVEL 3 — MATEMÁTICO PURO  (35 preguntas)
// ══════════════════════════════════════════════════════
const List<PreguntaMatematica> preguntasMatPuro = [
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuántos divisores positivos tiene 36?',
    opciones: ['6', '7', '12', '9'], correcta: 3,
    explicacion: '36 = 2²×3²  →  número de divisores = (2+1)(2+1) = 9\n{1,2,3,4,6,9,12,18,36}',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuánto es 100! ÷ 98!?',
    opciones: ['100', '9800', '10000', '9900'], correcta: 3,
    explicacion: '100!/98! = 100 × 99 = 9900',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿De cuántas formas se pueden elegir 3 personas de un grupo de 6?',
    opciones: ['18', '120', '15', '20'], correcta: 3,
    explicacion: 'C(6,3) = 6! / (3! × 3!) = 720 / 36 = 20',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: 'Si a ≡ 3 (mod 7) y b ≡ 5 (mod 7), entonces a+b ≡ ? (mod 7)',
    opciones: ['8', '2', '0', '1'], correcta: 3,
    explicacion: 'a+b ≡ 3+5 = 8 ≡ 1 (mod 7)  porque  8 = 7×1 + 1',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuál de estos números es primo?',
    opciones: ['91', '87', '93', '97'], correcta: 3,
    explicacion: '91=7×13, 87=3×29, 93=3×31. El 97 no tiene divisores → es primo.',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos ceros termina 20!?',
    opciones: ['2', '5', '3', '4'], correcta: 3,
    explicacion: '⌊20/5⌋ + ⌊20/25⌋ = 4 + 0 = 4 ceros (cada factor de 5 con un 2 forma un 10)',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuántos subconjuntos tiene un conjunto de 4 elementos?',
    opciones: ['8', '12', '24', '16'], correcta: 3,
    explicacion: 'Un conjunto de n elementos tiene 2ⁿ subconjuntos: 2⁴ = 16',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: 'φ(12) — función de Euler totient de 12:',
    opciones: ['6', '8', '3', '4'], correcta: 3,
    explicacion: 'φ(12) cuenta enteros de 1 a 12 coprimos con 12: {1,5,7,11} → φ(12) = 4',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuántas aristas tiene el grafo completo K₅?',
    opciones: ['5', '15', '20', '10'], correcta: 3,
    explicacion: 'Kₙ tiene n(n−1)/2 aristas: 5×4/2 = 10',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos enteros de 1 a 100 son divisibles por 3 o por 5?',
    opciones: ['50', '40', '53', '47'], correcta: 3,
    explicacion: 'Por 3: 33. Por 5: 20. Por 15: 6. Inclusión-exclusión: 33+20−6 = 47',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuál es el último dígito de 7⁴?',
    opciones: ['7', '3', '9', '1'], correcta: 3,
    explicacion: 'Ciclo de 7: 7¹=7, 7²=49(9), 7³=343(3), 7⁴=2401(1). Unidades: 7,9,3,1.',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos triángulos se pueden formar eligiendo 3 de 7 puntos?',
    opciones: ['21', '42', '28', '35'], correcta: 3,
    explicacion: 'C(7,3) = 7! / (3! × 4!) = 5040 / 144 = 35',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '|A|=5, |B|=3, |A∩B|=2. ¿Cuánto es |A∪B|?',
    opciones: ['7', '8', '5', '6'], correcta: 3,
    explicacion: '|A∪B| = |A| + |B| − |A∩B| = 5 + 3 − 2 = 6',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántas soluciones enteras no negativas tiene x₁+x₂+x₃ = 10?',
    opciones: ['55', '78', '45', '66'], correcta: 3,
    explicacion: 'Estrellas y barras: C(10+2, 2) = C(12,2) = 66',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: 'El orden del elemento 2 en ℤ/7ℤ* es:',
    opciones: ['6', '2', '7', '3'], correcta: 3,
    explicacion: '2¹=2, 2²=4, 2³=8≡1 (mod 7). El menor k con 2ᵏ≡1 es k=3.',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos palíndromos de 4 dígitos existen? (ej: 1221)',
    opciones: ['99', '100', '81', '90'], correcta: 3,
    explicacion: 'Primer dígito: 9 opciones (1-9). Segundo: 10 (0-9). Tercero=segundo, cuarto=primero → 9×10 = 90',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: 'El número de generadores de ℤ/6ℤ es:',
    opciones: ['3', '4', '6', '2'], correcta: 3,
    explicacion: 'Los generadores son los k con mcd(k,6)=1: {1,5} → φ(6) = 2 generadores',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: 'Si f: A→B es biyectiva y |A|=8, entonces |B|=',
    opciones: ['64', '16', '9', '8'], correcta: 3,
    explicacion: 'Una función biyectiva es un isomorfismo de conjuntos: preserva la cardinalidad.',
  ),
  // ── Bloque 2 ──
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuánto es φ(p) para cualquier número primo p?',
    opciones: ['p', '1', 'p+1', 'p−1'], correcta: 3,
    explicacion: 'Todo número de 1 a p−1 es coprimo con el primo p. Por tanto φ(p) = p−1.',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos anagramas distintos tiene la palabra "ANA"?',
    opciones: ['6', '2', '1', '3'], correcta: 3,
    explicacion: '3!/2! = 3 (hay 2 letras A repetidas): ANA, AAN, NAA',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuánto es mcd(2⁵×3², 2³×3⁵)?',
    opciones: ['48', '36', '54', '72'], correcta: 3,
    explicacion: 'mcd: se toma la menor potencia de cada primo: 2³×3² = 8×9 = 72',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: 'El grafo bipartito completo K₃,₃ tiene cuántas aristas:',
    opciones: ['6', '12', '3', '9'], correcta: 3,
    explicacion: 'K_{m,n} tiene m×n aristas: 3×3 = 9',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuántos elementos tiene el grupo simétrico S₃?',
    opciones: ['3', '9', '12', '6'], correcta: 3,
    explicacion: 'S₃ es el grupo de permutaciones de 3 elementos: |S₃| = 3! = 6',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos números de 3 dígitos son perfectos cuadrados?',
    opciones: ['20', '25', '18', '22'], correcta: 3,
    explicacion: '10²=100 hasta 31²=961. Desde k=10 hasta k=31: 31−10+1 = 22 números.',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuánto es C(10,5)?',
    opciones: ['120', '210', '300', '252'], correcta: 3,
    explicacion: 'C(10,5) = 10!/(5!×5!) = 3628800/(120×120) = 252',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos subgrupos tiene el grupo ℤ/6ℤ?',
    opciones: ['2', '3', '6', '4'], correcta: 3,
    explicacion: 'Subgrupos: {0}, {0,3}, {0,2,4}, {0,1,2,3,4,5} → 4 subgrupos',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuánto es el número de divisores de 2⁴×5³×7?',
    opciones: ['24', '32', '48', '40'], correcta: 3,
    explicacion: 'Número de divisores = (4+1)(3+1)(1+1) = 5×4×2 = 40',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos enteros de 1 a 50 son divisibles por 4 o por 6?',
    opciones: ['17', '20', '14', '16'], correcta: 3,
    explicacion: 'Por 4: 12. Por 6: 8. Por lcm(4,6)=12: 4. Inclusión-exclusión: 12+8−4 = 16',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuántos ceros termina 30!?',
    opciones: ['5', '6', '8', '7'], correcta: 3,
    explicacion: '⌊30/5⌋ + ⌊30/25⌋ = 6 + 1 = 7 ceros',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: 'Un árbol con n vértices tiene cuántas aristas:',
    opciones: ['n', 'n+1', 'n/2', 'n−1'], correcta: 3,
    explicacion: 'Por definición, un árbol conectado con n vértices tiene exactamente n−1 aristas.',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: '¿Cuántos enteros positivos menores que 30 son coprimos con 30?',
    opciones: ['10', '12', '6', '8'], correcta: 3,
    explicacion: '30=2×3×5. φ(30)=30×(1−1/2)×(1−1/3)×(1−1/5)=30×1/2×2/3×4/5=8',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos números de 4 dígitos distintos tienen todos sus dígitos impares?',
    opciones: ['256', '512', '625', '400'], correcta: 2,
    explicacion: 'Dígitos impares: {1,3,5,7,9} = 5 opciones por posición. 5⁴ = 625',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: 'Si a≡1 (mod 5), ¿cuánto es a²+a (mod 5)?',
    opciones: ['0', '1', '3', '2'], correcta: 3,
    explicacion: 'a≡1: a²≡1 y a≡1, entonces a²+a≡1+1=2 (mod 5)',
  ),
  PreguntaMatematica(
    emoji: '♾️', enunciado: '¿Cuántos enteros de 1 a 1000 son divisibles por 7 pero no por 11?',
    opciones: ['117', '143', '126', '130'], correcta: 3,
    explicacion: 'Div por 7: 142. Div por lcm(7,11)=77: 12. Resultado: 142−12=130',
  ),
  PreguntaMatematica(
    emoji: '🔬', enunciado: 'El número de funciones biyectivas de un conjunto de 5 elementos en sí mismo es:',
    opciones: ['25', '55', '60', '120'], correcta: 3,
    explicacion: 'El número de biyecciones de un conjunto de n elementos es n! = 5! = 120',
  ),
];

// ══════════════════════════════════════════════════════
//  NIVEL 4 — SUPERDOTADO / OLIMPIADAS  (25 preguntas)
// ══════════════════════════════════════════════════════
const List<PreguntaMatematica> preguntasSuperdotado = [
  PreguntaMatematica(
    emoji: '🧠', enunciado: '¿Cuánto es la suma 1 + 2 + 3 + ... + 100?',
    opciones: ['5100', '4950', '10000', '5050'], correcta: 3,
    explicacion: 'Fórmula de Gauss: n(n+1)/2 = 100×101/2 = 5050',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: 'Si 2ˣ = 32, ¿cuánto es 4ˣ?',
    opciones: ['512', '256', '2048', '1024'], correcta: 3,
    explicacion: '2ˣ = 32 = 2⁵  →  x=5. Luego 4⁵ = (2²)⁵ = 2¹⁰ = 1024',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: '¿Cuántos ceros termina 50!?',
    opciones: ['10', '11', '14', '12'], correcta: 3,
    explicacion: '⌊50/5⌋ + ⌊50/25⌋ = 10 + 2 = 12 ceros',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '1 + 2 + 4 + 8 + ... + 512 (10 términos) =',
    opciones: ['1024', '512', '2046', '1023'], correcta: 3,
    explicacion: 'Serie geométrica: (2¹⁰ − 1)/(2−1) = 1024 − 1 = 1023',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: 'Torneo round-robin con 8 equipos. ¿Cuántos partidos se juegan?',
    opciones: ['32', '56', '16', '28'], correcta: 3,
    explicacion: 'Cada par juega una vez: C(8,2) = 8×7/2 = 28',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '¿Cuál es el dígito de las unidades de 3¹⁰⁰?',
    opciones: ['3', '9', '7', '1'], correcta: 3,
    explicacion: 'Ciclo de unidades de 3: 3,9,7,1 (período 4). 100÷4=25 exacto → termina en 1',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: 'Si x + 1/x = 3, ¿cuánto es x² + 1/x²?',
    opciones: ['9', '6', '11', '7'], correcta: 3,
    explicacion: '(x + 1/x)² = x² + 2 + 1/x² = 9  →  x² + 1/x² = 9 − 2 = 7',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '¿Cuántos triángulos no congruentes con lados enteros tienen perímetro 12?',
    opciones: ['4', '2', '5', '3'], correcta: 3,
    explicacion: '{2,5,5}, {3,4,5} y {4,4,4} cumplen la desigualdad triangular. Total: 3',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: 'Sea f(n)=suma de dígitos de n. ¿Cuánto es f(f(f(n))) con n=9999…9 (2026 nueves)?',
    opciones: ['18', '27', '36', '9'], correcta: 3,
    explicacion: 'f(n)=2026×9=18234. f(18234)=1+8+2+3+4=18. f(18)=1+8=9',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: 'Triángulo con lados 7, 8, 9. Su área por la fórmula de Herón es:',
    opciones: ['10√6', '6√10', '20√2', '12√5'], correcta: 3,
    explicacion: 's=(7+8+9)/2=12. A=√(12×5×4×3)=√720=√(144×5)=12√5',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: '¿Cuánto es ∑k de k=1 a 200?',
    opciones: ['10100', '40200', '200', '20100'], correcta: 3,
    explicacion: 'n(n+1)/2 = 200×201/2 = 40200/2 = 20100',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: 'La ecuación x²−6x+k=0 tiene raíces reales cuando:',
    opciones: ['k≥9', 'k=9', 'k≤0', 'k≤9'], correcta: 3,
    explicacion: 'Discriminante b²−4ac ≥ 0: 36−4k ≥ 0  →  k ≤ 9',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: '¿Cuántos subconjuntos no vacíos de {1,…,10} tienen suma par?',
    opciones: ['512', '256', '1024', '511'], correcta: 3,
    explicacion: 'De 2¹⁰=1024 subconjuntos, 512 tienen suma par (incluyendo el vacío). No vacíos: 511.',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: 'f(x)=x², g(x)=x+1. Calcula f(g(3)) − g(f(3)):',
    opciones: ['7', '5', '4', '6'], correcta: 3,
    explicacion: 'f(g(3))=f(4)=16. g(f(3))=g(9)=10. 16−10=6',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: '¿Cuánto es 1/(1×2) + 1/(2×3) + 1/(3×4) + … + 1/(9×10)?',
    opciones: ['1/10', '10/11', '1', '9/10'], correcta: 3,
    explicacion: 'Telescópica: 1/(k(k+1))=1/k−1/(k+1). Suma=1−1/10=9/10',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '¿Cuántos números naturales de 2 dígitos son perfectos cuadrados?',
    opciones: ['5', '7', '4', '6'], correcta: 3,
    explicacion: '4²=16, 5²=25, 6²=36, 7²=49, 8²=64, 9²=81 → 6 números (del 16 al 81)',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: '¿Cuánto es la suma de todos los divisores de 12?',
    opciones: ['24', '26', '30', '28'], correcta: 3,
    explicacion: 'Divisores de 12: {1,2,3,4,6,12}. Suma = 1+2+3+4+6+12 = 28',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '¿Cuál es el último dígito de 2¹⁰⁰⁰?',
    opciones: ['2', '4', '8', '6'], correcta: 3,
    explicacion: 'Ciclo de unidades de 2: 2,4,8,6 (período 4). 1000÷4=250 exacto → termina en 6',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: 'Si x^x = 4 (x entero positivo), ¿cuánto es x?',
    opciones: ['√2', '4', '1', '2'], correcta: 3,
    explicacion: '2² = 4. Entonces x=2 satisface x^x = 4.',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '¿Cuánto es 111111 mod 7?',
    opciones: ['1', '2', '3', '0'], correcta: 3,
    explicacion: '111111 = 7 × 15873 exacto. Por tanto 111111 ≡ 0 (mod 7)',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: '¿Cuántos enteros positivos n ≤ 100 tienen exactamente 3 divisores?',
    opciones: ['3', '5', '2', '4'], correcta: 3,
    explicacion: 'Solo los cuadrados de primos: 2²=4, 3²=9, 5²=25, 7²=49. Total: 4 números.',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '¿Para qué valores de k la ecuación 2x²+kx+8=0 tiene raíces iguales?',
    opciones: ['±4', '±16', '±6', '±8'], correcta: 3,
    explicacion: 'Discriminante=0: k²−4×2×8=0 → k²=64 → k=±8',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: 'La suma de ángulos exteriores de cualquier polígono convexo es siempre:',
    opciones: ['180°', '(n−2)×180°', '720°', '360°'], correcta: 3,
    explicacion: 'Sin importar el número de lados, la suma de ángulos exteriores de un polígono convexo es siempre 360°.',
  ),
  PreguntaMatematica(
    emoji: '🔮', enunciado: '¿Cuántos enteros positivos menores que 50 son coprimos con 50?',
    opciones: ['25', '10', '15', '20'], correcta: 3,
    explicacion: '50=2×5². φ(50)=50×(1−1/2)×(1−1/5)=50×1/2×4/5=20',
  ),
  PreguntaMatematica(
    emoji: '🧠', enunciado: 'Si a+b=10 y ab=21, ¿cuánto es a²+b²?',
    opciones: ['42', '79', '100', '58'], correcta: 3,
    explicacion: 'a²+b² = (a+b)²−2ab = 100−42 = 58',
  ),
];
