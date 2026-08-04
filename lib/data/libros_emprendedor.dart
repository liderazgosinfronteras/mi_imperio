// lib/data/libros_emprendedor.dart
import '../models/libro_model.dart';

List<Libro> crearLibrosEmprendedor() => [
  Libro(
    id: 'emp01',
    titulo: 'El Emprendedor Lean',
    autor: 'Eric Ries',
    anio: '2011',
    emoji: '🚀',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'La metodología Lean Startup que revolucionó cómo se construyen empresas: experimentar, aprender y pivotar más rápido que la competencia.',
    gemasRecompensa: 44,
    capitulos: [
      const CapituloResumen(
        titulo: 'La Startup como Experimento',
        emoji: '🔬',
        contenido: '''
Eric Ries comenzó su carrera como emprendedor fracasando espectacularmente. Construyó un producto durante meses con un equipo brillante, con tecnología de punta, con un plan de negocios detallado. Lo lanzaron. Nadie lo compró. Y en ese fracaso, Ries tuvo la revelación que cambió su forma de pensar sobre el emprendimiento.

El problema no era la calidad del producto. El problema era el método: habían construido algo que nadie les había pedido, basándose en suposiciones no validadas sobre lo que el mercado quería. La metodología Lean Startup nació de ese fracaso.

La premisa central es radical: una startup no es una pequeña versión de una empresa grande. Es una institución diseñada para descubrir un modelo de negocio sostenible en condiciones de extrema incertidumbre. El trabajo principal del emprendedor no es ejecutar un plan; es aprender qué plan ejecutar.

Esta distinción cambia completamente cómo se trabaja. En una empresa establecida con producto y mercado probados, la eficiencia en la ejecución es el objetivo. En una startup, el objetivo es el aprendizaje validado: descubrir rápidamente qué funciona y qué no antes de quedarse sin dinero o tiempo.

Ries introduce el concepto del ciclo construir-medir-aprender (build-measure-learn): en lugar de construir el producto perfecto y lanzarlo, construye el mínimo necesario para aprender, mide la respuesta real del mercado y usa eso para tomar decisiones mejores.

La startup como experimento elimina el orgullo del producto y lo reemplaza por la humildad del científico: mis hipótesis pueden estar equivocadas, y debo descubrirlo lo más rápido posible.
''',
      ),
      const CapituloResumen(
        titulo: 'El MVP: Mínimo Producto Viable',
        emoji: '⚡',
        contenido: '''
El concepto de MVP (Minimum Viable Product o Mínimo Producto Viable) es quizás la contribución más práctica y más mal entendida del libro de Ries. Ha sido adoptado masivamente en el mundo emprendedor pero con frecuencia interpretado incorrectamente como "el producto más barato posible".

Un MVP no es un producto de baja calidad. Es el experimento más simple posible que te permite aprender la lección más importante en el menor tiempo. La pregunta que define al MVP no es "¿qué es lo mínimo que puedo construir?" sino "¿qué es lo mínimo que necesito construir para probar mi hipótesis más crítica?"

Ries ilustra con el ejemplo de Dropbox: antes de construir el software, los fundadores hicieron un video de cuatro minutos mostrando cómo funcionaría el producto. El video no tenía código detrás; era solo una demostración del concepto. En una noche, decenas de miles de personas se registraron para la lista de espera. Eso era el MVP: una validación de que el problema era real y que las personas querían esa solución específica.

Otro ejemplo: Zappos, el gigante de calzado online, comenzó como un MVP donde el fundador fotografiaba zapatos de tiendas locales, los ponía online y cuando alguien compraba, iba a la tienda, compraba el zapato al precio regular y lo enviaba. No había sistema de inventario, no había optimización de logística. Solo aprendizaje: ¿la gente compra zapatos online sin probárselos? Sí.

La mentalidad del MVP requiere superar el miedo a lanzar algo imperfecto. Ries cita la frase de Reid Hoffman (fundador de LinkedIn): "Si no te da vergüenza la primera versión de tu producto, lo lanzaste demasiado tarde."
''',
      ),
      const CapituloResumen(
        titulo: 'Pivote o Persiste: La Decisión Más Difícil',
        emoji: '🔄',
        contenido: '''
Uno de los momentos más difíciles en la vida de cualquier startup es decidir si pivotar (cambiar la dirección fundamental del negocio) o persistir (continuar con el curso actual a pesar de resultados mixtos). Ries dedica un capítulo completo a este dilema porque lo considera la decisión más crítica y más emocionalmente cargada del emprendimiento.

La dificultad de la decisión es psicológica. Los fundadores están emocionalmente invertidos en su visión original: meses o años de trabajo, sus propios ahorros, la confianza de sus inversores. Reconocer que la dirección debe cambiar puede sentirse como admitir un fracaso personal. Esta resistencia es comprensible pero costosa.

Ries propone que la decisión de pivotar o persistir debe basarse en métricas de aprendizaje validado, no en intuición ni optimismo. Las preguntas clave son: ¿estamos aprendiendo lo que necesitamos aprender? ¿Hay evidencia de que nuestras hipótesis fundamentales son correctas? ¿Los indicadores adelantados apuntan hacia un modelo de negocio sostenible?

Si las respuestas son negativas después de suficientes experimentos, el pivote es la respuesta racional. No es fracaso; es el proceso de aprendizaje funcionando correctamente.

Ries identifica varios tipos de pivote. El pivote de zoom-in (lo que era una característica se convierte en el producto completo). El pivote de segmento de cliente (el producto funciona, pero para un segmento diferente del que pensabas). El pivote de plataforma (lo que construiste como aplicación puede convertirse en plataforma para otros). Cada tipo representa una forma diferente de usar lo aprendido para redireccionar hacia el éxito.

Los emprendedores que pivotaron a tiempo construyeron empresas icónicas: Twitter empezó como un servicio de podcasting, Instagram era una app de geolocalización social.
''',
      ),
      const CapituloResumen(
        titulo: 'Métricas que Importan vs. Métricas de Vanidad',
        emoji: '📊',
        contenido: '''
Ries introduce una distinción crucial para cualquier emprendedor: la diferencia entre "métricas de vanidad" y "métricas accionables". Las métricas de vanidad hacen que el negocio parezca bien aunque no esté funcionando. Las métricas accionables revelan información que puede usarse para tomar mejores decisiones.

Las métricas de vanidad más comunes incluyen el número de usuarios registrados (sin considerar cuántos son activos), las visitas totales al sitio web (sin considerar la conversión), las descargas de la app (sin considerar la retención) y el dinero recaudado en inversión (que no es el objetivo sino un medio).

Un negocio puede tener un millón de usuarios registrados de los cuales solo el 1% son activos, y usar ese millón de usuarios como prueba de éxito ante inversores mientras el negocio real es frágil. Las métricas de vanidad permiten esta ilusión.

Las métricas accionables en cambio conectan directamente con el comportamiento del negocio y con las decisiones que debes tomar. La tasa de retención (¿cuántos usuarios que usaron el producto el mes pasado lo volvieron a usar este mes?), el LTV (valor de vida del cliente), la tasa de conversión de prueba a pago: estas métricas dicen si el negocio está creando valor real.

Ries también introduce el concepto del "motor de crecimiento": el mecanismo específico mediante el cual el negocio crece. Puede ser crecimiento pegajoso (los usuarios que retienen se convierten en base fija), crecimiento viral (cada usuario trae nuevos usuarios) o crecimiento pagado (el costo de adquisición es menor que el LTV).

Entender cuál es tu motor de crecimiento y medir las métricas que lo alimentan es la disciplina analítica fundamental del emprendedor Lean.
''',
      ),
      const CapituloResumen(
        titulo: 'El Emprendedor Lean en la Gran Empresa',
        emoji: '🏢',
        contenido: '''
El capítulo final de Ries expande su metodología más allá de las startups hacia las grandes empresas. Su argumento es que las organizaciones establecidas también necesitan innovación continua, y la metodología Lean es aplicable aunque el contexto sea diferente.

Las grandes empresas enfrentan un dilema llamado "el dilema del innovador" (acuñado por Clayton Christensen): las mismas prácticas que hacen exitosa a una empresa establecida (optimización de procesos, eficiencia de escala, satisfacción del cliente actual) hacen muy difícil innovar para el futuro. Las divisiones de innovación de las grandes empresas suelen morir aplastadas por los procesos y culturas de la organización madre.

Ries propone el modelo de "sandbox de innovación": espacios dentro de la organización grande donde equipos pequeños pueden operar con autonomía, aplicar metodología Lean, fallar rápido y aprender sin poner en riesgo las operaciones core del negocio. Los equipos en el sandbox tienen métricas propias, presupuestos propios y protección de la burocracia corporativa durante el período de experimentación.

El caso de General Electric y su programa FastWorks, que implementó principios Lean en procesos de desarrollo de productos que típicamente tomaban años, demostró que la metodología funciona incluso en organizaciones centenarias con productos físicos complejos.

La lección final de Ries es universal: en un mundo que cambia más rápido que nunca, la capacidad de aprender y adaptarse más rápido que la competencia es la ventaja competitiva más sostenible. El emprendedor Lean, ya sea fundando una startup o innovando dentro de una corporación, aplica esa capacidad con rigor y metodología.

No se trata de tener la idea correcta desde el principio; se trata de encontrar la idea correcta más rápido que nadie.
''',
      ),
    ],
    preguntas: [
      const PreguntaLibro(
        enunciado: '¿Cuál es la premisa central de la metodología Lean Startup según Ries?',
        opciones: [
          'Que las startups deben copiar los modelos de empresas exitosas existentes',
          'Que el trabajo principal del emprendedor es ejecutar el plan de negocios con eficiencia',
          'Que una startup es una institución para descubrir un modelo sostenible bajo extrema incertidumbre',
          'Que el producto perfecto siempre encuentra su mercado si se construye bien',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La startup no es una empresa pequeña que ejecuta un plan; es una institución diseñada para descubrir el plan correcto mediante experimentos. El objetivo es aprendizaje validado, no ejecución eficiente de suposiciones no probadas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo es correcto decidir pivotar según la metodología Lean?',
        opciones: [
          'Cuando los inversores pierden la confianza en el equipo',
          'Cuando la competencia lanza un producto similar',
          'Cuando la evidencia de múltiples experimentos muestra que las hipótesis fundamentales son incorrectas',
          'Cuando el equipo fundador se siente desmotivado por la dirección actual',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El pivote debe basarse en métricas de aprendizaje validado, no en emoción ni presión externa. Si los experimentos muestran consistentemente que las hipótesis fundamentales son incorrectas, el pivote es la respuesta racional.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el primer y más importante "Factor F" de fracaso empresarial según el libro?',
        opciones: [
          'La falta de financiación en las primeras etapas',
          'Un producto sin demanda suficiente en el mercado',
          'Relacionarse con los socios incorrectos',
          'Entrar en un mercado con competencia establecida',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El primer Factor F es elegir los socios incorrectos. La mayoría de los negocios que fracasan tienen conflictos de socios sobre dirección, distribución de ganancias o nivel de compromiso. Elegir socios correctamente supera en importancia al producto.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el orden correcto de análisis que propone el autor: producto primero o mercado primero?',
        opciones: [
          'Producto primero: construir la mejor solución posible y luego buscar el mercado',
          'Simultáneo: desarrollar producto y mercado en paralelo para ahorrar tiempo',
          'Mercado primero: identificar el problema real que existe y luego diseñar el producto',
          'El orden no importa; lo que importa es la calidad de ambos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El orden correcto es mercado primero: identificar qué problema real existe, cuánto dolor causa y quién paga por la solución. Luego diseñar el producto. Enamorarse del producto sin validar el mercado es uno de los Factores F.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la característica de la "decisión" que Hill identifica en las personas exitosas?',
        opciones: [
          'Toman decisiones lentamente y con mucha deliberación para evitar errores',
          'Consultan siempre a expertos antes de decidir',
          'Toman decisiones rápidamente porque tienen claros sus valores y las cambian lentamente',
          'Delegan las decisiones difíciles a sus equipos de confianza',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Los grandes realizadores toman decisiones rápidas (porque tienen claros sus valores y objetivos) y las cambian lentamente cuando la evidencia lo justifica. Quienes tardan en decidir o cambian de opinión constantemente dispersan su energía.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál de los seis miedos considera Hill el más destructivo para el emprendedor?',
        opciones: [
          'El miedo a la muerte',
          'El miedo a las críticas',
          'El miedo a la vejez',
          'El miedo a la pobreza',
        ],
        respuestaCorrecta: 3,
        explicacion: 'El miedo a la pobreza es el más destructivo para el emprendedor porque paraliza la acción. Quien tiene pánico a la pérdida económica tomará decisiones tan conservadoras que nunca podrá construir algo significativo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué tipo de producto favorece Ferriss para la automatización del negocio?',
        opciones: [
          'Servicios de consultoría personalizada de alto precio',
          'Restaurantes y negocios físicos con sistemas de franquicia',
          'Productos digitales o físicos con logística tercerizada que pueden entregarse sin presencia del creador',
          'Acciones y fondos de inversión gestionados por algoritmos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Ferriss favorece productos escalables (libros electrónicos, cursos, software, o físicos con logística tercerizada) que generan el mismo ingreso por unidad sin importar el volumen, sin requerir la presencia del creador en cada venta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia Kawasaki entre "marketing" y "evangelismo"?',
        opciones: [
          'El marketing usa tecnología; el evangelismo es solo presencial',
          'El marketing es pagado; el evangelismo es gratuito y orgánico',
          'El marketing busca convencer con características; el evangelismo busca convertir con visión genuina',
          'El marketing es para productos; el evangelismo es solo para causas sociales',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El marketing convencional habla de características y busca convencer. El evangelismo comparte una visión con creencia genuina y busca convertir a otros en creyentes que a su vez evangelizan. Requiere creer genuinamente en lo que haces.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál de las siguientes describe mejor un "equipo A" según Kawasaki?',
        opciones: [
          'El equipo con los salarios más altos y las mejores oficinas',
          'El equipo con más credenciales académicas y publicaciones científicas',
          'El equipo con competencias complementarias, alineación de valores y capacidad de ejecución',
          'El equipo con la mayor experiencia en la industria específica',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El equipo A combina: competencias complementarias (cubren áreas críticas sin duplicación), alineación en valores y visión (pueden decidir bajo presión) y capacidad de ejecución (convierten ideas en resultados tangibles).',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué descubre la investigación sobre los arrepentimientos al final de la vida?',
        opciones: [
          'Las personas se arrepienten más de los riesgos que tomaron',
          'Las personas más exitosas economicamente son las que menos se arrepienten',
          'El arrepentimiento más común es no haber tenido el coraje de vivir una vida auténtica',
          'Las personas en su mayoría están satisfechas con las elecciones que tomaron',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La investigación es consistente: el arrepentimiento más común al final de la vida no es haber tomado riesgos sino no haberlos tomado; no haber vivido una vida fiel a uno mismo en lugar de la que otros esperaban.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo reconcilia Sinetar el argumento "sigue tu pasión" con la realidad económica?',
        opciones: [
          'Reconoce que no siempre es posible vivir de la pasión y propone mantener el trabajo seguro',
          'Separa completamente la pasión del ingreso y recomienda tener ambas por separado',
          'Propone que el dinero siempre llega si uno es suficientemente positivo y visualiza el éxito',
          'Argumenta que la pasión sin excelencia no paga facturas, pero que la pasión genera la dedicación que produce excelencia, que a su vez genera valor económico en un proceso que lleva tiempo y trabajo deliberado',
        ],
        respuestaCorrecta: 3,
        explicacion: 'Sinetar no es ingenua: "el dinero vendrá" no es magia. El argumento es que la pasión genera la dedicación que produce maestría, y la maestría genera valor que el mercado recompensa. El camino requiere trabajo real, tiempo real y posiblemente años de ingresos menores. La fe en el proceso debe ser honesta, no ilusoria.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 2 — La Semana Laboral de 4 Horas
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp02',
    titulo: 'La Semana Laboral de 4 Horas',
    autor: 'Tim Ferriss',
    anio: '2007',
    emoji: '⏰',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'Tim Ferriss rompe con la idea de que hay que trabajar 80 horas semanales para tener éxito. Enseña cómo diseñar una vida de lujo con ingresos automáticos, eliminando lo que no importa y subcontratando el resto.',
    gemasRecompensa: 70,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Mito del Trabajo Duro y los Nuevos Ricos',
        emoji: '💼',
        contenido: '''Tim Ferriss vivía el sueño americano: empresa propia, ingresos crecientes, trabajo constante de 14 horas diarias. Y era completamente miserable. El punto de quiebre llegó cuando decidió tomar unas vacaciones "de emergencia" de las que nunca regresó al modelo anterior.

Los NUEVOS RICOS (NR), como Ferriss los llama, no definen el éxito por cuánto dinero tienen en el banco. Lo definen por cuánta libertad de tiempo y movilidad tienen. Un ejecutivo que gana \$500,000 al año pero trabaja 80 horas semanales tiene menos libertad que alguien que gana \$50,000 pero trabaja 10 horas semanales desde cualquier lugar del mundo.

El problema con el modelo tradicional: se nos enseña a diferir la vida. "Trabaja duro ahora para disfrutar después (en la jubilación)." Ferriss argumenta que este modelo es defectuoso por varias razones: no sabes si llegarás a la jubilación con salud, el dinero sin actividad significativa produce aburrimiento, y las cosas que quieres hacer a los 65 no son las mismas que a los 35.

La alternativa de Ferriss: los "mini-retiros" a lo largo de la vida activa. Periodos de 1-3 meses cada año viviendo en otro país, aprendiendo algo nuevo, descansando profundamente. Esto requiere automatizar o eliminar el trabajo que no necesita tu presencia activa.

La pregunta que cambia todo: "¿Qué haría si no tuviera miedo?" La mayoría de personas saben exactamente qué querrían hacer con su vida si el dinero y el tiempo no fueran obstáculos. La metodología DEAL de Ferriss es un camino para eliminar esos obstáculos.''',
      ),
      CapituloResumen(
        titulo: 'D de Definición: Eliminar el Miedo',
        emoji: '🎯',
        contenido: '''La D de DEAL (Definir, Eliminar, Automatizar, Liberar) comienza con identificar lo que realmente quieres — no lo que te han dicho que deberías querer.

Ferriss propone el ejercicio del "peor caso": en lugar de pensar abstractamente "si dejo mi trabajo pasará algo malo", escribe específicamente qué es lo peor que podría pasar. ¿Quedarías en la calle? ¿Perderías todas tus amistades? Cuando lo escribes en detalle, frecuentemente descubres que el peor caso es mucho más manejable de lo que temías, y que incluso si ocurre, sería recuperable.

Luego pregúntate: ¿cuál es el MEJOR caso posible si tomas la acción que tienes miedo de tomar? Y ¿cuál es el costo de NO tomar acción — de seguir exactamente igual en 1, 3, 10 años? Esta comparación frecuentemente revela que el mayor riesgo no es actuar sino NO actuar.

Ferriss introduce el concepto de METAS DE SUEÑO: no objetivos vagos ("quiero ser libre") sino específicos y costosos ("quiero hablar italiano conversacional en 3 meses, viajar a Italia en junio, y correr una maratón antes de los 40"). La especificidad transforma los sueños en planes.

Un principio clave: ser selectivo con lo que persigues. La mayoría de personas tienen demasiadas metas vagas. Los Nuevos Ricos tienen pocas metas muy específicas que, cuando se logran, producen una transformación real en la experiencia de vida.''',
      ),
      CapituloResumen(
        titulo: 'E de Eliminación: La Dieta de Información',
        emoji: '✂️',
        contenido: '''El principio de Pareto (80/20) es el fundamento de la E: el 80% de tus resultados viene del 20% de tus actividades. Si puedes identificar ese 20% y eliminar o delegar el 80% restante, produces los mismos resultados en una fracción del tiempo.

Ferriss aplica esto a la información: la mayoría de las personas consumen enormes cantidades de noticias, emails, reuniones y conversaciones que no producen ningún resultado real. Llama a esto "dieta de información" — eliminar todo el consumo de información que no conduce a acción inmediata.

La GESTIÓN DEL TIEMPO de Ferriss va contra la intuición: no se trata de ser más eficiente haciendo más cosas. Se trata de identificar las pocas cosas que realmente importan y hacerlas bien, mientras se eliminan las demás. Ser absolutamente efectivo en lo importante es más valioso que ser medianamente eficiente en todo.

Ferriss propone revisar el email solo dos veces al día (mediodía y final de la tarde), y ponerlo en modo de respuesta automática el resto del tiempo. Inicialmente suena extremo, pero la mayoría de "urgencias" no son reales — y cuando son reales, las personas encuentran otra manera de contactarte.

El objetivo no es hacer más cosas en el tiempo libre creado — es hacer cosas significativas. El tiempo libre sin significado produce ansiedad, no libertad.''',
      ),
      CapituloResumen(
        titulo: 'A de Automatización: Ingresos en Piloto Automático',
        emoji: '🤖',
        contenido: '''Para automatizar ingresos, Ferriss recomienda crear un PRODUCTO DE INFORMACIÓN o servicio que se pueda vender de forma recurrente sin que tu presencia física sea necesaria cada vez. Cursos online, ebooks, software, membresías — cualquier cosa que puedas crear una vez y vender infinitas veces.

El proceso de Ferriss para validar un producto antes de crearlo completamente: crear una página de ventas básica, dirigir tráfico pago hacia ella, y ver si la gente hace clic en "comprar". Si nadie compra ni siquiera cuando el precio está disponible, el producto no tiene mercado. Si suficientes personas hacen clic, tienes validación de demanda antes de invertir meses en crear el producto.

El ASISTENTE VIRTUAL es el segundo componente de automatización. Ferriss popularizó la idea de contratar asistentes en países de bajo costo (India, Filipinas) para tareas administrativas, investigación, gestión de email, coordinación. El costo puede ser \$5-15 por hora — significativamente más bajo que un asistente local.

La clave del asistente virtual: no delegar problemas, delegar resultados. "Investiga los 5 mejores hoteles en Tokio con este criterio y preséntame una comparación" es mejor instrucción que "busca algo en Tokio". Las instrucciones claras producen resultados confiables.

El objetivo final: un negocio que genera \$1,000-3,000 mensuales en ingresos netos con pocas horas semanales de tu atención — suficiente para vivir bien en muchos países del mundo mientras disfrutas de libertad real.''',
      ),
      CapituloResumen(
        titulo: 'L de Liberación: Vivir Donde Quieras',
        emoji: '🌍',
        contenido: '''La L de Liberación es la fase final: usar los sistemas creados para vivir donde quieras, cuando quieras. Ferriss llama a este estilo de vida el "lujo del nuevo rico" — no artículos de lujo sino tiempo libre y movilidad geográfica.

Para quienes todavía trabajan en empleos corporativos, Ferriss propone una estrategia gradual. Primero, hacer el trabajo tan bien que seas indispensable. Segundo, proponer trabajar remotamente "de prueba" un día por semana — demostrando que produces igual o más que en la oficina. Tercero, expandir gradualmente hasta el trabajo completamente remoto.

La ARBITRAJE GEOGRÁFICO es uno de los conceptos más poderosos del libro: los mismos ingresos en dólares o euros pueden comprar 5-10 veces más calidad de vida en muchos países de Latinoamérica, Sudeste Asiático o Europa del Este que en Estados Unidos o Europa Occidental. No es escapar a la pobreza — es vivir como millonario en términos de calidad de vida real.

Ferriss también aborda el MIEDO AL ABURRIMIENTO que muchas personas tienen ante la perspectiva de no trabajar 50 horas semanales. Argumenta que este miedo es en realidad miedo al significado: cuando el trabajo deja de ser la fuente de identidad, hay que encontrar otras fuentes. Los mini-retiros de Ferriss siempre incluyen aprender algo nuevo intensamente — idiomas, deportes, artes.

El libro cierra con una pregunta poderosa: "¿Qué harías si supieras que no puedes fallar?" La respuesta a esa pregunta, dice Ferriss, es exactamente lo que deberías estar haciendo.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cómo define Ferriss a los "Nuevos Ricos" (NR)?',
        opciones: [
          'Personas que han acumulado más de un millón de dólares en activos netos',
          'Emprendedores tecnológicos que han logrado exits multimillonarios en Silicon Valley',
          'Personas que priorizan la libertad de tiempo y movilidad sobre la acumulación de dinero en el banco',
          'Trabajadores freelance con ingresos variables pero sin jefe directo',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Los Nuevos Ricos no se definen por cuánto dinero tienen sino por cuánta libertad disfrutan. Un ejecutivo con \$500,000 anuales y 80 horas semanales tiene menos libertad que alguien con \$50,000 y 10 horas semanales desde cualquier lugar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el ejercicio del "peor caso" de Ferriss y para qué sirve?',
        opciones: [
          'Imaginar el fracaso más catastrófico posible para motivarse a trabajar más duro',
          'Escribir específicamente qué es lo peor que podría pasar al tomar la acción temida, revelando que el riesgo real es más manejable de lo que el miedo sugería',
          'Calcular las pérdidas financieras máximas posibles antes de tomar una decisión de negocios',
          'Preparar un plan de contingencia para cada escenario negativo posible',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El ejercicio del peor caso transforma el miedo vago en riesgo concreto. Al escribir específicamente "¿quedaría en la calle? ¿perdería todas mis amistades?", generalmente descubres que el peor caso es mucho más manejable y recuperable de lo que el miedo no articulado sugería.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo aplica Ferriss el principio de Pareto (80/20) a la productividad?',
        opciones: [
          'Trabaja el 80% del tiempo en tareas urgentes y el 20% en tareas importantes',
          'El 80% del dinero viene del 20% de los clientes, así que enfócate en conseguir más clientes similares al mejor 20%',
          'El 80% de tus resultados viene del 20% de tus actividades — identifica ese 20% y elimina o delega el resto',
          'Dedica el 20% de tu tiempo a aprender y el 80% a ejecutar lo que ya sabes',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La aplicación del 80/20 de Ferriss no es gestionar mejor las tareas sino cuestionarse cuáles tareas deberían existir. Si el 20% de las actividades produce el 80% de los resultados, eliminar el 80% de las actividades produce los mismos resultados en una fracción del tiempo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "arbitraje geográfico" y por qué es relevante para los Nuevos Ricos?',
        opciones: [
          'Comprar propiedades en mercados más baratos para venderlas en mercados más caros',
          'Contratar empleados en países de bajo costo para reducir gastos operativos',
          'Usar ingresos en monedas fuertes para vivir en países donde esa cantidad compra una calidad de vida mucho mayor',
          'Viajar constantemente para aprovechar las diferencias de precios entre países',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El arbitraje geográfico es una de las ideas más prácticas de Ferriss: los mismos \$2,000-3,000 mensuales pueden comprar una vida mediocre en una ciudad cara o una vida de lujo real en muchos países de América Latina, Sudeste Asiático o Europa del Este. No es escapismo sino optimización de la calidad de vida real.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la estrategia de Ferriss para validar un producto antes de crearlo?',
        opciones: [
          'Crear el producto completo y luego hacer encuestas de satisfacción',
          'Investigar si existen competidores exitosos en el mercado antes de invertir tiempo',
          'Crear una página de ventas y dirigir tráfico pago para medir si la gente realmente compra antes de crear el producto',
          'Consultar con 100 clientes potenciales y pedirles feedback detallado sobre el concepto',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Ferriss recomienda crear una página de ventas básica y pagar por tráfico para ver si alguien hace clic en "comprar". Si nadie compra cuando el precio está disponible, el producto no tiene mercado suficiente. Esta validación previa evita meses de trabajo creando algo que nadie quiere.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué critica Ferriss sobre el modelo tradicional de "diferir la vida para la jubilación"?',
        opciones: [
          'Que las pensiones no alcanzan para mantener el nivel de vida deseado en la vejez',
          'Que implica trabajar décadas bajo estrés extremo, sin garantía de llegar con salud y disfrutando actividades que a los 65 ya no son posibles o deseadas igual que a los 35',
          'Que la inflación destruye los ahorros a largo plazo haciendo la jubilación imposible',
          'Que el sistema de pensiones está diseñado para beneficiar a las corporaciones, no a los trabajadores',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El modelo de diferir la vida tiene tres problemas para Ferriss: no sabes si llegarás a la jubilación con salud, el dinero sin actividad significativa produce aburrimiento (no felicidad), y las cosas que quieres hacer a los 35 no son las mismas que a los 65. Los "mini-retiros" distribuidos en la vida activa son su alternativa.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el objetivo de la "dieta de información" que propone Ferriss?',
        opciones: [
          'Consumir solo noticias internacionales para estar informado sobre oportunidades de negocios globales',
          'Leer solo libros de no-ficción y eliminar completamente el entretenimiento',
          'Eliminar el consumo de información que no conduce a acción inmediata, revisando emails solo dos veces al día',
          'Suscribirse solo a fuentes de información de alta calidad y cancelar el resto',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La dieta de información de Ferriss no es sobre calidad de las fuentes sino sobre eliminar el consumo que no produce acción. Revisar email solo dos veces al día, ignorar noticias que no afectan tus decisiones inmediatas, y salir de reuniones que no requieren tu participación son ejemplos prácticos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué consejo da Ferriss sobre cómo delegar tareas a un asistente virtual?',
        opciones: [
          'Empezar delegando las tareas más importantes para ahorrar tiempo desde el principio',
          'No delegar: los asistentes virtuales son menos confiables que los asistentes presenciales',
          'Delegar resultados concretos, no problemas vagos — instrucciones específicas producen resultados confiables',
          'Delegar solo tareas administrativas repetitivas y nunca las que involucran comunicación con clientes',
        ],
        respuestaCorrecta: 2,
        explicacion: '"Busca algo en Tokio" no es buena instrucción. "Investiga los 5 mejores hoteles en Tokio con precio menor a \$150/noche, desayuno incluido, y radio de 2km al centro histórico, y preséntame una tabla comparativa" produce un resultado accionable. Delegar resultados, no tareas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Ferriss argumenta que el "miedo al aburrimiento" frena a muchas personas de cambiar?',
        opciones: [
          'Porque el aburrimiento es una señal de que no se está haciendo suficiente dinero',
          'Porque el cerebro humano está biológicamente diseñado para evitar el estado de no-actividad',
          'Porque en realidad es miedo a perder la identidad basada en el trabajo — y hay que encontrar otras fuentes de significado',
          'Porque el aburrimiento lleva a tomar malas decisiones financieras por impulso',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Para Ferriss, el miedo al aburrimiento es en realidad miedo a la pregunta "¿quién soy si no soy mi trabajo?" Cuando el trabajo deja de ser la fuente principal de identidad, hay que construir otras fuentes: aprender algo nuevo, proyectos creativos, relaciones. Los mini-retiros siempre incluyen aprendizaje intensivo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la pregunta que Ferriss propone como filtro definitivo para tomar decisiones de vida?',
        opciones: [
          '¿Cuánto dinero ganaré con esta decisión en los próximos 5 años?',
          '¿Qué harías si supieras que no puedes fallar?',
          '¿Esta decisión me da más libertad de tiempo o me la quita?',
          '¿Podría delegar esto a un asistente virtual o automatizarlo?',
        ],
        respuestaCorrecta: 1,
        explicacion: '"¿Qué harías si supieras que no puedes fallar?" elimina el miedo del análisis y revela lo que genuinamente quieres. La mayoría de personas sabe exactamente qué harían — y el gap entre esa respuesta y su vida actual define exactamente qué necesita cambiar. La metodología DEAL es el camino para cerrar ese gap.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 3 — El Mito del Emprendedor
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp03',
    titulo: 'El Mito del Emprendedor',
    autor: 'Michael E. Gerber',
    anio: '1986',
    emoji: '🏪',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'La mayoría de negocios fracasan porque los dueños son técnicos brillantes que no saben construir un negocio. Gerber muestra cómo pensar como franquiciador para crear sistemas que funcionen sin depender de ti.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Mito del Emprendedor: El Técnico que se Volvió Dueño',
        emoji: '🔧',
        contenido: '''Michael Gerber abre con una observación devastadoramente honesta: la mayoría de las personas que abren un negocio no son emprendedores — son técnicos que tuvieron un "ataque de iniciativa emprendedora".

Un contador que trabaja para una firma cree que puede hacer lo mismo por su cuenta y ganar más. Un chef que trabaja en un restaurante cree que puede tener su propio y hacerlo mejor. Un peluquero, un fotógrafo, un programador — todos asumen que porque son buenos haciendo su trabajo técnico, pueden construir un negocio de eso.

El problema: saber hacer el trabajo técnico y saber construir un negocio son dos habilidades completamente diferentes. El negocio exitoso no requiere solo un técnico brillante — requiere un Técnico, un Gerente y un Emprendedor trabajando en equilibrio.

El EMPRENDEDOR es la visión, la creatividad, el futuro. Vive en la imaginación y pregunta "¿y si...?" El GERENTE es el pragmatismo, el orden, la planificación. Vive en el pasado y pregunta "¿cómo?" El TÉCNICO es el hacer, la ejecución, el presente. Vive en el trabajo y pregunta "¿cuándo lo hago yo mismo?"

La mayoría de dueños de pequeños negocios son técnicos con un poco de gerente y casi nada de emprendedor. Construyen negocios que dependen completamente de ellos para funcionar. Cuando no están, el negocio para. Eso no es un negocio — es un autoempleo con más responsabilidades.''',
      ),
      CapituloResumen(
        titulo: 'Las Tres Etapas del Crecimiento',
        emoji: '🌱',
        contenido: '''Todo negocio pasa por tres etapas: infancia, adolescencia y madurez. La mayoría se queda atrapada en la infancia o muere en la adolescencia sin llegar a la madurez.

La INFANCIA es la etapa del técnico. El dueño hace todo: vende, produce, administra, limpia. El negocio depende 100% de su presencia y energía. Esta etapa puede funcionar mientras el dueño tiene energía suficiente, pero no escala. El dueño trabaja más horas que cuando era empleado, gana menos por hora, y no tiene jefe — o más bien, tiene todos sus clientes como jefes.

La ADOLESCENCIA llega cuando el negocio crece más de lo que una persona puede manejar sola. El dueño contrata su primera persona de confianza — generalmente alguien como él, un técnico. Esto funciona un tiempo, pero el negocio sigue siendo caótico porque no hay sistemas: todo depende del criterio y la memoria de las personas.

La crisis de la adolescencia llega cuando el dueño descubre que tiene un nuevo problema: ya no puede controlar todo personalmente, pero tampoco tiene sistemas para que otros lo hagan bien. El negocio se convierte en un caos de excepciones, criterios personales e improvisación constante.

La MADUREZ es el destino al que muy pocos llegan. Un negocio maduro tiene sistemas, procesos y una cultura que funciona independientemente de quién trabaje en él. Gerber argumenta que el objetivo de todo emprendedor debería ser construir un negocio que funcione sin necesitar al dueño en cada decisión.''',
      ),
      CapituloResumen(
        titulo: 'El Modelo de Franquicia como Prototipo',
        emoji: '🏬',
        contenido: '''La solución que propone Gerber es pensar como franquiciador, aunque no planees vender franquicias. El modelo de franquicia es el ejemplo más exitoso de negocio sistemático en la historia: McDonald's puede tener el mismo nivel de producto y servicio en miles de locales en decenas de países porque tiene sistemas que cualquier persona puede seguir.

McDonald's no depende del talento excepcional de sus empleados — depende de sistemas excepcionales ejecutados por personas ordinarias. Ray Kroc, el fundador de McDonald's moderno, no vendía hamburguesas — vendía sistemas para vender hamburguesas de la misma manera cada vez.

Gerber propone construir lo que llama el PROTOTIPO DE FRANQUICIA para tu negocio: documentar cada proceso, cada decisión, cada estándar de manera tan detallada que cualquier persona razonablemente inteligente y motivada pueda ejecutarlo correctamente siguiendo el manual.

Esto requiere un cambio de mentalidad radical: pasar de pensar "¿cómo hago este trabajo?" a "¿cómo construyo un sistema que haga este trabajo?" La diferencia entre un negocio que depende del dueño y uno que no depende del dueño está en los sistemas.

El beneficio no es solo la escalabilidad — es que el propio dueño puede tomarse vacaciones. Un negocio que para cuando el dueño se va de vacaciones no es un negocio — es un eslabón de la cadena. Un negocio con sistemas funciona mientras el dueño viaja.''',
      ),
      CapituloResumen(
        titulo: 'El Manual de Operaciones y la Cultura',
        emoji: '📋',
        contenido: '''El corazón del modelo de Gerber es el MANUAL DE OPERACIONES: la documentación completa de cómo funciona cada aspecto del negocio. No es burocracia por el bien de la burocracia — es el código fuente que hace posible la consistencia, la escalabilidad y la capacidad de delegar.

Un buen manual de operaciones incluye: el propósito del negocio (por qué existe), los estándares de cada área (cómo se hace cada cosa), las métricas de desempeño (cómo sabemos si lo estamos haciendo bien), y los sistemas de corrección (qué hacemos cuando algo falla).

Pero Gerber va más allá del manual técnico. Argumenta que los grandes negocios no son solo sistemas — tienen una CULTURA: un conjunto de valores, comportamientos y creencias que guían cada decisión. La cultura no se declara en un cartel en la pared — se vive en cómo trata el dueño a su primer empleado, cómo se maneja el primer error, cómo se celebra el primer éxito.

La consistencia es el valor central en el modelo de Gerber. El cliente que regresa a McDonald's no busca sorpresas — busca exactamente lo mismo que obtuvo la primera vez. La consistencia construye confianza; la confianza construye lealtad; la lealtad construye el negocio sostenible.

El objetivo final del manual no es crear robots — es crear contexto. Cuando los empleados entienden el propósito y los estándares del negocio, pueden tomar mejores decisiones autónomamente, dentro del marco que el sistema establece.''',
      ),
      CapituloResumen(
        titulo: 'El Negocio como Producto: Construir para Vender',
        emoji: '🎁',
        contenido: '''Gerber cierra con un cambio de perspectiva que transforma la manera de pensar sobre el negocio: en lugar de construir un negocio para trabajar en él, construye el negocio como si fuera el producto que quieres vender.

Un negocio que depende de su dueño para funcionar no tiene valor de venta — porque cuando el dueño se va, el negocio desaparece. Un negocio con sistemas sólidos, procesos documentados, cultura establecida y resultados consistentes tiene valor propio, independiente de quién lo dirige actualmente.

Esta perspectiva cambia radicalmente las prioridades diarias. En lugar de preguntarte "¿cómo hago este trabajo hoy?" te preguntas "¿cómo construyo el sistema que hará este trabajo mejor que yo, consistentemente, sin mi presencia?"

Gerber distingue entre trabajar EN el negocio (ejecutar las tareas diarias) y trabajar SOBRE el negocio (construir los sistemas que hacen que las tareas diarias se ejecuten bien). La mayoría de dueños pasan el 90% del tiempo trabajando EN el negocio. Los dueños de negocios exitosos encuentran la manera de pasar una parte creciente del tiempo trabajando SOBRE el negocio.

La pregunta que Gerber deja al lector: si tuvieras que irte de tu negocio por seis meses mañana, ¿podría funcionar sin ti? Si la respuesta es no, tienes un trabajo con empleados — no un negocio verdadero. El libro es la guía para transformar uno en el otro.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es el "mito del emprendedor" según Gerber?',
        opciones: [
          'La creencia falsa de que cualquier persona puede hacerse millonaria con su propio negocio',
          'La suposición incorrecta de que ser bueno técnicamente en un trabajo equivale a poder construir un negocio exitoso de eso',
          'El mito de que los emprendedores nacen con talentos especiales que los demás no tienen',
          'La idea errónea de que los negocios pequeños no pueden competir con las grandes corporaciones',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El mito es que ser un buen técnico (cocinero, contador, programador, etc.) es suficiente para tener un buen negocio. Gerber demuestra que construir un negocio exitoso requiere tres habilidades distintas: técnica, gerencial y emprendedora, y que la mayoría solo tiene la primera.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los tres roles que Gerber identifica en todo negocio y cómo los describe?',
        opciones: [
          'Fundador (visión), Director (estrategia), Operador (ejecución)',
          'Emprendedor (visión, futuro, "¿y si?"), Gerente (orden, pasado, "¿cómo?"), Técnico (ejecución, presente, "¿cuándo lo hago yo?")',
          'Propietario (capital), Administrador (recursos), Trabajador (producción)',
          'Innovador (ideas), Planificador (sistemas), Ejecutor (tareas)',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El Emprendedor vive en la imaginación y el futuro. El Gerente vive en el pasado y el orden. El Técnico vive en el presente y el trabajo. La mayoría de dueños de pequeños negocios son principalmente Técnicos con un poco de Gerente y casi nada de Emprendedor — lo que explica por qué sus negocios los atan en lugar de liberarlos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Gerber recomienda pensar como franquiciador aunque no planees vender franquicias?',
        opciones: [
          'Porque el modelo de franquicia tiene ventajas fiscales que otros modelos no tienen',
          'Porque las franquicias tienen mejor acceso a financiamiento bancario',
          'Porque el modelo de franquicia demuestra que los sistemas permiten consistencia sin depender del talento excepcional de ninguna persona específica',
          'Porque las franquicias tienen mayor reconocimiento de marca que los negocios independientes',
        ],
        respuestaCorrecta: 2,
        explicacion: 'McDonald\'s no depende del talento excepcional de sus empleados — depende de sistemas excepcionales. Pensar como franquiciador significa documentar cada proceso tan claramente que cualquier persona razonablemente inteligente pueda ejecutarlo bien. Esto produce consistencia, escalabilidad y libertad para el dueño.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue a un negocio que puede venderse de uno que no puede?',
        opciones: [
          'La rentabilidad: un negocio rentable siempre puede venderse por su flujo de efectivo',
          'El tamaño: los negocios más grandes siempre son más vendibles que los pequeños',
          'La independencia del dueño: un negocio con sistemas funciona sin el dueño y tiene valor propio; uno que depende del dueño no puede venderse porque sin el dueño desaparece',
          'La antigüedad: los negocios con más años de operación son más confiables para compradores',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Si el negocio desaparece cuando el dueño se va, el comprador no está comprando un negocio — está comprando un trabajo. Un negocio con sistemas, cultura y resultados consistentes tiene valor independiente de quién lo dirige. Esta es la diferencia entre construir un trabajo y construir un activo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre trabajar "en" el negocio y trabajar "sobre" el negocio según Gerber?',
        opciones: [
          'Trabajar en el negocio es trabajo físico; trabajar sobre el negocio es trabajo administrativo',
          'Trabajar en el negocio es ejecutar las tareas diarias; trabajar sobre el negocio es construir los sistemas que hacen que las tareas se ejecuten bien sin tu presencia constante',
          'Trabajar en el negocio es el rol del empleado; trabajar sobre el negocio es el rol del contador',
          'No hay diferencia real — toda actividad de un dueño es simultáneamente en y sobre el negocio',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Trabajar en el negocio es cocinar, atender clientes, hacer ventas. Trabajar sobre el negocio es documentar la receta para que cualquiera cocine igual, crear un sistema de atención al cliente, diseñar el proceso de ventas. Los dueños exitosos encuentran cada vez más tiempo para trabajar sobre el negocio y menos en él.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué señal indica que un negocio está en "crisis de adolescencia" según Gerber?',
        opciones: [
          'Las ventas crecen más rápido de lo que el negocio puede manejar financieramente',
          'Los empleados jóvenes superan en productividad a los veteranos',
          'El dueño no puede controlar todo personalmente pero no tiene sistemas para que otros lo hagan bien — el resultado es caos, excepciones constantes e improvisación',
          'El negocio necesita más capital para crecer pero los bancos niegan los préstamos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La crisis de adolescencia llega cuando el negocio crece más de lo que el dueño puede manejar solo, pero sin sistemas, la delegación produce caos. Cada empleado toma decisiones con su propio criterio, las excepciones se multiplican, y el dueño pasa más tiempo apagando incendios que construyendo el negocio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el propósito fundamental del Manual de Operaciones según Gerber?',
        opciones: [
          'Cumplir con requisitos legales y laborales que la ley exige',
          'Crear contexto y estándares para que empleados ordinarios tomen decisiones extraordinariamente consistentes sin depender del criterio personal de cada uno',
          'Documentar la historia y los valores del negocio para propósitos de marketing',
          'Facilitar la auditoría contable y tributaria del negocio',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El Manual de Operaciones no es burocracia — es el código fuente del negocio. Su propósito no es crear robots sino crear contexto: cuando los empleados entienden el propósito y los estándares, pueden tomar mejores decisiones autónomamente dentro del marco establecido. Consistencia sin depender del talento de personas específicas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Gerber dice que la mayoría de pequeños negocios son "autoempleo con más responsabilidades"?',
        opciones: [
          'Porque los dueños de pequeños negocios ganan menos que los empleados en corporaciones grandes',
          'Porque los negocios pequeños no tienen acceso a las mismas herramientas tecnológicas que las grandes empresas',
          'Porque el dueño trabaja más horas que como empleado, tiene todos sus clientes como jefes, y el negocio para cuando él para — no hay libertad real',
          'Porque la carga impositiva de los pequeños negocios es desproporcionadamente alta en comparación con las grandes corporaciones',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El técnico que abre su negocio frecuentemente descubre que trabaja más horas que antes, gana menos por hora, no tiene un jefe pero tiene decenas de clientes-jefes, y el negocio para cuando él se enferma o descansa. Eso no es libertad ni emprendimiento — es autoempleo con más responsabilidades y riesgos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo define Gerber un "negocio maduro" en contraste con uno en infancia o adolescencia?',
        opciones: [
          'Un negocio con más de 10 años de operación continua y crecimiento sostenido',
          'Un negocio con más de 50 empleados y presencia en múltiples ciudades',
          'Un negocio con sistemas, procesos y cultura que funcionan consistentemente independientemente de quién trabaje en él en un momento dado',
          'Un negocio que ya pagó completamente sus deudas iniciales y opera sin financiamiento externo',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La madurez no es cuestión de tamaño ni antigüedad — es cuestión de sistemas. Un negocio maduro funciona cuando el dueño está de vacaciones, cuando un empleado clave se va, cuando hay un problema inesperado. Los sistemas, no las personas, son la fuente de la consistencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pregunta propone Gerber como prueba de si realmente tienes un negocio o solo un trabajo?',
        opciones: [
          '¿Genera suficiente dinero para pagar todos tus gastos y aún te sobra?',
          '¿Tienes empleados que realizan el trabajo técnico mientras tú te enfocas en la estrategia?',
          '¿Podría tu negocio funcionar durante seis meses sin tu presencia activa?',
          '¿Podría alguien comprar tu negocio y operarlo exitosamente sin tu ayuda?',
        ],
        respuestaCorrecta: 0,
        explicacion: 'La prueba de los seis meses es definitiva: si tu negocio no puede funcionar sin ti durante ese tiempo, tienes un trabajo, no un negocio. Un negocio verdadero tiene sistemas que funcionan independientemente del dueño. Esta realización es, para Gerber, el primer paso para construir algo que te libere en lugar de atarte.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 4 — Cero a Uno
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp04',
    titulo: 'Cero a Uno: Notas sobre Startups',
    autor: 'Peter Thiel',
    anio: '2014',
    emoji: '🚀',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'Peter Thiel argumenta que la verdadera innovación va de cero a uno — crea algo nuevo, no copia lo existente. El secreto de los mejores negocios es encontrar verdades que pocos conocen y construir monopolios basados en ellas.',
    gemasRecompensa: 70,
    capitulos: const [
      CapituloResumen(
        titulo: 'De Cero a Uno vs. De Uno a N',
        emoji: '💡',
        contenido: '''Peter Thiel, co-fundador de PayPal y primer inversor externo de Facebook, abre con una distinción que define toda la filosofía del libro: de CERO A UNO significa crear algo que no existía antes — verdadera innovación. De UNO A N significa copiar algo que ya existe y hacerlo en escala — globalización.

Copiar es más fácil y de menor riesgo. Si China tiene autos, construir más fábricas de autos en China es de uno a N. Si creas un tipo completamente nuevo de transporte que no existía, eso es de cero a uno.

El problema con el mundo moderno: estamos obsesionados con el uno a N. Las escuelas de negocios enseñan mejores prácticas de industrias existentes. Los inversores prefieren lo conocido. Los emprendedores buscan mercados existentes que pueden "disrumpir" con pequeñas mejoras.

Pero los mejores negocios del mundo fueron de cero a uno: Google no fue un buscador más entre muchos — fue un tipo completamente nuevo de buscador. Apple no fue un teléfono más — fue un nuevo concepto de lo que puede ser un teléfono. Tesla no fue un auto más eficiente — fue una nueva categoría de vehículo.

De cero a uno requiere pensar por ti mismo, cuestionar lo que "todo el mundo sabe", y estar dispuesto a parecer equivocado durante el tiempo que toma demostrar que tienes razón. Es más difícil, más riesgoso y produce resultados enormemente más grandes cuando funciona.''',
      ),
      CapituloResumen(
        titulo: 'El Poder del Monopolio',
        emoji: '👑',
        contenido: '''Thiel hace una afirmación que contradice décadas de teoría económica: los monopolios son buenos para la sociedad y para los negocios. No los monopolios coercitivos mantenidos por la fuerza del gobierno, sino los monopolios creativos obtenidos por ser genuinamente mejores en lo que hacen.

La economía convencional adora la competencia perfecta. Muchos compradores, muchos vendedores, ninguno con poder de mercado, precios determinados por oferta y demanda. Thiel argumenta que este modelo es el infierno de los negocios: nadie gana dinero en un mercado perfectamente competitivo porque la competencia destruye los márgenes.

Los mejores negocios evitan la competencia volviéndose monopolios. Google controla el 90% de las búsquedas web. No porque sea ilegal usar otro buscador — porque es genuinamente mucho mejor. Este monopolio les permite tener los márgenes que les permiten invertir en innovación, pagar los mejores salarios y crear los mejores productos.

¿Cómo construyes un monopolio? Thiel identifica cuatro características: tecnología propietaria (significativamente superior a alternativas), efectos de red (el producto mejora cuantos más usuarios tiene), economías de escala (costos que disminuyen al crecer), y marca fuerte (identidad que los competidores no pueden copiar).

La estrategia inicial: empieza con un mercado pequeño y domínalo completamente antes de expandirte. Amazon empezó con libros — un mercado muy específico que pudo dominar antes de expandirse a todo lo demás. Ser el rey de un mercado pequeño es mejor que ser un jugador mediocre en uno grande.''',
      ),
      CapituloResumen(
        titulo: 'Los Secretos: La Fuente de los Grandes Negocios',
        emoji: '🔑',
        contenido: '''Una de las ideas más originales de Thiel: los mejores negocios se construyen sobre SECRETOS — verdades importantes que la mayoría de personas no conoce o no cree.

Un secreto no es información clasificada ni conocimiento técnico oscuro. Es una perspectiva sobre el mundo que es verdadera pero que va contra el consenso. Los secretos requieren pensamiento independiente y la disposición a parecer equivocado ante el resto del mundo.

Peter Thiel pregunta en cada entrevista de trabajo: "¿Qué verdad importante crees que muy pocas personas comparten contigo?" Una buena respuesta suena algo así: "La mayoría cree X, pero la verdad es Y." Es una pregunta difícil de responder porque requiere pensamiento genuinamente original — no reproducción de lo que todos dicen.

Los grandes negocios se construyen sobre secretos porque los mercados saturados (donde todos saben la misma información) no dejan espacio para el pensamiento nuevo. Airbnb encontró el secreto de que las personas tendrían cuartos disponibles y otras querrían hospedarse de manera más personal. Uber encontró el secreto de que la gente pagaría por un servicio más confiable que los taxis.

¿Cómo encontrar secretos? Mira lo que la gente no dice en voz alta pero hace en privado. Busca industrias donde la forma convencional de hacer las cosas parece absurda si la ves con ojos frescos. Pregúntate: ¿qué área está prohibida pensar diferente? Generalmente ahí están los secretos más valiosos.''',
      ),
      CapituloResumen(
        titulo: 'Fundaciones: Las Decisiones que no se Pueden Deshacer',
        emoji: '🏗️',
        contenido: '''Thiel dedica un capítulo crucial a las DECISIONES FUNDACIONALES — las que se toman al inicio y que son difíciles o imposibles de deshacer más adelante. Estas decisiones tienen un impacto desproporcionado en el destino de todo el negocio.

La primera decisión fundamental: con quién fundar el negocio. Los co-fundadores son como un matrimonio de negocios. Si eliges mal, el daño puede ser irreparable. Los mejores equipos co-fundadores tienen historia previa — se conocen bien, han trabajado juntos, saben cómo manejarse en momentos difíciles. No busques un co-fundador en una conferencia de networking — busca a alguien que ya conoces en profundidad.

La segunda: qué estructura de propiedad, control y gobierno crear desde el inicio. La distribución de acciones, las cláusulas de vesting, los derechos de voto — estas decisiones son difíciles de cambiar después y determinan quién tiene poder cuando hay desacuerdo.

La tercera: a quién contratar primero. Las primeras 10-20 personas de un startup establecen la cultura y las normas que definirán todo lo que viene después. Las personas equivocadas en ese momento inicial son mucho más dañinas que las personas equivocadas cuando la empresa tiene 200.

Thiel también habla de la importancia de los ROLES CLAROS: en las startups con problemas, frecuentemente el conflicto viene de que dos personas sienten que son responsables de lo mismo — o que nadie es responsable de algo importante. Definir roles claramente desde el inicio previene la mayoría de estos conflictos.''',
      ),
      CapituloResumen(
        titulo: 'El Futuro y la Visión Definida',
        emoji: '🔭',
        contenido: '''Thiel cierra con una reflexión sobre el FUTURO y cómo los mejores emprendedores se relacionan con él. Distingue entre cuatro perspectivas: optimismo definido, optimismo indefinido, pesimismo definido y pesimismo indefinido.

El OPTIMISMO DEFINIDO es la perspectiva que Thiel atribuye a los grandes constructores históricos: tenían una visión específica de cómo querían que fuera el futuro y trabajaban activamente para construirlo. Los fundadores de Estados Unidos, los ingenieros del Proyecto Apolo, los innovadores de la era industrial — todos tenían planes concretos para un futuro mejor.

El OPTIMISMO INDEFINIDO, que Thiel identifica como el problema de Silicon Valley moderno, es creer que el futuro será mejor sin tener un plan específico de cómo hacerlo mejor. Se manifiesta como finanzas que mueven dinero de lugar sin crear valor real, y como startups que "mejoran las cosas" sin tener una visión de qué cosa importante quieren construir.

El gran emprendedor tiene VISIÓN DEFINIDA: puede explicar específicamente qué mundo está tratando de construir y por qué ese mundo sería mejor. Elon Musk puede explicar exactamente por qué la humanidad necesita ser multiplanetaria y cuáles son los pasos concretos para lograrlo.

Thiel termina con una pregunta que invita a la reflexión: "¿Qué empresa valiosa todavía nadie está construyendo?" La respuesta a esa pregunta, si es honesta y bien pensada, es exactamente donde está la oportunidad más grande disponible para un emprendedor de cero a uno.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la diferencia central entre "de cero a uno" y "de uno a N" según Thiel?',
        opciones: [
          'De cero a uno crea algo completamente nuevo; de uno a N copia y escala algo existente',
          'De cero a uno es para startups tecnológicas; de uno a N es para negocios tradicionales',
          'De cero a uno requiere más inversión inicial; de uno a N es más eficiente en capital',
          'De cero a uno es más riesgoso pero siempre más rentable que de uno a N',
        ],
        respuestaCorrecta: 0,
        explicacion: 'De cero a uno es crear algo que no existía — verdadera innovación. De uno a N es copiar algo que ya existe y hacerlo en mayor escala — globalización. Thiel argumenta que el mundo necesita más de cero a uno porque hay límites físicos a cuánto se puede escalar lo existente, pero pocas limitaciones a lo que se puede crear.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Thiel argumenta que los monopolios son buenos para la sociedad?',
        opciones: [
          'Porque concentran el capital que permite financiar investigación y desarrollo a gran escala',
          'Porque los monopolios creativos obtenidos por ser genuinamente mejores generan los márgenes que permiten innovar, pagar los mejores salarios y producir los mejores productos',
          'Porque un monopolio reduce la confusión del consumidor al simplificar las opciones del mercado',
          'Porque los monopolios son más estables y menos propensos a las crisis económicas que los mercados competitivos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El monopolio de Google en búsquedas no es por coerción sino por ser genuinamente mejor. Esos márgenes permiten a Google invertir en Gmail, Maps, YouTube, investigación en IA. La competencia perfecta destruye los márgenes y con ellos la capacidad de invertir en innovación real.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es un "secreto" en la definición de Thiel y por qué es la fuente de los grandes negocios?',
        opciones: [
          'Información clasificada sobre tecnologías militares o gubernamentales que tiene valor comercial',
          'Una ventaja competitiva oculta como una patente o proceso productivo que los competidores no conocen',
          'Una verdad importante sobre el mundo que la mayoría no conoce o no cree — requiere pensamiento independiente y disposición a parecer equivocado',
          'Un nicho de mercado tan pequeño que los competidores grandes no lo han notado todavía',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Un secreto es una verdad que va contra el consenso. Airbnb encontró el secreto de que la gente hospedaría extraños y que otros pagarían por ese tipo de experiencia — algo que parecía ridículo antes de que lo probaran. Los mejores negocios se construyen sobre secretos porque donde todos piensan igual, no hay espacio para la innovación real.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Thiel recomienda empezar con un mercado pequeño y dominarlo antes de expandirse?',
        opciones: [
          'Porque los mercados pequeños tienen menos regulaciones y son más fáciles de operar',
          'Porque con menos capital inicial solo se puede atacar mercados pequeños efectivamente',
          'Porque ser el rey de un mercado pequeño establece el monopolio desde el que se puede expandir; intentar ganar un mercado grande desde el inicio es casi imposible',
          'Porque los mercados pequeños tienen márgenes más altos que los mercados masivos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Amazon dominó los libros antes de expandirse a todo el retail. PayPal dominó los pagos en eBay antes de expandirse a internet en general. El monopolio de un mercado pequeño te da los recursos, la reputación y la experiencia para atacar mercados más grandes desde una posición de fortaleza.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la "pregunta de los secretos" que Thiel hace en entrevistas de trabajo?',
        opciones: [
          '¿Cuánto tiempo llevas estudiando la industria en la que queremos competir?',
          '¿Qué verdad importante crees que muy pocas personas comparten contigo?',
          '¿Cuál es el mayor error que has cometido en tu carrera y qué aprendiste?',
          '¿Qué harías diferente si pudieras rediseñar nuestra industria desde cero?',
        ],
        respuestaCorrecta: 1,
        explicacion: '"¿Qué verdad importante crees que muy pocas personas comparten contigo?" busca pensamiento genuinamente original. Una buena respuesta suena: "La mayoría cree X, pero la verdad es Y." Es difícil de responder porque requiere pensamiento independiente real — no reproducción del consenso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue el "optimismo definido" del "optimismo indefinido" según Thiel?',
        opciones: [
          'El optimismo definido tiene datos que lo respaldan; el indefinido es solo esperanza sin evidencia',
          'El optimismo definido tiene una visión específica de qué mundo construir y cómo; el indefinido cree que el futuro será mejor sin un plan concreto de cómo hacerlo',
          'El optimismo definido es apropiado para grandes empresas; el indefinido para startups en etapa temprana',
          'El optimismo definido es individual; el indefinido es colectivo o societal',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Elon Musk tiene optimismo definido: puede explicar exactamente por qué la humanidad debe ser multiplanetaria y los pasos concretos para lograrlo. El optimismo indefinido de Silicon Valley es creer que "el futuro será mejor" sin un plan específico. El primero construye el futuro; el segundo lo espera.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las cuatro características que Thiel identifica en los mejores monopolios?',
        opciones: [
          'Precio bajo, distribución masiva, publicidad fuerte, equipo grande',
          'Tecnología propietaria superior, efectos de red, economías de escala, marca fuerte',
          'Primer movimiento en el mercado, capital abundante, talento excepcional, patentes sólidas',
          'Operaciones eficientes, bajos costos, márgenes altos, clientes leales',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los monopolios duraderos tienen tecnología propietaria (significativamente superior a alternativas), efectos de red (el producto mejora cuantos más usuarios tiene), economías de escala (costos que disminuyen al crecer) y marca fuerte (identidad que los competidores no pueden copiar fácilmente).',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué son tan críticos los co-fundadores en la visión de Thiel?',
        opciones: [
          'Porque las startups necesitan al menos tres fundadores para obtener inversión de capital de riesgo',
          'Porque los co-fundadores con historia previa y conocimiento mutuo profundo manejan mejor los conflictos inevitables que los que se conocieron recientemente',
          'Porque dos fundadores tienen más contactos y redes que uno solo',
          'Porque la distribución de trabajo entre co-fundadores aumenta la velocidad de desarrollo del producto',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La decisión de co-fundadores es como un matrimonio de negocios. Los mejores equipos fundadores tienen historia previa: se conocen, han trabajado juntos, saben cómo manejarse en momentos difíciles. Las startups que fracasan por conflicto entre fundadores frecuentemente eligieron co-fundadores basándose en habilidades sin conocerse bien.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Thiel critica la competencia perfecta desde el punto de vista empresarial?',
        opciones: [
          'Porque la competencia perfecta hace imposible diferenciarse con marketing y publicidad',
          'Porque la competencia perfecta favorece a las empresas más grandes con más capital',
          'Porque destruye los márgenes hasta que nadie gana dinero real — los negocios sobreviven pero no prosperan ni pueden invertir en innovación',
          'Porque la competencia perfecta incentiva reducir costos a expensas de la calidad',
        ],
        respuestaCorrecta: 2,
        explicacion: 'En un mercado perfectamente competitivo, la competencia empuja los precios hasta los costos y los márgenes desaparecen. Las aerolíneas mueven millones de personas pero sus márgenes son tan pequeños que cualquier crisis las pone al borde de la quiebra. Google, con su monopolio en búsquedas, tiene márgenes que le permiten invertir en múltiples proyectos de largo plazo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la pregunta que Thiel propone como el mejor ejercicio para encontrar oportunidades de cero a uno?',
        opciones: [
          '¿Qué empresa exitosa existente podría disrumpir con una versión mejorada del mismo producto?',
          '¿Qué necesidad existe en el mercado que todavía ninguna empresa está satisfaciendo bien?',
          '¿Qué empresa valiosa todavía nadie está construyendo?',
          '¿Qué tendencia tecnológica será dominante en los próximos 10 años?',
        ],
        respuestaCorrecta: 2,
        explicacion: '"¿Qué empresa valiosa todavía nadie está construyendo?" es la pregunta de cero a uno. No "¿qué empresa existente puedo mejorar?" sino "¿qué empresa que valdría miles de millones no existe todavía?" La respuesta honesta y bien pensada a esa pregunta es exactamente donde está la mayor oportunidad de innovación genuina.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 5 — El Arte de Empezar
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp05',
    titulo: 'El Arte de Empezar',
    autor: 'Guy Kawasaki',
    anio: '2004',
    emoji: '🚀',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'Guy Kawasaki, exevangelista de Apple, comparte su guía práctica y directa para cualquier persona que quiera iniciar un movimiento, un negocio o un proyecto con recursos limitados pero con una visión clara.',
    gemasRecompensa: 68,
    capitulos: const [
      CapituloResumen(
        titulo: 'Crea Significado, No Solo Dinero',
        emoji: '💡',
        contenido: '''Guy Kawasaki abre con una provocación que contradice gran parte del discurso emprendedor moderno: los mejores emprendedores no comienzan con la idea de hacer dinero — comienzan con la idea de cambiar algo en el mundo. El dinero viene como consecuencia, no como objetivo.

Kawasaki llama a esto CREAR SIGNIFICADO: la pregunta que debes hacerte al inicio no es "¿cuánto dinero puede ganar este negocio?" sino "¿qué cambiaría en el mundo si mi empresa tuviera éxito?" Esta pregunta filtra la gran mayoría de ideas de negocio — las que sobreviven a ese filtro son las que tienen más probabilidades de mantener la energía del fundador a través de los inevitables momentos difíciles.

El ex evangelista de Apple ejemplifica con su experiencia: Apple no comenzó con la idea de dominar el mercado de computadores personales. Comenzó con la visión de democratizar el poder de la computación, de poner en manos de personas comunes herramientas que antes solo tenían las corporaciones y los gobiernos. Esa visión era tan poderosa que generó un movimiento, no solo clientes.

Kawasaki también desmonta el mito del "momento perfecto para empezar." La mayoría de las personas esperan que el mercado esté listo, que tengan suficiente dinero, que la idea esté totalmente desarrollada, que el equipo esté completo. Esas condiciones nunca llegan simultáneamente. El arte de empezar consiste en comenzar de todas formas, con lo que tienes.

La primera tarea práctica: escribir el mantra de tu organización. No la misión corporativa de tres párrafos — una frase de tres a cinco palabras que capture la esencia de por qué existes. Nike: "Rendimiento atlético auténtico." Google: "Información democratizada." La claridad de propósito es el primer motor del emprendimiento real.''',
      ),
      CapituloResumen(
        titulo: 'El Arte del Posicionamiento: Define lo que Haces',
        emoji: '🎯',
        contenido: '''El segundo capítulo central aborda el posicionamiento — el proceso de definir con total claridad qué haces, para quién lo haces y por qué deberían elegirte a ti. Kawasaki tiene un estándar impresionante para esto: si no puedes explicarlo a tu abuela en treinta segundos, no lo entiendes lo suficientemente bien.

El error más común de los emprendedores nuevos es el posicionamiento ambiguo: "Hacemos software para empresas que quieren crecer." Este tipo de descripción no dice nada, no se diferencia de nadie y no genera curiosidad genuina. El posicionamiento efectivo debe ser específico, memorable y claramente diferenciado.

Kawasaki introduce el TEST DE LA ABUELA como criterio central: después de escucharte, ¿puede tu abuela repetir lo que haces con suficiente precisión como para explicárselo a otra persona? Si no puede, necesitas simplificar. Esta prueba no es sobre hacer el producto más simple — es sobre poder comunicarlo de forma simple.

También introduce el concepto de curva de posicionamiento: en cualquier mercado hay un espectro de opciones, de la más económica a la más premium, de la más simple a la más completa. ¿Dónde te posicionas en ese espectro y por qué? La respuesta debe ser consistente con quién es tu cliente ideal y con qué valoran más.

El posicionamiento también responde a la pregunta: ¿A qué dices que NO? Las empresas con posicionamiento más fuerte son aquellas que definen con claridad no solo lo que ofrecen sino lo que deliberadamente no ofrecen. La claridad sobre el "no" hace más creíble el "sí".''',
      ),
      CapituloResumen(
        titulo: 'El Arte del Pitch: Presenta tu Idea',
        emoji: '🎤',
        contenido: '''Kawasaki es conocido mundialmente por la REGLA 10-20-30: cualquier presentación de negocios debe tener no más de 10 diapositivas, durar no más de 20 minutos, y usar fuente de no menos de 30 puntos. Esta regla nació de la observación de cientos de presentaciones fallidas — las peores siempre eran las más largas y más densas.

Las 10 diapositivas deben cubrir: el problema que resuelves, tu solución, el modelo de negocio, la tecnología o ventaja especial, el mercado y su tamaño, la competencia y cómo te diferencias, el equipo, las proyecciones financieras, el estado actual y los logros, y la petición concreta — cuánto necesitas y para qué.

La razón de los 20 minutos es pragmática: en cualquier reunión hay interrupciones, retrasos técnicos, preguntas inesperadas. Si tu presentación necesita exactamente 45 minutos para funcionar, estás un minuto de problemas permanentemente.

La fuente de 30 puntos fuerza un cambio cognitivo crucial: si no puedes poner tus ideas en fuente grande, es porque estás leyendo las diapositivas en lugar de hablar con la audiencia, y tienes demasiado texto porque no has destilado tu idea a lo esencial.

Kawasaki también da el principio más importante sobre el pitch: HABLA DEL CLIENTE, NO DE TI. Los inversores y clientes no quieren escuchar qué tan increíble es tu tecnología — quieren escuchar qué problema del cliente resuelve y por qué ese cliente pagaría. Cada diapositiva debe poder responder "¿y a mí qué me importa esto?"''',
      ),
      CapituloResumen(
        titulo: 'El Arte de Conseguir Recursos: Bootstrapping',
        emoji: '💰',
        contenido: '''Kawasaki dedica un capítulo extenso a la realidad de los recursos — específicamente al arte de conseguirlos, administrarlos y multiplicarlos cuando hay muy poco disponible. Su perspectiva es decididamente anti-glamorosa: la mayoría de los negocios exitosos nacen del bootstrapping, no del capital de riesgo.

BOOTSTRAPPING significa construir una empresa con los ingresos que ella misma genera, sin depender de inversión externa. Las ventajas son contraintuitivas: te fuerza a encontrar clientes que realmente paguen desde el primer día, elimina el tiempo que se pierde buscando y manejando inversores, y te mantiene en control total de la dirección de la empresa.

Kawasaki da tácticas concretas para hacer más con menos: cobrar por adelantado a los clientes para financiar el desarrollo del producto; hacer alianzas con empresas complementarias para ampliar el alcance sin gasto de marketing; buscar subsidios y concursos que no diluyen la propiedad; comenzar con un servicio manual antes de automatizarlo.

Sobre el financiamiento externo, Kawasaki desmitifica el proceso. La mayoría de las startups que buscan venture capital nunca lo consiguen, y muchas de las que lo consiguen hubieran sido mejores sin él — porque la presión de dar retornos en plazos específicos desvía el negocio de su misión original.

Si la respuesta es sí, necesito inversión, la preparación es crítica: equipo comprobado, tracción demostrable, mercado grande, y una historia que explique por qué este equipo específico puede ganar en este mercado específico.''',
      ),
      CapituloResumen(
        titulo: 'Construir el Equipo y la Cultura',
        emoji: '🤝',
        contenido: '''En los capítulos finales, Kawasaki aborda uno de los mayores determinantes del éxito emprendedor: el equipo. Su posición es directa — una idea mediocre con un equipo excepcional tiene más probabilidades de éxito que una idea excepcional con un equipo mediocre.

La razón es simple: los negocios reales no funcionan como el plan de negocios. Las condiciones del mercado cambian, los clientes piden cosas diferentes a las que anticipaste, la tecnología evoluciona, los competidores se mueven. El equipo que puede adaptarse, aprender y pivotar es el que sobrevive — la idea original rara vez llega intacta al éxito.

Para construir el equipo, Kawasaki da el consejo que más resistencia genera pero que más consistentemente funciona: contrata a personas mejores que tú en sus áreas específicas. Los fundadores inseguros contratan personas que no los amenacen — y el equipo resultante es tan débil como el ego del fundador. Los grandes líderes contratan personas ante quienes se sienten admirados.

Sobre la cultura, Kawasaki es específico: la cultura no es lo que está escrito en los valores corporativos — es lo que haces cuando nadie te mira, y lo que toleran los líderes. Si el liderazgo tolera que se falte al respeto a los clientes, esa es la cultura real, independientemente de qué diga el manual.

El cierre es una invitación: empieza ahora. No cuando estés listo. No cuando tengas el equipo perfecto. Ahora, con lo que tienes, porque la alternativa — esperar — garantiza que nunca empezarás.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué propone Guy Kawasaki como punto de partida más importante para un emprendimiento?',
        opciones: [
          'Identificar el mercado más grande disponible y encontrar una forma de capturar una porción de él',
          'Asegurar financiamiento inicial antes de comenzar a construir el producto o servicio',
          'Crear significado — comenzar con la visión de qué cambiaría en el mundo si la empresa tiene éxito',
          'Formar primero el equipo completo antes de definir la idea o el modelo de negocio',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Kawasaki propone que los mejores emprendedores comienzan con "¿qué cambiaría en el mundo si mi empresa tiene éxito?" — no "¿cuánto dinero puedo ganar?" Esta visión de crear significado es lo que sostiene la energía del fundador en los momentos difíciles y genera movimientos, no solo clientes.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la regla 10-20-30 de Kawasaki para presentaciones?',
        opciones: [
          '10 reuniones de 20 minutos antes de confirmar la idea, con 30 personas del mercado objetivo',
          'No más de 10 diapositivas, no más de 20 minutos de duración, fuente de no menos de 30 puntos',
          '10 minutos de contexto, 20 de demostración del producto, 30 minutos de preguntas abiertas',
          'Obtener 10 clientes en 20 días con un presupuesto no mayor a 30 dólares por cliente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La regla 10-20-30 es la contribución más famosa de Kawasaki al mundo del pitch: máximo 10 diapositivas, máximo 20 minutos de duración, mínimo 30 puntos de fuente. Cada restricción fuerza una mejora: menos slides obliga a priorizar, 20 minutos deja espacio para imprevistos, y la fuente grande elimina el texto de relleno.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "test de la abuela" que propone Kawasaki para el posicionamiento?',
        opciones: [
          'Probar el producto con usuarios mayores de 60 años que representan el segmento menos atendido',
          'Verificar que el negocio puede sobrevivir con los márgenes típicos de mercados tradicionales',
          'Si después de escucharte, tu abuela puede repetir lo que haces con suficiente precisión para explicárselo a otro',
          'Validar que el producto es lo suficientemente simple para que cualquier persona lo use sin capacitación',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El test de la abuela evalúa la claridad comunicativa: si alguien sin contexto técnico no puede repetir lo que haces, es porque no has destilado tu idea a lo esencial. No evalúa la simpleza del producto sino la claridad con que puedes comunicarlo, lo cual requiere comprensión profunda del problema que resuelves.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la ventaja contraintuitiva del bootstrapping según Kawasaki?',
        opciones: [
          'Permite crecer más rápido porque no hay que dedicar tiempo a reportar a inversores externos',
          'Garantiza que la empresa recibirá valoraciones más altas cuando eventualmente busque inversión',
          'Fuerza a encontrar clientes que realmente paguen desde el primer día y mantiene control total',
          'Elimina la necesidad de tener un plan de negocios formal antes de comenzar a operar',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El bootstrapping fuerza la validación real: si nadie paga, el negocio no sobrevive. Eso elimina rápidamente las ideas que solo suenan bien. También mantiene al fundador en control total sin la presión de inversores que pueden desviar la misión original para cumplir plazos de retorno de capital.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dice Kawasaki sobre contratar personas para el equipo fundador?',
        opciones: [
          'Debes contratar personas con perfiles similares al tuyo para garantizar alineación cultural',
          'Es mejor contratar personas que conozcas bien antes del emprendimiento para minimizar riesgos',
          'Contrata personas mejores que tú en sus áreas — los fundadores inseguros contratan personas que no los amenacen',
          'El primer equipo debe ser lo más pequeño posible para preservar el capital en las etapas iniciales',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Kawasaki insiste en contratar personas ante quienes el fundador se sienta admirado, no personas que no representen una "amenaza" para el ego. Los equipos construidos sobre la inseguridad del fundador son tan débiles como ese ego. Los grandes líderes aprenden de su equipo constantemente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué principal principio da Kawasaki sobre el contenido de un pitch efectivo?',
        opciones: [
          'Hablar principalmente de la tecnología que hace único el producto para establecer diferenciación técnica',
          'Hablar del cliente — qué problema tiene y por qué pagaría para resolverlo, no de cuán increíble es la tecnología',
          'Comenzar siempre con los logros del equipo fundador para establecer credibilidad rápidamente',
          'Enfocarse primero en el tamaño del mercado para demostrar que la oportunidad justifica la inversión',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Kawasaki insiste en que el pitch debe hablar del cliente, no del producto. Los inversores y clientes quieren saber qué problema tiene el cliente y por qué pagaría para resolverlo. "¿Y a mí qué me importa?" debe poder responderse en cada diapositiva desde la perspectiva del cliente objetivo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo define Kawasaki la cultura organizacional real?',
        opciones: [
          'Es lo que está declarado en los valores corporativos y el manual del empleado de la empresa',
          'Es lo que el CEO declara públicamente en las reuniones generales de la organización',
          'Es lo que haces cuando nadie te mira y lo que los líderes toleran — no lo que dicen que valoran',
          'Es el conjunto de rituales y tradiciones que el equipo fundador establece en el primer año',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Para Kawasaki, la cultura real no es el manual — es lo que se recompensa, se tolera y se castiga en la práctica. Si el liderazgo tolera que se falte al respeto a los clientes, esa es la cultura real. Las decisiones concretas cotidianas definen la cultura, no los documentos de valores.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué una idea mediocre con equipo excepcional supera a una idea excepcional con equipo mediocre?',
        opciones: [
          'Porque el equipo puede mejorar la idea pero una idea no puede mejorar sola al equipo',
          'Porque los negocios reales no siguen el plan — el equipo debe adaptarse cuando las condiciones cambian',
          'Porque los inversores valoran más el equipo que la idea al decidir a qué empresa financiar',
          'Porque las ideas excepcionales atraen demasiada competencia y son más difíciles de sostener en el tiempo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los negocios reales no siguen el plan original: el mercado cambia, los clientes piden cosas inesperadas, la competencia se mueve. Un equipo excepcional puede pivotar, aprender y adaptarse. Un equipo mediocre ejecutará perfectamente el plan equivocado sin saber cambiarlo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué incluye el mantra organizacional según Kawasaki y cómo se diferencia de la misión?',
        opciones: [
          'El mantra es más largo que la misión e incluye valores, visión y objetivos de mediano plazo',
          'El mantra son tres a cinco palabras que capturan la esencia de por qué existes — mucho más corto que la misión',
          'El mantra es para uso interno del equipo y la misión es para comunicarse con clientes e inversores',
          'El mantra cambia anualmente mientras la misión permanece constante por décadas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Kawasaki propone el mantra como alternativa a la misión corporativa tradicional de múltiples párrafos. El mantra son tres a cinco palabras que capturan la esencia de por qué la organización existe: Nike "Rendimiento atlético auténtico", Google "Información democratizada". Simple, memorable, y verdadero.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el consejo final de Kawasaki sobre el momento de empezar un negocio?',
        opciones: [
          'Esperar a tener el plan de negocios completo y validado antes de comprometer recursos propios',
          'Comenzar solo cuando tengas el equipo mínimo viable completo para ejecutar correctamente',
          'Empieza ahora, con lo que tienes — esperar garantiza que nunca empezarás',
          'Comenzar en el momento del ciclo económico que más favorezca tu tipo de industria objetivo',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Kawasaki cierra con la instrucción más directa del libro: empieza ahora, con lo que tienes. No cuando estés listo, no cuando el mercado esté mejor, no cuando tengas el equipo perfecto. La alternativa — seguir esperando — garantiza que nunca empezarás, porque las condiciones perfectas no llegan solas.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 6 — Rework: Negocios sin Reglas
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp06',
    titulo: 'Rework: Negocios sin Reglas',
    autor: 'Jason Fried y David Heinemeier Hansson',
    anio: '2010',
    emoji: '⚡',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'Los fundadores de Basecamp desafían las reglas convencionales del mundo empresarial: que necesitas inversión, empleados, un plan de negocio elaborado o crecer a toda costa para construir una empresa exitosa y rentable.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'Olvida lo que Sabes sobre los Negocios',
        emoji: '🗑️',
        contenido: '''Jason Fried y David Heinemeier Hansson abren Rework con una provocación directa: gran parte de la sabiduría convencional sobre negocios es incorrecta, está desactualizada, o simplemente nunca fue verdad.

La convención dice: necesitas un plan de negocios formal antes de empezar. Rework responde: los planes de negocios son ficción — proyecciones que cambian en la primera semana de contacto con la realidad. Lo que necesitas no es un plan sino una dirección. Los planes se vuelven obsoletos; la capacidad de adaptarse no.

La convención dice: necesitas inversión externa para crecer. Rework responde: el dinero de inversión también compra obligaciones, plazos de retorno, y pérdida de control. Basecamp creció desde cero hasta ser rentable sin un dólar de inversión externa. El bootstrapping te fuerza a construir algo que la gente pague, no algo que impresione a los inversores.

La convención dice: los errores y fracasos son valiosas experiencias de aprendizaje. Rework desafía incluso esto: el aprendizaje de los errores está sobrevalorado. También aprendes — y con menos costo — del éxito. Los fracasos enseñan lo que no funciona, pero no necesariamente lo que funciona.

La convención dice: crece lo más rápido posible. Rework pregunta: ¿para qué? La escala sin rentabilidad no es éxito — es un problema más grande. Una empresa pequeña, rentable y bien manejada es mejor por cualquier métrica que importa que una empresa grande, no rentable y caótica.''',
      ),
      CapituloResumen(
        titulo: 'Productividad Real: Trabajo Profundo',
        emoji: '⏰',
        contenido: '''El capítulo central sobre productividad en Rework es uno de los más influyentes del libro: la forma en que la mayoría de las empresas organizan el trabajo — con reuniones, interrupciones constantes, y comunicación en tiempo real — destruye activamente la productividad de sus empleados.

El problema con las reuniones es específico y documentado: una reunión de una hora con ocho personas no cuesta una hora — cuesta ocho horas de tiempo de personas. Además interrumpe el flujo de trabajo de cada persona, genera más reuniones de seguimiento, y raramente produce decisiones que no podrían haberse tomado con un email de cinco minutos.

Fried y DHH proponen una alternativa radical: trata las interrupciones como enemigos del trabajo real. El trabajo profundo — la concentración sostenida en un problema durante horas sin interrupción — es irreproducible en un ambiente donde cada diez minutos alguien pregunta algo, llega una notificación, o hay una reunión "rápida".

Una de las ideas más directas: si tu trabajo requiere mucha coordinación en tiempo real, eso es una señal de un problema de diseño organizacional, no una virtud. Los mejores equipos de Basecamp pueden trabajar de forma asíncrona porque el trabajo está bien definido, la documentación es buena, y la confianza es alta.

El libro recomienda que las empresas adopten días sin reuniones como política, que traten los chats y emails como comunicación asíncrona, y que midan el output real en lugar de las horas visibles. La persona que llega temprano y se va tarde no es necesariamente la más productiva — puede ser simplemente la más visible.''',
      ),
      CapituloResumen(
        titulo: 'Haz Menos, Haz Mejor',
        emoji: '✂️',
        contenido: '''Rework propone una filosofía de negocio contracultural: haz menos, pero hazlo excepcionalmente bien. En lugar de acumular funcionalidades, clientes, empleados y oficinas como señales de éxito, enfócate en hacer una cosa muy bien y crecer solo cuando eso sea insosteniblemente necesario.

El principio central: ser una empresa pequeña es una ventaja, no un estado provisional a superar. Las empresas pequeñas son más ágiles, pueden cambiar de dirección más rápido, tienen menos burocracia, y pueden enfocarse con más intensidad. Muchas empresas pequeñas son más rentables por empleado que las grandes — simplemente nadie las menciona porque el relato dominante valora el tamaño.

Fried y DHH tienen una posición explícita sobre las características del producto: menos es más. Cada característica que agregas es una deuda — requiere mantenimiento, documentación, soporte, y capacitación. La mayoría de las características que los clientes piden no son las que realmente más usan. Agregar sin criterio hace el producto más complicado, más difícil de usar, y más costoso de mantener.

El proceso para decidir qué hacer: resuelve el problema más urgente para el cliente más real que tienes. No el cliente hipotético del futuro, no la característica que te pediría un cliente diez veces más grande — el problema real del cliente real de hoy.

El libro también habla sobre el marketing: en lugar de publicidad pagada, construye algo tan bueno que las personas hablen de ello. El mejor marketing es un producto que las personas recomienden porque genuinamente les cambió algo, no porque hayan visto un anuncio segmentado.''',
      ),
      CapituloResumen(
        titulo: 'Tu Competidor No es tu Enemigo',
        emoji: '🌐',
        contenido: '''Una de las perspectivas más originales de Rework es sobre la competencia. La mayoría de los libros de negocios tratan a los competidores como enemigos a derrotar. Rework propone que obsesionarse con la competencia es una forma de vivir reactivamente.

La trampa de la obsesión competitiva funciona así: tu competidor lanza una nueva función, y tú la agregas también aunque no estés seguro de que sea valiosa. Tu competidor cambia su precio, y tú cambias el tuyo. Terminás definiendo tu producto por lo que hace el competidor, no por lo que necesita el cliente. Eso es perder el control de tu propia dirección.

Fried y DHH proponen una alternativa: obsesiónate con tus clientes, no con tus competidores. Construye lo que ellos genuinamente necesitan, comunica lo que hace única tu solución, y deja que los competidores hagan lo suyo. Si tu diferenciación es real y valiosa, los clientes correctos lo reconocerán.

Sobre la copia: si alguien copia tu producto, no entres en pánico. Los copiadores rara vez entienden el por qué detrás de lo que copian — solo copian el qué. Sin entender el por qué, no pueden mejorar ni adaptar eficientemente lo que copian. Tu ventaja está en la comprensión profunda del problema que resuelves.

El capítulo también aborda la comunicación diferente a la competencia: en lugar del lenguaje corporativo genérico que todos usan, habla como una persona real a otra persona real. La autenticidad en la comunicación es escasa y por eso es diferenciadora.''',
      ),
      CapituloResumen(
        titulo: 'Contratación y Cultura en una Empresa Real',
        emoji: '👥',
        contenido: '''Los capítulos finales de Rework abordan quizás el tema más importante para cualquier empresa que empiece a escalar: cómo contratar y cómo construir cultura sin destruir lo que hizo exitosa a la empresa en primer lugar.

Sobre contratación, Fried y DHH tienen posiciones firmes: contrata tan tarde como sea humanamente posible. La mayoría de las empresas contrata demasiado pronto, basándose en proyecciones de crecimiento que no se materializan. Cada empleado que contratas es una responsabilidad permanente — un sueldo mensual, tiempo de gestión, cultura que defender.

Cuando contratas, busca algo específico que no está en la mayoría de las descripciones de puesto: la capacidad de ESCRIBIR BIEN. La escritura correlaciona con el pensamiento claro y la comunicación efectiva. En una empresa donde la comunicación escrita es el modo por defecto, contratar personas que escriben bien es una ventaja competitiva real.

Sobre la cultura, el mensaje es preciso: la cultura no se declara — se demuestra. No publiques los valores en la pared; toma decisiones consistentes con ellos. No anuncies que eres transparente; sé transparente cuando es incómodo. La brecha entre lo que dices que valoras y lo que haces en la práctica destruye la confianza más rápido que cualquier otra cosa.

Rework cierra con un llamado a actuar ahora: no necesitas permiso para empezar, no necesitas un título de MBA, no necesitas millones de dólares de inversión. Lo que necesitas es un problema real que resuelves para clientes reales que pagan. Todo lo demás viene después.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la posición de Fried y DHH sobre los planes de negocio formales?',
        opciones: [
          'Son esenciales para conseguir financiamiento y deben actualizarse mensualmente',
          'Son ficción — proyecciones que cambian en la primera semana; lo que necesitas es una dirección, no un plan',
          'Son útiles solo para empresas con más de cinco empleados o con necesidades de financiamiento externo',
          'Deben ser cortos y flexibles, pero son indispensables para cualquier emprendimiento serio',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Rework argumenta que los planes de negocios son ficción porque las proyecciones cambian al primer contacto con la realidad. Lo que necesitas no es un plan detallado sino una dirección clara y la capacidad de adaptarte. Los planes se vuelven obsoletos; la adaptabilidad no.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Rework dice que las reuniones destruyen la productividad?',
        opciones: [
          'Porque generan conflictos interpersonales que requieren tiempo adicional para resolverse',
          'Porque una reunión de una hora con ocho personas cuesta ocho horas e interrumpe el flujo de trabajo profundo',
          'Porque la mayoría de los participantes no están preparados y no aportan valor real al resultado',
          'Porque son una señal de mala comunicación escrita que debería corregirse primero en la organización',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Fried y DHH calculan el costo real: una reunión de una hora con ocho personas cuesta ocho horas productivas. Además interrumpe el flujo de trabajo profundo que es irreproducible en ambientes de interrupciones constantes. El trabajo profundo requiere tiempo sostenido sin interrupciones.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué perspectiva tiene Rework sobre el tamaño de la empresa?',
        opciones: [
          'Crecer rápido es el objetivo principal porque las empresas grandes tienen más recursos para competir',
          'Ser pequeño es una ventaja competitiva real — agilidad, enfoque y rentabilidad por empleado pueden ser superiores',
          'El tamaño ideal es de 10 a 50 personas porque equilibra velocidad y capacidad de ejecución',
          'El tamaño debe seguir al mercado — si el mercado crece, la empresa debe crecer proporcionalmente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Rework propone que ser pequeño no es un estado provisional a superar sino una ventaja: agilidad, menos burocracia, capacidad de cambio más rápido, y frecuentemente mayor rentabilidad por empleado que las grandes. El relato dominante valora el tamaño, pero el tamaño en sí no es el objetivo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué habilidad específica priorizan Fried y DHH al contratar y por qué?',
        opciones: [
          'La habilidad técnica específica del rol porque es la más difícil de desarrollar internamente',
          'La capacidad de escribir bien — correlaciona con pensamiento claro y comunicación efectiva asíncrona',
          'La experiencia previa en empresas similares porque reduce el tiempo de adaptación al rol',
          'La capacidad de trabajo en equipo presencial porque construye cultura organizacional más fuerte',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Fried y DHH buscan personas que escriban bien porque la escritura correlaciona con pensamiento claro. En una empresa donde la comunicación asíncrona es el modo por defecto, escribir con claridad es una ventaja competitiva real. La persona que escribe bien también piensa y comunica sin ambigüedad.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué consejo da Rework sobre agregar funcionalidades al producto?',
        opciones: [
          'Agrega todo lo que los clientes pidan porque la variedad atrae a más segmentos de mercado',
          'Agrega primero las funcionalidades que generan más ingresos directamente medibles',
          'Haz menos — cada funcionalidad es una deuda de mantenimiento; agrega solo lo que resuelve el problema más urgente del cliente real',
          'Agrega según lo que hace la competencia para no quedarte detrás en la percepción del mercado',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Rework ve cada funcionalidad como una deuda: requiere mantenimiento, documentación, soporte y capacitación. Agregar sin criterio hace el producto más complicado y costoso. El criterio correcto es: ¿resuelve el problema más urgente para el cliente más real que tengo hoy?',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Rework el problema de obsesionarse con la competencia?',
        opciones: [
          'La competencia siempre tiene ventajas de escala que hacen inútil intentar competir directamente',
          'Obsesionarse con competidores lleva a vivir reactivamente — haciendo lo que ellos hacen en lugar de lo que crees correcto',
          'La obsesión competitiva es útil al inicio pero se vuelve dañina cuando la empresa ya tiene tracción',
          'Los competidores más peligrosos son los que no conoces, no los que monitorizas activamente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Rework argumenta que la obsesión competitiva lleva a reaccionar en lugar de liderar: copias funcionalidades del competidor, cambias precios cuando ellos cambian los suyos, y terminas definiendo tu producto por lo que hace otro. La alternativa: obsesiónate con tus clientes, no con tus rivales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué afirman Fried y DHH sobre la cultura organizacional?',
        opciones: [
          'La cultura debe ser definida por el CEO y comunicada formalmente a través de documentos internos',
          'La cultura no se declara — se demuestra a través de decisiones consistentes y de lo que se tolera en la práctica',
          'La cultura fuerte requiere que todos los empleados compartan los mismos valores personales profundos',
          'La cultura se construye principalmente en los primeros tres meses de vida de la empresa',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Rework es explícito: la cultura no es el manual — es lo que se recompensa, se tolera y se castiga en la práctica. La brecha entre lo que dices que valoras y lo que haces en la práctica destruye la confianza. Las decisiones concretas cotidianas definen la cultura real.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué dice Rework que los copiadores rara vez son una amenaza real?',
        opciones: [
          'Porque les falta el talento técnico para copiar con suficiente calidad y velocidad',
          'Porque la ley de propiedad intelectual los protege efectivamente en la mayoría de los mercados',
          'Porque copian el qué pero no entienden el por qué, y sin el por qué no pueden mejorar ni adaptarse eficientemente',
          'Porque el mercado siempre prefiere al original sobre las copias en las decisiones de compra',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Los copiadores copian el qué (interfaz, precio, funcionalidades) pero no comprenden el por qué detrás de cada decisión. Sin ese entendimiento profundo, no pueden mejorar ni adaptar lo que copian. Tu ventaja real está en esa comprensión, no en los activos que se pueden copiar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo recomienda Rework contratar nuevos empleados?',
        opciones: [
          'Cuando proyectes crecimiento del 20% en ingresos en los próximos seis meses',
          'Al inicio del emprendimiento para tener el equipo completo antes de lanzar el producto',
          'Tan tarde como sea posible — solo cuando el dolor de no tener esa persona sea insoportable',
          'Según el estándar de la industria para empresas de tu tamaño y tipo de mercado',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Fried y DHH advierten contra contratar demasiado pronto basándose en proyecciones no materializadas. Cada empleado es una responsabilidad permanente. La señal para contratar es el dolor real: cuando la carga de trabajo insostenible es inequívoca y el costo de no contratar supera claramente el de contratar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mensaje final de Rework sobre los prerrequisitos para emprender?',
        opciones: [
          'Necesitas al menos dos años de experiencia en la industria antes de lanzar un producto propio',
          'El MBA o la formación formal en negocios es la base más sólida para tomar decisiones empresariales',
          'No necesitas permiso, título ni millones — solo un problema real que resuelves para clientes que pagan',
          'Necesitas primero construir una red de contactos sólida que te facilite el acceso a clientes iniciales',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Rework cierra con una declaración inclusiva y directa: no necesitas permiso, título de MBA, ni capital de riesgo. Lo que necesitas es un problema real que resuelves para clientes reales que pagan. Todo lo demás — equipo, oficina, inversión — viene después de eso y en respuesta a eso.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 7 — Cero a Uno
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp07',
    titulo: 'Cero a Uno',
    autor: 'Peter Thiel',
    anio: '2014',
    emoji: '🚀',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'El cofundador de PayPal revela que el verdadero progreso no viene de mejorar lo que existe — viene de crear algo completamente nuevo. La guía radical para construir empresas que transforman el mundo.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'De Cero a Uno vs De Uno a N',
        emoji: '🔢',
        contenido: '''Peter Thiel hace una distinción fundamental que ordena todo el libro: hay dos tipos de progreso. De 1 a N es globalización — hacer más de lo que ya funciona, llevar lo que ya existe a más lugares, copiar los modelos probados. De 0 a 1 es tecnología — crear algo genuinamente nuevo que antes no existía.

Ambos son valiosos pero tienen dinámicas completamente diferentes. La globalización es predecible, competitiva y lineal. La tecnología es incierta, monopolística y exponencial.

La pregunta que Thiel hace a todos los candidatos en sus entrevistas: "¿En qué aspecto importante estás en desacuerdo con la mayoría?" Las personas que no pueden responder esta pregunta o que dan respuestas políticamente correctas raramente construyen empresas transformadoras. El emprendimiento genuino requiere pensar por uno mismo, no seguir el consenso.

Los emprendedores que construyen algo de 0 a 1 no compiten — crean mercados donde antes no existía competencia. Apple no compitió con los teléfonos existentes cuando lanzó el iPhone — los hizo irrelevantes. Google no compitió con los motores de búsqueda existentes — redefinió lo que un motor de búsqueda podía ser.

La enseñanza universitaria de negocios tiende a enseñar estrategias de 1 a N: cómo competir mejor en mercados existentes. Pero las empresas más valiosas de la historia crearon mercados completamente nuevos. Thiel propone que la pregunta más importante no es "¿cómo compito mejor?" sino "¿qué problema importante todavía no tiene solución?".''',
      ),
      CapituloResumen(
        titulo: 'La Ventaja del Monopolio',
        emoji: '👑',
        contenido: '''Thiel propone algo que va contra la intuición económica convencional: los monopolios son buenos. No los monopolios de colusión o de abuso — los monopolios de innovación genuina. Las empresas que construyen algo tan superior que no tienen competencia real.

Google tiene el 80%+ del mercado de búsqueda. ¿Es eso bueno o malo? Para los consumidores, es el mejor motor de búsqueda disponible — y lo es precisamente porque Google no tiene que preocuparse por competidores que la obliguen a distraerse en guerras de precio. Puede invertir en I+D a largo plazo.

La empresa perfectamente competitiva en un mercado perfectamente competitivo no gana ninguna utilidad — los precios se reducen hasta el costo marginal. Solo los monopolios generan ganancias reales, que pueden reinvertirse en seguir siendo mejores.

Los cuatro pilares del monopolio duradero: 1) Tecnología propietaria (al menos 10 veces mejor que la alternativa — no 10%, sino 10x). 2) Efectos de red (el producto se vuelve más valioso con cada usuario adicional). 3) Economías de escala (costos por unidad que disminuyen con el crecimiento). 4) Marca (la percepción que los consumidores no pueden copiar fácilmente).

La startup perfecta: comienza dominando un nicho pequeño y específico, luego expande. Amazon comenzó solo con libros. Facebook comenzó solo con estudiantes de Harvard. Dominar el nicho da la base para expandirse — intentar dominar todo desde el principio garantiza no dominar nada.''',
      ),
      CapituloResumen(
        titulo: 'Construir el Futuro',
        emoji: '🔭',
        contenido: '''Thiel divide las visiones del futuro en cuatro cuadrantes: optimismo definido (sé que el futuro será mejor y sé exactamente cómo), optimismo indefinido (creo que el futuro será mejor pero no sé cómo ni planeo hacerlo), pesimismo definido (sé que el futuro será peor y me preparo para ello), pesimismo indefinido (creo que el futuro será peor pero no sé por qué).

El Silicon Valley y la cultura financiera de Wall Street son ejemplos de optimismo indefinido: todos creen que las cosas irán bien, pero nadie tiene un plan específico para hacerlo. Se diversifican, se protegen, esperan que el mercado haga su magia. Thiel argumenta que esta actitud no construye nada.

Los grandes constructores históricos — los que construyeron los ferrocarriles transcontinentales, los que fueron a la Luna, los que construyeron las grandes ciudades modernas — operaban desde el optimismo definido: tenían un plan específico y lo ejecutaban.

Las startups más transformadoras piensan en el largo plazo de formas que la mayoría considera irrealistas. SpaceX tiene un plan específico para colonizar Marte. Tesla tenía un plan específico para que los autos eléctricos fueran los mejores autos, no solo los más verdes. Este tipo de pensamiento a largo plazo y específico es lo que produce transformación real.

El secreto que Thiel busca en las startups: "¿Qué sabes sobre el mundo que casi nadie más sabe?" Las empresas más valiosas se construyen sobre secretos — verdades sobre el mundo que el mercado todavía no ha descubierto ni valorado.''',
      ),
      CapituloResumen(
        titulo: 'El Equipo y la Cultura',
        emoji: '🤝',
        contenido: '''Thiel dedica capítulos importantes a los fundamentos humanos de las startups: quiénes son las personas correctas, cómo construir una cultura que funcione, y por qué las primeras decisiones de equipo son las más importantes de toda la empresa.

La trinidad del cofundador: Thiel propone que los mejores equipos fundadores tienen tres cualidades combinadas. Conocimiento técnico profundo del problema. Red de relaciones que permite reclutar talento y acceder a recursos. Alineación de valores que permita tomar decisiones difíciles sin destruir la relación.

Los tres tipos de equipo que no funcionan: los fundadores que son solo amigos (les importa más la relación que hacer las cosas bien), los que son solo conocidos de negocios (no tienen suficiente confianza para los conflictos inevitables), y los que tienen habilidades perfectamente complementarias pero valores opuestos (colapsan en las decisiones difíciles).

La cultura como religión: Thiel habla de las mejores startups como casi sectas — en el sentido de que tienen una visión tan específica del mundo y una comunidad tan cohesionada alrededor de ella que se distinguen radicalmente del exterior. No todas las sectas tienen razón, pero todas las startups exitosas tienen algo de secta.

El rol del CEO en la startup: diferente al del CEO de una corporación grande. En una startup, el CEO establece la cultura con cada decisión personal. Lo que el CEO tolera, la cultura lo acepta. Lo que el CEO celebra, la cultura lo replica. La influencia es directa y masiva.''',
      ),
      CapituloResumen(
        titulo: 'Las Lecciones del Pasado y el Futuro',
        emoji: '🌐',
        contenido: '''Thiel cierra el libro con una perspectiva filosófica más amplia: el futuro no está determinado. Es posible construir un mundo mejor, pero requiere pensar por uno mismo, tener el coraje de ejecutar ideas que la mayoría considera imposibles o equivocadas, y rechazar la mediocridad del consenso.

La crisis de la innovación: Thiel argumenta que los sistemas de innovación modernos — universidades, grandes corporaciones, el gobierno — son buenos para producir más de lo mismo pero pobres para producir algo genuinamente nuevo. La innovación radical tiene que venir de startups porque las organizaciones grandes tienen demasiado que perder.

Los grandes problemas sin resolver: energía limpia, salud preventiva, educación personalizada, colonización espacial. Estos problemas son tanto filosóficos como técnicos — requieren personas que se atrevan a pensar de manera radicalmente diferente sobre lo que es posible.

La advertencia sobre la imitación: los emprendedores que estudian el éxito de otras startups e intentan replicarlo raramente tienen éxito. Los negocios son diferentes entre sí en formas que hacen la imitación inefectiva. El éxito real requiere entender los principios fundamentales y aplicarlos creativamente, no copiar estrategias de superficie.

El mensaje final de Thiel: el futuro no llegará solo. Tiene que ser construido por personas que crean genuinamente que pueden hacerlo y que tienen el coraje de emprender con ese nivel de ambición. La pregunta que cada emprendedor debe hacerse no es "¿cómo me adapto al mercado existente?" sino "¿qué mercado necesito crear?".''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre el progreso "de 0 a 1" y "de 1 a N" según Thiel?',
        opciones: [
          '0 a 1 es el crecimiento inicial de una startup; 1 a N es la expansión a escala',
          '0 a 1 es crear algo genuinamente nuevo; 1 a N es globalización — hacer más de lo que ya existe',
          '0 a 1 es el crecimiento lineal; 1 a N es el crecimiento exponencial',
          '0 a 1 aplica a tecnología; 1 a N aplica a servicios y comercio',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La distinción más importante del libro. La globalización (1 a N) lleva lo que funciona a más lugares. La tecnología (0 a 1) crea algo que antes no existía. Solo lo segundo produce progreso genuinamente nuevo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Thiel dice que los monopolios son buenos?',
        opciones: [
          'Porque permiten precios más altos que generan mayor rentabilidad para los inversores',
          'Los monopolios de innovación genuina no tienen que preocuparse por guerras de precio y pueden invertir en I+D a largo plazo — beneficiando a los consumidores',
          'Porque son más estables que las empresas competitivas y ofrecen más seguridad laboral',
          'Porque la concentración de recursos permite proyectos de mayor escala e impacto',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Google domina la búsqueda porque es el mejor motor de búsqueda — y lo es en parte porque sin la presión competitiva puede invertir en ser mejor. La empresa perfectamente competitiva no genera utilidades para reinvertir.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los cuatro pilares del monopolio duradero según Thiel?',
        opciones: [
          'Capital, talento, patentes y territorio',
          'Tecnología propietaria (10x mejor), efectos de red, economías de escala y marca',
          'Primero en el mercado, mayor inversión, mejor distribución y lealtad del cliente',
          'Producto superior, precio bajo, distribución amplia y marketing efectivo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Los cuatro pilares: 1) Tecnología al menos 10 veces mejor (no 10%). 2) Efectos de red (más valiosa con más usuarios). 3) Economías de escala (costos que bajan con el crecimiento). 4) Marca que no puede copiarse fácilmente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué estrategia de crecimiento recomienda Thiel para una startup?',
        opciones: [
          'Lanzar en todos los mercados simultáneamente para establecer presencia global rápidamente',
          'Comenzar dominando un nicho pequeño y específico, luego expandirse — como Amazon con libros y Facebook con Harvard',
          'Crecer orgánicamente sin prisa, consolidando cada mercado antes de avanzar al siguiente',
          'Enfocarse primero en el mercado más grande para lograr el mayor impacto posible',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Amazon comenzó solo con libros. Facebook comenzó solo con Harvard. Dominar el nicho da la base para expandirse. Intentar dominar todo desde el principio garantiza no dominar nada.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pregunta hace Thiel a todos los candidatos en sus entrevistas?',
        opciones: [
          '"¿Cuál es el mayor fracaso de tu carrera y qué aprendiste de él?"',
          '"¿En qué aspecto importante estás en desacuerdo con la mayoría?"',
          '"¿Cuál es el problema más importante en tu industria que todavía no tiene solución?"',
          '"¿Qué construirías si tuvieras acceso ilimitado a capital y talento?"',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Las personas que no pueden responder esta pregunta raramente construyen empresas transformadoras. El emprendimiento genuino requiere pensar por uno mismo, no seguir el consenso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "optimismo indefinido" que critica Thiel?',
        opciones: [
          'La tendencia de los emprendedores a sobrestimar el tamaño de su mercado potencial',
          'Creer que el futuro será mejor pero sin un plan específico para hacerlo — la actitud de diversificarse y esperar que el mercado haga su magia',
          'El optimismo de los inversores de capital de riesgo sobre el retorno de sus inversiones',
          'La creencia de que la tecnología resolverá todos los problemas humanos automáticamente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Wall Street y Silicon Valley mainstream son ejemplos de optimismo indefinido. Todo el mundo cree que las cosas irán bien, pero nadie tiene un plan específico. Thiel propone que el progreso real requiere optimismo definido: un plan concreto.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el "secreto" que Thiel busca en las startups más prometedoras?',
        opciones: [
          'Una patente o propiedad intelectual que protege el negocio de la competencia',
          'Una verdad sobre el mundo que casi nadie más sabe todavía — en lo que el mercado no ha valorado',
          'Un proceso interno más eficiente que permite costos significativamente menores',
          'Un acceso privilegiado a recursos escasos que la competencia no puede obtener',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! "¿Qué sabes sobre el mundo que casi nadie más sabe?" Las empresas más valiosas se construyen sobre secretos — verdades que el mercado todavía no descubrió ni valoró.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Thiel compara las mejores startups con "sectas" (en sentido positivo)?',
        opciones: [
          'Porque tienen rituales internos que crean cohesión y cultura organizacional fuerte',
          'Porque tienen una visión tan específica del mundo y una comunidad tan cohesionada que se distinguen radicalmente del exterior',
          'Porque siguen a un líder carismático con devoción que puede ser peligrosa',
          'Porque aíslan a sus empleados del mundo exterior para mantener el enfoque',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Thiel usa "secta" positivamente: las mejores startups tienen una visión tan específica y una comunidad tan cohesionada que parecen "raras" desde afuera. No todas las sectas tienen razón, pero todas las startups exitosas tienen algo de eso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué la imitación de startups exitosas rara vez funciona según Thiel?',
        opciones: [
          'Porque los mercados ya están saturados cuando los imitadores llegan',
          'Porque los negocios exitosos son únicos en formas que hacen la imitación inefectiva — el éxito real requiere principios, no estrategias de superficie',
          'Porque los fundadores originales tienen más experiencia y recursos para competir',
          'Porque la velocidad de la innovación hace que los modelos queden obsoletos rápidamente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El éxito real viene de entender los principios fundamentales y aplicarlos creativamente a problemas nuevos — no de copiar estrategias que funcionaron en contextos diferentes.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la pregunta final que Thiel dice que todo emprendedor debe hacerse?',
        opciones: [
          '"¿Cómo me adapto mejor al mercado existente?"',
          '"¿Cómo gano a mis competidores actuales?"',
          '"¿Qué mercado necesito crear?" — no competir mejor, sino crear algo donde no existe competencia',
          '"¿Cómo escalo más rápido que mis competidores?"',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! La mentalidad competitiva pregunta "¿cómo gano en el juego existente?". La mentalidad transformadora pregunta "¿qué juego nuevo necesito crear?". Las empresas más valiosas no compitieron — crearon mercados nuevos.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 8 — El Método Lean Startup
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp08',
    titulo: 'El Método Lean Startup',
    autor: 'Eric Ries',
    anio: '2011',
    emoji: '🔄',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'El método que transformó cómo se construyen empresas en todo el mundo: valida tus suposiciones con el mínimo esfuerzo posible antes de comprometer todos tus recursos en una dirección que quizás no funciona.',
    gemasRecompensa: 62,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Problema del Desperdicio',
        emoji: '🗑️',
        contenido: '''Eric Ries trabajó en startups que fracasaron después de años de desarrollo, millones de dólares gastados, y equipos enteros comprometidos — todo para lanzar productos que nadie quería. Esta experiencia lo llevó a desarrollar el Método Lean Startup.

El desperdicio más grande en la historia del emprendimiento no es el dinero — es el tiempo y el esfuerzo humano gastados en construir cosas que nadie quería. Ries calculó que la mayoría de las startups fallan no porque las personas sean incompetentes sino porque construyeron el producto equivocado con el nivel correcto de competencia.

La suposición más peligrosa: "Sé lo que los clientes quieren". La mayoría de los emprendedores comienzan con una visión sobre un producto que asumen que el mercado necesita. Desarrollan ese producto durante meses o años, luego lo lanzan y descubren que las suposiciones eran incorrectas. El Lean Startup propone validar esas suposiciones con el menor esfuerzo posible.

La diferencia entre aprendizaje y ilusión de aprendizaje: muchos emprendedores confunden actividad con progreso. Trabajar 80 horas semanales construyendo un producto que nadie quería no fue aprendizaje — fue trabajo desperdiciado. El aprendizaje real en el Lean Startup es el aprendizaje validado: cambios en el comportamiento real de clientes reales que confirman o refutan suposiciones.

El ciclo de Construir-Medir-Aprender: el corazón del método. En lugar del ciclo tradicional (planificar extensamente, construir completamente, lanzar y esperar), Ries propone un ciclo lo más corto posible: construir un experimento mínimo, medir qué sucede con usuarios reales, aprender de esa medición, y repetir.''',
      ),
      CapituloResumen(
        titulo: 'El Producto Mínimo Viable',
        emoji: '🧪',
        contenido: '''El Producto Mínimo Viable (MVP, por sus siglas en inglés) es una de las ideas más malentendidas y más poderosas del mundo de las startups. No es el producto con las características mínimas — es el experimento mínimo que te permite aprender la cosa más importante sobre tu negocio lo más rápido posible.

El MVP de Zappos: antes de construir nada, el fundador tomó fotografías de zapatos en tiendas locales, las publicó en un sitio web simple, y esperó a ver si alguien compraba. Cuando alguien hacía un pedido, él iba a la tienda, compraba el par, y lo enviaba. ¿Quería hacer esto escalonado? No. ¿Aprendió si había demanda real? Absolutamente.

El MVP de Dropbox: en lugar de construir el software (que era técnicamente muy complejo y tomaría meses), el fundador grabó un video de 3 minutos mostrando cómo el producto funcionaría. La lista de espera de personas que querían el producto fue la validación que necesitaban para seguir invirtiendo en el desarrollo.

La trampa del perfeccionismo: muchos emprendedores no lanzan su MVP porque "todavía no está listo". El MVP siempre incomoda porque muestra el producto en estado rudimentario. Pero ese incomodidad es la señal de que es suficientemente mínimo. Si el MVP no te avergüenza un poco, lanzaste demasiado tarde.

El tipo de aprendizaje del MVP: no buscas solo saber si a la gente "le gusta" (las encuestas de opinión son poco confiables). Buscas saber si hacen algo específico — si se registran, si pagan, si regresan, si recomiendan. El comportamiento real es incomparablemente más valioso que la opinión expresada.''',
      ),
      CapituloResumen(
        titulo: 'Pivotar o Perseverar',
        emoji: '🔀',
        contenido: '''Una de las contribuciones más importantes del Lean Startup es un framework para tomar la decisión más difícil del emprendimiento: pivotar (cambiar la dirección) o perseverar (seguir con la apuesta actual). Esta decisión se toma frecuentemente con información insuficiente o basada en emociones en lugar de datos.

Un pivote no es un fracaso — es un cambio de estrategia basado en evidencia validada. Instagram comenzó como Burbn, una aplicación para el check-in en lugares con elementos de juego. El equipo observó que los usuarios solo usaban la función de fotos. Pivotaron. Se convirtieron en la aplicación de fotos más popular de la historia.

Los síntomas de que un pivote puede ser necesario: los indicadores de crecimiento no mejoran a pesar del esfuerzo creciente, los usuarios retienen pero no recomiendan, el producto cambia continuamente pero sin mejorar las métricas clave. Estos síntomas indican que la estrategia actual no está funcionando aunque el equipo esté trabajando duro.

Los tipos de pivote que Ries identifica: pivote de zoom-in (una característica se convierte en el producto completo), pivote de zoom-out (el producto se convierte en una característica de algo más grande), pivote de segmento de cliente (misma solución para un tipo diferente de cliente), pivote de canal (la misma solución distribuida de una manera diferente).

La trampa de pivotear demasiado pronto: el impulso humano es de moverse cuando algo se siente difícil. Pero las métricas a veces necesitan tiempo para madurar. Ries propone establecer hitos específicos — "si no alcanzamos X usuarios activos en Y semanas, consideraremos pivotar" — antes de comenzar, para no pivotar desde el pánico sino desde los datos.''',
      ),
      CapituloResumen(
        titulo: 'Las Métricas que Importan',
        emoji: '📊',
        contenido: '''El Lean Startup hace una distinción crucial entre métricas vanidosas y métricas accionables. Las métricas vanidosas son números que se ven bien en las presentaciones pero que no informan decisiones útiles. Las métricas accionables son números que, cuando cambian, te dicen exactamente qué cambió y qué puedes hacer al respecto.

Métricas vanidosas: usuarios registrados totales (no te dice cuántos están activos), páginas vistas (no te dice si el contenido es valioso), "likes" o seguidores en redes sociales (no te dice si la gente compra), PR en medios (no te dice si el negocio crece). Todas estas métricas pueden subir mientras el negocio se deteriora.

Métricas accionables: tasa de retención (el porcentaje de usuarios que regresa después de la primera visita), el valor de vida del cliente (cuánto dinero produce un cliente a lo largo de la relación), el costo de adquisición (cuánto cuesta conseguir cada cliente nuevo), la tasa de referidos (qué porcentaje de nuevos usuarios vienen de recomendaciones).

La contabilidad de la innovación: Ries propone un sistema diferente de rendición de cuentas para startups. En lugar de medir el progreso contra el plan original (que era basado en suposiciones no validadas), mide el progreso contra las hipótesis actuales más informadas. Esto permite saber si estás aprendiendo y adaptándote — que es el trabajo real de una startup.

El tablero de cohort: en lugar de medir métricas en total (todos los usuarios desde el lanzamiento), mide cada "cohorte" de usuarios por separado — los que se unieron en el mes 1, los del mes 2, etc. Esto revela tendencias que el total oculta: si las cohortes más recientes retienen mejor, algo mejoró. Si retienen peor, algo empeoró.''',
      ),
      CapituloResumen(
        titulo: 'Crecer de Manera Sostenible',
        emoji: '🌱',
        contenido: '''El crecimiento sostenible es el que viene de clientes genuinamente satisfechos que atraen a más clientes — no de campañas de marketing costosas que traen usuarios que luego se van.

Los tres motores del crecimiento: 1) El motor pegajoso (retención: los usuarios que se quedan generan crecimiento a través del tiempo). 2) El motor viral (los usuarios que recomiendan a otros). 3) El motor de pago (el modelo de negocio donde el dinero generado se reinvierte para adquirir más clientes).

La trampa del crecimiento artificial: muchas startups crecen rápidamente a través de marketing agresivo, incentivos de registro o viral loops poco orgánicos. Este crecimiento se ve bien en el tablero pero enmascara el problema fundamental: la mayoría de los usuarios no encuentran valor real y no regresan. Cuando el marketing se detiene, el negocio se contrae.

El crecimiento que importa: la tasa de retención mes a mes. Si el 40% de los usuarios del mes 1 siguen activos en el mes 6, el negocio tiene algo que la gente valora genuinamente. Si menos del 10% sigue activo en el mes 6, el marketing puede traer muchos usuarios pero el negocio está perdiendo agua más rápido de lo que puede llenar el cubo.

El Lean Startup como práctica permanente: Ries no propone el Lean Startup solo para startups pequeñas. Las grandes corporaciones que dejan de aprender y adaptarse mueren — más lentamente que las startups, pero igualmente. Las organizaciones que institucionalicen el ciclo Construir-Medir-Aprender pueden mantener la agilidad de una startup con la escala de una corporación.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es el ciclo fundamental del Método Lean Startup?',
        opciones: [
          'Planear-Ejecutar-Revisar-Ajustar',
          'Idea-Producto-Lanzamiento-Marketing',
          'Construir-Medir-Aprender — lo más rápido posible para validar suposiciones',
          'Investigar-Diseñar-Prototipar-Lanzar',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! El ciclo Construir-Medir-Aprender es el corazón del método. En lugar de construir todo antes de aprender nada, construyes el mínimo necesario para aprender algo específico, mides, aprendes, y repites.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es realmente un "Producto Mínimo Viable" (MVP)?',
        opciones: [
          'El producto con las características mínimas para lanzarse al mercado',
          'El experimento mínimo que te permite aprender la cosa más importante sobre tu negocio lo más rápido posible',
          'Una versión beta limitada para un grupo selecto de usuarios tempranos',
          'El producto con el menor costo de producción posible para maximizar márgenes',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Esta es la malinterpretación más común. MVP no es sobre mínimas características — es sobre máximo aprendizaje con mínimo esfuerzo. El MVP de Zappos era ir a comprar zapatos físicamente cuando alguien ordenaba — no escalable, pero enormemente informativo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo validó Dropbox la demanda de su producto antes de construirlo?',
        opciones: [
          'Lanzó una versión simplificada del software a un grupo de 100 usuarios beta',
          'Realizó encuestas masivas sobre las necesidades de almacenamiento de archivos en la nube',
          'Grabó un video de 3 minutos mostrando cómo funcionaría el producto — la lista de espera resultante fue la validación',
          'Ofreció el servicio manualmente a los primeros clientes antes de automatizarlo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Antes de invertir meses en construir software técnicamente complejo, un video que muestra cómo funcionaría fue suficiente para medir si había demanda real. Lista de espera = validación. Cero interés = pivote necesario.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es un "pivote" según Ries y cómo se diferencia de un fracaso?',
        opciones: [
          'Un cambio de equipo directivo cuando la estrategia no funciona',
          'Un pivote es un cambio de estrategia basado en evidencia validada — no un fracaso sino aprendizaje aplicado',
          'Abandonar el mercado actual para entrar en uno completamente diferente',
          'Una reducción de costos y alcance cuando los recursos se agotan',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Instagram comenzó como Burbn (check-in con juego). Pivotaron al ver que los usuarios solo usaban las fotos. El pivote no fue fracaso — fue aprendizaje que produjo la app de fotos más exitosa de la historia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué son las "métricas vanidosas" que critica Ries?',
        opciones: [
          'Métricas que solo miden el ego del fundador sin valor real',
          'Números que se ven bien en presentaciones pero no informan decisiones — usuarios registrados totales, páginas vistas, likes en redes sociales',
          'Métricas financieras que priorizan la rentabilidad sobre el crecimiento',
          'Indicadores de calidad del producto que no reflejan la experiencia del usuario',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Usuarios registrados totales pueden subir mientras el negocio se deteriora si los usuarios no son activos. Páginas vistas pueden crecer mientras la conversión cae. Estas métricas se ven bien pero no dicen nada útil.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué el MVP siempre debería "avergonzarte un poco" según Ries?',
        opciones: [
          'Porque si el MVP avergüenza, motiva al equipo a mejorar el producto más rápido',
          'Porque la incomodidad de mostrar algo rudimentario es la señal de que es suficientemente mínimo — si no avergüenza, lanzaste demasiado tarde',
          'Porque los inversores valoran la humildad y la honestidad sobre el estado real del producto',
          'Porque la vergüenza del MVP protege de las expectativas excesivas de los primeros usuarios',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El MVP debe incomodar porque muestra el producto en estado rudimentario. Si el MVP no te avergüenza, es porque construiste demasiado antes de validar — y ese trabajo extra puede haber sido desperdiciado si las suposiciones eran incorrectas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los tres motores del crecimiento sostenible según Ries?',
        opciones: [
          'Producto, marketing y distribución',
          'Pegajoso (retención), viral (recomendaciones) y de pago (reinversión de ingresos en adquisición)',
          'Orgánico, paid y earned media',
          'B2B, B2C y marketplace',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Motor pegajoso: los usuarios que se quedan. Motor viral: los que recomiendan. Motor de pago: los ingresos que permiten adquirir más usuarios. Cada motor tiene sus métricas específicas y sus límites.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Ries considera el crecimiento artificial a través de marketing agresivo una trampa?',
        opciones: [
          'Porque es costoso y reduce la rentabilidad de la empresa',
          'Porque enmascara el problema fundamental: usuarios que no encuentran valor real y no regresan — cuando el marketing se detiene, el negocio se contrae',
          'Porque crea expectativas en los inversores que son difíciles de mantener',
          'Porque los usuarios adquiridos a través de publicidad son menos leales que los orgánicos',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El crecimiento que importa es la retención. Si el 90% de los usuarios no regresa después del mes 1, el marketing puede llenar el cubo continuamente pero siempre estará perdiendo agua más rápido.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "contabilidad de la innovación" que propone Ries?',
        opciones: [
          'Un sistema contable especializado para startups que capitaliza los gastos de I+D',
          'Medir el progreso contra las hipótesis actuales más informadas — no contra el plan original basado en suposiciones no validadas',
          'Un marco para evaluar el retorno de las inversiones en innovación tecnológica',
          'La metodología para valuar startups en etapas tempranas antes de tener ingresos',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El plan original estaba basado en suposiciones no validadas. Medirte contra ese plan es irrelevante. La contabilidad de la innovación mide si estás aprendiendo y adaptándote — que es el trabajo real de una startup.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mayor desperdicio que identifica Ries en el emprendimiento tradicional?',
        opciones: [
          'El dinero gastado en campañas de marketing que no convierten',
          'El tiempo perdido en procesos burocráticos internos que retrasan el desarrollo',
          'El tiempo y esfuerzo humano gastados en construir cosas que nadie quería — con el nivel correcto de competencia aplicado al producto equivocado',
          'Las oportunidades de mercado que pasan de largo porque la startup tarda demasiado en lanzar',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! El mayor desperdicio no es el dinero — es el capital humano aplicado a construir algo que nadie necesitaba. Equipos talentosos trabajando con dedicación total en el problema equivocado es la tragedia más común del emprendimiento.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 9 — La E Mítica Revisada
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp09',
    titulo: 'La E Mítica Revisada',
    autor: 'Michael E. Gerber',
    anio: '1995',
    emoji: '⚙️',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'El libro de negocios más vendido de todos los tiempos: el técnico exitoso que abre su propio negocio y se convierte en esclavo de él — y cómo construir un negocio que funcione sin depender de ti.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Mito del Empresario',
        emoji: '🧨',
        contenido: '''Michael Gerber comienza con una revelación incómoda: la mayoría de las personas que abren negocios no son empresarios — son técnicos que sufrieron un "ataque emprendedor". Un gran cocinero abre un restaurante. Un buen mecánico abre un taller. Una excelente estilista abre un salón de belleza.

El problema: ser buena en algo técnico y saber cómo construir un negocio que hace esa cosa técnica son habilidades completamente diferentes. El cocinero que abre un restaurante descubre que pasará el 80% de su tiempo haciendo contabilidad, gestionando personal, manejando proveedores, resolviendo problemas — y tal vez el 20% cocinando.

La trampa del técnico: en lugar de construir un negocio que hace el trabajo técnico, el técnico literalmente se convierte en un empleado de sí mismo — con el peor jefe del mundo (él mismo), sin vacaciones, sin beneficios, sin límites de horario. La "libertad" del negocio propio se convierte en la esclavitud más completa.

La E Mítica es la fantasía de que cualquier persona con pasión y técnica puede construir un negocio exitoso. Gerber propone que ser empresario genuino requiere tres personalidades que pocas personas tienen desarrolladas simultáneamente: el Emprendedor (el visionario), el Gerente (el administrador) y el Técnico (quien hace el trabajo). La mayoría de los propietarios de pequeños negocios son casi 100% Técnico.

El resultado estadístico: el 80% de los negocios pequeños cierra en los primeros 5 años. De los que sobreviven el primer ciclo, el 80% cierra en los siguientes 5. No por falta de talento técnico — por falta de las habilidades de negocio que nadie enseñó.''',
      ),
      CapituloResumen(
        titulo: 'Las Tres Personalidades del Negocio',
        emoji: '🎭',
        contenido: '''Gerber propone que todo propietario de negocio tiene tres personalidades internas en guerra: el Emprendedor, el Gerente y el Técnico. El desequilibrio entre estas tres produce los problemas más comunes de los negocios pequeños.

El Emprendedor es el visionario: vive en el futuro, lleno de ideas y posibilidades. Cada problema es una oportunidad. Cada conversación produce nuevas ideas. La visión del emprendedor es lo que nació el negocio. Sin emprendedor, no hay iniciativa ni innovación.

El Gerente es el administrador: vive en el pasado, creando orden en el caos producido por el emprendedor. Necesita planificación, organización, sistemas, controles. Sin gerente, el negocio es caos creativo que nunca escala.

El Técnico es quien hace el trabajo: vive en el presente, enfocado en hacer la tarea concreta. Desconfía de la visión del emprendedor ("suena bien pero quién lo va a hacer") y de los sistemas del gerente ("demasiado burocrático, solo quiero hacer mi trabajo"). Sin técnico, nada se produce.

El problema de la mayoría de los dueños de pequeños negocios: son 70% Técnico, 20% Gerente y 10% Emprendedor. Hacen el trabajo técnico, administran lo mínimo necesario, y casi nunca piensan estratégicamente sobre el negocio. El negocio nunca puede crecer porque el dueño es el cuello de botella de todo.

El objetivo de Gerber: desarrollar las tres personalidades en equilibrio, pero especialmente fortalecer la perspectiva emprendedora que es la que permite construir un negocio que funcione independientemente de ti.''',
      ),
      CapituloResumen(
        titulo: 'El Negocio como Franquicia',
        emoji: '🏪',
        contenido: '''La solución central del libro: pensar en tu negocio como si fuera una franquicia, aunque nunca tengas intención de franquiciarlo. La pregunta que guía todo el libro: "¿Cómo puedo construir un negocio donde el resultado no dependa de mí?"

El modelo McDonald's: Ray Kroc no era el mejor cocinero de hamburguesas del mundo. Pero construyó el mejor sistema para hacer hamburguesas consistentemente en miles de ubicaciones simultáneamente con empleados adolescentes. La hamburguesa de McDonald's es exactamente igual en Ciudad de México que en Tokio. Eso es un sistema.

El prototipo de franquicia: documentar cada proceso del negocio de manera que cualquier persona razonablemente competente pueda ejecutarlo correctamente siguiendo el sistema. Esto no significa hacer el trabajo robótico ni sin personalidad — significa que la excelencia del servicio no depende del estado de ánimo o del talento individual de quien lo ejecuta ese día.

Los sistemas permiten escalar: sin sistemas, el negocio solo puede crecer hasta donde el dueño puede llegar. Con sistemas, puede replicarse indefinidamente. La pregunta que Gerber plantea: si mañana necesitas duplicar tu negocio, ¿tienes documentado cómo funciona cada proceso? Si la respuesta es no, el negocio no puede escalar.

El manual de operaciones: Gerber propone que cada pequeño negocio tenga un manual que documente cada proceso — desde cómo se responde el teléfono hasta cómo se resuelven las quejas, desde cómo se onboardea un nuevo empleado hasta cómo se hace el cierre mensual. Este manual es el activo más valioso del negocio.''',
      ),
      CapituloResumen(
        titulo: 'El Desarrollo del Negocio',
        emoji: '📈',
        contenido: '''Gerber identifica tres fases en el desarrollo de cualquier negocio: Infancia, Adolescencia y Madurez. Cada fase tiene sus características, sus crisis típicas, y sus soluciones.

La Infancia: el dueño ES el negocio. El trabajo es el dueño y el dueño es el trabajo. Esta fase es sostenible temporalmente — el entusiasmo del inicio compensa el agotamiento. El fin de la infancia llega cuando el trabajo sobrepasa la capacidad del dueño y hay una crisis de gestión.

La Adolescencia: el dueño contrata personas para que hagan el trabajo que él no puede hacer solo. El problema: sin sistemas, el dueño delega el trabajo pero no el método. El resultado es inconsistencia — cada empleado hace el trabajo a su manera, la calidad varía, las queja aumentan, el dueño microgestiona agotado. La salida es o la muerte del negocio o el regreso a la infancia (el dueño hace todo de nuevo).

La Madurez: el negocio funciona con sistemas independientes del propietario. El dueño trabajó en el negocio para crear los sistemas que permiten que el negocio funcione sin él. No significa que el dueño no trabaja — significa que el trabajo del dueño es el negocio como sistema, no las tareas técnicas.

La transición de Adolescencia a Madurez es la más difícil: requiere que el dueño deje de hacer el trabajo técnico que le encanta y en el que es bueno, y empiece a trabajar en construir los sistemas que permitan a otros hacerlo. Esta transición requiere un cambio de identidad — de Técnico a Emprendedor/Gerente.''',
      ),
      CapituloResumen(
        titulo: 'El Negocio que Trabaja para Ti',
        emoji: '🔑',
        contenido: '''La pregunta fundamental que Gerber propone como brújula: ¿Estás trabajando PARA tu negocio o está tu negocio trabajando PARA ti? La mayoría de los propietarios de pequeños negocios trabajan para su negocio — son sus empleados más comprometidos y peor pagados.

El propósito del negocio no es el trabajo técnico — es crear valor para los clientes de una manera que no requiera que tú estés presente en cada transacción. Si tu negocio solo funciona cuando estás físicamente presente haciendo el trabajo, tienes un trabajo, no un negocio.

La visión estratégica: antes de saber qué tipo de negocio construir, necesitas saber qué tipo de vida quieres vivir. ¿Cuántas horas trabajarás? ¿Cuánto ganarás? ¿Cuándo te tomarás vacaciones? ¿Qué impacto quieres tener en tu comunidad? El negocio es un vehículo para esa vida — no al revés.

Los estándares sin sistemas son solo deseos: muchos dueños tienen estándares de calidad altos pero sin sistemas que los garanticen. El resultado: el estándar se cumple cuando el dueño está presente y se degrada cuando no lo está. Los sistemas son la forma de convertir estándares en realidad consistente.

Gerber termina con un mensaje esperanzador: no es demasiado tarde para transformar un negocio-trampa en un negocio-activo. Requiere trabajo diferente al que el propietario normalmente hace — trabajo en el negocio, no en el negocio. Pero los resultados — un negocio que crea valor sin depender del propietario en cada paso — valen cada esfuerzo invertido.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es el "ataque emprendedor" según Gerber?',
        opciones: [
          'El impulso repentino de renunciar al trabajo corporativo y lanzar un negocio sin planificación',
          'Cuando un técnico exitoso abre su propio negocio creyendo que su habilidad técnica es suficiente para hacerlo funcionar',
          'La crisis de identidad que experimentan los emprendedores en los primeros años de negocio',
          'El entusiasmo inicial que dura pocos meses antes de que la realidad del negocio llegue',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El gran cocinero abre un restaurante, el gran mecánico abre un taller. El problema: ser buena en la técnica y saber construir un negocio de esa técnica son habilidades completamente diferentes.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las tres personalidades que Gerber identifica en todo negocio?',
        opciones: [
          'Fundador, inversor y empleado',
          'Visionario, operador y financiero',
          'Emprendedor (visionario), Gerente (administrador) y Técnico (quien hace el trabajo)',
          'Creador, constructor y mantenedor',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Las tres personalidades internas en guerra. Sin Emprendedor no hay visión. Sin Gerente hay caos. Sin Técnico nada se produce. La mayoría de los dueños son 70% Técnico, lo que limita el crecimiento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Gerber propone pensar el negocio como si fuera una franquicia?',
        opciones: [
          'Para prepararse para vender franquicias como modelo de expansión',
          'Para construir sistemas que produzcan resultados consistentes sin depender del talento o estado de ánimo de individuos específicos',
          'Para atraer a inversores que confían más en modelos replicables',
          'Para reducir los costos operativos a través de la estandarización de procesos',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! McDonald\'s no necesita al mejor cocinero — necesita el mejor sistema para cocinar hamburguesas consistentemente. La franquicia es la metáfora de un negocio donde la excelencia es del sistema, no del individuo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue a un negocio de un trabajo con el propio jefe según Gerber?',
        opciones: [
          'El negocio genera más ingresos; el trabajo propio tiene menos seguridad',
          'Si el negocio solo funciona cuando estás físicamente presente haciendo el trabajo, tienes un trabajo — no un negocio',
          'El negocio tiene empleados; el trabajo propio es operado por una sola persona',
          'El negocio tiene una estrategia de crecimiento; el trabajo propio solo busca subsistir',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La pregunta definitoria: ¿puede el negocio operar sin ti? Si no puede, no tienes un negocio — tienes el trabajo más exigente del mundo con el peor jefe imaginable (tú mismo).',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la crisis típica al final de la "Infancia" del negocio?',
        opciones: [
          'La falta de capital para seguir operando sin financiamiento externo',
          'La competencia de negocios más grandes con más recursos y escala',
          'El trabajo sobrepasa la capacidad del dueño y hay una crisis de gestión — no puede hacerlo todo solo',
          'Los empleados clave dejan el negocio llevándose clientes y conocimiento',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! La Infancia termina cuando el entusiasmo ya no puede compensar el agotamiento. El trabajo sobrepasa la capacidad del dueño y debe elegir: crecer hacia la Adolescencia (contratar) o regresar a un negocio más pequeño.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué la "Adolescencia" del negocio es tan peligrosa?',
        opciones: [
          'Porque los costos de contratación superan los ingresos generados por los nuevos empleados',
          'Porque contratar sin sistemas produce inconsistencia: cada empleado hace el trabajo a su manera, la calidad varía y el dueño microgestiona agotado',
          'Porque los empleados jóvenes no tienen la experiencia necesaria para el trabajo de calidad',
          'Porque la comunicación entre el dueño y los empleados se vuelve compleja e ineficiente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Sin sistemas, el dueño delega el trabajo pero no el método. Resultado: inconsistencia, quejas, microgestión agotadora. La salida es o morir como negocio o construir los sistemas que permitan la Madurez.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué cambio de identidad requiere la transición de Adolescencia a Madurez?',
        opciones: [
          'De empleado a jefe — comenzar a delegar toda la responsabilidad en el equipo',
          'De Técnico (hacer el trabajo) a Emprendedor/Gerente (construir los sistemas que permiten a otros hacer el trabajo)',
          'De microgestor a líder estratégico que solo se enfoca en el largo plazo',
          'De dueño de un negocio a inversionista que tiene múltiples negocios',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La transición más difícil: dejar el trabajo técnico que amas y que eres buena en, para construir los sistemas que permitan a otros hacerlo. Requiere un cambio de identidad, no solo de responsabilidades.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué los "estándares sin sistemas son solo deseos" según Gerber?',
        opciones: [
          'Porque los estándares sin métricas no pueden medirse ni mejorarse',
          'El estándar se cumple cuando el dueño está presente y se degrada cuando no — sin sistema que lo garantice, la consistencia depende del individuo',
          'Porque los empleados no comprenden los estándares a menos que estén formalizados por escrito',
          'Porque los clientes perciben los estándares variables como falta de profesionalismo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Los sistemas son la forma de convertir estándares en realidad consistente. Sin ellos, la calidad fluctúa con el estado de ánimo, la presencia y el talento individual — imposible de escalar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pregunta fundamental propone Gerber como brújula del emprendimiento?',
        opciones: [
          '"¿Cuánto dinero quieres ganar con tu negocio en 5 años?"',
          '"¿Estás trabajando PARA tu negocio o está tu negocio trabajando PARA ti?"',
          '"¿Tu negocio resuelve un problema que el mercado genuinamente tiene?"',
          '"¿Tienes los sistemas y el capital para escalar cuando llegue el momento?"',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Esta pregunta revela el tipo de emprendedor que eres. Trabajar PARA el negocio = esclavo. Negocio que trabaja PARA ti = activo real. La diferencia la hacen los sistemas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el estadístico más alarmante que cita Gerber sobre los pequeños negocios?',
        opciones: [
          'El 50% de los negocios no llega a los 2 años de operación',
          'El 80% cierra en los primeros 5 años; del 20% que sobrevive, el 80% cierra en los siguientes 5',
          'Solo el 10% de los negocios fundados por técnicos llega a la etapa de madurez',
          'El 70% de los propietarios de negocios pequeños gana menos que como empleados',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El 80% en 5 años, del 20% restante otro 80% en los siguientes 5. No por falta de talento técnico — por falta de las habilidades de negocio que nadie enseñó. La E Mítica cobra su precio.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 10 — El \$100 Startup
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'emp10',
    titulo: 'El \$100 Startup',
    autor: 'Chris Guillebeau',
    anio: '2012',
    emoji: '💵',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'Guillebeau estudió 1,500 personas que construyeron negocios rentables con menos de \$100 de inversión inicial. El resultado: una guía práctica para ganar dinero haciendo lo que te apasiona — sin inversionistas ni oficinas.',
    gemasRecompensa: 58,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Intersección entre Pasión y Utilidad',
        emoji: '🎯',
        contenido: '''Chris Guillebeau entrevistó a 1,500 personas de todo el mundo que construyeron negocios con ingresos de al menos \$50,000 anuales, invirtiendo menos de \$100 de capital inicial. Lo que encontró desafió la narrativa convencional del emprendimiento: no necesitas gran capital, conexiones especiales ni un MBA para construir algo rentable.

La intersección mágica: el negocio exitoso vive donde se cruzan lo que te apasiona hacer y lo que otras personas están dispuestas a pagar. Muchas personas tienen pasiones que no saben cómo monetizar. Otras tienen habilidades que el mercado paga pero que no disfrutan. La intersección de ambas produce el negocio más sostenible.

El error de la pasión pura: "haz lo que amas y el dinero vendrá" es un consejo incompleto y potencialmente peligroso. No toda pasión tiene mercado suficiente. La pasión por coleccionar sellos postales es genuina — pero es difícil construir un negocio de \$50,000 anuales en torno a ella. La clave es la intersección con lo que otros valoran.

El error del mercado puro: encontrar lo que el mercado paga y hacerlo aunque no lo disfrutes produce un negocio rentable pero miserable. La persona que odio lo que hace trabaja con menos creatividad, menos energía y menos innovación — y eventualmente agota su ventaja sobre quienes sí lo disfrutan.

La habilidad transferible: Guillebeau descubrió que las habilidades que más monetizan en el ecosistema del startup de \$100 no son las más técnicas sino las más transferibles — enseñar a otros, conectar a personas, resolver problemas de comunicación o productividad que casi todos enfrentan.''',
      ),
      CapituloResumen(
        titulo: 'El Lanzamiento Mínimo',
        emoji: '🚀',
        contenido: '''Guillebeau propone que la mayoría de los negocios pequeños no necesitan meses de preparación — necesitan hacer una oferta a alguien que pueda comprarla. El lanzamiento mínimo ocurre cuando alguien paga por primera vez.

La estrategia de "un acuerdo de negocios es mejor que ninguno": en lugar de construir el sitio web perfecto, escribir el plan de negocios, conseguir el logo ideal — hacer una oferta concreta a alguien que crees que podría necesitar lo que ofreces. Una venta es más valiosa que todo el tiempo de preparación del mundo.

El producto de información como herramienta de inicio: cursos, ebooks, guías, consultorías. Tienen costo marginal cercano a cero, no requieren inventario físico, pueden crearse con computadora e internet. Muchas de las personas que Guillebeau estudió comenzaron con un curso en línea o un ebook sobre algo que sabían muy bien.

El precio como comunicación: Guillebeau observó que muchos emprendedores principiantes subvalúan su trabajo dramáticamente — especialmente las mujeres. Un servicio que ofrece un resultado claro y valioso (ahorrar dinero, ahorrar tiempo, crear tranquilidad de ánimo) puede cobrarse significativamente más que el costo del tiempo de quien lo ofrece.

La propuesta de valor simple: en lugar de describir lo que ofreces en términos técnicos, descríbelo en términos del problema que resuelve para el cliente. "Ayudo a dueñas de pequeños negocios a organizar sus finanzas para pagar menos impuestos" es más poderoso que "ofrezco servicios de contabilidad y consultoría fiscal".''',
      ),
      CapituloResumen(
        titulo: 'La Oferta Irresistible',
        emoji: '🎁',
        contenido: '''Guillebeau estudió qué hace que algunas ofertas generen ventas inmediatas y otras generen indiferencia. Las diferencias no estaban en la calidad del producto sino en cómo la oferta estaba enmarcada y comunicada.

Los cuatro elementos de una oferta irresistible: 1) Claridad absoluta sobre qué obtienes (sin términos vagos). 2) Un precio que parece justo o incluso una ganga para el valor recibido. 3) Una garantía que elimina el riesgo percibido del comprador. 4) Una razón para actuar ahora (escasez, descuento temporal, bono que vence).

La garantía como herramienta de ventas: muchos vendedores temen ofrecer garantías porque creen que habrá muchos pedidos de devolución. La realidad: las garantías bien diseñadas aumentan las ventas mucho más de lo que aumentan las devoluciones. El cliente que sabe que puede devolver si no está satisfecho compra con menos miedo — y quien compra con menos miedo rara vez pide devolución.

La urgencia genuina vs. la urgencia fabricada: la urgencia funciona cuando es real (solo quedan 5 lugares en el curso, el precio sube mañana porque es el lanzamiento). La urgencia fabricada (cuenta regresiva que se reinicia, escasez falsa) erosiona la confianza cuando el cliente la descubre — y siempre lo descubren.

El testimonio como prueba social: las personas toman decisiones de compra basadas en lo que otras personas como ellas hicieron. Un testimonio de alguien con el mismo perfil que el cliente potencial es más persuasivo que diez testimonios de personas sin relación. Guillebeau propone solicitar testimonios específicos: no "fue genial" sino "antes de trabajar con X tenía este problema; después de trabajar con X logré este resultado específico".''',
      ),
      CapituloResumen(
        titulo: 'Hacer Crecer el Negocio sin Capital',
        emoji: '📈',
        contenido: '''Las estrategias de crecimiento que Guillebeau observó en los 1,500 negocios estudiados tenían algo en común: casi todas se basaban en relaciones y valor genuino, no en publicidad pagada.

El contenido como marketing: crear artículos, videos, podcasts, o publicaciones que demuestren genuinamente el expertise — sin pedir nada a cambio. Esta estrategia construye confianza con posibles clientes antes de que hayan comprado. Cuando deciden comprar, ya confían en ti.

Las asociaciones estratégicas: encontrar personas que ya tienen acceso a tu cliente ideal y proponer una relación de beneficio mutuo. Una consultora financiera puede asociarse con un abogado que trabaja con el mismo cliente. El abogado refiere clientes a la consultora y viceversa. Costo: cero. Alcance: multiplicado.

El marketing por correo electrónico: Guillebeau observó que la lista de correo electrónico propio era el activo de marketing más valioso en prácticamente todos los negocios estudiados. A diferencia de los seguidores en redes sociales (que el algoritmo puede esconder), una lista de email es tuya. Una lista de 500 personas comprometidas puede sostener un negocio de \$50,000+.

La economía de los servicios premium: muchos emprendedores buscan volumen — muchos clientes pagando poco. Guillebeau observó que el modelo más sostenible frecuentemente es pocos clientes pagando bien. Diez clientes a \$5,000 anuales es más sostenible (y más satisfactorio) que 500 clientes a \$100 anuales.''',
      ),
      CapituloResumen(
        titulo: 'La Vida que Quieres Vivir',
        emoji: '🌅',
        contenido: '''Guillebeau termina el libro con el recordatorio más importante: el negocio es un medio, no un fin. La pregunta que debe guiar todas las decisiones no es "¿cómo crezco el negocio?" sino "¿qué tipo de vida quiero vivir y cómo puede el negocio apoyar esa vida?".

La libertad como métrica: la mayoría de los emprendedores que Guillebeau estudió no comenzaron sus negocios para hacerse ricos — comenzaron para tener libertad. Libertad de horarios, libertad geográfica, libertad para trabajar en lo que les importa, libertad de no tener un jefe. La métrica del éxito no era siempre el ingreso — era la calidad de vida.

El negocio "suficiente": muchas personas buscan escalar indefinidamente cuando ya tienen un negocio que funciona bien. Guillebeau introduce el concepto del negocio "suficiente" — uno que produce el ingreso necesario para la vida que deseas sin requerir más atención de la que estás dispuesta a dar. No todo negocio necesita crecer hasta ser una corporación.

La diversificación de ingresos: los negocios más resilientes que estudió Guillebeau tenían múltiples fuentes de ingreso relacionadas. Un escritor que también da talleres, también vende cursos online, también tiene un programa de membresía. Ninguna fuente individual representa más del 50% del ingreso total.

El consejo final: comienza antes de estar lista. No cuando tengas el logo perfecto, el sitio web ideal, la oferta completamente pulida. Haz una oferta a alguien que podría necesitar lo que ofreces. Si dice que sí, tienes un negocio. Si dice que no, tienes información. En ambos casos, estás avanzando.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué estudió Guillebeau para escribir El \$100 Startup?',
        opciones: [
          'Las estrategias de las 500 empresas más grandes de Fortune en sus etapas iniciales',
          '1,500 personas que construyeron negocios rentables con menos de \$100 de inversión inicial',
          'Los errores más comunes de startups que fracasaron en los primeros dos años',
          'Los modelos de negocio más rentables en el ecosistema digital',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! 1,500 casos reales de negocios con ingresos de al menos \$50,000 anuales construidos con menos de \$100. No teoría — evidencia real de que el capital no es el obstáculo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la "intersección mágica" que busca Guillebeau?',
        opciones: [
          'Donde se cruzan la pasión por el trabajo y la habilidad técnica en ese trabajo',
          'Donde se cruzan lo que te apasiona hacer y lo que otras personas están dispuestas a pagar',
          'Donde se cruzan el bajo costo de producción y el alto precio de venta',
          'Donde se cruzan la demanda del mercado y tu acceso a los canales de distribución',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Pasión sin mercado = hobby. Mercado sin pasión = trabajo miserable. La intersección de ambas produce el negocio más sostenible: haces algo que disfrutas y que otros valoran suficientemente para pagarlo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo ocurre el "lanzamiento mínimo" según Guillebeau?',
        opciones: [
          'Cuando el sitio web del negocio está publicado y operativo',
          'Cuando el primer producto o servicio está completamente terminado y listo',
          'Cuando alguien paga por primera vez — una venta es más valiosa que todo el tiempo de preparación',
          'Cuando el negocio está registrado legalmente y tiene todos los permisos necesarios',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! El negocio comienza con la primera venta, no con el plan de negocio perfecto. Una oferta concreta a alguien que pueda necesitar lo que ofreces es más poderosa que semanas de preparación sin cliente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los cuatro elementos de una "oferta irresistible" según Guillebeau?',
        opciones: [
          'Precio bajo, entrega rápida, calidad alta y servicio al cliente excepcional',
          'Claridad total sobre qué obtienes, precio justo, garantía que elimina el riesgo, y razón para actuar ahora',
          'Diseño atractivo, testimonios, descripción técnica y precio competitivo',
          'Marca reconocida, distribución amplia, precio accesible y publicidad masiva',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Claridad (sin términos vagos), precio justo para el valor, garantía (elimina el miedo al riesgo), urgencia genuina (razón para actuar ahora). Estos cuatro elementos transforman el interés en decisión de compra.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Guillebeau dice que las garantías aumentan las ventas más que las devoluciones?',
        opciones: [
          'Porque legalmente limitan la responsabilidad del vendedor ante productos defectuosos',
          'El cliente que sabe que puede devolver compra con menos miedo — y quien compra con menos miedo rara vez pide devolución',
          'Porque crean la percepción de alta calidad que justifica precios premium',
          'Porque las personas que piden devoluciones son una minoría estadísticamente insignificante',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La garantía elimina el riesgo percibido de la compra. Con menos miedo, más personas compran. Y quien compra con confianza, convencida de que lo que compra funcionará, raramente necesita devolverlo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el "activo de marketing más valioso" que observó Guillebeau?',
        opciones: [
          'Los seguidores en redes sociales por la amplificación viral que permiten',
          'Las relaciones con medios de comunicación que generan cobertura gratuita',
          'La lista propia de correo electrónico — a diferencia de las redes sociales, es tuya y ningún algoritmo puede esconderla',
          'Las reseñas positivas en plataformas de terceros como Google o Amazon',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Los seguidores en redes sociales pueden desaparecer por cambios de algoritmo. La lista de email propia es un activo real. Una lista de 500 personas comprometidas puede sostener un negocio de \$50,000+ anuales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el modelo que Guillebeau llama más sostenible para los emprendedores independientes?',
        opciones: [
          'Muchos clientes pagando poco para diversificar el riesgo',
          'Pocos clientes pagando bien — diez a \$5,000 es más sostenible que 500 a \$100',
          'Un solo cliente grande con contrato de largo plazo para garantizar estabilidad',
          'Equilibrio entre clientes pequeños y grandes para maximizar el alcance total',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Diez clientes a \$5,000 anuales requiere gestionar 10 relaciones. 500 clientes a \$100 requiere gestionar 500 relaciones. El trabajo es incomparablemente menor en el primer modelo con el mismo ingreso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el negocio "suficiente" según Guillebeau?',
        opciones: [
          'Un negocio que apenas cubre los gastos operativos pero no genera pérdidas',
          'Uno que produce el ingreso para la vida que deseas sin requerir más atención de la que estás dispuesta a dar — sin necesidad de escalar indefinidamente',
          'Un negocio en su estado mínimo viable antes de añadir características y servicios adicionales',
          'El tamaño óptimo de negocio para una sola persona sin empleados',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! No todo negocio necesita convertirse en corporación. El negocio suficiente produce la vida que quieres. Más allá de eso, el crecimiento puede crear complejidad sin añadir calidad de vida real.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Guillebeau dice que muchos emprendedores subvalúan su trabajo dramáticamente?',
        opciones: [
          'Porque la competencia de precios bajos en internet ha deprimido los precios globalmente',
          'Porque no saben cómo calcular correctamente sus costos de producción y tiempo',
          'Especialmente las mujeres — no comunican en términos del valor que crean para el cliente sino del tiempo que invierten',
          'Porque temen perder clientes si cobran el precio que realmente refleja su valor',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! El precio debe comunicar el valor al cliente, no el costo de quien lo produce. "Te ahorro \$3,000 en impuestos" vale mucho más que "invierto 5 horas en tus impuestos a \$50 la hora".',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el consejo final más práctico de Guillebeau?',
        opciones: [
          'Estudiar el mercado exhaustivamente antes de hacer cualquier movimiento',
          'Encontrar un socio que complemente tus habilidades antes de lanzar',
          'Comienza antes de estar lista — haz una oferta a alguien. Si dice que sí tienes un negocio; si dice que no, tienes información',
          'Construye primero un fondo de emergencia de 6 meses antes de emprender',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! La preparación perfecta es la trampa más común. Una oferta a un potencial cliente te dice más que semanas de investigación. Sí = negocio. No = información sobre qué ajustar. En ambos casos estás avanzando.',
      ),
    ],
  ),

  Libro(
    id: 'emp11',
    titulo: 'Lo Difícil de las Cosas Difíciles',
    autor: 'Ben Horowitz',
    anio: '2014',
    emoji: '⚔️',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'El cofundador de Andreessen Horowitz comparte las lecciones más duras del liderazgo en startups: cómo sobrevivir cuando todo sale mal y seguir construyendo de todas formas.',
    gemasRecompensa: 46,
    capitulos: [
      const CapituloResumen(
        titulo: 'La Lucha: Cuando Todo Sale Mal',
        emoji: '🔥',
        contenido: '''
Ben Horowitz no escribió un libro de gestión empresarial convencional. Escribió un libro de guerra. Y la guerra que describe —construir y dirigir una startup— es tan brutal que la mayoría de los libros de negocios ni siquiera se atreven a mencionarla honestamente.

La Lucha (The Struggle) es el estado mental que todo CEO de startup conoce: cuando los inversores no quieren invertir más, cuando los empleados clave se van, cuando el producto no funciona, cuando tienes nómina que pagar y no tienes el dinero. Horowitz no dice que la Lucha se puede evitar. Dice que es parte inevitable del proceso de construir algo que no existía antes.

Lo que distingue a Horowitz de otros autores es la ausencia total de platitudes. No hay "piensa positivo" ni "visualiza el éxito". Hay soluciones concretas a problemas concretos, extraídas de su experiencia real dirigiendo Loudcloud (después Opsware) al borde del colapso múltiples veces antes de venderla a HP por 1.6 mil millones de dólares.''',
      ),
      const CapituloResumen(
        titulo: 'Tiempo de Guerra vs. Tiempo de Paz',
        emoji: '🕊️',
        contenido: '''
Una de las distinciones más útiles del libro es la diferencia entre un CEO de tiempo de paz y un CEO de tiempo de guerra. En tiempo de paz —cuando la empresa crece, el mercado es favorable, hay recursos— el CEO debe fomentar la creatividad, delegar, construir cultura. En tiempo de guerra —cuando la supervivencia misma está en juego— el CEO necesita romper protocolos, tomar decisiones unilaterales rápidas, y sacrificar lo bueno por lo urgente.

El error más común es aplicar tácticas de tiempo de paz en tiempo de guerra, o viceversa. Un CEO que delega y busca consenso cuando la empresa está a dos semanas de quedarse sin caja está cometiendo un error fatal. Pero un CEO que dirige con urgencia y control total cuando la empresa está prosperando ahogará la innovación y perderá a sus mejores personas.

Horowitz da ejemplos concretos de cuándo cambiar de modo: cuando un competidor lanza un producto que amenaza tu mercado principal (tiempo de guerra), cuando estás creciendo 20% mensual y el mayor reto es contratar bien (tiempo de paz). Reconocer en qué tiempo vives es la primera habilidad del CEO.''',
      ),
      const CapituloResumen(
        titulo: 'Contratación, Despidos y la Honestidad Radical',
        emoji: '👥',
        contenido: '''
Los capítulos sobre gestión de personas son los más prácticos del libro. Horowitz es brutalmente honesto sobre los errores que cometió: contratar a personas que parecían brillantes pero no podían ejecutar en el ambiente caótico de una startup, no despedir rápido cuando era obvio que alguien no encajaba, evitar conversaciones difíciles esperando que los problemas se resolvieran solos.

Su consejo sobre despidos es contraintuitivo: cuando sabes que necesitas despedir a alguien, hazlo hoy. Cada día que esperas daña al equipo, daña a la persona, y daña a la empresa. La demora viene del deseo de evitar el dolor, pero ese dolor existe de todas formas —solo se concentra más tarde y con más daño colateral.

Sobre honestidad, Horowitz propone lo que llama "la trampa del amigo": los CEOs que evitan decir las malas noticias para no desmoralizar al equipo terminan creando equipos que no pueden manejar la realidad. Un equipo que conoce los problemas reales puede ayudar a resolverlos. Un equipo que solo escucha las buenas noticias está operando con información falsa.''',
      ),
      const CapituloResumen(
        titulo: 'Cultura: Lo que Haces Cuando Nadie Mira',
        emoji: '🏛️',
        contenido: '''
La cultura no se define por los valores que se ponen en la pared de la oficina. Se define por los comportamientos que la empresa tolera y premia. Si dices que valoras la honestidad pero promueves a quien evita conflictos, tu cultura real es la de evitar conflictos. Si dices que valoras la innovación pero castigas los fracasos, tu cultura real es la aversión al riesgo.

Horowitz observa que la cultura se forma en los momentos de tensión: cómo reacciona el liderazgo cuando hay una crisis, qué pasa cuando alguien da malas noticias, qué comportamientos se recompensan cuando nadie está mirando. Esos momentos son los que definen la cultura más que cualquier declaración de valores.

Su consejo para construir cultura: empieza por los comportamientos específicos que quieres ver, no por los valores abstractos que quieres tener. "Queremos innovación" es una declaración. "Si alguien trae una idea nueva, la primera respuesta del equipo no puede ser señalar por qué no va a funcionar" es una regla de comportamiento que crea cultura real.''',
      ),
      const CapituloResumen(
        titulo: 'El Arte de la Dirección en Condiciones Extremas',
        emoji: '🎯',
        contenido: '''
El capítulo final sintetiza la filosofía de Horowitz: no existe un manual para las situaciones más difíciles. Cada crisis es única, cada empresa es diferente, y los consejos genéricos fallan exactamente cuando más los necesitas. Lo que sí existe es la capacidad de desarrollar criterio a través de la experiencia y la reflexión.

Horowitz cita a Andy Grove (Intel) como su mayor influencia: la idea de que las empresas no mueren por malas decisiones únicas sino por la acumulación de pequeñas evasiones de la realidad. Cada vez que un CEO evita una conversación difícil, retrasa una decisión obvia, o acepta un rendimiento inferior porque es más cómodo que el conflicto, está haciendo un pequeño depósito en la cuenta del fracaso futuro.

El mensaje final es extrañamente esperanzador: si estás en la Lucha ahora mismo, eso significa que todavía estás luchando. Los que se rinden no luchan. Seguir adelante cuando todo dice que pares —eso es exactamente lo que se requiere para construir algo que importe.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es "La Lucha" según Ben Horowitz?',
        opciones: [
          'El proceso de levantar capital de inversores institucionales',
          'El estado mental de agotamiento total que precede al fracaso empresarial',
          'El estado inevitable de crisis que todo CEO de startup experimenta cuando la supervivencia de la empresa está en duda',
          'El conflicto entre los fundadores y el equipo de gestión profesional',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! La Lucha no es fracaso — es el proceso. Es cuando tienes nómina que pagar y no tienes el dinero. Cuando los inversores no invierten más. Horowitz lo describe como parte inevitable de construir algo que no existía antes.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo aplica el "modo tiempo de guerra" según Horowitz?',
        opciones: [
          'Cuando la empresa tiene más de 100 empleados y necesita estructura formal',
          'Siempre — un CEO debe estar siempre en modo urgencia para no perder competitividad',
          'Cuando la supervivencia de la empresa está amenazada y decisiones rápidas y unilaterales son más valiosas que el consenso',
          'Cuando hay conflictos internos que requieren intervención directa del liderazgo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! En tiempo de guerra, el consenso es un lujo que no existe. Aplicar tácticas de tiempo de paz (delegar, buscar consenso) cuando la empresa está a semanas de quebrar es el error que Horowitz vio destruir negocios.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Horowitz dice que los despidos se deben hacer "hoy"?',
        opciones: [
          'Para no darle tiempo al empleado de causar daño adicional a la empresa',
          'Porque cada día de demora daña al equipo, a la persona, y a la empresa — la demora no elimina el dolor, solo lo concentra más tarde con más daño colateral',
          'Para cumplir con las obligaciones legales de la manera más eficiente posible',
          'Porque la indecisión sobre despidos destruye la credibilidad del liderazgo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La trampa de esperar viene del deseo de evitar el dolor, pero ese dolor existe de todas formas. Mientras más esperas, más daño: el equipo nota el problema, la persona no mejora, y tú gastas energía mental evitando lo inevitable.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo se define realmente la cultura de una empresa según Horowitz?',
        opciones: [
          'Por los valores declarados en el sitio web y en la sala de reuniones',
          'Por el tipo de personas que contrata y el proceso de onboarding que aplica',
          'Por los comportamientos que la empresa tolera y premia en los momentos de tensión, no por los valores declarados',
          'Por el estilo de liderazgo del CEO y su forma de comunicarse con el equipo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Si dices que valoras la innovación pero castigas los fracasos, tu cultura real es la aversión al riesgo. La cultura es lo que haces cuando nadie mira, no lo que dices cuando todos escuchan.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es "la trampa del amigo" según Horowitz?',
        opciones: [
          'Contratar amigos personales en roles de liderazgo sin evaluar su competencia',
          'Los CEOs que evitan compartir malas noticias para no desmoralizar al equipo, creando equipos que no pueden manejar la realidad',
          'La tendencia a favorecer a empleados con quienes tienes relación personal sobre los más competentes',
          'Depender de la red de amigos para conseguir los primeros clientes en lugar de desarrollar ventas estructuradas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Un equipo que conoce los problemas reales puede ayudar a resolverlos. Un equipo que solo escucha las buenas noticias opera con información falsa — exactamente cuando más necesita información real.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué lección tomó Horowitz de Andy Grove (Intel)?',
        opciones: [
          'Que la escala es el único camino hacia la sostenibilidad empresarial a largo plazo',
          'Que las empresas no mueren por una mala decisión única, sino por la acumulación de pequeñas evasiones de la realidad',
          'Que el liderazgo tecnológico requiere una comprensión profunda de la ingeniería del producto',
          'Que los mejores CEOs son aquellos que pueden ejecutar tanto en roles técnicos como comerciales',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Cada pequeña evasión —conversación evitada, decisión retrasada, rendimiento inferior aceptado— es un depósito en la cuenta del fracaso futuro. Las empresas colapsan por mil pequeñas capitulaciones, no por un gran error.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mensaje final más importante de Horowitz sobre "La Lucha"?',
        opciones: [
          'Que los mejores emprendedores aprenden a eliminar la Lucha mediante planificación estratégica superior',
          'Que la Lucha es señal de que el modelo de negocio necesita ser pivotado inmediatamente',
          'Que si estás en la Lucha, todavía estás luchando — seguir cuando todo dice que pares es exactamente lo que requiere construir algo que importe',
          'Que la Lucha se debe compartir con inversores para obtener apoyo adicional en momentos críticos',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Horowitz no promete que la Lucha desaparecerá. Promete que quienes la atraviesan y siguen construyendo son exactamente las personas que crean las empresas que cambian el mundo.',
      ),
    ],
  ),

  Libro(
    id: 'emp12',
    titulo: 'La Prueba de Mamá',
    autor: 'Rob Fitzpatrick',
    anio: '2013',
    emoji: '👵',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'Cómo hablar con clientes y aprender si tu negocio es una buena idea cuando todos te van a mentir por educación — incluyendo tu propia mamá.',
    gemasRecompensa: 42,
    capitulos: [
      const CapituloResumen(
        titulo: 'El Gran Error en las Conversaciones con Clientes',
        emoji: '❌',
        contenido: '''
La Prueba de Mamá viene de una observación simple: si le preguntas a tu mamá si tu idea de negocio es buena, te dirá que sí porque te quiere. Ese "sí" no vale nada. Es una mentira educada, una validación falsa que muchos emprendedores acumulan hasta creer que tienen un negocio viable cuando en realidad tienen solo un conjunto de personas que no quisieron herir sus sentimientos.

Rob Fitzpatrick identificó que casi todas las conversaciones con clientes potenciales son inútiles porque hacemos las preguntas equivocadas. "¿Te gustaría una app que hiciera X?" "¿Crees que pagarías por Y?" "¿Qué te parece nuestra idea?" Estas preguntas invitan a opiniones sobre el futuro y sobre tu idea — dos cosas que las personas son incapaces de predecir honestamente.

Las opiniones sobre el futuro son inútiles porque las personas no saben lo que harán hasta que estén en la situación real. Las opiniones sobre tu idea son inútiles porque nadie quiere desanimarte. El resultado: después de 20 conversaciones con "mucho interés", lanzas el producto y nadie compra.''',
      ),
      const CapituloResumen(
        titulo: 'Las Preguntas que No Te Mienten',
        emoji: '✅',
        contenido: '''
La solución de Fitzpatrick es elegante: en lugar de preguntar sobre el futuro o sobre tu idea, pregunta sobre el pasado y sobre la vida del cliente. Las personas no pueden mentir sobre lo que ya hicieron. No pueden inventar cuánto gastaron el mes pasado ni cómo resolvieron un problema la semana pasada.

La Prueba de Mamá consiste en tres reglas: habla de su vida, no de tu idea; pregunta sobre el pasado, no sobre el futuro; escucha más, habla menos. Aplicando estas reglas, cada conversación se convierte en una sesión de inteligencia de mercado, no en una búsqueda de validación.

Ejemplo concreto: en lugar de "¿Usarías una app para gestionar tus finanzas personales?" pregunta "¿Cómo gestionas tus finanzas personales actualmente? ¿Cuánto tiempo le dedicas? ¿Qué es lo más frustrante de ese proceso?" La primera pregunta invita a un "sí" de compromiso falso. La segunda te revela si el problema es real, qué tan doloroso es, y si alguien ya está pagando por resolverlo.''',
      ),
      const CapituloResumen(
        titulo: 'Los Cumplidos y las Señales de Alerta',
        emoji: '⚠️',
        contenido: '''
Fitzpatrick enseña a leer las señales de alerta en las conversaciones. Los cumplidos son las más peligrosas: "¡Qué idea tan interesante!", "¡Definitivamente lo necesito!", "¡Me encanta!". Estas frases se sienten como validación pero no significan nada. Son el equivalente conversacional de "me llamas y quedamos" —una forma educada de decir que no están comprometidos.

Las señales reales de interés son muy diferentes: alguien te pregunta cuándo puede comprarlo, alguien te pide una demostración para mañana, alguien introduce a un colega que también necesitaría el producto, o mejor aún —alguien te da dinero ahora aunque sea pequeño. El compromiso se mide en dinero, tiempo, o acciones concretas, no en entusiasmo verbal.

Los compromisos también se pueden estructurar en la conversación: "¿Estarías dispuesta a probar esto con tu equipo el próximo mes?" es mucho más revelador que "¿Te gustaría algo así?" Si dicen que sí a la primera pregunta, tienes algo. Si solo dicen que sí a la segunda, tienes nada.''',
      ),
      const CapituloResumen(
        titulo: 'Cómo Estructurar las Conversaciones',
        emoji: '📋',
        contenido: '''
Fitzpatrick da un framework para estructurar las conversaciones de descubrimiento. Antes de cada conversación, escribe las tres cosas más importantes que necesitas aprender. No las preguntas que quieres hacer —las cosas que necesitas saber. Esa distinción fuerza claridad sobre el objetivo real de la conversación.

Durante la conversación, resiste la tentación de hablar de tu solución. Cada vez que describes tu producto estás invitando a opiniones sobre él en lugar de aprender sobre el problema. El objetivo es salir de la conversación sabiendo más sobre el problema de lo que sabías al entrar, no habiendo "vendido" tu idea a alguien que no compró nada.

Después de cada conversación, escribe las notas completas inmediatamente. La memoria es selectiva: tendemos a recordar lo que queremos escuchar y olvidar lo que contradice nuestra hipótesis. Las notas concretas —citas textuales del cliente, hechos específicos, momentos de duda o confusión— son el único antídoto contra el sesgo de confirmación.''',
      ),
      const CapituloResumen(
        titulo: 'El Momento Correcto para Mostrar Tu Idea',
        emoji: '🚀',
        contenido: '''
Fitzpatrick no dice que nunca debes hablar de tu producto —dice que el momento importa. Primero validas que el problema existe y duele lo suficiente. Luego validas que tu solución particular tiene algo que las alternativas existentes no tienen. Solo entonces tiene sentido hablar de detalles de producto y precio.

La señal de que estás listo para mostrar tu solución es cuando las conversaciones sobre el problema se vuelven repetitivas —escuchas los mismos problemas, frustraciones y soluciones actuales de múltiples personas. Eso significa que has aprendido el territorio suficientemente bien para hacer afirmaciones sobre él.

El error que Fitzpatrick observa constantemente: emprendedores que hacen demasiadas conversaciones de validación cuando ya tienen suficiente información para actuar, y emprendedores que actúan antes de tener suficiente información para validar que el problema es real. El objetivo no es hacer más conversaciones —es aprender lo que necesitas para tomar la siguiente decisión con menor incertidumbre.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Por qué las preguntas como "¿te gustaría una app que hiciera X?" son inútiles según Fitzpatrick?',
        opciones: [
          'Porque son demasiado específicas y no capturan la amplitud del mercado potencial',
          'Porque invitan a opiniones sobre el futuro y sobre tu idea — dos cosas que las personas no pueden predecir honestamente y no quieren criticar por educación',
          'Porque revelan tu idea antes de tener una patente o protección intelectual registrada',
          'Porque son preguntas cerradas que no generan suficiente información cualitativa',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Las personas no saben lo que harán en el futuro y no quieren desanimarte. El resultado es siempre un "sí" de compromiso falso que no predice ninguna compra real.',
      ),
      const PreguntaLibro(
        enunciado: '¿En qué consiste "La Prueba de Mamá"?',
        opciones: [
          'Pedirle a tu madre que pruebe el producto antes de lanzarlo al mercado general',
          'Preguntar solo a familiares y amigos para obtener feedback honesto y cercano',
          'Hablar de la vida del cliente (no de tu idea), preguntar sobre el pasado (no el futuro), y escuchar más que hablar',
          'Hacer que tu familiar más crítico evalúe tu pitch antes de presentarlo a inversores',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! Las personas no pueden mentir sobre lo que ya hicieron. Pregunta sobre el pasado y la vida del cliente — cómo resuelven el problema hoy, cuánto gastan, qué es más frustrante. Esos datos son reales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué tipo de señal indica interés REAL de un cliente potencial?',
        opciones: [
          '"¡Qué idea tan interesante! Definitivamente lo necesito"',
          '"Me encanta el concepto, estaré pendiente del lanzamiento"',
          'Preguntar cuándo puede comprarlo, pedir demostración para mañana, o darte dinero aunque sea pequeño',
          '"Se lo voy a recomendar a mis amigos cuando esté disponible"',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Los cumplidos son las señales más peligrosas — se sienten como validación pero significan nada. El compromiso real se mide en dinero, tiempo concreto, o acciones, no en entusiasmo verbal.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué debes escribir ANTES de cada conversación con clientes?',
        opciones: [
          'La lista de características del producto que quieres validar con el cliente',
          'Las tres cosas más importantes que necesitas APRENDER (no las preguntas que quieres hacer)',
          'El script completo de la conversación con preguntas y respuestas esperadas',
          'Los datos del competidor más cercano para mencionar en la conversación',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La distinción entre "qué quiero preguntar" y "qué necesito saber" fuerza claridad sobre el objetivo real. Necesitas salir de cada conversación con aprendizaje específico, no con validación general.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué debes escribir notas inmediatamente después de cada conversación?',
        opciones: [
          'Para poder compartirlas con tu equipo y tomar decisiones colectivas basadas en los datos',
          'Para cumplir con buenas prácticas de investigación de mercado que los inversores pueden auditar',
          'Porque la memoria es selectiva — tendemos a recordar lo que queremos escuchar y olvidar lo que contradice nuestra hipótesis',
          'Para poder comparar la conversación con las de otros clientes potenciales en un análisis posterior',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! El sesgo de confirmación es el mayor enemigo del descubrimiento de clientes. Las notas concretas —citas textuales, hechos específicos— son el único antídoto. Sin ellas, solo recuerdas lo que confirma lo que ya creías.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo es el momento correcto para mostrar tu solución según Fitzpatrick?',
        opciones: [
          'Al comienzo de cada conversación para obtener feedback inmediato sobre el producto',
          'Después de la primera conversación que confirme que el problema existe',
          'Cuando las conversaciones sobre el problema se vuelven repetitivas — escuchas los mismos problemas de múltiples personas — y ya conoces bien el territorio',
          'Solo después de tener un prototipo funcional que el cliente pueda probar directamente',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Primero validas que el problema existe y duele. Cuando escuchas los mismos problemas repetidamente de personas distintas, conoces el territorio suficientemente para hacer afirmaciones y mostrar tu solución.',
      ),
    ],
  ),

  Libro(
    id: 'emp13',
    titulo: 'Tracción: Cómo Cualquier Startup Puede Lograr Crecimiento Explosivo',
    autor: 'Gabriel Weinberg y Justin Mares',
    anio: '2014',
    emoji: '📈',
    categoria: CategoriaLibro.emprendedor,
    resumenCorto: 'El framework definitivo de 19 canales de tracción para conseguir clientes. La razón por la que startups con grandes productos fracasan es que no saben cómo conseguir usuarios.',
    gemasRecompensa: 44,
    capitulos: [
      const CapituloResumen(
        titulo: 'La Mitad Olvidada de Construir un Negocio',
        emoji: '🎯',
        contenido: '''
Gabriel Weinberg, fundador de DuckDuckGo, y Justin Mares, emprendedor en serie, parten de una observación que destruye la narrativa romántica del emprendimiento: "Si lo construyes, vendrán" es una mentira. Casi todas las startups que fracasan tienen un producto funcional. Fracasan porque nunca resolvieron el problema de cómo conseguir clientes.

La tracción es evidencia cuantificable de demanda de mercado: clientes pagando, usuarios activos, descargas que crecen semana a semana. Sin tracción, todo lo demás —el producto, el equipo, la visión— es especulación. Con tracción, consigues inversión, contratas talento, y construyes con información real en lugar de esperanza.

El libro nació de una pregunta: ¿hay algún canal de tracción que las startups exitosas hayan usado que las fracasadas ignoraron? La respuesta fue no — las startups exitosas usan todos los canales posibles para encontrar los que funcionan para su negocio específico. Lo que sí diferencia a las exitosas es que tienen un proceso sistemático para encontrar y explotar su canal óptimo.''',
      ),
      const CapituloResumen(
        titulo: 'El Framework Bullseye',
        emoji: '🎯',
        contenido: '''
El Framework Bullseye (Diana) es el proceso de Weinberg y Mares para identificar tu canal de tracción óptimo. Consta de tres anillos: el anillo exterior (brainstorming de los 19 canales), el anillo medio (experimentos rápidos en los más prometedores), y el centro (el canal que prueba funcionar y merece enfoque total).

El primer paso es considerar los 19 canales sin prejuicio: relaciones públicas, publicidad viral, relaciones públicas no convencionales, marketing en buscadores (SEO), publicidad en buscadores (SEM), publicidad en redes sociales y display, marketing de contenidos, email marketing, marketing de ingeniería (integraciones, APIs), marketing viral, negocios de desarrollo, ventas, programas de afiliados, plataformas existentes, ferias y eventos, conferencias offline, construcción de comunidad, y hablar en eventos.

El segundo paso es elegir tres canales del anillo medio y hacer experimentos pequeños y rápidos para obtener datos reales. ¿Cuánto cuesta adquirir un cliente por este canal? ¿Qué volumen de clientes es posible? ¿Cuánto tiempo lleva escalar? Los experimentos no tienen que ser perfectos — tienen que ser suficientemente buenos para producir señales que guíen la decisión.''',
      ),
      const CapituloResumen(
        titulo: 'Los 19 Canales: Los Más Subestimados',
        emoji: '📡',
        contenido: '''
Weinberg y Mares encontraron que los emprendedores tienden a usar los mismos dos o tres canales populares (redes sociales, publicidad) e ignoran canales que históricamente han impulsado los negocios más grandes. Algunos de los más subestimados:

Relaciones públicas no convencionales: crear noticias reales haciendo algo memorable (BetaBrand hace ropa ridícula para conseguir cobertura mediática; WePay puso un bloque de hielo con 500 dólares congelados frente al evento de PayPal). El objetivo no es la cobertura misma sino los clientes que llegan por ella.

Construcción de comunidad: crear una comunidad alrededor de un problema que tu producto resuelve. Antes de lanzar su producto, muchas startups exitosas construyeron foros, grupos, eventos —reuniendo a personas con el mismo problema. Cuando lanzaron el producto, tenían miles de usuarios comprometidos esperando.

Hablar en eventos: un CEO que habla en diez conferencias relevantes puede conseguir más clientes que seis meses de publicidad. La credibilidad que construyes hablando en persona es casi imposible de replicar con publicidad digital.''',
      ),
      const CapituloResumen(
        titulo: 'Construir Tracción Mientras Desarrollas el Producto',
        emoji: '⚡',
        contenido: '''
Uno de los errores más comunes que Weinberg y Mares observan: emprendedores que esperan hasta tener el producto perfecto para empezar a buscar clientes. Para entonces, han perdido entre seis meses y dos años de aprendizaje sobre cómo conseguir clientes — aprendizaje que habría mejorado el producto.

Su recomendación: desde el día uno, dedica la mitad del tiempo al producto y la mitad a la tracción. No esperes al lanzamiento para experimentar con canales. Crea una landing page antes de tener el producto, mide cuántas personas se registran. Escribe contenido sobre el problema que resuelves y mide el tráfico orgánico. Habla en un evento y mide cuántas personas te contactan.

La ventaja de empezar con tracción temprano es que cuando lances el producto, ya sabes qué canales funcionan para tu mercado específico. No estarás experimentando con canales el mismo día que intentas conseguir tus primeros cien clientes. Tendrás información real sobre cómo encontrar a tu cliente ideal.''',
      ),
      const CapituloResumen(
        titulo: 'El Canal Dominante y la Trampa del Éxito',
        emoji: '🏆',
        contenido: '''
Una vez que encuentras tu canal dominante —el canal que produce la mayoría de tu crecimiento a costo aceptable— la tentación es dejarte llevar por él indefinidamente. Weinberg y Mares advierten contra esto: casi todos los canales saturan eventualmente. El costo de adquisición aumenta, la efectividad disminuye, y el canal que te llevó de 0 a 1.000 clientes no te llevará de 10.000 a 100.000.

Las empresas más exitosas mantienen el proceso Bullseye activo incluso cuando tienen un canal dominante que funciona bien. Siguen experimentando con canales secundarios, buscando el próximo canal que escale. Cuando el canal actual empieza a saturarse, ya tienen el siguiente funcionando.

El mensaje final del libro es pragmático: la tracción es trabajo, no magia. Es experimentar sistemáticamente, medir honestamente, y escalar lo que funciona. Las startups que crecen no tienen mejor producto que las que fracasan —tienen mejor proceso para encontrar y explotar sus canales de crecimiento.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Por qué fracasan la mayoría de startups según Weinberg y Mares?',
        opciones: [
          'Por falta de capital suficiente para sobrevivir hasta el punto de rentabilidad',
          'Porque construyen el producto equivocado para el mercado equivocado',
          'Porque tienen un producto funcional pero nunca resolvieron el problema de cómo conseguir clientes — la tracción',
          'Por conflictos entre los fundadores que destruyen la cohesión del equipo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! "Si lo construyes, vendrán" es una mentira. Casi todos los fracasos tienen un producto que funciona. La mitad olvidada del emprendimiento — conseguir clientes — es lo que los destruye.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuántos canales de tracción identifican Weinberg y Mares en el libro?',
        opciones: [
          '7 canales principales organizados por etapa de crecimiento',
          '12 canales digitales y 5 canales offline',
          '19 canales distintos, cada uno con su propio potencial dependiendo del tipo de negocio',
          '24 canales incluyendo variantes modernas de los canales tradicionales',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Los 19 canales incluyen desde SEO y publicidad hasta construcción de comunidad, hablar en eventos y relaciones públicas no convencionales. El punto es que la mayoría de emprendedores solo usa 2-3 e ignora canales que podrían ser perfectos para su negocio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué hace el Framework Bullseye (Diana)?',
        opciones: [
          'Identifica al cliente ideal dentro de un mercado masivo para enfocar el marketing',
          'Evalúa la competencia en cada canal para determinar dónde hay menos competidores',
          'Es un proceso de tres anillos: brainstorming de los 19 canales, experimentos rápidos en los más prometedores, y enfoque total en el canal que prueba funcionar',
          'Calcula el retorno sobre inversión esperado de cada canal de marketing digital',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! El Framework Bullseye sistematiza el proceso de encontrar tu canal óptimo. Sin un proceso sistemático, los emprendedores se quedan con sus canales favoritos aunque no sean los más efectivos para su negocio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo se debe empezar a trabajar en la tracción según el libro?',
        opciones: [
          'Después del lanzamiento oficial del producto, cuando ya hay algo concreto que mostrar',
          'Desde el día uno — dedicando la mitad del tiempo al producto y la mitad a la tracción en paralelo',
          'Cuando el producto tiene al menos un 80% de las características planificadas para el MVP',
          'Cuando los inversores confirman que el mercado es suficientemente grande para justificar el esfuerzo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Esperar al lanzamiento es perder entre 6 meses y 2 años de aprendizaje. Cuando lances, ya deberías saber qué canales funcionan para tu mercado — no estar experimentando el mismo día que intentas conseguir tus primeros usuarios.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué los autores advierten contra depender del canal dominante indefinidamente?',
        opciones: [
          'Porque diversificar los canales reduce el riesgo de que los competidores copien tu estrategia de adquisición',
          'Porque casi todos los canales saturan eventualmente — el canal que te lleva de 0 a 1.000 clientes raramente te lleva de 10.000 a 100.000',
          'Porque los inversores prefieren empresas con estrategias de crecimiento diversificadas para valoraciones más altas',
          'Porque la concentración en un canal crea dependencia técnica difícil de eliminar después',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El costo de adquisición aumenta y la efectividad disminuye con el tiempo en cualquier canal. Las empresas exitosas mantienen el proceso de experimentación activo incluso cuando su canal actual funciona bien.',
      ),
    ],
  ),

];
