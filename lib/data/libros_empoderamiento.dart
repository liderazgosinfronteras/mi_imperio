// lib/data/libros_empoderamiento.dart
import '../models/libro_model.dart';

List<Libro> crearLibrosEmpoderamiento() => [

  // ══════════════════════════════════════════════════════════
  //  LIBRO 1 — Mujeres que Corren con los Lobos
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em01',
    titulo: 'Mujeres que Corren con los Lobos',
    autor: 'Clarissa Pinkola Estés',
    anio: '1992',
    emoji: '🐺',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'A través de cuentos, mitos y leyendas de todo el mundo, la psicoanalista Clarissa Pinkola Estés recupera la naturaleza salvaje femenina que la civilización ha intentado domesticar durante siglos.',
    gemasRecompensa: 75,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Mujer Salvaje: El Arquetipo Perdido',
        emoji: '🌕',
        contenido: '''Clarissa Pinkola Estés es psicoanalista jungiana, cuentacuentos y poeta. Creció entre dos culturas — la mexicana de sus padres adoptivos y la húngara de sus abuelos — y desde niña absorbió los cuentos que los mayores usaban para transmitir la sabiduría más profunda sobre lo que significa ser mujer. Pasó décadas recopilando esos cuentos de distintas tradiciones del mundo, y encontró algo que la asombró: todos contaban la misma historia. La historia de una naturaleza femenina esencial, poderosa y libre — y de los intentos de la cultura por domesticarla, contenerla, o hacerla desaparecer.

A esta naturaleza la llama LA MUJER SALVAJE, y la describe no como una figura agresiva o antisocial, sino como el arquetipo de la vida instintiva femenina: la capacidad de sentir profundamente, de crear sin disculparse, de reconocer el peligro antes de que se nombre, de amar ferozmente y de regenerarse después de las pérdidas.

Estés usa la figura del LOBO como símbolo de esta naturaleza — específicamente la loba, que en muchas culturas indígenas representa la maestra, la guía, la que cuida la manada con sabiduría y vigilancia, la que conoce el territorio. Como los lobos, las mujeres con su naturaleza instintiva intacta tienen agudeza para reconocer lo falso, resistencia ante la adversidad, y la capacidad de jugar, crear y celebrar la vida.

El diagnóstico central del libro: la mayoría de las mujeres en la cultura occidental viven en un estado de hambre del alma — una sensación de algo que falta, de haber perdido acceso a algo esencial en sí mismas. Esta hambre no se sacia con más logros, más relaciones o más posesiones. Solo se sacia con el retorno a la naturaleza instintiva que fue suprimida o enterrada.

El libro entero es una invitación a ese retorno.''',
      ),
      CapituloResumen(
        titulo: 'La Historia de La Llorona y el Alma Herida',
        emoji: '💧',
        contenido: '''Estés usa el cuento de LA LLORONA — figura presente en toda América Latina, la mujer que llora buscando a sus hijos perdidos — como mapa del alma femenina que ha sido separada de lo que más ama y que vaga en un estado de duelo sin resolver.

La interpretación psicoanalítica de Estés va más allá de la interpretación literal. La Llorona no busca solo a sus hijos biológicos — busca todo lo que el alma femenina ha perdido: sus creaciones, sus instintos, sus sueños, los aspectos de sí misma que fueron rechazados o suprimidos para ser aceptable.

El duelo sin resolver que representa la Llorona es una herida real que Estés encontró en la consulta con mujeres de todas las edades y culturas. Se manifiesta como tristeza crónica sin causa clara, como la sensación de no saber quién se es realmente, como la incapacidad de sentir alegría genuina incluso cuando las circunstancias externas son buenas.

El primer paso para sanar esta herida, propone Estés, es reconocerla y llorarla genuinamente. No suprimir el duelo ni racionalizarlo — permitir que el alma llore lo que perdió, con toda la intensidad que merece. Esta es la primera acción salvaje: sentir todo lo que sientes en lugar de domesticar la emoción para no incomodar.

Estés también introduce el concepto de LAS MUJERES HERIDAS QUE HIEREN: mujeres cuya naturaleza salvaje fue tan lastimada que comenzaron a lastimar a otras, a perpetuar el mismo ciclo de supresión. Reconocer este patrón sin juzgar — ni a las mujeres heridas ni a quienes las hirieron — es parte del trabajo de sanación.''',
      ),
      CapituloResumen(
        titulo: 'La Bella y la Bestia: Amar lo Salvaje en Uno Mismo',
        emoji: '🌹',
        contenido: '''Estés relee el cuento de La Bella y la Bestia desde una perspectiva completamente diferente a la romántica convencional. La Bestia no representa al hombre que la mujer debe salvar — representa la naturaleza salvaje e instintiva que la mujer ha aprendido a ver como monstruosa en sí misma, y que necesita aprender a amar y aceptar.

Desde la infancia, a las niñas se les enseña cuáles aspectos de sí mismas son aceptables (la amabilidad, la dulzura, la belleza, la obediencia) y cuáles son monstruosos (la rabia, los deseos propios, la ambición, la sexualidad, el rechazo de las expectativas). La Bestia es todo lo que fue etiquetado como monstruoso.

El acto de amor radical en el cuento, según Estés, no es que la Bella ame a la Bestia a pesar de ser fea — es que la Bella aprende a ver que la Bestia no es monstruosa sino profundamente viva. Y al ver eso, la Bestia puede transformarse. Del mismo modo, cuando una mujer aprende a amar y aceptar las partes de sí misma que aprendió a suprimir, esas partes se transforman de fuentes de vergüenza a fuentes de poder.

El PROBLEMA con el cuento tal como se enseña habitualmente: el foco está en que la Bella salva a la Bestia siendo suficientemente amorosa y paciente. Estés corrige esta lectura: el trabajo no es salvar a la Bestia externa (otra persona, una institución) sino reconocer y amar a la Bestia interna — la naturaleza salvaje propia.

Las mujeres que intentan constantemente "salvar" a otros frecuentemente lo hacen porque no pueden tolerar el contacto directo con su propia naturaleza salvaje. El camino de regreso a una misma es más urgente que el camino hacia el rescate del otro.''',
      ),
      CapituloResumen(
        titulo: 'La Mujer Esqueleto: Vida, Muerte y Regeneración',
        emoji: '💀',
        contenido: '''Uno de los cuentos más poderosos del libro es el de LA MUJER ESQUELETO — una figura de las tradiciones inuitas que representa el ciclo de vida, muerte y renacimiento. En el cuento, un pescador engancha accidentalmente a esta figura en su anzuelo y huye aterrorizado — y la Mujer Esqueleto lo persigue, enredada en sus propias cuerdas.

La interpretación de Estés: la Mujer Esqueleto representa la vida en su totalidad, incluyendo la muerte y lo que viene después. El pescador que huye representa la parte de nosotras que quiere solo la vida placentera sin la muerte, solo los comienzos sin los finales, solo la creación sin la destrucción.

Pero la vida no funciona así. Todo ciclo de crecimiento genuino requiere una muerte — la muerte de la versión anterior de ti misma, de la relación que ya no sirve, del trabajo que ya no tiene sentido, de la creencia que ya no es verdad. Sin esa muerte, no hay espacio para el nuevo nacimiento.

La REGENERACIÓN es el tema central: las mujeres con su naturaleza instintiva intacta saben cómo morir bien — cómo soltar lo que terminó sin aferrarse desesperadamente, y cómo encontrar el renacimiento dentro de la pérdida. Esta capacidad es la fuente más profunda de resiliencia.

Estés también habla del concepto de LAS MUJERES QUE AMAN DEMASIADO PRONTO: mujeres que dan su corazón completo antes de conocer suficientemente bien al otro — o que huyen ante la primera señal de profundidad porque la intimidad real aterra. En ambos casos, la relación con la propia naturaleza salvaje está interrumpida.

La práctica central del capítulo: aprender a soltar. Soltar relaciones que terminaron, identidades que ya no encajan, roles que fueron útiles en otra época. El alma que puede soltar puede recibir lo nuevo.''',
      ),
      CapituloResumen(
        titulo: 'El Retorno de la Mujer Salvaje',
        emoji: '🌱',
        contenido: '''Estés cierra con el mapa del retorno — el proceso de reconectar con la naturaleza instintiva femenina que fue suprimida, domesticada o herida. Este retorno no es un evento único sino un proceso continuo, en espiral, que requiere atención constante.

El primer paso es RECONOCER LOS SIGNOS DE HAMBRE DEL ALMA: aburrimiento persistente que el entretenimiento no alivia, sensación de que la vida tiene que tener más sentido del que tiene actualmente, tristeza sin causa aparente, compulsión de complacer a todos a costa de las propias necesidades, o la incapacidad de decir no aunque en el fondo quieras decirlo.

El segundo paso es PROTEGER EL TIEMPO CREATIVO: cualquier forma de creación — cocinar con intención, jardinería, escritura, pintura, música, tejido, baile — es una forma de contacto con la naturaleza salvaje. La creatividad no tiene que ser "artística" para ser profunda. Lo que importa es el estado de absorción total, sin objetivo más allá del acto mismo.

El tercer paso es CUIDAR LAS RELACIONES DE MANADA: las mujeres que nutren la naturaleza salvaje de las demás, que celebran en lugar de competir, que comparten sabiduría en lugar de retenerla. Estés usa la imagen de la manada de lobas que cuidan las crías entre todas — ninguna loba sola puede hacer lo que hace la manada junta.

El cuarto paso es VIVIR DESDE LOS RITMOS PROPIOS: cada mujer tiene sus ritmos naturales de energía, necesidad de soledad y compañía, períodos de creación y períodos de descanso. Ignorar esos ritmos constantemente para adaptarse a los ritmos de la cultura o de otros es otra forma de abandonar a la mujer salvaje interior.

El libro termina con una certeza poderosa: la naturaleza salvaje no muere, solo duerme. Siempre puede ser despertada. Siempre puede volver a correr.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué representa la "Mujer Salvaje" en el trabajo de Clarissa Pinkola Estés?',
        opciones: [
          'Una mujer agresiva o antisocial que rechaza las normas culturales',
          'El arquetipo de la vida instintiva femenina — la capacidad de sentir profundamente, crear, reconocer el peligro y regenerarse',
          'La figura histórica de las mujeres de las culturas premodernas',
          'Un ideal de feminidad que solo pueden alcanzar mujeres con conexión espiritual especial',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La Mujer Salvaje no es agresividad ni rechazo — es la naturaleza instintiva femenina en su plenitud: creativa, sensible, sabia, y capaz de regenerarse.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué representa la Llorona en la interpretación psicoanalítica de Estés?',
        opciones: [
          'El miedo maternal de perder a los hijos en situaciones de peligro',
          'El alma femenina que vaga en duelo buscando sus creaciones, instintos y aspectos de sí misma que fueron suprimidos',
          'La figura cultural de la mujer traicionada que busca venganza',
          'El arquetipo de la maternidad sacrificada en culturas latinoamericanas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La Llorona no busca solo hijos literales — busca todo lo que el alma perdió: sueños, creatividad, instintos, partes de sí misma rechazadas para ser aceptable.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es la reinterpretación de Estés sobre "La Bella y la Bestia"?',
        opciones: [
          'Que la Bella debe aprender a amar a los hombres a pesar de sus defectos',
          'Que la Bestia representa la naturaleza salvaje que la mujer aprendió a ver como monstruosa en sí misma y que necesita aprender a amar',
          'Que las relaciones difíciles pueden transformarse con suficiente paciencia y amor',
          'Que la fealdad externa no importa si hay bondad interna',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La Bestia es la rabia, los deseos propios, la ambición — todo lo que la cultura etiquetó como monstruoso en las mujeres. Aprenderlo a amar es recuperar el propio poder.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué enseña el cuento de la Mujer Esqueleto sobre el crecimiento?',
        opciones: [
          'Que debemos evitar el sufrimiento para poder florecer plenamente',
          'Que todo ciclo de crecimiento genuino requiere una muerte — soltar lo anterior para que lo nuevo pueda nacer',
          'Que la resiliencia se construye ignorando el dolor hasta que desaparece',
          'Que las relaciones que duelen son señales de incompatibilidad fundamental',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Perfecto! Sin muerte no hay renacimiento. Soltar lo que terminó — relaciones, identidades, creencias — crea el espacio para el nuevo crecimiento.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es el "hambre del alma" y cómo se reconoce?',
        opciones: [
          'Un estado de hambre espiritual que solo se sacia con práctica religiosa regular',
          'La sensación de que algo falta, producida por la separación de la naturaleza instintiva — se manifiesta como tristeza sin causa, aburrimiento persistente, o compulsión de complacer a todos',
          'El deseo de aventura que produce insatisfacción con la vida cotidiana',
          'Un estado temporal de agotamiento que requiere descanso físico extenso',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Excelente! El hambre del alma no se sacia con más logros ni entretenimiento. Solo se sacia con el retorno a la naturaleza instintiva femenina que fue suprimida.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué metáfora usa Estés para describir el proceso de recuperación psíquica femenina?',
        opciones: [
          'La mariposa que sale del capullo tras la metamorfosis',
          'La loba que regresa a su manada después de la cacería solitaria',
          'Los huesos secos que se reensamblan y el polvo que les devuelve la vida',
          'La semilla que germina bajo tierra antes de ver la luz',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El cuento de La Mujer Esqueleto y el relato de Ezequiel sobre los huesos secos sirven a Estés para describir la recuperación: recolectar los huesos (fragmentos del yo perdido), ensamblarlos, y soplar vida de nuevo sobre ellos. El yo salvaje no muere; solo espera ser convocado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la advertencia central de Estés sobre ignorar la voz instintiva interna?',
        opciones: [
          'Llevar una vida demasiado segura y sin riesgos',
          'Acumular resentimientos hacia quienes tienen más libertad',
          'Caer en relaciones destructivas, perder la creatividad y enfermar porque el alma exige lo que le fue negado',
          'Volverse excesivamente independiente y rechazar el amor',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Estés documenta que ignorar la naturaleza instintiva tiene costos concretos: relaciones donde se tolera lo intolerable, creatividad bloqueada, enfermedades psicosomáticas, depresión. El alma tiene su propia hambre y exigencia; ignorarla no la silencia, la radicaliza.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dicen Kay y Shipman sobre el riesgo y su relación con la confianza?',
        opciones: [
          'Las mujeres deben evitar los riesgos innecesarios para proteger su carrera',
          'La aversión al riesgo es una fortaleza femenina que protege de errores costosos',
          'Los riesgos solo deben tomarse cuando la probabilidad de éxito es alta',
          'Tomar riesgos calculados —incluso cuando salgan mal— es el mecanismo más potente para construir confianza porque demuestra que el fracaso es sobrevivible',
        ],
        respuestaCorrecta: 3,
        explicacion: 'Las autoras documentan que la aversión al riesgo de las mujeres las mantiene en zonas seguras que no construyen confianza. Los hombres toman más riesgos, fracasan más y aprenden que el fracaso no es terminal. Esa experiencia acumulada es la que construye la confianza que parece innata.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué consejo final da Estés para mantener viva la naturaleza salvaje en la vida cotidiana?',
        opciones: [
          'Retirarse de la vida social para protegerse de influencias que domestican la naturaleza instintiva',
          'Cuidar el tiempo creativo, las relaciones de manada y los ritmos propios — la naturaleza salvaje no muere, solo duerme y puede ser despertada',
          'Adoptar rituales espirituales de culturas indígenas para reconectar con la sabiduría ancestral',
          'Rechazar los roles de madre y esposa que la sociedad impone para vivir plenamente la naturaleza instintiva',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Estés termina con esperanza: la naturaleza salvaje no muere, solo duerme. Se despierta protegiendo el tiempo creativo, cultivando relaciones de manada donde las mujeres se apoyan mutuamente, y viviendo desde los propios ritmos naturales en lugar de adaptarse constantemente a los ritmos de otros.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa para Estés "vivir desde los ritmos propios"?',
        opciones: [
          'Seguir estrictamente el ciclo lunar como guía para las decisiones importantes de la vida',
          'Respetar los propios ciclos naturales de energía, necesidad de soledad y creación en lugar de ignorarlos para adaptarse a expectativas externas',
          'Establecer una rutina diaria fija que no cambie independientemente de las circunstancias',
          'Priorizar siempre las necesidades propias sobre las necesidades de los demás',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Cada mujer tiene sus propios ritmos naturales: periodos de alta energía y descanso, necesidad de soledad y de compañía, fases de creación y de integración. Ignorarlos constantemente para adaptarse a los ritmos de la cultura o de otros es una forma de abandonar a la mujer salvaje interior.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 2 — Lean In
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em02',
    titulo: 'Lean In: Las Mujeres, el Trabajo y la Voluntad de Liderar',
    autor: 'Sheryl Sandberg',
    anio: '2013',
    emoji: '💪',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'La COO de Facebook analiza honestamente los obstáculos externos e internos que frenan el avance de las mujeres en sus carreras, y propone estrategias concretas para inclinarse hacia adelante en lugar de retroceder.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Liderazgo Ambivalente: Por Qué las Mujeres Frenan',
        emoji: '🔍',
        contenido: '''Sheryl Sandberg comienza con una observación incómoda: a pesar de décadas de progreso en igualdad de género, el porcentaje de mujeres en posiciones de liderazgo sigue siendo desproporcionalmente bajo. Las mujeres obtienen la mitad de las licenciaturas y maestrías, pero representan menos del 20% de los líderes corporativos y políticos a nivel mundial.

Hay barreras externas reales: discriminación, falta de políticas de conciliación, expectativas culturales sobre el rol de la mujer. Sandberg las reconoce todas. Pero su libro se enfoca en algo diferente: las BARRERAS INTERNAS que las propias mujeres se imponen, frecuentemente sin ser conscientes de ello.

La más importante: la tendencia a RETROCEDER antes de que sea necesario. Sandberg observa que mujeres brillantes comienzan a hacer concesiones en su carrera cuando todavía están a años de necesitarlas. Una mujer que piensa en tener hijos "algún día" empieza a decir no a proyectos exigentes, a evitar posiciones de alto perfil, a prepararse inconscientemente para un futuro que aún no llegó.

INCLINARSE HACIA ADELANTE es lo contrario: aprovechar activamente las oportunidades disponibles hoy, ocupar el espacio al que se tiene derecho, no suavizar los logros propios para parecer más aceptable. Sandberg escribe desde la experiencia de haber cometido estos errores y de haber visto a miles de mujeres talentosas hacerlo también.

El mensaje central: el cambio sistémico es necesario Y el cambio individual es posible ahora mismo. No hay que esperar a que el mundo sea más justo para tomar las oportunidades disponibles hoy.''',
      ),
      CapituloResumen(
        titulo: 'El Síndrome del Impostor y la Confianza',
        emoji: '🎭',
        contenido: '''El síndrome del impostor —la sensación de no merecer el éxito propio, de que en cualquier momento alguien descubrirá que no eres tan capaz como creen— afecta a personas de todos los géneros, pero Sandberg documenta que es significativamente más prevalente entre mujeres altamente exitosas.

Maya Angelou, una de las escritoras más celebradas del siglo XX, confesó: "He escrito 11 libros, pero cada vez pienso que ahora sí van a descubrir que no sé de lo que estoy hablando." Si alguien con su trayectoria siente eso, no es sorprendente que mujeres que recién comienzan sus carreras lo sientan con más fuerza.

La diferencia de género en el síndrome del impostor no es solo individual — está reforzada culturalmente. Los hombres atribuyen sus éxitos principalmente a sus capacidades; las mujeres los atribuyen más frecuentemente a factores externos (suerte, ayuda de otros, el momento apropiado). Cuando ambos fracasan, los hombres atribuyen el fracaso a circunstancias externas; las mujeres lo atribuyen a falla personal.

Esta asimetría tiene consecuencias concretas: las mujeres piden menos aumentos, aceptan la primera oferta salarial más frecuentemente, se postulan a trabajos solo cuando cumplen el 100% de los requisitos (los hombres lo hacen cuando cumplen el 60%), y raramente negocian activamente sus condiciones laborales.

Sandberg propone una práctica concreta: llevar un registro de los logros propios, actualizado regularmente. Cuando el síndrome del impostor llegue, leer ese registro. El cerebro necesita evidencia contraria a la voz que dice "no mereces estar aquí."''',
      ),
      CapituloResumen(
        titulo: 'Sentarse en la Mesa',
        emoji: '🪑',
        contenido: '''Una de las observaciones más memorables de Sandberg: en las reuniones importantes, las mujeres tienden a sentarse en las sillas periféricas o en la pared, mientras los hombres se sientan en la mesa. Es una metáfora de algo más profundo: la tendencia a no ocupar el espacio al que se tiene derecho.

En una reunión en la Casa Blanca, Sandberg observó que las mujeres jóvenes del equipo que la acompañaban se sentaron contra la pared aunque había sillas libres en la mesa. Cuando llegó el momento de las preguntas del Presidente, las mujeres no hicieron ninguna. Los hombres en la mesa hicieron varias.

"Sentarse en la mesa" no es literalmente sobre dónde te sientas — es sobre ocupar el espacio que tienes derecho a ocupar. Significa hablar en reuniones aunque no tengas todo perfectamente preparado. Significa hacer preguntas aunque te parezcan básicas. Significa presentar proyectos antes de que estén perfectos.

Sandberg también aborda la negociación salarial con datos concretos: las mujeres que no negocian pierden, en promedio, más de \$500,000 dólares en ingresos a lo largo de su carrera comparadas con hombres en posiciones equivalentes que sí negociaron. Y la principal razón por la que las mujeres no negocian no es falta de información — es miedo a parecer "difíciles" o "codiciosas."

La realidad: pedir lo que mereces no solo te beneficia a ti — establece un precedente para las mujeres que vienen después.''',
      ),
      CapituloResumen(
        titulo: 'El Mito de Poder Tenerlo Todo',
        emoji: '⚖️',
        contenido: '''Sandberg aborda con honestidad una de las preguntas más comunes y más cargadas de la vida de las mujeres profesionales: "¿Puedes tenerlo todo?" Su respuesta es matizada y honesta: depende de qué defines como "todo", y requiere compromisos dolorosos que no tienen equivalente para la mayoría de hombres.

La maternidad tiene un costo real en las carreras de las mujeres que no tiene equivalente para los hombres. Las empresas siguen penalizando implícitamente las ausencias por maternidad, la flexibilidad de horarios y la opción de poner límites a las horas de trabajo. Esto no es imaginación — está documentado en diferencias salariales y de promoción que se amplían significativamente después de que las mujeres tienen hijos.

Pero Sandberg también identifica algo que las mujeres pueden hacer: elegir deliberadamente al compañero correcto. El factor más importante en la carrera de una mujer no es la empresa ni el jefe — es el compañero de vida. Un compañero que comparte equitativamente las responsabilidades domésticas y del cuidado de los hijos hace posible una carrera que de otro modo sería imposible.

Sandberg escribe con honestidad sobre su propio matrimonio: su esposo Dave se convirtió en co-padre completamente presente. No perfecto, pero equitativo. Y esa distribución fue lo que le permitió a ella mantener una carrera de liderazgo mientras también era madre.

El mensaje no es que todas las mujeres deban tener carreras de alto nivel — es que las que lo desean merecen el apoyo para hacerlo, tanto del sistema como de las personas más cercanas en sus vidas.''',
      ),
      CapituloResumen(
        titulo: 'Liderazgo Femenino: Ser Exitosa y Agradable',
        emoji: '🌟',
        contenido: '''Sandberg documenta uno de los dilemas más agotadores de las mujeres que lideran: el doble estándar entre ser exitosa y ser agradable. Los hombres son admirados cuando son asertivos y directos. Las mujeres con las mismas características frecuentemente son percibidas negativamente.

Investigaciones consistentes muestran que cuando la misma negociación es conducida por un hombre o por una mujer, la mujer es percibida como "difícil" o "agresiva" con mayor frecuencia. Cuando el mismo liderazgo directivo es ejercido por hombre o mujer, la mujer recibe más críticas sobre su "estilo."

Sandberg no ofrece una solución fácil porque no existe. Pero sí identifica estrategias que reducen la penalización: enmarca las peticiones como también beneficiosas para el equipo o la empresa (no solo para ti). Muestra calidez genuina además de competencia —no como táctica sino como expresión auténtica. Construye relaciones antes de necesitarlas.

Una de sus observaciones más importantes: las mujeres deben apoyarse mutuamente activamente. El mito de que hay "cupo limitado" para mujeres en posiciones de liderazgo produce competencia entre mujeres que beneficia a nadie. La realidad es lo opuesto: las mujeres en posiciones de liderazgo atraen y promueven más mujeres talentosas.

Sandberg cierra con su visión del futuro: un mundo donde la ambición no tiene género, donde el liderazgo no implica elegir entre éxito y feminidad, y donde los hombres y mujeres comparten equitativamente tanto las responsabilidades domésticas como las del liderazgo. Ese mundo no es solo más justo — es más productivo para todos.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué significa "lean in" (inclinarse hacia adelante) según Sandberg?',
        opciones: [
          'Trabajar más horas y sacrificar el balance personal para avanzar en la carrera',
          'Aprovechar activamente las oportunidades disponibles, ocupar el espacio propio y no retroceder antes de que sea necesario',
          'Adoptar comportamientos y estilos de comunicación más masculinos para tener éxito',
          'Inclinarse físicamente en reuniones para mostrar dominancia y confianza',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Lean In es lo opuesto a retroceder preventivamente. Significa tomar proyectos exigentes ahora (no esperar a un futuro hipotético), negociar activamente, hablar en reuniones, y no suavizar los logros propios. No es trabajar más horas — es comprometerse plenamente con las oportunidades disponibles.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "síndrome del impostor" y cómo afecta especialmente a las mujeres?',
        opciones: [
          'La tendencia de las mujeres a fingir competencias que no tienen para obtener posiciones más altas',
          'La sensación de no merecer el propio éxito y el miedo a ser "descubiertas" como incompetentes, que lleva a las mujeres a atribuir sus logros a la suerte más que a su capacidad',
          'La dificultad de adaptarse a culturas corporativas diseñadas por y para hombres',
          'El agotamiento crónico que resulta de intentar cumplir simultáneamente con estándares laborales y domésticos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El síndrome del impostor lleva a las mujeres a pedir menos, aceptar la primera oferta, y no postularse a posiciones para las que están calificadas. La práctica de registrar logros propios regularmente crea evidencia contraria a esta voz interna.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué costo concreto tiene para las mujeres no negociar sus salarios?',
        opciones: [
          'Perder oportunidades de ascenso que se dan principalmente a quienes demuestran iniciativa',
          'Ser percibidas como poco ambiciosas y perder proyectos importantes para su desarrollo',
          'Perder más de \$500,000 dólares en ingresos a lo largo de la carrera comparadas con hombres que sí negociaron en posiciones equivalentes',
          'Crear una brecha de habilidades de negociación que se amplía con los años',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El impacto acumulado de no negociar es enorme: si una mujer acepta \$5,000 menos en su primer trabajo y luego todos los aumentos son un porcentaje de ese salario base, la diferencia se acumula exponencialmente. Más de \$500,000 en una carrera es una estimación conservadora documentada por investigadores.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál identifica Sandberg como el factor más importante en la carrera de una mujer profesional?',
        opciones: [
          'La empresa para la que trabaja y si tiene políticas activas de diversidad e inclusión',
          'El mentor o mentora que la acompaña durante los primeros años de su carrera',
          'El compañero de vida que elige — uno que comparte equitativamente las responsabilidades domésticas',
          'La red de contactos profesionales que construye antes de los 30 años',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Sandberg es directa: el factor más determinante en la carrera de una mujer no es la empresa ni el jefe — es el compañero de vida. Un compañero que comparte equitativamente el cuidado de los hijos y las responsabilidades domésticas hace posible una carrera que de otro modo sería físicamente imposible de sostener.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué doble estándar identifica Sandberg para las mujeres que lideran?',
        opciones: [
          'Se les exige más preparación que a los hombres para los mismos roles de liderazgo',
          'Reciben menos compensación que los hombres en los mismos roles aunque tengan el mismo desempeño',
          'Son admiradas por asertividad y directividad cuando son hombres, pero percibidas como "difíciles" o "agresivas" cuando las mismas características las ejercen mujeres',
          'Reciben más críticas sobre resultados y menos oportunidades de aprender de los errores',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El doble estándar está documentado en múltiples estudios: la misma negociación, conducta asertiva o liderazgo directivo es percibida más negativamente cuando la ejerce una mujer. Sandberg no ofrece solución fácil pero sí estrategias: mostrar calidez genuina además de competencia, enmarcar peticiones como beneficiosas para el equipo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Sandberg critica que las mujeres "retroceden antes de que sea necesario"?',
        opciones: [
          'Porque este patrón demuestra que no están comprometidas con sus carreras a largo plazo',
          'Porque mujeres que piensan en la maternidad futura empiezan a declinar oportunidades presentes, creando un techo de cristal autopuesto años antes de necesitarlo',
          'Porque retroceder envía señales equivocadas a los jefes sobre el nivel de ambición',
          'Porque posterga el momento en que pueden enfrentar los obstáculos reales del liderazgo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El retroceso preventivo es auto-sabotaje: una mujer que podría tener hijos "algún día" empieza a decir no a proyectos exigentes, a evitar posiciones de alto perfil, a hacer concesiones que no son necesarias todavía. Cuando el futuro previsto llegue, ya habrá perdido oportunidades que no se recuperan.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Sandberg para combatir el síndrome del impostor?',
        opciones: [
          'Buscar terapia psicológica especializada en autoestima femenina',
          'Compararse solo con otras mujeres en lugar de con hombres para tener referencias más realistas',
          'Llevar un registro actualizado de los propios logros para tener evidencia concreta contra la voz que dice "no mereces estar aquí"',
          'Publicar los logros profesionales en redes sociales para recibir validación externa constante',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El síndrome del impostor es una voz interna que contradice la evidencia externa del propio éxito. Un registro de logros actualizado regularmente crea esa evidencia de forma concreta y accesible. Cuando la voz dice "no mereces estar aquí", el registro dice "aquí hay 15 razones concretas por las que sí."',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la visión de futuro con la que Sandberg cierra el libro?',
        opciones: [
          'Un mundo donde las empresas contraten el mismo número de hombres y mujeres en todos los niveles por mandato legal',
          'Un mundo donde la ambición no tenga género, el liderazgo no implique elegir entre éxito y feminidad, y hombres y mujeres compartan equitativamente trabajo y hogar',
          'Un mundo donde las mujeres lideren más corporaciones y los hombres cuiden más a los hijos como inversión de roles completa',
          'Un mundo donde la maternidad no penalice las carreras porque las empresas ofrezcan guarderías en todos los centros de trabajo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La visión de Sandberg no es la inversión de roles sino la equidad genuina: ambición sin género, liderazgo sin penalización por feminidad, responsabilidades domésticas compartidas. No es un mundo para las mujeres sino un mundo mejor para todos — más justo y más productivo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Sandberg argumenta que las mujeres deben apoyarse mutuamente activamente?',
        opciones: [
          'Porque las empresas promueven más a mujeres cuando ven que trabajan bien entre ellas',
          'Porque el mito del "cupo limitado" crea competencia contraproducente; la realidad es que las mujeres en liderazgo atraen y promueven más mujeres talentosas',
          'Porque las redes de mujeres tienen acceso a información y oportunidades que las redes masculinas no comparten',
          'Porque los clientes y consumidores prefieren trabajar con mujeres en equipos diversos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El mito del cupo limitado produce que las mujeres se vean entre sí como competencia. Pero los datos muestran lo contrario: las mujeres en posiciones de poder tienden a reclutar y promover más mujeres talentosas, creando un ciclo virtuoso en lugar de competitivo. Apoyarse mutuamente beneficia a todas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué observación hizo Sandberg en una reunión en la Casa Blanca sobre el comportamiento de mujeres?',
        opciones: [
          'Que las mujeres hablaban menos que los hombres aunque tenían las mismas posiciones y credenciales',
          'Las mujeres jóvenes del equipo se sentaron en la pared en lugar de en la mesa, y cuando llegaron las preguntas del Presidente, no hicieron ninguna',
          'Que las mujeres preparaban mejor sus presentaciones que los hombres pero las entregaban con menos confianza',
          'Que las mujeres eran interrumpidas más frecuentemente que los hombres durante las reuniones',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Esta observación se convirtió en la metáfora central del libro: "sentarse en la mesa" versus "sentarse en la pared" es la diferencia entre ocupar el espacio al que se tiene derecho y minimizarse voluntariamente. Las sillas en la mesa estaban disponibles — nadie las usó. Eso es retroceder cuando no había razón para hacerlo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 3 — El Poder de la Vulnerabilidad
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em03',
    titulo: 'El Poder de la Vulnerabilidad',
    autor: 'Brené Brown',
    anio: '2010',
    emoji: '❤️',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'Investigadora de la Universidad de Houston, Brené Brown descubrió que la vulnerabilidad no es debilidad sino la fuente de la valentía, la conexión genuina y la vida plena. Este libro cambia cómo entendemos la fortaleza.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Investigación que Cambió Todo',
        emoji: '🔬',
        contenido: '''Brené Brown comenzó su carrera investigando la conexión humana — por qué algunas personas la tienen fácilmente y otras constantemente la sienten fuera de alcance. Esperaba encontrar patrones relacionados con las habilidades sociales, la extroversión o el atractivo físico. Lo que encontró fue completamente diferente y al principio la desconcertó.

Las personas que describían sentir conexión genuina con otros tenían una cosa en común: eran capaces de ser VULNERABLES. Podían admitir sus miedos, sus incertidumbres, sus imperfecciones sin derrumbarse. Podían pedir ayuda, decir "te quiero" sin garantía de ser correspondidos, y mostrar quiénes realmente eran sin esperar aprobación.

Las personas que luchaban con la conexión —que se sentían solas, desconectadas, constantemente performing— tenían también algo en común: se armaban contra la vulnerabilidad. Trabajaban para parecer invulnerables: perfectas, seguras, capaces de manejarlo todo sin ayuda.

Brown llama a las personas del primer grupo "las que tienen corazón entero" (wholehearted) — no porque sean perfectas sino porque viven desde una base de dignidad propia, sin necesitar la aprobación constante de otros para sentirse valiosas.

La revelación más perturbadora: la vulnerabilidad que estas personas practican no las hace más débiles — las hace más fuertes. Tienen relaciones más genuinas, mayor creatividad, mejor capacidad de liderazgo y más resiliencia ante los fracasos. La vulnerabilidad no es el opuesto de la fortaleza — es su fuente.''',
      ),
      CapituloResumen(
        titulo: 'La Vergüenza: El Enemigo de la Conexión',
        emoji: '🌑',
        contenido: '''Brown identifica la VERGÜENZA como el principal obstáculo para la vulnerabilidad y la conexión. Y hace una distinción crucial que transforma cómo entendemos nuestras emociones: vergüenza no es lo mismo que culpa.

La CULPA es "hice algo malo." La VERGÜENZA es "soy algo malo." La culpa dice "me equivoqué en esto" — y puede motivar el cambio y la reparación. La vergüenza dice "yo soy el error" — y paraliza, aisla, produce la necesidad de esconderse.

Brown argumenta que la vergüenza es una epidemia silenciosa que subyace a la mayoría de comportamientos destructivos: la adicción, la violencia, la agresividad, la depresión. La vergüenza crea personas que se sienten tan fundamentalmente inadecuadas que no pueden tolerar la exposición de ser vistas realmente.

¿Cómo se combate la vergüenza? No con optimismo forzado ni afirmaciones positivas — con EMPATÍA. La vergüenza crece en el secreto y el silencio; muere cuando es vista con empatía. Cuando alguien te dice "yo también me he sentido así" o "entiendo por qué sientes eso", la vergüenza pierde su poder.

Brown también identifica los "detonadores de vergüenza" más comunes: apariencia física, maternidad, familia, dinero, trabajo, sexualidad. Conocer tus detonadores específicos te da cierto control sobre ellos — no elimina la vergüenza pero te permite reconocerla cuando aparece en lugar de ser arrastrado por ella sin entender qué ocurre.''',
      ),
      CapituloResumen(
        titulo: 'La Valentía de Ser Imperfecta',
        emoji: '💎',
        contenido: '''Uno de los conceptos centrales de Brown es la PERFECCIÓN como escudo contra la vulnerabilidad — y por qué ese escudo termina siendo una trampa. El perfeccionismo no es trabajar bien ni tener estándares altos: es usar la perfección como protección contra el juicio de los demás.

La persona perfeccionista piensa (a menudo inconscientemente): "Si soy perfecta, nadie puede criticarme. Si no cometo errores, no habrá vergüenza." Pero la perfección es inalcanzable, lo que produce un estado crónico de insuficiencia — siempre falta algo para ser perfecto.

Más importante: el perfeccionismo inhibe la creatividad, el aprendizaje y el crecimiento. Los estudios de Brown muestran que las personas más creativas y las que más aprenden son las que tienen mayor tolerancia al fracaso y la imperfección — porque están dispuestas a intentar cosas nuevas sin garantía de éxito.

Brown propone la VALENTÍA ORDINARIA como alternativa al perfeccionismo: no la valentía de los héroes de guerra sino la de mostrarse tal como eres en conversaciones difíciles, de pedir lo que necesitas, de decir "no sé", de admitir que estás luchando con algo. Esta valentía cotidiana requiere práctica deliberada porque va contra el instinto de protegerse.

La RESILIENCIA también está directamente relacionada con la capacidad de ser imperfecto. Las personas que se recuperan más rápidamente de los fracasos no son las que menos fracasan — son las que han desarrollado la capacidad de nombrar lo que salió mal, aprender de ello sin juzgarse duramente y seguir adelante.''',
      ),
      CapituloResumen(
        titulo: 'La Conexión Genuina y la Arena',
        emoji: '🤝',
        contenido: '''Brown desarrolla el concepto de la ARENA como metáfora del espacio donde mostramos quiénes somos y hacemos las cosas que importan — con el riesgo de ser juzgados, criticados o de fracasar públicamente.

La cita de Theodore Roosevelt que Brown usa para enmarcar esta sección se ha convertido en una de las más compartidas en todo el mundo: "No es el crítico quien cuenta; no es quien señala cómo el hombre fuerte tropieza, ni quien dice que quien hace las obras podría haberlas hecho mejor. El crédito pertenece al hombre que está en la arena."

Estar en la arena significa comprometerse con algo que importa, sabiendo que podrías fallar y ser juzgado por ello. Lo contrario es ser espectador o crítico desde las gradas — más cómodo pero también más vacío.

Brown también desarrolla el concepto de las personas cuya OPINIÓN IMPORTA: la lista de personas en tu vida cuyo juicio realmente te afecta porque las respetas y cuya perspectiva valoras. Cuando estés en la arena y alguien te critique, antes de dejar que esa crítica te destruya, pregúntate: ¿está esta persona en mi lista? Si no está, sus palabras no merecen más que un reconocimiento breve.

Finalmente, Brown habla de la AUTOCOMPASIÓN como práctica esencial: tratarte con la misma amabilidad que tratarías a un buen amigo cuando ha cometido un error. La mayoría de personas son mucho más duras consigo mismas que con cualquier otro. La autocompasión no es autoindulgencia — es la base desde la que se puede seguir intentando después de fallar.''',
      ),
      CapituloResumen(
        titulo: 'Vivir con Corazón Entero',
        emoji: '💜',
        contenido: '''Brown cierra con las prácticas concretas que caracterizan a las personas que viven con "corazón entero" (wholehearted living) — que no son personas sin problemas ni sin vergüenza, sino personas que han desarrollado la capacidad de manejar la vulnerabilidad sin que las destruya.

PRÁCTICA 1 — Cultivar la autenticidad: soltar la necesidad de aprobación constante y la imagen que intentas proyectar para ser aceptable. La autenticidad no se logra de una vez — es una práctica diaria de elegir ser tú mismo en cada interacción, aunque eso implique riesgo.

PRÁCTICA 2 — Cultivar la gratitud y la alegría: las personas con corazón entero practican la gratitud activamente, especialmente en los momentos de alegría. Y en los momentos de pérdida o miedo, eligen ver lo que tienen en lugar de solo lo que podría perderse.

PRÁCTICA 3 — Cultivar la intuición y confiar en la fe: soltar la certeza y la necesidad de controlar todos los resultados. Vivir con vulnerabilidad requiere tolerar la incertidumbre — y eso requiere alguna forma de fe en que las cosas pueden salir bien aunque no tengas control sobre todos los factores.

PRÁCTICA 4 — Cultivar el descanso y el juego: soltar el agotamiento como símbolo de estatus y la productividad como medida del valor propio. El descanso y el juego no son lujos — son necesidades biológicas y psicológicas cuya ausencia erosiona todo lo demás.

La vida con corazón entero no es perfecta ni fácil. Es una elección continua de mostrarse, ser vistos y arriesgarse a la conexión genuina. Brown la describe como "la vida más valiente" que cualquier persona puede elegir vivir.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué descubrió Brown sobre las personas que experimentan conexión genuina con otros?',
        opciones: [
          'Tienen mayor inteligencia emocional que el promedio de la población',
          'Son más extrovertidas y tienen más habilidades sociales desarrolladas',
          'Son capaces de ser vulnerables — mostrar miedos, pedir ayuda e imperfecciones sin derrumbarse',
          'Provienen de familias que modelaron la conexión emocional desde la infancia',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La investigación de Brown encontró que la vulnerabilidad — no las habilidades sociales, la extroversión ni el atractivo — es el factor que distingue a quienes experimentan conexión genuina de quienes luchan con ella. Las personas que se arman contra la vulnerabilidad terminan armadascontra la conexión.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la distinción clave entre vergüenza y culpa según Brown?',
        opciones: [
          'La vergüenza es pública; la culpa es privada e interna',
          'La vergüenza dice "soy algo malo"; la culpa dice "hice algo malo" — la primera paraliza, la segunda puede motivar el cambio',
          'La vergüenza es más severa e intensa que la culpa en todas las circunstancias',
          'La culpa es más frecuente que la vergüenza en personas con autoestima alta',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Esta distinción cambia la comprensión de ambas emociones. La culpa ("hice algo malo") preserva la dignidad propia y puede motivar la reparación. La vergüenza ("yo soy el error") ataca la identidad y paraliza. Cultivar la culpa en lugar de la vergüenza produce personas que aprenden de sus errores en lugar de esconderse de ellos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo se combate la vergüenza según la investigación de Brown?',
        opciones: [
          'Con optimismo activo y afirmaciones positivas que contrarresten los pensamientos negativos',
          'Con empatía — cuando alguien ve la vergüenza con comprensión ("yo también me he sentido así"), la vergüenza pierde su poder',
          'Con logros y éxitos que demuestren que los miedos de la vergüenza son infundados',
          'Con el silencio y la privacidad — compartir la vergüenza solo la amplifica',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La vergüenza crece en el secreto y el silencio; muere con la empatía. Cuando alguien dice "yo también me he sentido así", la vergüenza pierde el poder que tenía porque ya no es el oscuro secreto de una persona inadecuada — es una experiencia humana compartida. La conexión es el antídoto de la vergüenza.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia la valentía ordinaria del perfeccionismo según Brown?',
        opciones: [
          'La valentía es para los grandes momentos; el perfeccionismo aplica al trabajo cotidiano',
          'El perfeccionismo usa la perfección como escudo contra el juicio; la valentía ordinaria es mostrarse imperfecto en conversaciones difíciles, pedir lo que necesitas y admitir que no sabes',
          'La valentía requiere entrenamiento; el perfeccionismo emerge naturalmente en personas con estándares altos',
          'El perfeccionismo produce mejores resultados a corto plazo; la valentía es más sostenible a largo plazo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El perfeccionismo no es trabajar bien sino usar la perfección como protección: "si soy perfecta, nadie puede criticarme." Pero produce insuficiencia crónica porque la perfección es inalcanzable, e inhibe la creatividad y el aprendizaje. La valentía ordinaria hace lo opuesto: se muestra imperfecta y aprende de ello.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa "estar en la arena" según Brown y Roosevelt?',
        opciones: [
          'Competir activamente con otros en el mercado profesional o empresarial',
          'Comprometerse con algo que importa sabiendo que podrías fallar y ser juzgado — en lugar de ser espectador crítico desde las gradas',
          'Tener el coraje de enfrentar conflictos directamente en lugar de evitarlos',
          'Participar activamente en debates públicos sobre temas controvertidos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La metáfora de Roosevelt que Brown recupera: estar en la arena es arriesgarse a fallar públicamente porque el objetivo importa. Lo contrario es criticar desde las gradas — más cómodo pero vacío. Brown propone que solo las personas en nuestra lista de "cuya opinión importa" tienen derecho a afectarnos cuando están en las gradas criticando.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la autocompasión y por qué es necesaria según Brown?',
        opciones: [
          'Perdonarse automáticamente todos los errores sin reflexión ni aprendizaje',
          'Buscar validación externa de otros cuando nos sentimos inadecuados',
          'Tratarse con la misma amabilidad que darías a un buen amigo tras un error — la base desde la que se puede seguir intentando después de fallar',
          'Bajar los estándares para protegerse de la decepción cuando no se alcanzan',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La autocompasión no es autoindulgencia — es el trato que uno mismo merece cuando falla. Las personas que se tratan duramente tras los errores aprenden menos y se recuperan más lento que quienes se tratan con amabilidad. La autocompasión crea la seguridad psicológica para intentar de nuevo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué el perfeccionismo inhibe la creatividad según la investigación de Brown?',
        opciones: [
          'Porque los perfeccionistas invierten tanto tiempo en detalles que no tienen tiempo para crear',
          'Porque requieren demasiada aprobación externa antes de compartir su trabajo con otros',
          'Porque la intolerancia al fracaso y la imperfección impide intentar cosas nuevas sin garantía de éxito',
          'Porque los estándares del perfeccionista son tan altos que ningún resultado los satisface',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Las personas más creativas tienen mayor tolerancia al fracaso y la imperfección: están dispuestas a crear cosas malas en el proceso de crear cosas buenas, a intentar algo que podría no funcionar. El perfeccionista no puede tolerar ese riesgo, así que no experimenta ni innova.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Brown a las personas "wholehearted" (de corazón entero)?',
        opciones: [
          'Personas que nunca experimentan vergüenza o miedo porque han trabajado profundamente en sí mismas',
          'Personas que viven sin problemas ni adversidades gracias a sus prácticas de bienestar',
          'No personas perfectas ni sin vergüenza, sino personas que han desarrollado capacidad de manejar la vulnerabilidad sin que las destruya',
          'Personas que priorizan las relaciones y la conexión emocional sobre los logros profesionales',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El "corazón entero" no es ausencia de problemas ni de vergüenza. Es haber desarrollado las prácticas que permiten manejar la vulnerabilidad: autenticidad, gratitud, intuición, descanso y juego. Estas personas fracasan, tienen vergüenza y enfrentan adversidades — pero las manejan de manera que no destruye su sentido de valor propio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué práctica propone Brown para cultivar el "corazón entero" en la vida cotidiana?',
        opciones: [
          'Meditar 30 minutos diarios para desarrollar observación imparcial de las propias emociones',
          'Cultivar la autenticidad soltando la necesidad de aprobación constante y la imagen que intentas proyectar',
          'Llevar un diario de gratitud anotando tres cosas positivas cada noche',
          'Practicar la vulnerabilidad solo con las personas de más confianza para minimizar el riesgo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Cultivar la autenticidad es la primera y más fundamental práctica: elegir ser uno mismo en cada interacción en lugar de proyectar la imagen que crees que otros esperan. Es una práctica diaria, no un estado permanente que se alcanza. Cada vez que eliges autenticidad sobre aprobación, estás practicando el corazón entero.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dice Brown sobre el descanso y el juego como prácticas del corazón entero?',
        opciones: [
          'Son importantes pero secundarios a las prácticas de gratitud y autenticidad',
          'Solo son accesibles para personas con suficientes recursos económicos y tiempo libre',
          'Son necesidades biológicas y psicológicas esenciales — soltar el agotamiento como símbolo de estatus y la productividad como medida del valor propio',
          'Son más importantes para los introvertidos que para las personas extrovertidas y con más energía social',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Brown documenta que en nuestra cultura el agotamiento se usa como medida de valor ("estoy tan ocupada" como señal de importancia) y la productividad como medida de mérito. Esta cultura erosiona la salud y la conexión. El descanso y el juego no son recompensas por el trabajo bien hecho — son necesidades sin las cuales el trabajo y las relaciones se deterioran.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 4 — Big Magic: Creatividad más allá del Miedo
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em04',
    titulo: 'Big Magic: Creatividad más allá del Miedo',
    autor: 'Elizabeth Gilbert',
    anio: '2015',
    emoji: '✨',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'Elizabeth Gilbert, autora de Comer, Rezar, Amar, explora la vida creativa y cómo liberarse del miedo para crear con alegría, curiosidad y valentía sin importar el resultado.',
    gemasRecompensa: 70,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Coraje: Una Vida Creativa Requiere Valentía',
        emoji: '🦁',
        contenido: '''Elizabeth Gilbert abre el libro con una afirmación directa: una vida creativa es posible para cualquier persona, no solo para los artistas profesionales. Pero esa vida requiere una elección activa de coraje, porque el miedo siempre estará presente — y la clave no es eliminarlo sino aprender a no dejarlo conducir.

Gilbert usa una metáfora poderosa: imagina que miedo y creatividad son dos pasajeros en el mismo auto. Creatividad conduce. Miedo puede venir en el asiento trasero, pero no puede tocar el volante ni el radio. Esa imagen captura la relación sana entre ambas fuerzas — no negar el miedo, sino negarse a darle el control.

El coraje creativo, para Gilbert, no es la ausencia de miedo sino la decisión de crear de todas formas. Ella misma describe años de paralización creativa, de preguntarse si era "suficientemente buena" para escribir, de posponer proyectos por el terror al fracaso o al ridículo. La ruptura llegó cuando decidió que su creatividad era más importante que la opinión de cualquier persona.

Gilbert también rechaza la idea del artista como ser torturado. La narrativa cultural que glorifica el sufrimiento creativo — el artista alcohólico, el genio deprimido, la escritora que vive en miseria — es una trampa que asocia la creatividad con el dolor y hace que las personas abandonen sus sueños para no sufrir. Una vida creativa puede ser alegre, curiosa y llena de juego. No tiene que ser oscura para ser profunda.

El primer paso es simple y desafiante a la vez: declarar que tienes el derecho de ser creativa, sin necesitar permiso de nadie.''',
      ),
      CapituloResumen(
        titulo: 'La Magia: Las Ideas como Entidades Vivas',
        emoji: '💡',
        contenido: '''En el capítulo más filosófico y controvertido del libro, Gilbert propone una idea radical: las ideas creativas son entidades vivas que buscan manifestarse a través de seres humanos receptivos. No es una afirmación religiosa literal sino una metáfora funcional que transforma la manera de relacionarse con el proceso creativo.

Bajo esta perspectiva, cuando tienes una idea que te entusiasma y no actúas sobre ella, la idea no muere — se va a buscar otro recipiente. Gilbert cuenta la historia de cómo una novela que abandonó por años apareció después en la mente de otra escritora, Ann Patchett, con sorprendentes similitudes. Interpretó esto como evidencia de que las ideas circulan entre personas hasta encontrar a alguien que les dé forma.

Esta perspectiva tiene implicaciones prácticas importantes. Primero: cuando una idea te visita con entusiasmo persistente, tienes la responsabilidad de actuar sobre ella oportunamente. Dejar que se marchite por miedo o postergación es perder una oportunidad genuina. Segundo: si fracasas o abandonas un proyecto, no es el fin del mundo — la idea encontrará otra forma de existir. Esto alivia la presión paralizante.

Gilbert también introduce el concepto del DAEMON o GENIO — en el sentido griego antiguo, no el cristiano medieval. Para los griegos, el genio era una entidad externa que acompañaba a los creadores, no algo que vivía dentro de ellos. Esta idea elimina el ego del resultado: si el trabajo es brillante, el genio te asistió; si es mediocre, el genio no estuvo presente ese día. En ambos casos, tu trabajo es presentarte y hacer el intento.''',
      ),
      CapituloResumen(
        titulo: 'La Permisividad: Darte Permiso para Crear',
        emoji: '🔓',
        contenido: '''Gilbert identifica la falta de permiso como el principal obstáculo para la vida creativa. Las personas esperan permiso externo que nunca llega: permiso de la crítica para ser consideradas artistas, permiso del mercado para que su trabajo valga, permiso de la familia para dedicar tiempo a crear, permiso de la academia para que sus ideas sean legítimas.

La verdad incómoda es que ese permiso solo puede venir de uno mismo, y debe darse sin garantías de ningún resultado. No puedes esperar saber que tu trabajo será bueno para empezar a hacerlo — debes empezar sin esa certeza y descubrir qué emerge.

Gilbert también aborda la trampa del credencialismo creativo: la idea de que necesitas un título, un maestro aprobado, un editor, o un número mínimo de seguidores para tener derecho a crear. Esta trampa afecta especialmente a mujeres, a personas de culturas que priorizan la utilidad sobre el arte, y a cualquiera que internalizó el mensaje de que la creatividad es un lujo para los afortunados.

El antídoto es lo que Gilbert llama CURIOSIDAD. No ambición, no pasión ardiente, no visión grandiosa — curiosidad. Preguntarte qué te llama la atención, qué te provoca ganas de explorar, qué cosas disfrutarías hacer aunque nadie las viera. La curiosidad es más accesible y sostenible que la pasión, y es suficiente como punto de partida para una vida creativa auténtica.

Darte permiso también significa aceptar que tu trabajo puede ser imperfecto, puede no ser recibido como esperabas, puede incluso fracasar. Y crear de todas formas.''',
      ),
      CapituloResumen(
        titulo: 'La Persistencia: El Arte de Comprometerse con el Proceso',
        emoji: '🌿',
        contenido: '''Una vez que te das permiso y comienzas a crear, aparece el siguiente desafío: mantenerte. Gilbert dedica este capítulo a la realidad cotidiana de la vida creativa, que no es glamorosa ni constantemente inspirada — es trabajo persistente, lleno de días grises, de páginas que no funcionan, de proyectos que se estancan.

El primer principio de la persistencia es NO ESPERAR LA INSPIRACIÓN PARA COMENZAR. La inspiración visita a las personas que están trabajando, no a las que están esperando. Gilbert cita a Chuck Close: "La inspiración es para aficionados. Los demás simplemente se presentan a trabajar." Crear el hábito de sentarse a crear aunque no tengas ganas es más importante que cualquier destellos de inspiración.

El segundo principio es NO NECESITAR SUFRIR. La narrativa del artista como persona que trabaja a pesar de su sufrimiento crea la expectativa de que crear debe doler. Gilbert propone el modelo opuesto: crear puede ser un acto de alegría sostenida, de curiosidad satisfecha, de juego serio. Cuando el proceso se vuelve solo tortuga y nunca placer, algo está mal — o con el proyecto, o con la relación que tienes con él.

El tercer principio es SEPARAR TU IDENTIDAD DE TU OBRA. Si tu valor como persona depende de que tu trabajo sea exitoso o reconocido, cualquier crítica o fracaso se convierte en una amenaza existencial. Cultivar una identidad más amplia — como ser humano completo, no solo como creador — da la estabilidad emocional para sobrevivir el proceso creativo con sus inevitables tropiezos.

La persistencia no es fuerza de voluntad bruta — es enamorarte del proceso lo suficiente como para seguir presentándote.''',
      ),
      CapituloResumen(
        titulo: 'La Confianza: Crear sin Permiso del Mundo',
        emoji: '🌟',
        contenido: '''Gilbert cierra el libro con el concepto de confianza — no autoconfianza en el sentido de creer que tu trabajo es el mejor, sino confianza en el proceso creativo mismo y en tu derecho de participar en él, independientemente de los resultados.

Esta confianza incluye lo que Gilbert llama CREAR SIN RESULTADOS COMO OBJETIVO PRINCIPAL. En la cultura actual, se tiende a valorar la creatividad solo cuando genera dinero, fama o impacto medible. Esta perspectiva mata la creatividad de muchas personas antes de que empiece, porque muy pocas personas podrán vivir de su arte en términos económicos. Pero crear tiene valor intrínseco que no necesita justificarse con resultados externos.

Gilbert cuenta su propia historia: durante años escribió mientras trabajaba como mesera, recepcionista de bar, ayudante de chef. No esperó a poder vivir de la escritura para considerarse escritora. Creaba porque necesitaba hacerlo, porque le daba sentido, porque era quien ella era. El éxito de Comer, Rezar, Amar llegó décadas después de que ella ya se había comprometido con su vida creativa.

La confianza también implica aceptar la opinión del mundo sin dejarse destruir por ella. Las críticas negativas no definen el valor de tu trabajo, y las críticas positivas tampoco — ambas son perspectivas, no verdades absolutas. La persona que crea desde un lugar de confianza puede recibir retroalimentación sin colapsar.

El mensaje final de Gilbert es simple y profundo: tienes derecho a una vida creativa. No necesitas ser extraordinaria para vivir creativamente — solo necesitas presentarte, con curiosidad y valentía, y hacer el trabajo que te llama.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: 'Según Elizabeth Gilbert, ¿cuál es la relación correcta entre el miedo y la creatividad?',
        opciones: [
          'El miedo debe ser completamente eliminado antes de que la creatividad pueda florecer genuinamente',
          'El miedo y la creatividad son incompatibles — no pueden coexistir en el mismo proceso',
          'El miedo puede estar presente siempre que no tome el control — la creatividad conduce y el miedo viaja en el asiento trasero',
          'El miedo es una señal de que no estás listo para crear y debes esperar hasta superarlo',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Gilbert usa la metáfora del auto: creatividad conduce, miedo puede viajar en el asiento trasero pero no puede tocar el volante. El coraje creativo no es ausencia de miedo sino la decisión de crear de todas formas, sin dejar que el miedo paralice el proceso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Gilbert sobre la naturaleza de las ideas creativas en su marco filosófico?',
        opciones: [
          'Las ideas son producto exclusivo del inconsciente individual y no se comparten entre personas',
          'Las ideas son entidades que buscan manifestarse y circulan entre personas hasta encontrar a alguien que actúe sobre ellas',
          'Las ideas solo aparecen a quienes tienen talento innato reconocible desde la infancia',
          'Las ideas son herramientas racionales que se generan mediante técnicas de creatividad estructurada',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Gilbert propone que las ideas son entidades vivas que buscan manifestarse a través de recipientes receptivos. Si una persona no actúa sobre una idea, esta puede "irse" a otro creador. Esta perspectiva reduce la presión del ego y anima a actuar oportunamente sobre las ideas que nos visitan.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué identifica Gilbert como el principal obstáculo para la vida creativa?',
        opciones: [
          'La falta de talento innato que no puede desarrollarse con práctica',
          'La escasez de tiempo libre causada por las responsabilidades laborales y familiares',
          'La falta de permiso — las personas esperan aprobación externa que nunca llega en lugar de darse permiso a sí mismas',
          'La competencia con otros creadores que ya ocupan el espacio disponible en el mercado',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Gilbert identifica la falta de autopermiso como el principal bloqueo. Las personas esperan permiso de críticos, mercados, familias o academias para crear, y ese permiso nunca llega de forma garantizada. La única forma de empezar es darse permiso sin certeza de resultado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué concepto propone Gilbert como punto de partida más sostenible que la "pasión" para la creatividad?',
        opciones: [
          'La ambición de lograr reconocimiento en el campo elegido',
          'La curiosidad — seguir lo que llama tu atención sin exigirte una visión grandiosa',
          'La disciplina rígida de crear cierto número de horas independientemente del interés',
          'La competencia con otros creadores que te motiva a superarte constantemente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Gilbert propone la curiosidad como motor más accesible y sostenible que la pasión ardiente. La curiosidad pregunta: "¿qué me llama la atención? ¿qué disfrutaría explorar?" Sin exigir una visión grandiosa, es suficiente para comenzar y sostener una vida creativa auténtica.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dice Gilbert sobre la relación entre inspiración y trabajo?',
        opciones: [
          'Debes esperar la inspiración antes de comenzar para que el trabajo tenga calidad real',
          'La inspiración es más importante que la técnica, especialmente en las primeras etapas',
          'La inspiración visita a quienes están trabajando — no hay que esperar a sentirla para comenzar',
          'La inspiración es un mito y la creatividad se reduce completamente a técnica y disciplina',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Gilbert cita a Chuck Close: "La inspiración es para aficionados. Los demás simplemente se presentan a trabajar." La inspiración llega durante el proceso, no antes. Crear el hábito de sentarse a crear — especialmente cuando no tienes ganas — es más importante que esperar el momento de inspiración ideal.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Gilbert rechaza la narrativa del "artista torturado"?',
        opciones: [
          'Porque el sufrimiento no existe en el proceso creativo auténtico',
          'Porque asocia la creatividad con el dolor y lleva a las personas a abandonar sus sueños para no sufrir',
          'Porque solo los artistas aficionados sufren durante el proceso creativo',
          'Porque el mercado actual no recompensa a los artistas que proyectan sufrimiento',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La narrativa del artista torturado asocia creatividad con sufrimiento necesario. Esto hace que muchas personas abandonen sus sueños porque no quieren esa vida de miseria. Gilbert propone que una vida creativa puede ser alegre, curiosa y llena de juego — no tiene que ser oscura para ser profunda.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué consejo central da Gilbert sobre esperar poder "vivir de tu arte" antes de comenzar a crear?',
        opciones: [
          'Esperar hasta poder vivir de tu arte garantiza que lo tomarás más en serio y con mayor compromiso',
          'No debes esperar ese momento — puedes comprometerte con tu vida creativa mientras trabajas en otro campo',
          'Solo deben crear profesionalmente quienes pueden garantizarse ingresos desde el principio',
          'El primer año siempre debe ser de transición, dejando el trabajo gradualmente para crear más',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Gilbert escribió durante años mientras trabajaba como mesera y ayudante de chef. No esperó a poder vivir de la escritura para considerarse escritora. Comprometerse con la vida creativa puede coexistir con otras responsabilidades económicas — esperar el momento "perfecto" a menudo significa no comenzar nunca.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo define Gilbert la confianza creativa en el cierre del libro?',
        opciones: [
          'La certeza de que tu trabajo es mejor que el de otros creadores en tu campo',
          'La garantía de que el mercado reconocerá y recompensará tu esfuerzo eventualmente',
          'La confianza en el proceso creativo y en tu derecho de participar en él, independientemente de los resultados',
          'La habilidad técnica suficiente para producir trabajo de alta calidad consistentemente',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La confianza de Gilbert no es arrogancia sobre la calidad del trabajo sino confianza en el derecho de crear y en el proceso mismo. Incluye aceptar que el trabajo puede fallar, que las críticas lleguen, y seguir creando de todas formas porque el acto de crear tiene valor intrínseco.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dice Gilbert sobre la identidad del creador y su relación con su obra?',
        opciones: [
          'Tu valor como persona debe estar directamente ligado a la calidad y éxito de tu trabajo creativo',
          'Separar tu identidad de tu obra es imposible porque el arte es una expresión directa de quién eres',
          'Debes separar tu identidad de tu obra para que las críticas o fracasos no se conviertan en amenazas existenciales',
          'Tu identidad como creador debe construirse solo a través del reconocimiento externo acumulado',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Si tu valor como persona depende del éxito de tu obra, cualquier crítica o fracaso se convierte en una crisis de identidad. Cultivar una identidad más amplia — como ser humano completo, no solo como creador — da estabilidad emocional para sobrevivir el proceso creativo con sus inevitables tropiezos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mensaje final del libro de Gilbert sobre el derecho a la vida creativa?',
        opciones: [
          'Solo quienes tienen talento excepcional y demostrable tienen derecho a una vida creativa plena',
          'El derecho a la vida creativa se gana a través del reconocimiento acumulado a lo largo del tiempo',
          'Cualquier persona tiene derecho a una vida creativa — solo necesita presentarse con curiosidad y valentía y hacer el trabajo',
          'La vida creativa plena requiere condiciones económicas específicas que permitan dedicarle tiempo completo',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Gilbert cierra con un mensaje inclusivo y radical: no necesitas ser extraordinaria ni tener condiciones perfectas para vivir creativamente. Solo necesitas presentarte, con curiosidad y valentía, y hacer el trabajo que te llama. El derecho a la vida creativa no se gana — se ejerce.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 5 — Playing Big: Juega en Grande
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em05',
    titulo: 'Playing Big: Juega en Grande',
    autor: 'Tara Mohr',
    anio: '2014',
    emoji: '🎯',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'Tara Mohr revela por qué las mujeres inteligentes y capaces se contienen, se minimizan y evitan destacar, y ofrece herramientas concretas para superar esos patrones y vivir de acuerdo con su visión más audaz.',
    gemasRecompensa: 68,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Problema: Jugar Pequeño y sus Causas',
        emoji: '🔍',
        contenido: '''Tara Mohr era consultora de empresas cuando comenzó a notar un patrón sorprendente: las mujeres más inteligentes y capacitadas en las organizaciones a menudo eran las que menos visibilidad tenían. No por falta de habilidades sino por una serie de comportamientos aprendidos que Mohr llama JUGAR PEQUEÑO.

Jugar pequeño se manifiesta de múltiples formas: esperar a "estar lista" antes de postular a un puesto superior; pedir disculpas innecesariamente antes de hablar; minimizar logros con frases como "fue suerte" o "fue trabajo de equipo"; evitar compartir una opinión que podría generar controversia; no pedir el aumento que mereces; no proponer la idea que tienes por miedo al rechazo.

La característica central de jugar pequeño no es la incompetencia — es la brecha entre lo que una mujer es capaz de hacer y lo que permite que el mundo vea. Esa brecha es el terreno de trabajo del libro.

Mohr investigó las causas de estos comportamientos y encontró que no son defectos de carácter ni errores individuales — son respuestas aprendidas a mensajes culturales muy específicos que las mujeres reciben desde la infancia. El mensaje de que destacar demasiado es arrogante. El mensaje de que las buenas mujeres son modestas. El mensaje de que tu valor depende de la aprobación de los demás. El mensaje de que es más seguro no arriesgarse.

Reconocer estos mensajes como mensajes culturales — no como verdades sobre quién eres — es el primer paso para cambiar la relación con ellos. No los elegiste conscientementem; pero sí puedes elegir conscientemente si los sigues siguiendo.''',
      ),
      CapituloResumen(
        titulo: 'El Miedo: Pahad y Yirah',
        emoji: '😰',
        contenido: '''Una de las contribuciones más originales de Mohr es la distinción entre dos tipos de miedo que en inglés se expresan con la misma palabra pero que en hebreo bíblico tienen nombres distintos: PAHAD y YIRAH.

PAHAD es el miedo al peligro real o imaginado — el miedo proyectado hacia futuros catastróficos que probablemente no ocurrirán. Es la voz que dice: "Si presento esta idea y la rechazan, pensarán que soy incompetente, y perderé credibilidad, y no ascenderé, y al final perderé el trabajo." Este tipo de miedo vive en el futuro, genera ansiedad paralizante y rara vez se corresponde con la realidad.

YIRAH es un miedo completamente distinto: la sensación que acompaña al crecimiento genuino, a pisar territorio desconocido, a expandirse más allá de los límites conocidos. No es alerta de peligro — es señal de que estás en el umbral de algo nuevo. La versión sana de este sentimiento puede traducirse como asombro, emoción nerviosa, o reconocimiento de que estás a punto de crecer.

La confusión entre los dos tipos de miedo causa un error crítico: tratar el yirah como si fuera pahad — interpretar la señal de crecimiento como señal de peligro y retroceder precisamente cuando más importa avanzar.

Mohr ofrece una pregunta para distinguirlos: ¿Este miedo me alerta de un peligro real y probable, o me está señalando una oportunidad de crecimiento que siento como amenaza? Cuando es yirah, la respuesta correcta no es retroceder sino respirar, sentirlo, y avanzar de todas formas.''',
      ),
      CapituloResumen(
        titulo: 'El Crítico Interior: Reconocerlo y Desidentificarse',
        emoji: '🧠',
        contenido: '''Mohr dedica un capítulo central al CRÍTICO INTERIOR — la voz interna que predice el fracaso, recuerda errores pasados, compara desfavorablemente con otros y genera dudas constantes sobre la propia capacidad. Esta voz es universal pero las investigaciones muestran que en las mujeres tiende a ser más activa y más cruel.

La mayoría de las personas tienen una relación de lucha o sumisión con su crítico interior: o intentan silenciarlo forzosamente (lo que raramente funciona) o lo creen completamente y actúan en consecuencia. Mohr propone un tercer camino: observarlo sin identificarse con él.

El crítico interior no es tu verdadero yo — es un patrón de pensamiento aprendido que intenta protegerte de riesgos (percibidos o reales) a través de la autocrítica preventiva. Cuando el crítico dice "tu idea es mediocre", lo que intenta es protegerte de la posibilidad de que otros piensen lo mismo. La intención no es dañina — el efecto sí puede serlo.

Mohr enseña a reconocer al crítico interior por sus patrones característicos: habla en absolutos ("nunca", "siempre", "todos"), compara desfavorablemente, predice catástrofes, y especialmente se activa justo antes de que hagas algo nuevo o arriesgado.

El ejercicio clave: cuando el crítico aparece, no te pelee con él ni lo sigas. Simplemente observa: "Ahí está el crítico interior diciendo que mi idea es mediocre." Esta pequeña distancia — observar en lugar de identificarte — reduce dramáticamente el poder que el crítico tiene sobre tus decisiones.''',
      ),
      CapituloResumen(
        titulo: 'El Mentor Interior: Tu Sabiduría más Profunda',
        emoji: '🌠',
        contenido: '''Como contrapeso al crítico interior, Mohr introduce el concepto del MENTOR INTERIOR — la voz de tu sabiduría más profunda, tu visión más audaz de quién puedes ser, la perspectiva que ve tu potencial sin las distorsiones del miedo o la comparación.

El mentor interior no es un ideal inalcanzable ni una fantasía — es una representación simbólica de la sabiduría que ya tienes acceso, aunque no siempre la escuches. Mohr lo describe como la versión de ti misma que ya está del otro lado del crecimiento que más te importa, y que puede mirarte desde allí con compasión y claridad.

El ejercicio central que Mohr enseña es la CONVERSACIÓN CON EL MENTOR INTERIOR: en journaling o en meditación, imaginas a tu mentora de 20 años en el futuro — la versión más sabia de ti misma — y le preguntas sobre la situación que enfrentas. ¿Qué perspectiva tiene ella? ¿Qué diría sobre el miedo que sientes? ¿Qué te recomendaría? ¿Qué sabe ella que tú aún no ves?

Este ejercicio funciona no porque el futuro sea predecible sino porque cambiar la perspectiva temporal activa una parte de ti que ya tiene claridad. Cuando te identificas con la versión futura de ti misma, hablas desde tu sabiduría, no desde tu ansiedad.

El mentor interior también representa la visión más amplia: recuerda por qué importa lo que estás haciendo, cuál es el impacto que quieres crear, qué te mueve en los niveles más profundos. Esta perspectiva es el antídoto al ruido cotidiano del crítico.''',
      ),
      CapituloResumen(
        titulo: 'Jugar en Grande: Visión, Acción y Retroalimentación',
        emoji: '🚀',
        contenido: '''En los capítulos finales, Mohr integra todas las herramientas en el concepto de JUGAR EN GRANDE — vivir y trabajar de acuerdo con tu visión más audaz, en lugar de en el rango de lo que parece seguro o modesto.

Jugar en grande empieza con clarificar tu visión: ¿qué quieres crear en el mundo? No lo que sería razonable dada tu situación actual, sino lo que genuinamente te llama cuando el miedo no está dominando la conversación. Mohr guía a las lectoras a distinguir entre metas externas (logros que otros reconocerán) y contribuciones internas (el impacto que quieres tener en la vida de las personas y en el mundo).

Luego introduce el concepto de ACCIÓN AUDAZ: hacer el siguiente paso que honraría tu visión, aunque sea incómodo. No la acción perfecta ni la acción que garantiza el éxito — la acción que está alineada con quién quieres ser y con el impacto que quieres crear. La acción audaz rara vez es grandiosa en el momento — es enviar el email, proponer la idea, postular al puesto, publicar el artículo.

Un componente crucial para jugar en grande es la relación sana con la retroalimentación. Mohr enseña a distinguir entre retroalimentación útil (información específica sobre cómo mejorar tu trabajo) e irrelevante (opiniones sobre si deberías hacer lo que haces en absoluto). Solo la primera merece peso en tus decisiones.

El libro cierra con la pregunta que más importa: ¿Qué dejarías de hacer si supieras que el mundo tiene suficiente de ti como para manejar que juegues en grande?''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué describe Tara Mohr con el concepto de "jugar pequeño"?',
        opciones: [
          'Elegir carreras o proyectos que requieren menos esfuerzo y compromiso a largo plazo',
          'La brecha entre lo que una mujer es capaz de hacer y lo que permite que el mundo vea, por miedos aprendidos',
          'Enfocarse en tareas pequeñas y específicas en lugar de objetivos grandes y ambiguos',
          'Pedir retroalimentación constante antes de tomar decisiones para minimizar el riesgo de error',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Jugar pequeño no es incompetencia — es la brecha entre capacidad real y visibilidad permitida. Se manifiesta en pedir disculpas innecesarias, minimizar logros, evitar opiniones controversiales, y esperar estar "lista" antes de actuar. Son respuestas aprendidas a mensajes culturales, no defectos de carácter.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre "pahad" y "yirah" según Tara Mohr?',
        opciones: [
          'Pahad es miedo racional y yirah es miedo irracional sin base en la realidad',
          'Pahad es miedo proyectado a futuros catastróficos, yirah es la sensación que acompaña al crecimiento genuino',
          'Pahad es miedo a personas específicas y yirah es miedo a situaciones abstractas',
          'Pahad ocurre antes de actuar y yirah ocurre después de cometer errores reales',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Pahad es el miedo al peligro real o imaginado que vive en el futuro y genera ansiedad paralizante. Yirah es la sensación de estar en el umbral del crecimiento — no es alerta de peligro sino señal de expansión. Confundirlos lleva a retroceder precisamente cuando más importa avanzar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el enfoque que propone Mohr para relacionarse con el crítico interior?',
        opciones: [
          'Silenciarlo a través de afirmaciones positivas que contradigan cada pensamiento negativo',
          'Seguir sus consejos porque suelen señalar áreas reales de mejora y debilidad',
          'Observarlo sin identificarse con él — reconocerlo como patrón aprendido, no como tu verdadero yo',
          'Ignorarlo completamente para evitar que sus mensajes interfieran con la acción',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Mohr propone un tercer camino entre luchar con el crítico y creerle: observarlo sin identificarte con él. "Ahí está el crítico diciendo que mi idea es mediocre" — esta pequeña distancia reduce dramáticamente su poder. El crítico no es tu yo verdadero sino un patrón aprendido de protección preventiva.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "mentor interior" según Mohr y para qué sirve?',
        opciones: [
          'Un coach externo de confianza que conoce tu historia y puede orientarte objetivamente',
          'La voz de tu sabiduría más profunda — la versión futura y más sabia de ti misma',
          'El conjunto de retroalimentaciones positivas que has recibido a lo largo de tu carrera',
          'La imagen idealizada de un referente externo que te inspira a alcanzar sus logros',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El mentor interior es una representación simbólica de la sabiduría que ya tienes acceso — la versión futura y más sabia de ti misma que puede ver tu situación con claridad y compasión. Dialogar con esta figura activa perspectivas más amplias que contrarrestan el ruido del crítico interior y el miedo cotidiano.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo diferencia Mohr la retroalimentación útil de la irrelevante?',
        opciones: [
          'La retroalimentación útil viene siempre de expertos reconocidos y la irrelevante de aficionados',
          'Útil es la que te hace sentir bien y la irrelevante es la que genera incomodidad o crítica',
          'Útil es información específica sobre cómo mejorar tu trabajo; irrelevante es opinión sobre si deberías hacer lo que haces',
          'La retroalimentación útil siempre incluye ejemplos concretos mientras la irrelevante es general',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Mohr distingue entre retroalimentación sobre el trabajo (cómo mejorar algo específico — útil) y retroalimentación sobre si deberías hacerlo en absoluto (si tu visión es válida — irrelevante para tomar decisiones propias). Solo la primera merece peso real en tus decisiones. Mezclarlas produce parálisis innecesaria.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué describe Mohr como "acción audaz" dentro del marco de jugar en grande?',
        opciones: [
          'Hacer cambios radicales y públicos de forma simultánea para maximizar el impacto visible',
          'Esperar a tener certeza de éxito antes de actuar para no desperdiciar energía en intentos fallidos',
          'El siguiente paso que honra tu visión aunque sea incómodo — no la acción perfecta sino la alineada',
          'Declarar públicamente tu visión más audaz para que el compromiso externo te mantenga en curso',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La acción audaz no es grandiosa en el momento — es enviar el email, proponer la idea, publicar el artículo. No requiere garantía de éxito ni perfección. Solo requiere que esté alineada con quién quieres ser y con el impacto que quieres crear. La acción audaz rara vez se siente heroica en el momento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la causa que identifica Mohr detrás de los comportamientos de "jugar pequeño"?',
        opciones: [
          'Defectos individuales de carácter que requieren trabajo psicológico intensivo para superarse',
          'Mensajes culturales aprendidos desde la infancia sobre modestia, aprobación y seguridad femenina',
          'Diferencias biológicas en la tolerancia al riesgo entre hombres y mujeres',
          'Falta de educación formal en liderazgo y habilidades de negociación desde temprana edad',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Mohr insiste en que jugar pequeño no es un defecto de carácter — es una respuesta aprendida a mensajes culturales muy específicos: destacar es arrogante, las buenas mujeres son modestas, tu valor depende de aprobación ajena. Reconocer estos mensajes como culturales, no como verdades sobre quién eres, es el primer paso para cambiar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distinción hace Mohr entre metas externas y contribuciones internas?',
        opciones: [
          'Las metas externas son más importantes porque generan reconocimiento y recompensas medibles',
          'Las contribuciones internas son las que otros esperan de ti; las externas son las que tú deseas',
          'Las metas externas son logros reconocibles por otros; las contribuciones internas son el impacto real que quieres crear',
          'Las metas externas se logran rápido y las contribuciones internas requieren décadas de trabajo sostenido',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Mohr distingue entre perseguir metas externas (títulos, ascensos, reconocimiento) y clarificar contribuciones internas (el impacto que genuinamente quieres tener en personas y en el mundo). Las contribuciones internas generan motivación más sostenible y alineación más profunda entre lo que haces y quién eres.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo aparece el "yirah" en situaciones de crecimiento real según Mohr?',
        opciones: [
          'Como una sensación de certeza tranquila que señala que estás tomando la decisión correcta',
          'Como señal de que debes detener el plan y buscar una alternativa más segura',
          'Como emoción nerviosa, asombro o sensación de estar en el umbral de algo nuevo — señal de crecimiento',
          'Solo aparece en personas con poca experiencia; desaparece con el tiempo y la práctica acumulada',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El yirah es la sensación que acompaña al crecimiento genuino: emoción nerviosa, asombro, reconocimiento de que estás pisando territorio desconocido. No es alerta de peligro — es señal de expansión. La respuesta correcta al yirah no es retroceder sino reconocerlo, respirar y avanzar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la pregunta final con que Mohr cierra el libro?',
        opciones: [
          '¿Cuánto tiempo más vas a esperar para ser quien realmente eres?',
          '¿Qué dejarías de hacer si supieras que el mundo tiene suficiente de ti para manejar que juegues en grande?',
          '¿Cuál sería tu siguiente paso si supieras que no puedes fallar en el intento?',
          '¿Qué necesitas aprender todavía antes de sentirte lista para actuar con tu visión más amplia?',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La pregunta final de Mohr invierte la lógica del miedo: en lugar de preguntar qué harías sin miedo, pregunta qué dejarías de hacer si el mundo pudiera manejarte jugando en grande. Implica que la contención es un servicio mal entendido — el mundo no necesita que te hagas pequeña para funcionar.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 6 — Yo Soy Malala
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em06',
    titulo: 'Yo Soy Malala',
    autor: 'Malala Yousafzai',
    anio: '2013',
    emoji: '📚',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'La historia real de la joven pakistaní que desafió a los talibanes para defender el derecho a la educación de las niñas y sobrevivió un atentado que se convirtió en el origen de un movimiento global.',
    gemasRecompensa: 80,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Valle de Swat: Una Infancia en el Paraíso',
        emoji: '🏔️',
        contenido: '''Malala Yousafzai nació en 1997 en Mingora, la ciudad principal del Valle de Swat, en el noroeste de Pakistán. Swat era conocido como el Suiza del Este — un valle de montañas espectaculares, ríos cristalinos y una cultura que, en los tiempos de su infancia, era relativamente abierta y hospitalaria.

Su padre, Ziauddin Yousafzai, era maestro de escuela y fundador de una cadena de colegios en Swat. Era una figura central en la comunidad, un orador apasionado, un hombre que creía profundamente en la educación como instrumento de transformación social. Desde muy pequeña, Malala fue testigo de cómo su padre debatía en las reuniones locales, desafiaba convenciones, y defendía el derecho de las niñas a educarse en una región donde esa idea era controvertida.

Lo que diferencia a Ziauddin de muchos padres de su cultura y tiempo es específico y poderoso: cuando su hija nació, en lugar de la decepción que muchos hombres pashtun sienten al no tener un hijo varón, Ziauddin la registró en el árbol genealógico de la familia — algo que nunca se hacía con las niñas. "Malala brillará como una luz," dijo, y pasó su vida entera alimentando esa luz.

Malala describe su infancia como feliz, curiosa e intensamente conectada a la comunidad. Competía en debates escolares, amaba la física y los libros, y soñaba con ser médica. Pero incluso en ese período relativamente estable, los signos del conflicto que vendría eran visibles: la presencia militar, las tensiones religiosas, los rumores sobre grupos extremistas que ganaban influencia en las montañas.''',
      ),
      CapituloResumen(
        titulo: 'Los Talibanes: Cuando el Paraíso se Oscureció',
        emoji: '⚡',
        contenido: '''Entre 2007 y 2009, los talibanes tomaron progresivo control del Valle de Swat. La transformación fue gradual pero inexorable: primero aparecieron los sermones radicales en las mezquitas, transmitidos por radio FM clandestina. Luego llegaron las intimidaciones, los panfletos amenazantes, las explosiones. Finalmente, el control explícito de la vida pública.

Las primeras restricciones golpearon con fuerza las libertades cotidianas: prohibición de música, de baile, de televisión, de deportes para las niñas. Malala recuerda el día en que la barbería del vecindario fue amenazada si seguía ofreciendo cortes de pelo "no islámicos", y el día en que los quioscos de CD fueron incendiados. La vida que conocía se iba desarmando pieza por pieza.

Pero la restricción que más afectó a Malala y su familia fue la prohibición de educación para las niñas. El 15 de enero de 2009, los talibanes proclamaron que ninguna niña podría ir a la escuela bajo amenaza de represalia. Malala tenía once años y enfrentó una decisión que nadie debería tener que tomar a esa edad: obedecer y abandonar su educación, o resistir y arriesgar las consecuencias.

Durante este período, Malala comenzó a bloguear de forma anónima para la BBC en urdu bajo el pseudónimo "Gul Makai" (nombre de un personaje folclórico). Describía la vida cotidiana bajo los talibanes con la perspectiva de una niña: el miedo, la determinación, la pérdida. Sus palabras llegaron al mundo exterior y el mundo empezó a prestar atención a Swat.''',
      ),
      CapituloResumen(
        titulo: 'Una Voz que el Mundo Escuchó',
        emoji: '🎙️',
        contenido: '''A medida que la situación en Swat empeoró y eventualmente llevó a un conflicto militar que desplazó a millones de personas, Malala comenzó a hablar con nombre propio. Con el apoyo de su padre, comenzó a dar entrevistas a medios locales e internacionales sobre el derecho de las niñas a la educación.

Su argumento era simple y poderoso: la educación es un derecho humano fundamental, no un privilegio que las autoridades religiosas o políticas pueden conceder o revocar. Esta posición no era popular en las zonas bajo influencia talibán — era peligrosa. Las amenazas comenzaron a llegar específicamente dirigidas a ella.

Malala y su familia recibieron advertencias de diversas fuentes. Los servicios de inteligencia pakistaníes les alertaron. Periodistas y activistas les informaron sobre amenazas específicas. La familia discutía la situación regularmente, y la conclusión de Malala era consistente: retirarse del discurso público sería una forma de darle a los talibanes exactamente lo que querían — el silencio de las voces que los desafiaban.

Ziauddin no callaba a su hija para protegerla — la apoyaba en encontrar su propia voz. Esta decisión, que muchos consideraron irresponsable, refleja una convicción profunda que Malala comparte: vivir en silencio frente a la injusticia también tiene un costo. El miedo que paraliza tiene sus propias víctimas.

En 2011, Malala recibió el Premio Nacional de la Paz de Pakistán. Tenía catorce años. El reconocimiento internacional aumentó su perfil pero también su exposición como objetivo.''',
      ),
      CapituloResumen(
        titulo: 'El Ataque y la Supervivencia',
        emoji: '🏥',
        contenido: '''El 9 de octubre de 2012, Malala viajaba en el autobús escolar de regreso a casa después de un examen cuando un hombre armado talibán detuvo el vehículo, preguntó quién era Malala Yousafzai, y disparó tres veces. Una bala penetró por encima del ojo izquierdo, recorrió la mejilla y el cuello, y se alojó cerca de la médula espinal.

Malala cayó inconsciente. Sus compañeras también fueron heridas. La trasladaron de emergencia a un hospital en Peshawar, luego a un hospital militar pakistaní, y finalmente — cuando quedó claro que su tratamiento requería recursos especializados — fue evacuada al Queen Elizabeth Hospital en Birmingham, Inglaterra.

Durante días la humanidad contuvo la respiración. Las redes sociales se llenaron de mensajes de #IAmMalala. Líderes mundiales expresaron su indignación. El ataque, lejos de silenciar su causa, la amplificó al mundo entero.

La recuperación fue lenta y dolorosa: cinco horas de cirugía craneal, problemas auditivos del oído izquierdo que requirieron implante coclear, fisioterapia extensa, meses de rehabilitación. Pero Malala no perdió la capacidad de hablar, de pensar, de recordar. Médicos del mundo describieron su recuperación como milagrosa.

Lo que más impresionó a quienes la atendieron fue su actitud durante la recuperación: sin odio hacia sus atacantes, con claridad sobre su propósito, y con urgencia de volver a la causa por la que casi pierde la vida. "No tienen armas suficientes para silenciarme," diría después.''',
      ),
      CapituloResumen(
        titulo: 'La Misión que Sobrevivió: Educación para Todas',
        emoji: '🌍',
        contenido: '''El ataque transformó a Malala de activista local en símbolo global. Desde Birmingham, donde se instaló con su familia, continuó su educación y su activismo. En julio de 2013, el día de su decimosexto cumpleaños, habló ante la Asamblea de la ONU en Nueva York en lo que se convirtió en uno de los discursos más citados del siglo: "Un niño, un maestro, un libro y un lápiz pueden cambiar el mundo."

En 2013, el mismo año en que se publicó su libro, Malala y su padre fundaron el Fondo Malala — una organización dedicada a garantizar doce años de educación pública gratuita y de calidad para todas las niñas del mundo. El fondo opera en diez países donde las niñas enfrentan las mayores barreras para educarse: Pakistán, Afganistán, Etiopía, Nigeria, India, Brasil, entre otros.

En 2014, a los diecisiete años, Malala recibió el Premio Nobel de la Paz — la persona más joven en la historia en recibir ese reconocimiento. Su discurso de aceptación fue un llamado a la acción global: no conmemoración de su sufrimiento sino un mapa de trabajo hacia un mundo donde ninguna niña sea excluida del conocimiento.

El mensaje central de Malala no es sobre ella misma — es sobre la educación como derecho inalienable. No importa la religión, la cultura, la geografía o el género: toda persona tiene derecho a aprender, a conocer el mundo, a desarrollar su mente. Las fuerzas que se oponen a ese derecho, independientemente de cómo se justifiquen, están del lado equivocado de la historia.

Su historia es un recordatorio de que la voz de una sola persona — especialmente una voz que se niega a callarse — puede cambiar el mundo.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué distinguió a Ziauddin Yousafzai, padre de Malala, de muchos padres de su cultura?',
        opciones: [
          'Fue el primer hombre de su familia en recibir educación universitaria formal',
          'Registró a Malala en el árbol genealógico familiar y la apoyó activamente — algo inusual para las niñas pashtun',
          'Emigró a Inglaterra para darle a su hija acceso a mejores oportunidades educativas',
          'Rechazó las tradiciones religiosas de su comunidad desde muy joven',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Ziauddin registró a Malala en el árbol genealógico de la familia — práctica reservada para varones en la cultura pashtun — y declaró desde su nacimiento que "brillaría como una luz". Su apoyo activo a la voz pública de su hija fue determinante en su desarrollo como activista.',
      ),
      const PreguntaLibro(
        enunciado: '¿Bajo qué pseudónimo comenzó Malala a bloguear para la BBC durante el período talibán?',
        opciones: [
          'Zainab Hussain',
          'Gul Makai',
          'Noor Islamabad',
          'Fatima Swat',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Malala blogueó anónimamente como "Gul Makai" — nombre de un personaje del folclore pashtun. Describía la vida cotidiana bajo los talibanes desde la perspectiva de una niña de once años, y sus palabras llegaron al mundo exterior cuando el Valle de Swat estaba prácticamente cerrado para los medios internacionales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué proclamaron los talibanes el 15 de enero de 2009 en el Valle de Swat?',
        opciones: [
          'La prohibición de cualquier actividad comercial durante las horas de oración',
          'La expulsión de todos los extranjeros y periodistas internacionales de la región',
          'Que ninguna niña podría ir a la escuela bajo amenaza de represalia',
          'La clausura de todos los medios de comunicación locales incluyendo la radio',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El 15 de enero de 2009, cuando Malala tenía once años, los talibanes proclamaron la prohibición de educación para las niñas bajo amenaza de represalia. Esta prohibición fue el detonante más directo de su activismo público, ya que eligió hablar en contra de ella en lugar de obedecer y abandonar su educación.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál fue la posición constante de Malala cuando recibió advertencias sobre amenazas a su seguridad?',
        opciones: [
          'Retirarse temporalmente del discurso público hasta que la situación de seguridad mejorara',
          'Mudarse a otra ciudad donde pudiera continuar su activismo con menos exposición directa',
          'Continuar hablando porque retirarse sería darle a los talibanes el silencio que buscaban',
          'Pedir protección policial formal antes de continuar con cualquier aparición pública',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Malala consideraba que vivir en silencio frente a la injusticia tiene su propio costo. Retirarse del discurso público sería darle a los talibanes exactamente lo que buscaban: el silencio de las voces que los desafiaban. Esta convicción sostuvo su activismo incluso cuando las amenazas eran específicas y creíbles.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué ocurrió el 9 de octubre de 2012?',
        opciones: [
          'Malala recibió el Premio Nacional de la Paz de Pakistán por su activismo educativo',
          'Un atacante talibán le disparó en el autobús escolar, hiriendo también a sus compañeras',
          'Los talibanes incendiaron la escuela fundada por su padre en Mingora',
          'Malala dio su primer discurso público internacional sobre educación femenina',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El 9 de octubre de 2012, un hombre armado detuvo el autobús escolar, preguntó por Malala y disparó tres veces. Una bala le atravesó la cabeza. Fue trasladada de urgencia a Pakistán y luego a Birmingham, Inglaterra, donde se recuperó después de una cirugía de cinco horas que el mundo siguió con angustia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál fue el efecto inmediato del ataque talibán sobre la causa de Malala?',
        opciones: [
          'Silenció su causa temporalmente mientras la comunidad internacional procesaba el shock',
          'Redujo el apoyo internacional porque muchos gobiernos temían involucrarse en conflictos locales',
          'Amplificó su causa al mundo entero, convirtiendo a Malala en símbolo global',
          'Motivó al gobierno pakistaní a negociar directamente con los talibanes para proteger a las activistas',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Lejos de silenciar su causa, el ataque la amplificó globalmente. Las redes sociales se llenaron de #IAmMalala, líderes mundiales expresaron indignación, y la historia de una niña que casi muere por defender el derecho a la educación llegó a todos los rincones del planeta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo y ante qué organización dio Malala su famoso discurso "Un niño, un maestro, un libro y un lápiz"?',
        opciones: [
          'En 2012 ante el Parlamento Europeo, días después de recibir el Premio Sájarov',
          'En 2013 ante la Asamblea de la ONU en Nueva York, el día de su decimosexto cumpleaños',
          'En 2014 en Oslo al recibir el Premio Nobel de la Paz a los diecisiete años',
          'En 2015 en Washington D.C. en una sesión conjunta del Congreso estadounidense',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El 12 de julio de 2013 — el día de su decimosexto cumpleaños — Malala habló ante la Asamblea General de la ONU. Su discurso, que incluye la frase "Un niño, un maestro, un libro y un lápiz pueden cambiar el mundo," se convirtió en uno de los discursos más citados del siglo XXI.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué reconocimiento recibió Malala en 2014 y por qué fue históricamente significativo?',
        opciones: [
          'El Premio Sájarov — primera vez que fue otorgado a una persona menor de 25 años',
          'El Premio Nobel de la Paz — se convirtió en la persona más joven en la historia en recibirlo',
          'El Premio Princesa de Asturias — primera persona pakistaní en recibir ese honor',
          'El Premio de Derechos Humanos de la ONU — primera activista no profesional en recibirlo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'En 2014, a los diecisiete años, Malala recibió el Premio Nobel de la Paz convirtiéndose en la persona más joven en la historia en recibir ese reconocimiento. Lo compartió con Kailash Satyarthi de India. Su discurso de aceptación fue un llamado a la acción global por la educación de todas las niñas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el enfoque del Fondo Malala fundado en 2013?',
        opciones: [
          'Proveer asistencia médica a víctimas de ataques terroristas en zonas de conflicto activo',
          'Garantizar doce años de educación pública gratuita y de calidad para todas las niñas del mundo',
          'Financiar la formación de maestros en regiones rurales de Pakistán y Afganistán',
          'Apoyar económicamente a familias que huyen de regímenes extremistas en el sur de Asia',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El Fondo Malala se dedica específicamente a garantizar doce años de educación pública gratuita y de calidad para todas las niñas del mundo. Opera en diez países donde las niñas enfrentan las mayores barreras para educarse, incluyendo Pakistán, Afganistán, Etiopía, Nigeria e India.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mensaje central del libro y el activismo de Malala?',
        opciones: [
          'El Islam debe reformarse internamente para dar más derechos a las mujeres pakistaníes',
          'Los países occidentales tienen la responsabilidad de intervenir militarmente para proteger a las niñas en peligro',
          'La educación es un derecho humano inalienable de toda persona, independientemente de religión, cultura o género',
          'Las niñas que viven en zonas de conflicto deben ser evacuadas a países seguros antes de poder educarse',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El mensaje central de Malala no es específicamente sobre Pakistán, el Islam ni los talibanes — es universal: toda persona tiene derecho a aprender y desarrollar su mente. Las fuerzas que se oponen a ese derecho, cualquiera sea su justificación, están del lado equivocado de la historia. Una voz que se niega a callarse puede cambiar el mundo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 7 — Lean In
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em07',
    titulo: 'Lean In: Las Mujeres, el Trabajo y la Voluntad de Liderar',
    autor: 'Sheryl Sandberg',
    anio: '2013',
    emoji: '💼',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'La COO de Facebook revela por qué las mujeres siguen siendo minoría en los puestos de poder y qué pueden hacer ellas mismas — sin esperar que el sistema cambie primero.',
    gemasRecompensa: 62,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Brecha de Ambición',
        emoji: '📊',
        contenido: '''Sheryl Sandberg partió de una observación incómoda: décadas después de los grandes avances del feminismo, las mujeres siguen siendo minoría dramática en las posiciones de mayor poder. El 4% de los CEOs de Fortune 500, menos del 20% en casi todos los directorios corporativos.

Las causas estructurales son reales: discriminación, políticas incompatibles con la crianza, culturas corporativas hostiles. Sandberg no las niega. Pero señala una causa adicional que raramente se discute: las mujeres mismas a veces se frenan antes de que el sistema las frene.

La "brecha de ambición": los estudios muestran que desde la adolescencia las niñas empiezan a reportar menos ambición que los niños aunque tienen igual capacidad. No porque sean menos capaces — porque aprendieron que la ambición femenina es socialmente penalizada mientras la masculina es recompensada.

La mujer "exitosa" es menos popular que el hombre "exitoso" en casi todos los estudios de percepción. El hombre que negocia un salario es "asertivo". La mujer que hace lo mismo es "agresiva". Esta asimetría en las consecuencias sociales frena la ambición femenina de maneras muy concretas.

Sandberg propone que esperar a que el mundo sea perfectamente justo antes de ser ambiciosa es una estrategia perdedora. El mundo cambia más rápido cuando hay más mujeres en posiciones de poder que pueden cambiarlo desde adentro.''',
      ),
      CapituloResumen(
        titulo: 'El Síndrome del Impostor',
        emoji: '🎭',
        contenido: '''El "síndrome del impostor" es la creencia de que en cualquier momento alguien descubrirá que no eres tan capaz como parece y te expondrá como un fraude. La investigación muestra que afecta más a las mujeres que a los hombres, especialmente en entornos de alta competencia.

Los hombres tienden a atribuir sus éxitos a sus capacidades. Las mujeres tienden a atribuirlos a la suerte, la ayuda de otros, o la dificultad reducida de la tarea. Esta diferencia en la atribución produce que las mujeres se sientan más vulnerables.

Sandberg comparte sus propias experiencias: a pesar de haber llegado a los más altos niveles corporativos de Silicon Valley, durante años sintió que en cualquier momento alguien descubriría que no pertenecía ahí. Lo que aprendió: ese sentimiento nunca desaparece completamente, pero puedes actuar a pesar de él.

La asimetría en la negociación salarial: las mujeres piden aumentos y ascensos significativamente menos que los hombres con capacidades equivalentes. No porque no quieran — sino porque anticipan las consecuencias sociales negativas. El resultado: una brecha salarial que en parte se auto-inflige.

Sandberg propone el ejercicio mental "¿qué haría si no tuviera miedo?". La respuesta frecuentemente señala hacia la carrera o la acción que realmente deseas pero que el miedo ha frenado.''',
      ),
      CapituloResumen(
        titulo: 'Sentarse en la Mesa',
        emoji: '🪑',
        contenido: '''En reuniones ejecutivas, los hombres tienden a sentarse en la mesa principal. Las mujeres, especialmente las más jóvenes, tienden a sentarse contra la pared o en sillas auxiliares — aunque hayan sido invitadas.

Esta tendencia física es metáfora de algo mayor: la tendencia de muchas mujeres a ocupar menos espacio, hablar menos, interrumpir menos, presentar sus ideas con mayor calificación ("no sé si esto es relevante, pero..."), disculparse antes de hacer preguntas.

El costo de la auto-minimización: cuando una persona con buenas ideas no las presenta o las presenta de manera tan tentativa que no se toman en serio, todos pierden. La organización pierde una perspectiva valiosa.

La doble trampa de "no ser suficientemente asertiva" y "ser demasiado asertiva": las mujeres navegan un pasillo estrecho donde hablar poco las hace invisibles y hablar con confianza las hace antipáticas. Sandberg propone estrategias para navegarla: enmarcar la asertividad en términos de los beneficios para el equipo.

El mentor y el patrocinador: un mentor da consejo. Un patrocinador usa su capital político para abrir puertas y defender a la mujer cuando no está en la sala. Las mujeres tienen acceso más fácil a mentores que a patrocinadores — y los patrocinadores son los que hacen la diferencia real.''',
      ),
      CapituloResumen(
        titulo: 'El Mito de Tenerlo Todo',
        emoji: '⚖️',
        contenido: '''"Tenerlo todo" es un mito dañino. Nadie — hombre ni mujer — puede tener todo perfectamente al mismo tiempo sin costo. La diferencia es que las mujeres frecuentemente empiezan a "inclinarse hacia atrás" (lean back) en sus carreras antes de necesitarlo.

La decisión de pareja es la más importante de la carrera: Sandberg es directa. Las mujeres con parejas que comparten equitativamente el trabajo del hogar y la crianza tienen carreras más exitosas. No es posible que la mujer trabaje a pleno rendimiento si también lleva el 80% de la carga doméstica.

La trampa de la perfecta madre: el estándar de "buena madre" ha subido exponencialmente en las últimas décadas — mientras el de "buen padre" ha permanecido más estable. Una madre que trabaja a tiempo completo es juzgada por no estar "suficientemente presente". Un padre que trabaja a tiempo completo raramente enfrenta esa presión.

La trampa de la anticipación: muchas mujeres empiezan a frenar su ambición anticipando la maternidad que quizás planifican pero que está a años de distancia. Esta anticipación del problema lleva a perder oportunidades presentes.

Sandberg reconoce sus propios privilegios: habla principalmente desde la perspectiva de mujeres con opciones. Su mayor fortaleza y su mayor limitación son la misma: no todos los problemas que enfrenta son los de una mujer de bajos ingresos o sin pareja.''',
      ),
      CapituloResumen(
        titulo: 'El Liderazgo Femenino del Futuro',
        emoji: '🌟',
        contenido: '''Sandberg no propone que las mujeres se conviertan en hombres de traje para tener éxito. Propone que el mundo del trabajo se beneficiaría profundamente de más mujeres en posiciones de liderazgo.

Los estudios sobre liderazgo femenino: las organizaciones con mayor diversidad de género en posiciones de liderazgo tienen mejores resultados financieros, mayor innovación, y mejor clima organizacional en promedio. No porque las mujeres sean "mejores líderes" en abstracto — sino porque la diversidad de perspectivas produce mejores decisiones.

El ciclo virtuoso del liderazgo femenino: más mujeres en posiciones de poder crean ambientes más acogedores para más mujeres, que a su vez producen más modelos a seguir para la generación siguiente. Romper el techo de cristal beneficia a todas las que vienen después.

Los hombres como aliados necesarios: el cambio requiere aliados masculinos que reconozcan las asimetrías del sistema. No por caridad — sino porque las organizaciones y las sociedades más igualitarias son también más prósperas y más justas para todos.

La visión final: un mundo donde ninguna mujer tenga que elegir entre su familia y su ambición profesional. Donde "liderar como mujer" no sea un oxímoron. El camino es largo — y requiere que más mujeres se inclinen hacia adelante ahora.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué significa "lean in" en el contexto del libro de Sandberg?',
        opciones: [
          'Una postura corporal que proyecta confianza en reuniones de negocios',
          'No frenarse antes de que el sistema te frene — participar activamente en lugar de retirarse anticipadamente',
          'Trabajar más horas que los colegas para demostrar compromiso',
          'Adaptarse a las normas masculinas del ambiente corporativo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Sandberg observó que muchas mujeres se frenan antes de que el sistema las frene. "Lean in" es la invitación a no hacerlo — ocupar el espacio que te corresponde sin esperar permiso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo se diferencia la atribución de éxitos entre hombres y mujeres según la investigación citada por Sandberg?',
        opciones: [
          'Los hombres atribuyen éxito a la suerte; las mujeres a su esfuerzo',
          'Los hombres atribuyen sus éxitos a sus capacidades; las mujeres a la suerte, la ayuda de otros o la facilidad de la tarea',
          'No existe diferencia significativa en cómo ambos géneros atribuyen sus éxitos',
          'Las mujeres son más precisas en evaluar sus capacidades que los hombres',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Esta diferencia de atribución hace que las mujeres se sientan más vulnerables al síndrome del impostor. Si el éxito fue suerte, en cualquier momento la suerte puede acabarse. Si fue capacidad, la capacidad se mantiene.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia identifica Sandberg entre mentor y patrocinador?',
        opciones: [
          'El mentor es externo a la organización; el patrocinador es interno',
          'El mentor da consejo; el patrocinador usa su capital político para abrir puertas cuando no estás presente',
          'El mentor se enfoca en habilidades técnicas; el patrocinador en habilidades interpersonales',
          'El mentor es relación informal; el patrocinador es relación formal con obligaciones',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Los mentores abundan pero los patrocinadores son raros y hacen la diferencia real en las carreras. Un patrocinador dice "ella debería tener ese ascenso" en la reunión donde se toman las decisiones — cuando tú no estás para defenderte.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Sandberg llama a la decisión de pareja "la decisión de carrera más importante"?',
        opciones: [
          'Porque la estabilidad emocional de la relación afecta el rendimiento profesional',
          'Porque las parejas con mayor red de contactos abren más puertas profesionales',
          'Porque las mujeres con parejas que comparten equitativamente el hogar tienen carreras más exitosas — es imposible rendir al máximo cargando el 80% de la carga doméstica',
          'Porque la imagen pública de la pareja afecta la percepción profesional de la mujer',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Las estadísticas muestran que en la mayoría de hogares heterosexuales, la mujer lleva el 70-80% del trabajo doméstico y la crianza independientemente de sus horas laborales. Esa carga adicional tiene consecuencias reales en la carrera.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el "lean back" que critica Sandberg?',
        opciones: [
          'El estilo de liderazgo relajado que evita el conflicto directo',
          'Retirarse o frenar la ambición anticipadamente — frecuentemente antes de que el obstáculo haya llegado realmente',
          'La tendencia a delegar demasiado en lugar de liderar personalmente',
          'Trabajar desde casa en lugar de estar presente en la oficina',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Lean back es cuando las mujeres empiezan a frenar la ambición anticipando la maternidad o los obstáculos — antes de que esos obstáculos hayan llegado. Esto significa perder oportunidades disponibles en el presente por un problema futuro hipotético.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la "doble trampa" que enfrentan las mujeres asertivas en el trabajo?',
        opciones: [
          'Si son competentes parecen frías; si son cálidas parecen incompetentes',
          'Si hablan poco son invisibles; si hablan con confianza son "demasiado agresivas" — un pasillo muy estrecho de aceptabilidad',
          'Si piden poco parecen sin ambición; si piden mucho parecen codiciosas',
          'Si trabajan mucho descuidan la familia; si equilibran parecen menos comprometidas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La asimetría de la asertividad es real y documentada. La mujer que habla con la misma confianza que su colega hombre es percibida como "agresiva". Los hombres no enfrentan esta penalización social por la misma conducta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pregunta propone Sandberg para revelar la ambición que el miedo ha frenado?',
        opciones: [
          '"¿Cuál es mi legado ideal en 20 años?"',
          '"¿Qué haría si tuviera todos los recursos necesarios?"',
          '"¿Qué haría si no tuviera miedo?" — revela la carrera o acción que realmente deseas',
          '"¿Qué me aconsejaría mi yo del futuro sobre las decisiones de hoy?"',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Esta pregunta revela el espacio entre donde estás y donde podrías estar si el miedo al fracaso o al juicio ajeno no te frenara. La respuesta es frecuentemente más ambiciosa que las metas que te has permitido declarar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué evidencia cita Sandberg sobre el beneficio de la diversidad de género en liderazgo?',
        opciones: [
          'Las empresas con más mujeres líderes tienen mejor imagen pública y atraen más talento',
          'Las mujeres líderes toman decisiones más éticas que sus pares masculinos',
          'Las organizaciones con mayor diversidad de género en liderazgo tienen mejores resultados financieros, más innovación y mejor clima',
          'Los equipos mixtos tienen mayor productividad pero menor cohesión',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! No es que las mujeres sean mejores líderes — es que la diversidad de perspectivas produce mejores decisiones. Los datos consistentemente muestran mejores resultados en organizaciones con mayor diversidad de género en posiciones clave.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Sandberg dice que esperar que el mundo sea perfectamente justo primero es "estrategia perdedora"?',
        opciones: [
          'Porque el mundo nunca será perfectamente justo y esa espera es infinita',
          'Porque el mundo cambia más rápido cuando hay más mujeres en posiciones de poder que pueden cambiarlo desde adentro',
          'Porque la justicia perfecta es subjetiva y nadie puede definirla con precisión',
          'Porque el tiempo de espera tiene costo de oportunidad que supera los beneficios de la equidad perfecta',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El cambio sistémico requiere personas dentro del sistema que lo cambien. Si todas las mujeres esperan que el sistema sea justo antes de entrar, el sistema nunca tiene a las personas que lo cambiarían. La presencia en el poder acelera el cambio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué limitación del libro reconoce honestamente Sandberg?',
        opciones: [
          'Que sus consejos aplican principalmente a mujeres con educación universitaria y redes de contactos',
          'Que habla principalmente desde el privilegio de opciones — no todos los problemas que enfrenta son los de una mujer de bajos ingresos o sin pareja',
          'Que su experiencia en Silicon Valley no representa la mayoría de ambientes laborales',
          'Que los estudios que cita tienen sesgos de género que no pudo eliminar',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Sandberg tiene dinero, educación de Harvard, una pareja comprometida, y empleos en las empresas más poderosas del mundo. No todas las mujeres tienen esas opciones — y el libro no las ignora aunque no las resuelve.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 8 — Big Magic
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em08',
    titulo: 'Big Magic: Vive una Vida Creativa más allá del Miedo',
    autor: 'Elizabeth Gilbert',
    anio: '2015',
    emoji: '✨',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'La autora de "Comer, Rezar, Amar" revela que no necesitas permiso, talento excepcional, ni garantías para crear — solo el coraje de mostrar quién eres a través de lo que haces.',
    gemasRecompensa: 58,
    capitulos: const [
      CapituloResumen(
        titulo: 'Las Ideas como Entidades Vivas',
        emoji: '💡',
        contenido: '''Elizabeth Gilbert propone una visión de la creatividad radicalmente diferente: las ideas son entidades vivas que buscan a la persona correcta para materializarse. No son "tuyas" — son visitantes que eliges recibir o rechazar.

Esta metáfora libera de la trampa de la propiedad creativa. Si las ideas son tuyas y las "haces mal", has fallado. Si son visitantes que buscaban un hogar, tu trabajo es simplemente ser buen anfitrión — sin la carga de la perfección absoluta.

Gilbert cuenta cómo una idea que tuvo para una novela fue desarrollada mentalmente durante años, luego abandonada. Cuando quiso volver a ella, el material central había desaparecido. Encontró exactamente la misma historia en la novela de una amiga. La idea pasó de una mente a otra cuando la primera estaba distraída.

El miedo a la idea: muchas personas reciben una idea genuina y la matan inmediatamente con "¿y si falla?", "¿quién soy yo para hacer eso?", "no tengo tiempo ni dinero". La idea, sin hogar, pasa a otra persona. Años después ves a alguien haciendo exactamente lo que una vez fue tuyo.

Recibir bien una idea: con emoción, con gratitud, con apertura. "¿Qué necesitas de mí? ¿Cuándo empezamos?" La conversación con la idea como si fuera un colaborador.''',
      ),
      CapituloResumen(
        titulo: 'El Permiso que no Necesitas',
        emoji: '🔑',
        contenido: '''No necesitas permiso de nadie para ser creativa. No necesitas el grado correcto, la conexión correcta, el talento certificado. Solo necesitas la decisión de empezar.

La cultura del permiso: desde la infancia aprendemos que la creatividad legítima requiere validación externa. Esta necesidad de validación es el mayor obstáculo porque pospone indefinidamente el comienzo.

Gilbert distingue entre la creatividad como vocación pura (hago esto porque no puedo no hacerlo) y la creatividad como búsqueda de reconocimiento (hago esto para que me admiren). La primera es sostenible. La segunda es miserable — siempre hay alguien que no admira lo suficiente.

El "permiso en pasado": si esperas tener permiso para empezar, ya lo tienes. El permiso fue dado el día que naciste con la capacidad de imaginar y crear. Lo que la sociedad no te enseñó es que ese permiso existe — pero existe.

El arte "impuro" también cuenta: proyectos de curiosidad que haces porque te intrigan, sin plan de publicarlos ni venderlos. La práctica privada de la creatividad alimenta la creatividad pública sin la presión del juicio.''',
      ),
      CapituloResumen(
        titulo: 'El Trabajo como Práctica',
        emoji: '🔨',
        contenido: '''La creatividad requiere trabajo duro, disciplinado y constante. La inspiración existe — pero si la esperas para empezar, esperarás para siempre. El trabajo atrae la inspiración, no al revés.

"La inspiración existe, pero tiene que encontrarte trabajando." Gilbert escribe todos los días, con o sin ganas, con o sin inspiración. Algunos días es trabajo mecánico. Otros días aparece la magia. Si no está trabajando cuando llega la magia, la magia pasa de largo.

El "contrato de trabajo" con la creatividad: se presenta todos los días, a la hora acordada, listo para trabajar. Si la musa quiere aparecer, encontrará a alguien presente y trabajando. Esta disciplina no mata la magia — la invita.

La rebelión de lo inacabado: el mundo está lleno de proyectos creativos que murieron en el "casi acabado". La perfección perfecta no existe y esperar que llegue es otra forma de no crear. Terminar las cosas imperfectas siempre es mejor que no terminar.

El segundo, tercero y decimoctavo intento: el primer borrador siempre es malo. La decimoctava versión es la que muestra al mundo. La perseverancia a través de las versiones fallidas es el trabajo real de la creatividad.''',
      ),
      CapituloResumen(
        titulo: 'La Relación con el Fracaso',
        emoji: '🌱',
        contenido: '''El fracaso creativo es parte inevitable e incluso útil del proceso. En lugar de verlo como señal de que no deberías hacer lo que haces, verlo como información del proceso.

Las críticas: todo creador que muestra su trabajo recibe críticas. Lo que Gilbert aprendió: las críticas dicen más sobre quien las escribe que sobre la obra. No significa ignorarlas todas — significa no dejar que paralicen el siguiente proyecto.

La diferencia entre el crítico interno y el externo: el primero puede ser útil — te da perspectiva, identifica problemas reales. El segundo es ruido que tienes que aprender a filtrar. No todo feedback viene del genuino interés en mejorar tu obra.

La negociación activa con el miedo: no supresión — el miedo siempre estará. Pero el acuerdo: "Puedes venir conmigo en este viaje creativo. Puedes sentarte en el asiento trasero. Pero yo manejo. Y no puedes tocar el radio."

Publicar sin control de los resultados: una vez que la obra sale al mundo, ya no te pertenece. El lector le dará el significado que le dé. Tu único control es en el proceso de creación. Aceptar esto es liberador.''',
      ),
      CapituloResumen(
        titulo: 'La Curiosidad como Brújula',
        emoji: '🧭',
        contenido: '''Gilbert no cree en "seguir tu pasión". Cree en seguir tu curiosidad. La pasión es demasiado ardiente, demasiado exigente. La curiosidad es más duradera y más confiable como brújula.

La trampa de la pasión: "sigue tu pasión" presupone que ya sabes cuál es. Para muchas personas eso es paralizante — no saben cuál es su "gran pasión" y esa incertidumbre las frena. La curiosidad es más accesible.

La curiosidad en la práctica: ¿hay algo que llevas tiempo queriendo aprender o probar pero siempre posponiste? Esa es la semilla. No tiene que ser tu vocación de vida, producir dinero ni ser "útil". Solo tiene que interesarte genuinamente.

El mapa de la curiosidad: siguiendo una curiosidad genuina llegas naturalmente a otra, y luego a otra. Este camino no tiene un destino predecible — pero siempre lleva a algún lugar interesante.

La dignidad de la creatividad ordinaria: no tienes que ser genio ni producir obra maestra para merecer la experiencia creativa. El placer de hacer cosas — bien, mal, imperfectamente, solo por el placer de hacerlas — es suficiente razón. La vida creativa no requiere más justificación que esa.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cómo describe Gilbert la naturaleza de las ideas creativas?',
        opciones: [
          'Como productos del subconsciente que emergen durante el sueño',
          'Como entidades vivas que buscan a la persona correcta para materializarse — visitantes que elegimos recibir',
          'Como habilidades que se desarrollan con práctica y educación formal',
          'Como recursos limitados que se agotan con el uso excesivo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Esta metáfora libera de la trampa de la propiedad creativa. Si la idea es un visitante, tu trabajo es ser buen anfitrión — sin la carga de que todo lo que creas tiene que ser perfecto.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Gilbert prefiere "seguir la curiosidad" sobre "seguir la pasión"?',
        opciones: [
          'Porque la curiosidad produce más ingresos económicos que la pasión a largo plazo',
          'Porque la pasión es inestable como brújula; la curiosidad no requiere saber cuál es tu "gran pasión"',
          'Porque la pasión implica sufrimiento mientras que la curiosidad implica placer',
          'Porque la curiosidad es un estado más accesible para la mayoría',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! "Sigue tu pasión" paraliza a quien no sabe cuál es su gran pasión. "Sigue tu curiosidad" es más accesible: solo necesitas identificar qué te resulta levemente más interesante que otra cosa.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué "permiso" dice Gilbert que ya tienes para ser creativa?',
        opciones: [
          'La aprobación de críticos profesionales para publicar tu obra',
          'El tiempo libre de otras obligaciones para dedicarse a la creatividad',
          'El permiso fue dado al nacer con la capacidad de imaginar y crear — no necesitas que nadie te lo otorgue',
          'El talento excepcional que distingue al artista genuino del aficionado',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! La cultura del permiso pospone indefinidamente el comienzo. Gilbert dice: ya tienes permiso. Fue dado el día que naciste con la capacidad de imaginar. No necesitas que nadie más te lo dé formalmente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el "contrato de trabajo" de Gilbert con la creatividad?',
        opciones: [
          'Producir una cantidad específica de trabajo cada semana',
          'Presentarse todos los días a la hora acordada — con o sin inspiración',
          'Alternar períodos de producción intensa con períodos de descanso total',
          'Trabajar solo cuando hay inspiración genuina para garantizar la autenticidad',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La inspiración no es prerequisito del trabajo — es consecuencia del trabajo. Si estás presente cuando la inspiración llega, ocurre la magia. Si esperas sentirla antes de trabajar, probablemente esperarás para siempre.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el "acuerdo con el miedo" que propone Gilbert?',
        opciones: [
          'Eliminar el miedo completamente antes de emprender proyectos creativos',
          'El miedo puede venir en el viaje pero no puede manejar — "siéntate en el asiento trasero"',
          'Ignorar el miedo y actuar como si no existiera',
          'Analizar el miedo racionalmente hasta que desaparezca',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La negociación activa con el miedo: no supresión ni eliminación — coexistencia con límites claros. El miedo viene en el viaje pero no dirige. Más realista y útil que "vence tu miedo".',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pasa con las ideas que no son recibidas según Gilbert?',
        opciones: [
          'Se archivan en el subconsciente colectivo de la humanidad',
          'Se pierden permanentemente sin recuperación posible',
          'Pasan a buscar otro hogar en otra persona disponible para recibirlas',
          'Regresan a quien las tuvo originalmente cuando las condiciones sean correctas',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! La sensación de "yo también lo pensé" cuando ves a alguien haciendo lo que una vez imaginaste es el visitante que no recibiste. Las ideas no esperan indefinidamente — buscan quien las reciba.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue la creatividad como vocación de la búsqueda de reconocimiento?',
        opciones: [
          'La vocación es profesional y remunerada; buscar reconocimiento es amateur',
          'La vocación es sostenible porque no depende de la respuesta ajena; buscar reconocimiento es miserable porque siempre falta admiración',
          'La vocación produce obras más originales; buscar reconocimiento produce obras comerciales',
          'La vocación requiere más disciplina; buscar reconocimiento requiere más marketing',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! "Hago esto porque no puedo no hacerlo" es sostenible durante décadas. "Hago esto para que me admiren" produce sufrimiento perpetuo. La primera fuente produce obras más auténticas y creadoras más felices.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Gilbert sobre las obras imperfectas que se quedan sin terminar?',
        opciones: [
          'Guardarlas hasta tener la habilidad de terminarlas correctamente',
          'Terminarlas imperfectas: la perfección perfecta no existe y esperar que llegue es otra forma de no crear',
          'Mostrarlas como "obras en progreso" con la nota correspondiente',
          'Buscar un colaborador que pueda completar las partes que uno mismo no puede',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La rebelión de lo inacabado es universal. El proyecto que nunca se termina porque todavía le falta "algo" — esa búsqueda de perfección perfecta es paralizante. Terminar lo imperfecto y mostrarlo siempre es mejor que no terminar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué ocurre con una obra una vez que sale al mundo según Gilbert?',
        opciones: [
          'Pertenece a quien la compra o la experimenta, no al creador',
          'El creador sigue siendo responsable de cómo es interpretada',
          'Ya no pertenece al creador — el lector le dará el significado que le dé, sin que puedas controlarlo',
          'El creador puede retirarla si la recepción no refleja la intención original',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! El único control real está en el proceso de creación — no en el resultado. Aceptar que una vez publicada, la obra tiene vida propia y el lector construye su propio significado, es liberador.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la visión de Gilbert sobre la creatividad no dirigida a la obra maestra?',
        opciones: [
          'Tiene valor como práctica pero debe aspirar eventualmente a la excelencia pública',
          'Es el único tipo de creatividad genuina porque está libre de las distorsiones del mercado',
          'El placer de crear — bien, mal, imperfectamente, solo por el placer de hacerlo — es suficiente razón; no necesita más justificación',
          'Debe compartirse con al menos un círculo íntimo para validar su valor real',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! No tienes que ser genio para merecer la experiencia creativa. Cocinar, jardinear, bailar sin audiencia — todo ello enriquece la vida sin necesitar validación externa.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 9 — Becoming: Mi Historia
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em09',
    titulo: 'Becoming: Mi Historia',
    autor: 'Michelle Obama',
    anio: '2018',
    emoji: '🌺',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'La ex Primera Dama narra su camino desde el South Side de Chicago hasta la Casa Blanca, mostrando que la identidad más poderosa no es la que el mundo te asigna — es la que construyes tú misma.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'Los Orígenes del South Side',
        emoji: '🏠',
        contenido: '''Michelle Obama creció en el South Side de Chicago, en un apartamento en el segundo piso de la casa de su tía-abuela. Clase trabajadora, familia unida, padre con esclerosis múltiple que nunca faltó un solo día al trabajo. Esta historia de origen no es de pobreza extrema ni de abundancia — es de una familia que con poco construyó mucho.

Su padre Fraser Robinson, operador de plantas de tratamiento de agua, demócrata comprometido, hombre de total integridad. Cuando la esclerosis múltiple avanzó y le costaba cada vez más moverse, jamás se quejó y nunca llegó tarde al trabajo. Ese tipo de integridad cotidiana construyó a Michelle más que cualquier lección formal.

Michelle describe su propia formación como intensamente ambiciosa desde pequeña. Cuando un consejero escolar le dijo que Princeton "quizás no era realista" para ella, decidió demostrar que sí lo era. Entró, se graduó, luego fue a Harvard Law.

Pero la ambición sin identidad crea problemas: ¿Para quién era ambiciosa? ¿Para satisfacer las expectativas del sistema o porque genuinamente quería esa vida? Esta pregunta — "¿quién quiero ser realmente?" — recorre todo el libro.

El South Side como fundamento: en todos los ambientes élite por los que pasó — Princeton, Harvard, el bufete de abogados, la Casa Blanca — llevó consigo los valores y la identidad que esa familia en ese apartamento le dio.''',
      ),
      CapituloResumen(
        titulo: 'El Matrimonio Obama',
        emoji: '💑',
        contenido: '''La historia de amor con Barack comienza con Michelle siendo su supervisora en el bufete. Barack era pasante; Michelle era la abogada asignada a orientarlo. Ella resistió durante semanas comenzar algo romántico con un colega. Cuando finalmente cedió, rápidamente supo que era el hombre con quien compartiría su vida.

El matrimonio Obama es una historia de dos personas igualmente fuertes y ambiciosas que negociaron continuamente quién cedía qué y cuándo. Michelle fue extraordinariamente honesta sobre el resentimiento que a veces sentía: cuando Barack decidía entrar a la política, la vida que ella había construido tuvo que reestructurarse repetidamente alrededor de las aspiraciones de él.

La crianza de Malia y Sasha durante la campaña presidencial de 2008 fue uno de los desafíos más complejos. Michelle decidió que sus hijas tendrían la mayor normalidad posible. Las lleva a las fiestas de pijamas, las recoge en el colegio, mantiene las rutinas. La familia primero.

El terapeuta como práctica: Michelle habla abiertamente de haber buscado terapia de pareja en un momento de conflicto serio. En muchas familias afroamericanas, pedir ayuda psicológica tiene estigma. Michelle normalizarlo públicamente fue un acto de coraje y de servicio.

El ojo escrutador sobre su cuerpo, su ropa, su pelo, sus brazos musculosos, sus opiniones — cada aspecto de su presencia fue analizado y criticado. Aprendió a construir una capa de armadura que la protegía sin desconectarla de lo genuino.''',
      ),
      CapituloResumen(
        titulo: 'La Casa Blanca',
        emoji: '🏛️',
        contenido: '''La Casa Blanca fue simultáneamente el lugar más privilegiado y más confinante que Michelle Obama habitó. Con 132 habitaciones, 92 empleados y protección del Servicio Secreto las 24 horas, no podía simplemente salir a caminar sin logística masiva.

Obama asumió la presidencia en medio de la peor crisis económica desde la Gran Depresión. El tono del país era de desesperanza y división. La familia navegó ese ambiente tratando de mantener la vida de sus hijas lo más normal posible.

Las iniciativas de Michelle: Let's Move (contra la obesidad infantil), Reach Higher (educación universitaria para estudiantes de bajos ingresos), el jardín de la Casa Blanca. No eran solo "causas de Primera Dama" — eran extensiones de los valores con que fue criada.

Ser la primera familia afroamericana en la Casa Blanca significó cargar el peso de representar a toda una comunidad. Cada error era amplificado. Cada logro era compartido. Cada ataque racista era personal y político al mismo tiempo.

"When they go low, we go high": Michelle convirtió esta frase en una filosofía de vida. No significa ignorar los ataques — significa no descender al nivel de quien ataca. Es más difícil de practicar que de decir.''',
      ),
      CapituloResumen(
        titulo: 'La Identidad en Construcción',
        emoji: '🌱',
        contenido: '''El título "Becoming" no es un estado pasado. Es un gerundio: el proceso continuo de llegar a ser. Michelle propone que la identidad no es algo que se descubre una vez — es algo que se construye activa y constantemente.

Las versiones de sí misma que Michelle fue reconociendo: la niña ambiciosa del South Side, la estudiante que probó su valía en ambientes hostiles, la abogada que se preguntó si esa era su vida real, la esposa de un político que tuvo que decidir continuamente cuánto de sí misma cedía, la madre que priorizó a sus hijas sobre casi todo.

Cada versión fue real y completa. Ninguna fue "la definitiva". Esto contradice la narrativa de la identidad fija con que la mayoría crecemos: "¿quién quieres ser cuando seas grande?" — como si hubiera una sola respuesta correcta que se alcanza y se mantiene.

La pregunta que regresa: "¿Soy suficiente?" Michelle confiesa que incluso en los años de la Casa Blanca, esa pregunta volvía. En eso es profundamente humana. Lo que cambia es la respuesta que eliges darle.

El llamado a las jóvenes: al final del libro, Michelle habla directamente a las niñas de color que crecen en ambientes donde el mundo les dice de mil maneras que no son suficientes. Les dice: el mundo se equivoca. Son exactamente suficientes.''',
      ),
      CapituloResumen(
        titulo: 'El Legado del Servicio',
        emoji: '🌟',
        contenido: '''El servicio a otros no es sacrificio — es el camino más directo a la vida con significado. Fraser Robinson, el padre de Michelle, nunca pensó que su vida tenía significado dramático. Pero su presencia constante, su integridad sin excepciones, su amor incondicional — eso construyó a Michelle Obama.

El servicio no requiere plataforma grande: el impacto que más importa — el que transforma vidas individuales — no requiere esa plataforma. Su padre lo hizo desde un puesto de trabajo ordinario con un salario ordinario.

La decepción con la política: el libro es honesto sobre las desilusiones del proceso político — las complejidades, la lentitud del cambio, el costo humano de las decisiones. Michelle nunca fingió que la política fue lo que esperaba. Pero también es clara sobre el bien real que se puede hacer con la intención correcta.

La vida después de la Casa Blanca: salir de ese nivel de exposición fue en parte un alivio y en parte un duelo. La identidad "Primera Dama" había ocupado ocho años. ¿Quién es Michelle Obama sin ese título? La respuesta lleva toda la vida construirse.

El "becoming" no tiene fin. Cada etapa cierra y abre la siguiente. En ese proceso continuo de construirse activamente a lo largo de toda la vida está el tipo de vida más plena que cualquier persona puede vivir.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Por qué Michelle Obama eligió el gerundio "Becoming" para el título?',
        opciones: [
          'Para referirse al proceso de convertirse en la Primera Dama',
          'Porque la identidad no se descubre una vez y se termina — es un proceso continuo de construcción activa a lo largo de la vida',
          'Para describir la transformación de una chica pobre a una mujer poderosa',
          'Porque "Becoming" también significa "favorecedor" en inglés',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Becoming es un gerundio — proceso continuo. La identidad no es algo que "llegas a ser" en un momento definitivo. Es algo que construyes activamente en cada etapa de la vida.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué hizo Michelle cuando un consejero le dijo que Princeton "quizás no era realista"?',
        opciones: [
          'Aceptó el consejo y buscó universidades con mejores probabilidades de admisión',
          'Pidió una reunión con el director para protestar la evaluación',
          'Decidió demostrar que sí era realista — entró a Princeton y luego fue a Harvard Law',
          'Ignoró el consejo confiando en que las cosas se resolverían',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Esta anécdota resume el carácter de Michelle: ante quien le dice que no puede, duplica el esfuerzo para demostrar que sí puede. El sistema la subestimó repetidamente — y ella lo superó repetidamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué fue lo más difícil que Michelle reconoce sobre su matrimonio con Barack?',
        opciones: [
          'La diferencia cultural entre sus familias de origen',
          'El resentimiento que sentía cuando las decisiones políticas de Barack reestructuraban repetidamente la vida que ella había construido',
          'La dificultad de mantener intimidad bajo el escrutinio público constante',
          'Las diferencias de carácter que dificultaban la comunicación en crisis',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Michelle es honesta: cada decisión de Barack de avanzar políticamente implicaba reorganizar la vida de ella. Ese resentimiento era real y legítimo — y lo procesaron, en parte, con terapia de pareja.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué hablar de terapia de pareja fue un acto de coraje para Michelle?',
        opciones: [
          'Porque las figuras públicas raramente admiten problemas en sus matrimonios por razones políticas',
          'Porque en muchas familias afroamericanas buscar ayuda psicológica tiene estigma — ella lo normalizó públicamente',
          'Porque la terapia implica problemas graves que podrían afectar su imagen política',
          'Porque estaba violando un acuerdo privado con Barack de no hablar del matrimonio',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El estigma cultural alrededor de la salud mental en muchas comunidades es real. Michelle usar su plataforma para normalizar la terapia dio permiso a millones de personas para buscar ayuda sin sentir vergüenza.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa en la práctica "When they go low, we go high"?',
        opciones: [
          'No responder a las críticas y mantenerse en silencio',
          'Demostrar superioridad moral ignorando completamente a quienes atacan',
          'Elegir no responder bajando al nivel del atacante — difícil de practicar especialmente ante ataques personales',
          'Responder con argumentos más elevados e inteligentes que los del atacante',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Esta frase se malentiende como "ignorar los ataques". No es eso. Es elegir no responder con la misma crueldad o deshonestidad. Una decisión activa y difícil, especialmente cuando los ataques son personales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Michelle la paradoja de la Casa Blanca?',
        opciones: [
          'El ambiente más lujoso e inspirador donde vivió, que la motivó a dar lo mejor',
          'El lugar más privilegiado y simultáneamente más confinante — no podía salir sin logística masiva del Servicio Secreto',
          'Una etapa de sacrificio total donde su vida personal desapareció',
          'Un período difícil pero justo donde privilegios compensaban exactamente las limitaciones',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La paradoja: nunca vivió en lugar tan privilegiado ni tan restringido simultáneamente. 132 habitaciones, 92 empleados, y no poder dar un paso sin coordinación del Servicio Secreto.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué lección sobre el servicio extrae Michelle de la vida de su padre?',
        opciones: [
          'Que el servicio requiere renunciar a las ambiciones personales',
          'El impacto más profundo se da en vidas individuales, desde un trabajo ordinario, con integridad cotidiana — no requiere plataforma grande',
          'Que el verdadero servicio es el político porque solo desde el poder se puede cambiar algo',
          'Que servir a la familia es la forma más noble de servicio',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Fraser Robinson era operador de agua. Su presencia constante e integridad sin excepciones construyó a Michelle Obama. El impacto más profundo raramente llega por los canales más visibles.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pregunta dice Michelle que regresó a lo largo de toda su vida, incluso en la Casa Blanca?',
        opciones: [
          '"¿Estoy tomando las decisiones correctas para mi familia?"',
          '"¿Cómo equilibro mi ambición con mis responsabilidades?"',
          '"¿Soy suficiente?" — incluso con todo el éxito acumulado, la pregunta volvía',
          '"¿Estoy viviendo mi vida o la vida que otros esperan de mí?"',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! En esto Michelle es profundamente humana: el éxito no elimina la pregunta de suficiencia. Lo que cambia con el tiempo es la respuesta que eliges darle. Esa honestidad la hace cercana a millones de lectoras.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mensaje que Michelle dirige específicamente a las jóvenes de color?',
        opciones: [
          'Que deben trabajar el doble que sus pares para demostrar que merecen un espacio',
          'Que el sistema tiene fallas pero con esfuerzo suficiente cualquier obstáculo puede superarse',
          'Que el mundo les dice de mil maneras que no son suficientes — y el mundo se equivoca. Son exactamente suficientes',
          'Que deben buscar mentores con experiencias similares para navegar los ambientes que las excluyen',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Michelle no dice "trabaja más duro". Les dice que el sistema que las subestima está equivocado. Son suficientes tal como son. Un regalo diferente al de la mayoría de los libros de éxito.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué la identidad no puede ser "definitiva" según la visión de Michelle Obama?',
        opciones: [
          'Porque las circunstancias externas cambian continuamente y la identidad debe adaptarse',
          'Porque el autoconocimiento siempre es incompleto y hay partes de uno mismo que permanecen ocultas',
          'Porque es un proceso continuo de construcción — cada etapa cierra y abre la siguiente, sin punto final',
          'Porque dependemos de los demás para entendernos y ellos también cambian continuamente',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El "becoming" no tiene fin. La identidad no es un destino que se alcanza — es un proceso activo. La niña ambiciosa del South Side y la Primera Dama son la misma persona en etapas diferentes del mismo proceso continuo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 10 — Mujeres que Corren con los Lobos
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'em10',
    titulo: 'Mujeres que Corren con los Lobos',
    autor: 'Clarissa Pinkola Estés',
    anio: '1992',
    emoji: '🐺',
    categoria: CategoriaLibro.empoderamiento,
    resumenCorto: 'A través de cuentos y mitos, la psicóloga junguiana revela la naturaleza salvaje e instintiva que toda mujer lleva dentro — y cómo recuperarla cuando la cultura la ha domesticado.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Mujer Salvaje',
        emoji: '🌙',
        contenido: '''Clarissa Pinkola Estés es psicóloga junguiana que pasó décadas recopilando cuentos de su herencia mexicana y húngara y estudiándolos como ventanas a la psicología femenina más profunda. En casi todas las culturas, los cuentos sobre mujeres revelan una naturaleza instintiva y salvaje que la civilización sistemáticamente intenta domar.

La "Mujer Salvaje" no es la mujer sin educación ni la mujer agresiva. Es la naturaleza instintiva femenina: la capacidad de sentir profundamente, de saber sin saber cómo sabe, de crear sin pedir permiso, de amar sin perder el yo, de decir no cuando hay que decirlo aunque duela.

Esta naturaleza instintiva es la fuente de la intuición, la creatividad, la resistencia y la sabiduría ancestral que las mujeres han portado a través de generaciones. Y es precisamente lo que más amenaza al poder que quiere controlar a las mujeres — por eso ha sido sistemáticamente suprimida.

Los síntomas de una Mujer Salvaje disminuida: se siente exhausta y sin alegría; se conforma con menos de lo que merece; no puede decir no; no sabe qué quiere; tiene miedo de crear; cuida a todos pero no se cuida a sí misma; ha perdido el sentido del humor.

Estés propone que recuperar la Mujer Salvaje no es un proceso de adquisición — es un proceso de recuerdo. La naturaleza instintiva no se perdió — fue enterrada. El trabajo es desenterrarla.''',
      ),
      CapituloResumen(
        titulo: 'Los Cuentos como Psicología',
        emoji: '📖',
        contenido: '''Estés analiza "Barbazul" — el hombre que mata a sus esposas que abren la habitación prohibida — como una historia sobre el predador psíquico que vive en el interior de cada persona y también existe en el mundo exterior.

El predador interno es la voz que dice "no puedes", "no eres suficiente", "mejor no intentarlo". Esta voz es el principal saboteador de la creatividad, la alegría y la autenticidad. Reconocerla — darle nombre, saber cuándo habla — es el primer paso para no ser dominada por ella.

"La Llorona" — el espíritu que llora buscando a sus hijos perdidos — es la historia del duelo por las partes de la propia vida que han sido sacrificadas: los sueños abandonados, la creatividad sofocada, el yo auténtico que fue domesticado. El llanto no es debilidad — es el inicio de la recuperación.

"La Bella y la Bestia" en la interpretación de Estés: la Bestia no es el hombre interior que debe ser domesticado. La Bestia es la naturaleza instintiva — fea por las normas convencionales, pero genuina y poderosa. El amor que salva a la Bestia es el reconocimiento de su valor real bajo la superficie que asusta.

Los cuentos son el idioma más antiguo de la psicología. Cada cultura los tiene. Cada cultura revela en ellos sus miedos y sabiduría más profundos sobre lo que significa ser mujer.''',
      ),
      CapituloResumen(
        titulo: 'Los Ciclos Creativos',
        emoji: '🔄',
        contenido: '''La vida creativa tiene cuatro estaciones que son todas igualmente necesarias. La cultura productivista solo celebra la "primavera" — la producción abundante y visible. Estés muestra que las otras estaciones son igualmente esenciales.

La primavera: el florecimiento, la creación abundante, las ideas que llegan con facilidad. Es la etapa que todos celebran — y ninguna dura para siempre.

El verano: la maduración, la profundización, el trabajo sostenido y disciplinado. Menos glamoroso que la primavera pero donde el trabajo real se asienta.

El otoño: la cosecha y el inicio del descenso. El dejar ir, el soltar, el reconocer qué ya no sirve y puede liberarse.

El invierno: la aparente muerte, el silencio, la oscuridad. Esta etapa es la que la cultura productivista teme y patologiza — el estado en que la mujer no produce, no muestra, no da. Pero es en el invierno donde las raíces se profundizan.

Estés propone respetar el propio ciclo creativo en lugar de forzar la primavera permanente que produce el agotamiento crónico. Las depresiones creativas, los períodos de aparente "sequía", los momentos de silencio son parte del proceso — no señales de fracaso.''',
      ),
      CapituloResumen(
        titulo: 'La Intuición y el Cuerpo',
        emoji: '🌿',
        contenido: '''La intuición femenina no es magia ni irracionalidad — es la síntesis ultrarrápida de información que el sistema consciente no ha procesado todavía. Cultivarla significa aprender a escucharla sin descartarla inmediatamente cuando contradice la lógica convencional.

El cuerpo como oráculo: el cuerpo registra información que la mente consciente ignora. La tensión en la garganta ante una situación de peligro. El peso en el pecho ante una decisión incorrecta. La ligereza ante la dirección correcta. Aprender el lenguaje del propio cuerpo es recuperar un sistema de información extraordinariamente sofisticado.

Las trampas de los predadores externos: Estés analiza las relaciones con personas que drenan la vida, que usan el amor como arma, que aíslan a la mujer de sus instintos protectores. La Mujer Salvaje sabe reconocer estas dinámicas — el trabajo es volver a confiar en ese saber.

La creatividad como práctica espiritual: crear — en cualquier forma — es un acto de conexión con la naturaleza instintiva. No se necesita ser artista profesional. Cocinar con atención, bailar sin audiencia, jardinear, escribir sin publicar — cualquier acto creativo genuino alimenta la Mujer Salvaje.

La sabiduría de la Anciana interior: la parte de la mujer que ya no necesita la aprobación de nadie, que ha sobrevivido suficientes cosas para saber lo que realmente importa, que puede mirar con ojos claros sin la distorsión del miedo al rechazo.''',
      ),
      CapituloResumen(
        titulo: 'Recuperar la Naturaleza Instintiva',
        emoji: '🌅',
        contenido: '''Estés cierra el libro con un llamado a la recuperación activa de la naturaleza instintiva. No como retorno a algún estado pre-civilizatorio imaginario — sino como reintegración de las partes que fueron domesticadas, suprimidas o ignoradas.

La comunidad de mujeres: las mujeres históricamente se han sostenido mutuamente en comunidad. Los círculos de conversación, grupos de apoyo, redes de amistad profunda — son espacios donde la naturaleza instintiva puede expresarse sin el miedo al juicio que domina los espacios mixtos.

El proceso de envejecer como iniciación: las arrugas, los cabellos plateados, el cuerpo que cambia — todo ello es la materialización de la sabiduría ganada. La mujer que envejece con gracia no niega el paso del tiempo — lo recibe como maestro.

La relación con las mujeres mayores: las abuelas, las maestras, las mentoras portan conocimiento que no puede transmitirse de otra manera. Buscarlas activamente, escuchar sus historias, es conectarse con la cadena de sabiduría femenina que trasciende generaciones.

La naturaleza instintiva se manifiesta en las respuestas más genuinas e involuntarias: el escalofrío ante la música perfecta, el llanto ante la injusticia, el amor que duele de lo profundo. Eso es la Mujer Salvaje. Siempre estuvo ahí.

Estés termina: no se trata de volver a algo que se perdió. Se trata de recordar lo que nunca dejó de existir. La naturaleza instintiva no murió — fue enterrada. Y puede desenterrarse.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es la "Mujer Salvaje" según Clarissa Pinkola Estés?',
        opciones: [
          'La mujer sin educación formal que actúa solo por impulso',
          'La naturaleza instintiva femenina: intuición, creatividad, sabiduría ancestral y la capacidad de sentir profundamente',
          'La mujer que rechaza las normas sociales por principio ideológico',
          'El arquetipo de la mujer guerrera de las tradiciones mitológicas antiguas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La Mujer Salvaje no tiene nada de peyorativo. Es la naturaleza instintiva — la fuente de la intuición, la creatividad, la resistencia y la sabiduría que la cultura sistemáticamente domestica.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué representa el "predador psíquico interior" según el análisis del cuento de Barbazul?',
        opciones: [
          'El hombre controlador y abusivo que existe en algunas relaciones',
          'La voz interna que dice "no puedes", "no eres suficiente" — el principal saboteador de la creatividad y la autenticidad',
          'Los impulsos destructivos que todos los seres humanos deben controlar',
          'Las experiencias traumáticas del pasado que bloquean el crecimiento',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El predador interior es la voz del autoboicot. Reconocerla — saber cuándo es ella hablando y no la verdad — es el primer paso para no ser dominada por ella.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué el "invierno creativo" es necesario y no señal de fracaso según Estés?',
        opciones: [
          'Porque los períodos de descanso son legalmente requeridos en muchos países',
          'Porque las raíces se profundizan en el silencio y la aparente oscuridad — preparando la siguiente primavera',
          'Porque el invierno creativo desarrolla la apreciación de los períodos de abundancia',
          'Porque la creatividad es cíclica por naturaleza biológica de la mujer',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La cultura productivista solo celebra la primavera. Estés muestra que el invierno — donde no se produce, no se muestra — es donde las raíces se profundizan. Forzar la primavera permanente agota.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Estés la intuición femenina?',
        opciones: [
          'Una forma de pensamiento mágico sin base en la realidad',
          'La síntesis ultrarrápida de información que el sistema consciente no ha procesado todavía — no magia sino sofisticación',
          'Una sensibilidad especial de las mujeres ante las emociones ajenas',
          'Un fenómeno espiritual que algunas mujeres desarrollan y otras no',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La intuición no es irracional — es ultra-racional. Procesa patrones e información que la mente consciente todavía no verbalizó. Descartarla porque "no puede explicarse" es ignorar uno de los sistemas de información más sofisticados.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué papel tiene el cuerpo como "oráculo" según Estés?',
        opciones: [
          'El cuerpo puede predecir el futuro cuando se aprende a interpretarlo',
          'El cuerpo registra información que la mente consciente ignora — tensiones, pesos, ligerezas que señalan peligro o dirección correcta',
          'El cuerpo es un obstáculo para la sabiduría espiritual que debe trascenderse',
          'Solo el cuerpo de mujeres que practican meditación tiene esta capacidad',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La tensión en la garganta ante el peligro, el peso en el pecho ante la decisión incorrecta, la ligereza ante la dirección correcta — el cuerpo habla. Aprender ese lenguaje recupera un sistema de información extraordinariamente sofisticado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué los círculos y comunidades de mujeres son especialmente importantes según Estés?',
        opciones: [
          'Porque excluir a los hombres crea un espacio seguro para procesar experiencias femeninas',
          'Porque la naturaleza instintiva puede expresarse sin el miedo al juicio que domina los espacios mixtos — restaurando la conexión ancestral entre mujeres',
          'Porque la competencia entre mujeres desaparece cuando no hay hombres presentes',
          'Por tradición histórica en la mayoría de culturas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! En los espacios de mujeres, la naturaleza instintiva puede hablar libremente — las intuiciones, los sueños, las verdades incómodas — sin la presión de la mirada evaluadora.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo enmarca Estés el proceso de envejecer en la cultura que devalúa la edad femenina?',
        opciones: [
          'Como un proceso biológico que debe resistirse con cuidados estéticos',
          'Como una iniciación hacia el arquetipo de la Anciana Sabia — las arrugas materializan la sabiduría ganada',
          'Como la etapa más difícil de la vida femenina por las pérdidas acumuladas',
          'Como una oportunidad de liberarse de las expectativas sociales de la juventud',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Lo que la cultura llama "decadencia" es la materialización de la sabiduría acumulada. La mujer que envejece con gracia recibe el tiempo como maestro — no lo niega.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué tienen en común los cuentos analizados por Estés de diferentes culturas?',
        opciones: [
          'Todos tienen un final feliz que valida la paciencia de la mujer protagonista',
          'Todos fueron escritos por mujeres y representan la psicología femenina desde adentro',
          'Todos revelan la naturaleza instintiva femenina amenazada — por el predador externo, interno, o la cultura que domestica',
          'Todos son de origen europeo y comparten la misma tradición cultural',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Estés usa cuentos de diferentes culturas porque todos revelan el mismo patrón: la naturaleza instintiva femenina amenazada y el proceso de recuperarla. Los cuentos son el idioma más antiguo de la psicología.',
      ),
      const PreguntaLibro(
        enunciado: '¿Dónde dice Estés que se manifiesta la Mujer Salvaje en la vida cotidiana?',
        opciones: [
          'En los logros profesionales y creativos que alcanzan reconocimiento social',
          'En los momentos de meditación y silencio deliberado',
          'En las respuestas más genuinas e involuntarias: el escalofrío ante la música perfecta, el llanto ante la injusticia, el amor que duele',
          'En la capacidad de establecer límites claros en las relaciones',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! La Mujer Salvaje no murió — fue enterrada. Y se manifiesta en las respuestas más genuinas e involuntarias. Eso es ella. Siempre estuvo ahí — no necesitas construirla, solo recordarla.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dice Estés sobre la recuperación de la naturaleza instintiva?',
        opciones: [
          'Es un proceso de adquisición de nuevas habilidades y perspectivas',
          'Requiere retirarse de la sociedad para vivir en entornos naturales',
          'Es un proceso de recuerdo — la naturaleza instintiva no se perdió sino que fue enterrada, y puede desenterrarse',
          'Necesita guía de un terapeuta especializado en psicología junguiana',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! No se trata de adquirir algo nuevo. Se trata de recordar lo que nunca dejó de existir. La naturaleza instintiva está ahí — el trabajo es quitar las capas de domesticación que la enterraron.',
      ),
    ],
  ),

];
