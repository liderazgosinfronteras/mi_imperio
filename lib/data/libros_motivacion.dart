// lib/data/libros_motivacion.dart
import '../models/libro_model.dart';

List<Libro> crearLibrosMotivacion() => [
  Libro(
    id: 'mot01',
    titulo: 'El Hombre en Busca de Sentido',
    autor: 'Viktor Frankl',
    anio: '1946',
    emoji: '🌟',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'La experiencia del psiquiatra superviviente del Holocausto que descubrió que quien tiene un porqué puede soportar cualquier cómo.',
    gemasRecompensa: 50,
    capitulos: [
      const CapituloResumen(
        titulo: 'Sobrevivir lo Insoportable',
        emoji: '🕯️',
        contenido: '''
Viktor Frankl era un psiquiatra vienés con una prometedora carrera cuando fue arrestado en 1942 y deportado a los campos de concentración nazis. Pasó tres años en Auschwitz, Dachau y otros campos. Perdió a su esposa, a sus padres y a su hermano. Perdió casi todo lo que tenía. Pero en ese infierno, hizo uno de los descubrimientos psicológicos más importantes del siglo XX.

Frankl observó que entre los prisioneros, quienes tenían mayores probabilidades de sobrevivir no eran necesariamente los más fuertes físicamente. Eran los que tenían un sentido, un porqué para sobrevivir. Quienes podían responder a la pregunta "¿para qué seguir?" tenían una reserva interior de resistencia que los demás no poseían.

Esta observación, confirmada por la experiencia y por estudios psicológicos posteriores, llevó a Frankl a desarrollar lo que llamó la "logoterapia": una forma de psicoterapia basada en el supuesto de que el deseo de encontrar sentido es la motivación fundamental del ser humano, más fundamental incluso que el placer (Freud) o el poder (Adler).

El descubrimiento más poderoso de Frankl en los campos fue que los nazis podían quitarle todo: su libertad, su familia, su ropa, su nombre. Pero había una cosa que no podían quitarle: la libertad de elegir su actitud ante lo que le ocurría. Esta última libertad, irreductible, fue la que mantuvo su dignidad y su salud mental en condiciones que habrían destruido a la mayoría.

Friedrich Nietzsche lo expresó antes que Frankl: "Quien tiene un porqué para vivir puede soportar casi cualquier cómo."
''',
      ),
      const CapituloResumen(
        titulo: 'La Búsqueda de Sentido como Motivación Fundamental',
        emoji: '🔍',
        contenido: '''
El argumento central de la logoterapia es que el ser humano no es fundamentalmente un animal que busca placer (como postuló Freud) ni poder (como postuló Adler), sino un ser que busca sentido. La ausencia de sentido produce lo que Frankl llama el "vacío existencial": una sensación de futilidad, aburrimiento y falta de propósito que puede ser más destructiva que el sufrimiento.

El vacío existencial se manifiesta de maneras diversas en el mundo moderno. En las personas que "lo tienen todo" materialmente pero sienten que algo fundamental falta. En el trabajador que cumple eficientemente con sus tareas pero no siente que su trabajo importe. En el consumidor que persigue satisfacciones hedonistas que nunca producen la plenitud prometida.

Frankl observa que el sentido no se inventa; se descubre. No es algo que la persona crea arbitrariamente para sentirse mejor; es algo que emerge de la relación honesta de la persona con la vida, sus capacidades, sus compromisos y sus valores.

El sentido puede encontrarse de tres maneras. La primera es a través de lo que se da al mundo: una obra creada, un acto realizado. La segunda es a través de lo que se recibe del mundo: el amor, la belleza, la verdad que uno experimenta. La tercera, la más difícil y la más poderosa, es a través de la actitud que se toma ante el sufrimiento inevitable.

Esta tercera fuente de sentido es la que Frankl descubrió en los campos: incluso el sufrimiento puede tener sentido si la persona elige transformarlo en testimonio, en aprendizaje o en servicio.

La búsqueda de sentido no es un lujo; es la necesidad psicológica más fundamental.
''',
      ),
      const CapituloResumen(
        titulo: 'La Libertad Interior ante el Sufrimiento',
        emoji: '🕊️',
        contenido: '''
Frankl desarrolla con profundidad el concepto de la libertad interior: la capacidad que tiene el ser humano de elegir su respuesta ante cualquier circunstancia, por terrible que sea. Esta libertad no es absoluta ni fácil de ejercer, pero es irreductible mientras la persona viva conscientemente.

Entre el estímulo (la circunstancia que enfrenta) y la respuesta (cómo reacciona ante ella), existe un espacio. En ese espacio reside la libertad humana. El animal responde al estímulo de manera casi automática; el ser humano tiene la capacidad de interponer entre el estímulo y la respuesta la reflexión, la elección, los valores.

Frankl documentó que incluso en los campos, donde las condiciones humanas eran las más extremas posibles, había prisioneros que mantenían su bondad, compartían su último pedazo de pan con quien lo necesitaba más, consolaban a otros en su propio sufrimiento. Y había guardias nazis que actuaban con crueldad inimaginable. En ambos casos, las personas habían elegido, consciente o inconscientemente, quiénes querían ser.

Esta comprensión tiene implicaciones profundas para la motivación en circunstancias mucho menos extremas. Quien entiende que tiene libertad interior de respuesta ante cualquier circunstancia no puede victimizarse indefinidamente. No hay jefe, no hay mercado, no hay circumstancia que quite la última libertad de decidir cómo uno se relacionará con esa circunstancia.

La libertad interior no es indiferencia al sufrimiento. Es la capacidad de transformarlo en algo significativo. Frankl no pretendía que el sufrimiento no doliera; pretendía que podía tener sentido, y que ese sentido transformaba la experiencia.
''',
      ),
      const CapituloResumen(
        titulo: 'Amor y Creatividad como Fuentes de Sentido',
        emoji: '💙',
        contenido: '''
Frankl identifica el amor como la forma más elevada de encuentro con el sentido. No el amor romántico en su sentido pop, sino el amor en su sentido más profundo: la capacidad de ver y valorar el ser único e irrepetible de otra persona, más allá de sus atributos físicos o sus utilidades.

En los campos, Frankl mantenía conversaciones imaginarias con su esposa, de quien no sabía si estaba viva o muerta. Estas conversaciones le daban fuerza para seguir. El amor no requiere la presencia física del ser amado; es una conexión que trasciende el tiempo y el espacio. Esta comprensión le permitió encontrar sentido incluso en la separación más dolorosa.

La creatividad es la segunda gran fuente de sentido que Frankl identifica. El acto de crear algo que expresa la visión única de una persona, ya sea una obra de arte, un proyecto empresarial, un jardín o una conversación significativa, es un encuentro con el sentido. Crear es afirmar que uno tiene algo que aportar al mundo que nadie más puede aportar exactamente de la misma manera.

Frankl también habla de los valores de actitud: la capacidad de elegir cómo uno se relaciona con las circunstancias que no puede cambiar. Cuando ya no podemos cambiar la situación (una enfermedad terminal, una pérdida irreversible), nuestro último recurso es la forma en que elegimos enfrentarla. Esta elección también es una forma de creatividad y de amor propio.

El sentido, en sus diversas formas, es el antídoto más poderoso contra la desesperanza, el agotamiento y la pérdida de motivación.
''',
      ),
      const CapituloResumen(
        titulo: 'Las Lecciones para la Vida Cotidiana',
        emoji: '🌅',
        contenido: '''
Frankl cierra su libro con una aplicación práctica de las lecciones del campo a la vida cotidiana. No porque la vida cotidiana sea comparable al Holocausto (no lo es), sino porque los principios que ayudaron a las personas a sobrevivir lo más extremo también pueden ayudar a florecer en circunstancias ordinarias.

La primera lección es que el significado supera a la motivación extrínseca. Las personas motivadas externamente (por dinero, aprobación social, miedo al castigo) tienen una fuente de energía que se agota cuando los incentivos externos desaparecen. Las personas motivadas por sentido tienen una fuente interna que se auto-sostiene y se profundiza con el tiempo.

La segunda lección es que el sufrimiento puede transformarse. No todo sufrimiento puede evitarse; parte es inevitable en la condición humana. La pregunta no es cómo evitar el sufrimiento sino qué hacemos con el que no podemos evitar. Frankl propone convertirlo en ocasión de crecimiento, de testimonio o de servicio.

La tercera lección es que la responsabilidad es la otra cara de la libertad. Si somos libres de elegir nuestra actitud, también somos responsables de nuestras elecciones. No podemos responsabilizar a las circunstancias de quiénes somos; podemos, y debemos, responsabilizarnos de cómo respondemos a ellas.

La cuarta lección es la del momento presente. Frankl observó que los que mejor sobrevivían eran los que encontraban significado en el momento actual, no los que se perdían en el pasado o en el futuro. Esta presencia en el presente es tanto una habilidad para desarrollar como una práctica a mantener.

La vida bien vivida no es la que evita el sufrimiento sino la que encuentra sentido en todo lo que la constituye, incluyendo lo difícil.
''',
      ),
    ],
    preguntas: [
      const PreguntaLibro(
        enunciado: '¿Cuáles son las tres formas de encontrar sentido según la logoterapia de Frankl?',
        opciones: [
          'Meditación, trabajo y relaciones sociales',
          'Fe religiosa, servicio comunitario y expresión artística',
          'Lo que damos al mundo, lo que recibimos de él y la actitud que tomamos ante el sufrimiento inevitable',
          'La familia, la profesión y los valores espirituales',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Frankl identifica tres fuentes: dar al mundo (obras, actos), recibir del mundo (amor, belleza, verdad) y la actitud ante el sufrimiento inevitable. Esta última es la más difícil y la más poderosa.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué la motivación basada en sentido supera a la motivación extrínseca?',
        opciones: [
          'Porque el sentido es socialmente más valorado que el dinero o el prestigio',
          'Porque la motivación extrínseca es ilegal en muchos contextos',
          'Porque la motivación extrínseca se agota cuando los incentivos externos desaparecen; el sentido es una fuente interna que se auto-sostiene',
          'Porque la ciencia demuestra que el cerebro procesa el sentido de manera más eficiente',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Los incentivos externos (dinero, aprobación, miedo al castigo) producen motivación que depende de la presencia de esos incentivos. El sentido es interno y se auto-sostiene, profundizándose con el tiempo independientemente de las circunstancias externas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa la cita de Nietzsche que Frankl usó como núcleo de su teoría?',
        opciones: [
          '"El superhombre crea su propio destino más allá del bien y del mal"',
          '"Dios ha muerto, y nosotros somos quienes lo hemos matado"',
          '"Quien tiene un porqué para vivir puede soportar casi cualquier cómo"',
          '"Lo que no me mata me hace más fuerte, pero solo si tengo voluntad de poder"',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Frankl tomó la frase de Nietzsche "Quien tiene un porqué para vivir puede soportar casi cualquier cómo" como fundamento de su observación: los prisioneros con un sentido claro para sobrevivir tenían mayor capacidad de resistencia ante el sufrimiento extremo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál de las siguientes describe mejor la "libertad interior" según Frankl?',
        opciones: [
          'La capacidad de escapar físicamente de cualquier situación de opresión',
          'El derecho a expresar libremente los propios pensamientos en cualquier contexto',
          'El espacio entre el estímulo y la respuesta donde reside la capacidad de elegir la actitud',
          'La independencia económica que libera de las presiones del sistema',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La libertad interior es el espacio entre el estímulo (lo que ocurre) y la respuesta (cómo reaccionamos). Los nazis podían quitar todo a Frankl excepto esta libertad: la de elegir su actitud ante lo que le ocurría, lo que preservó su dignidad incluso en las condiciones más extremas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo puede el amor ser fuente de sentido según Frankl, incluso en ausencia del ser amado?',
        opciones: [
          'Solo puede ser fuente de sentido cuando hay contacto físico regular',
          'A través de recuerdos del pasado compartido que consuelan en el presente',
          'El amor trasciende tiempo y espacio: las conversaciones imaginarias con el ser amado dan fuerza real',
          'Únicamente si el amor es correspondido y la persona amada comparte el mismo sufrimiento',
        ],
        respuestaCorrecta: 2,
        explicacion: 'En los campos, Frankl mantenía conversaciones imaginarias con su esposa sin saber si vivía. Esta conexión le daba fuerza real. El amor no requiere presencia física: es una conexión que trasciende tiempo y espacio, lo que lo convierte en fuente de sentido incluso en la separación más dolorosa.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Robbins el legado que una persona deja?',
        opciones: [
          'Las posesiones y el dinero que se deja a los herederos',
          'El nombre inscrito en monumentos o edificios públicos',
          'El impacto en vidas de personas tocadas, los valores transmitidos y las ideas sembradas',
          'Los premios y reconocimientos acumulados durante la vida profesional',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Para Robbins, el legado no es el dinero (que se redistribuirá) ni los bienes (que envejecerán), sino el impacto en las vidas de personas que tocaste, los valores que transmitiste y las ideas que sembraste. Se construye momento a momento en las decisiones y acciones cotidianas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué relación establece Robbins entre las creencias y la experiencia vivida?',
        opciones: [
          'Las creencias son consecuencia de la experiencia; primero vivimos, luego creemos',
          'Las creencias y la experiencia son independientes: una no afecta a la otra',
          'Las creencias son filtros que confirman evidencia consistente con ellas y moldean cómo se percibe la realidad',
          'Solo las creencias negativas afectan la experiencia; las positivas no tienen impacto real',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Para Robbins, las creencias son evaluaciones de la realidad que se convierten en filtros de toda experiencia posterior. Si crees que eres incapaz, cada dificultad confirma esa creencia. Si crees en tu capacidad, cada dificultad se convierte en un peldaño de aprendizaje. Las creencias son el sistema operativo de la mente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué factor identifica Schwartz como la principal diferencia entre quienes logran mucho y quienes logran poco?',
        opciones: [
          'La inteligencia y el coeficiente intelectual medido',
          'El nivel de educación formal y los títulos universitarios',
          'El tamaño de los pensamientos: pensar en grande vs. pensar en pequeño',
          'Los contactos familiares y sociales heredados',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Schwartz argumenta que la diferencia raramente está en inteligencia o talento. Está en el pensamiento: quienes piensan en grande atraen más oportunidades, toman más riesgos y producen más resultados que quienes piensan en pequeño.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "catálogo de victorias" que Schwartz propone construir?',
        opciones: [
          'Una lista de logros de personas exitosas que queremos imitar',
          'Un registro de los premios y reconocimientos obtenidos durante la carrera',
          'Una lista de logros propios, grandes y pequeños, que demuestran capacidad real',
          'Un diario de las metas cumplidas cada semana para celebrar el progreso',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El catálogo de victorias es una lista personal de logros pasados que demuestran capacidad real. Tener acceso mental frecuente a este catálogo construye la creencia en la propia capacidad de manera más efectiva que cualquier afirmación abstracta, porque se basa en evidencia concreta propia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué relación establece Schwartz entre el pensamiento grande y el trabajo cotidiano?',
        opciones: [
          'El pensamiento grande elimina la necesidad del trabajo duro cotidiano',
          'El pensamiento grande solo aplica a los grandes emprendedores, no al empleado ordinario',
          'El empleado que piensa en grande busca cómo mejorar su área, el negocio y resolver problemas del cliente',
          'El pensamiento grande es para las grandes decisiones; los detalles cotidianos requieren pensamiento pequeño',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Schwartz enseña que el pensamiento grande en el trabajo significa no solo hacer el propio trabajo sino pensar en cómo el área podría mejorar, cómo el negocio podría crecer, qué problemas del cliente no están resueltos. Esta orientación hacia el cuadro completo distingue a quienes progresan de quienes se estancan.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa para Schwartz que la confianza "se construye, no se espera"?',
        opciones: [
          'Que debemos fingir confianza antes de sentirla realmente',
          'Que la confianza llega automáticamente con la experiencia de años en un campo',
          'Que la confianza es el resultado de pequeñas victorias acumuladas deliberadamente, una acción a la vez',
          'Que la confianza se adquiere estudiando técnicas de comunicación asertiva',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Para Schwartz, la confianza no aparece sola ni se espera pasivamente. Se construye activamente tomando acciones pequeñas que producen evidencia de capacidad. Cada pequeña victoria alimenta la confianza para el siguiente paso más grande. Es un proceso deliberado de acumulación de evidencia personal.',
      ),
    ],
  ),

  Libro(
    id: 'mot04',
    titulo: 'Los 7 Hábitos de la Gente Altamente Efectiva',
    autor: 'Stephen Covey',
    anio: '1989',
    emoji: '7️⃣',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'El libro de liderazgo personal más influyente de las últimas décadas, que integra principios atemporales de efectividad con un sistema de desarrollo personal completo.',
    gemasRecompensa: 50,
    capitulos: [
      const CapituloResumen(
        titulo: 'El Paradigma y los Principios',
        emoji: '🔭',
        contenido: '''
Stephen Covey abre su obra más influyente con una distinción que considera fundamental: la diferencia entre la "ética de la personalidad" y la "ética del carácter". Esta distinción, argumenta, explica por qué la mayoría de los libros de éxito y las técnicas de motivación producen resultados superficiales y temporales.

La ética de la personalidad (que domina la literatura de superación personal desde los años 20) se enfoca en técnicas, actitudes, comportamientos visibles. Cómo hacer una buena primera impresión, cómo ser positivo, cómo usar el lenguaje corporal efectivamente. Estas técnicas tienen valor, pero cuando no están fundamentadas en el carácter, son manipulación que la gente percibe y ante la que reacciona con desconfianza.

La ética del carácter, que Covey encuentra en los libros sobre éxito publicados antes de 1920, se enfoca en los fundamentos: integridad, humildad, fidelidad, valentía, justicia, paciencia, industria. Estos son principios que no cambian con las tendencias culturales porque están alineados con las leyes naturales de la vida humana.

Covey introduce el concepto de "paradigma": el mapa mental a través del cual cada persona interpreta la realidad. Los paradigmas no son la realidad; son interpretaciones de ella. Y la calidad de los resultados que obtenemos depende directamente de la exactitud de nuestros paradigmas.

El cambio verdadero y duradero, según Covey, requiere un "cambio de paradigma": una transformación en la manera fundamental de ver el mundo. Las técnicas sin cambio de paradigma son como reordenar las sillas en el Titanic.

Los siete hábitos no son técnicas; son principios que, una vez internalizados, producen cambios de paradigma duraderos.
''',
      ),
      const CapituloResumen(
        titulo: 'Los Primeros Tres Hábitos: La Victoria Privada',
        emoji: '🏠',
        contenido: '''
Covey organiza los siete hábitos en dos grupos. Los primeros tres (ser proactivo, empezar con el fin en mente, poner primero lo primero) producen lo que llama la "victoria privada": el dominio de uno mismo.

El primer hábito, "ser proactivo", va más profundo que la simple iniciativa. Es la comprensión de que entre el estímulo y la respuesta existe un espacio donde reside la libertad humana de elegir. Las personas reactivas ceden ese espacio: la respuesta es determinada por el estímulo, por las emociones, por las circunstancias. Las personas proactivas reclaman ese espacio y eligen conscientemente su respuesta basándose en sus valores.

El segundo hábito, "empezar con el fin en mente", se basa en el principio de que todas las cosas se crean dos veces: primero en la mente y luego en la realidad. Una casa existe primero como plano antes de existir como estructura. Una vida puede existir primero como visión antes de manifestarse como experiencia. El segundo hábito es crear conscientemente la visión de quién quieres ser y qué quieres lograr.

El tercer hábito, "poner primero lo primero", es la gestión del tiempo y las prioridades alineada con los valores y la visión del segundo hábito. Covey introduce la matriz de gestión del tiempo que clasifica las actividades en: urgente e importante, no urgente pero importante, urgente pero no importante, y ni urgente ni importante. La clave de la efectividad está en invertir más tiempo en el cuadrante "importante pero no urgente": planificación, relaciones, desarrollo personal, prevención.

La victoria privada precede a la victoria pública: no puedes liderar efectivamente a otros antes de liderarte efectivamente a ti mismo.
''',
      ),
      const CapituloResumen(
        titulo: 'Los Hábitos 4, 5 y 6: La Victoria Pública',
        emoji: '🌐',
        contenido: '''
Los hábitos cuatro, cinco y seis producen la "victoria pública": la efectividad en las relaciones con otros.

El cuarto hábito, "pensar ganar-ganar", es una mentalidad que busca soluciones donde todas las partes se benefician. Covey distingue entre el pensamiento ganar-perder (el mío es a costa del tuyo), perder-ganar (cedo para evitar conflicto), ganar-perder (impongo mis términos) y ganar-ganar (buscamos soluciones que satisfacen los intereses legítimos de todos). La última mentalidad, aunque no siempre posible, produce las relaciones más duraderas y los acuerdos más robustos.

El quinto hábito, "busca primero entender, luego ser entendido", es quizás el más contraintuitivo y el más poderoso de los siete. La mayoría de las personas escucha con la intención de responder, no de entender. Mientras el otro habla, están preparando su respuesta. Covey propone la "escucha empática": escuchar con la intención genuina de comprender la perspectiva, los sentimientos y la lógica del otro.

El sexto hábito, "sinergizar", es la creación de algo que ninguna de las partes podría crear individualmente. La sinergia no es el resultado de compromisos (donde cada parte cede algo de lo que quiere) sino de la creación genuinamente nueva que emerge cuando mentes diferentes con perspectivas diferentes colaboran con respeto y apertura.

La diferencia entre estas tres mentalidades (ganar-ganar, escucha empática y sinergia) y sus alternativas puede explicar la mayor parte de la diferencia entre las relaciones y colaboraciones que producen resultados extraordinarios y las que producen solo lo ordinario.
''',
      ),
      const CapituloResumen(
        titulo: 'El Séptimo Hábito: Afilar la Sierra',
        emoji: '⚙️',
        contenido: '''
El séptimo hábito, "afilar la sierra", es el que sostiene a los otros seis. Es el principio del mantenimiento y la renovación continua de los cuatro aspectos del ser humano: el físico, el mental, el espiritual y el social/emocional.

La metáfora de afilar la sierra viene de la imagen del leñador que lleva horas cortando un árbol con una sierra cada vez más roma. Alguien le pregunta por qué no para a afilarla. "No tengo tiempo, tengo que seguir cortando", responde. El séptimo hábito es reconocer que el tiempo invertido en afilar la sierra produce más corte en menos tiempo total.

El aspecto físico incluye el ejercicio, la nutrición y el descanso. La inversión en salud física no es lujo; es el mantenimiento del instrumento más importante que tienes para cualquier logro.

El aspecto mental incluye la lectura, la escritura, el aprendizaje continuo. El cerebro, como cualquier capacidad, mejora con uso y se deteriora sin él. La práctica regular de desafiar y desarrollar la mente es el mantenimiento del segundo instrumento más importante.

El aspecto espiritual incluye la clarificación y el compromiso con los valores, la práctica de la meditación o la oración según la perspectiva personal, la conexión con la naturaleza. Este aspecto proporciona la fuente de motivación más profunda y más sostenible.

El aspecto social/emocional incluye el cuidado de las relaciones más importantes, la práctica de la empatía y del servicio. Este aspecto proporciona la conexión y el sentido de contribución que son necesidades fundamentales del ser humano.

Un desequilibrio prolongado en cualquiera de los cuatro aspectos produce deterioro que eventualmente afecta a los otros tres y a la efectividad en todas las áreas de vida.
''',
      ),
      const CapituloResumen(
        titulo: 'La Efectividad como Equilibrio',
        emoji: '⚖️',
        contenido: '''
Covey cierra su libro con una reflexión sobre la efectividad que integra todos los hábitos anteriores: la efectividad genuina no es producir más en menos tiempo; es lograr los resultados deseados de maneras que preservan y desarrollan los recursos que los producen.

Esta definición captura algo que la gestión convencional del tiempo frecuentemente pierde: el equilibrio entre producción (P) y capacidad de producción (CP). Un granjero que mata a sus gallinas para obtener todos los huevos de una vez maximiza la producción inmediata y destruye la capacidad de producción futura. Un individuo que trabaja sin descanso puede maximizar la productividad de corto plazo mientras deteriora la salud que es la fuente de toda productividad a largo plazo.

Covey también reflexiona sobre la diferencia entre administrar cosas y liderar personas. Las cosas se administran con eficiencia; las personas se lideran con efectividad. La clave del liderazgo de personas es tratarlas como fines en sí mismas (con dignidad, autonomía y la creencia en su potencial) en lugar de como medios para los fines de otros.

Los siete hábitos, tomados en conjunto, producen una "espiral hacia arriba": una mejora continua en carácter, competencia y relaciones que se auto-refuerza y se profundiza con el tiempo. No es un proceso que se completa sino uno que continúa mientras la persona vive y elige crecer.

Covey concluye con una observación poderosa: al final de la vida, las personas más satisfechas raramente se arrepienten de haber desarrollado demasiado carácter, de haber sido demasiado honestas, de haber invertido demasiado en relaciones. Los arrepentimientos típicos apuntan en la otra dirección.

La efectividad verdadera es vivir de manera que al final puedas decir que valió la pena.
''',
      ),
    ],
    preguntas: [
      const PreguntaLibro(
        enunciado: '¿Qué significa el primer hábito "ser proactivo" según Covey?',
        opciones: [
          'Tomar la iniciativa en todas las situaciones antes de que otros lo hagan',
          'Planificar con anticipación para evitar problemas futuros',
          'Reclamar el espacio entre estímulo y respuesta para elegir conscientemente basándose en valores',
          'Ser optimista y positivo ante cualquier circunstancia',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Ser proactivo significa reclamar el espacio de libertad entre el estímulo (circunstancia) y la respuesta (comportamiento). Las personas proactivas eligen su respuesta basándose en valores; las reactivas son determinadas por el estímulo.',
      ),
      const PreguntaLibro(
        enunciado: '¿En qué cuadrante recomienda Covey invertir más tiempo y por qué?',
        opciones: [
          'Urgente e importante (gestión de crisis): porque son las prioridades reales',
          'Urgente pero no importante (interrupciones): para mantener relaciones',
          'Importante pero no urgente (planificación, relaciones, desarrollo): porque previene crisis y produce mejoras sostenibles',
          'Ni urgente ni importante (entretenimiento): para recuperar energía',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El cuadrante de lo importante-no urgente (planificación, desarrollo personal, relaciones, prevención) es el de mayor impacto a largo plazo. Quien invierte aquí reduce las crisis del cuadrante urgente-importante y mejora sistemáticamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "escucha empática" del quinto hábito?',
        opciones: [
          'Escuchar con la intención de dar buenos consejos después',
          'Escuchar activamente mostrando interés con lenguaje corporal apropiado',
          'Escuchar con la genuina intención de comprender la perspectiva, sentimientos y lógica del otro',
          'Escuchar sin interrumpir hasta que el otro termine de hablar',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La escucha empática va más allá de no interrumpir: es escuchar con la intención de comprender genuinamente, no de preparar la propia respuesta. Esta escucha transforma las conversaciones de intercambios de monólogos a conexiones reales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "sinergia" del sexto hábito de Covey?',
        opciones: [
          'La suma de esfuerzos individuales que produce resultados iguales a la suma de las partes',
          'La capacidad de llegar a compromisos donde cada parte cede algo para avanzar',
          'La creación genuinamente nueva que surge cuando mentes distintas colaboran con respeto y apertura',
          'La cooperación eficiente dentro de un equipo con roles claramente definidos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La sinergia no es compromiso (donde cada parte cede algo) sino creación genuinamente nueva: algo que ninguna de las partes podría haber creado individualmente. Emerge cuando personas con perspectivas diferentes colaboran con respeto y apertura real, produciendo soluciones que superan cualquier contribución individual.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dice Covey sobre el equilibrio entre "producción" (P) y "capacidad de producción" (CP)?',
        opciones: [
          'La producción siempre debe priorizarse sobre la capacidad de producción',
          'La capacidad de producción es un lujo que solo las grandes empresas pueden mantener',
          'Maximizar la producción inmediata destruyendo la capacidad de producción futura es inefectivo a largo plazo',
          'El equilibrio P/CP solo aplica a negocios, no a la vida personal',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Covey ilustra con el granjero que mata las gallinas para obtener todos los huevos a la vez: maximiza producción inmediata pero destruye la fuente futura. El individuo que trabaja sin descanso hace lo mismo. La efectividad genuina equilibra la producción de resultados con el mantenimiento de la capacidad que los produce.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia hace Covey entre la "ética de la personalidad" y la "ética del carácter"?',
        opciones: [
          'La ética de personalidad es para relaciones personales y la de carácter para el trabajo profesional',
          'La ética de personalidad usa técnicas y actitudes superficiales; la de carácter se basa en principios profundos e internos',
          'La ética de carácter es más antigua y conservadora; la de personalidad es más moderna y adaptable',
          'No hay diferencia práctica — ambas buscan los mismos resultados por diferentes caminos igualmente válidos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La ética de personalidad (técnicas, primeras impresiones, lenguaje corporal) produce resultados superficiales sin fundamento de carácter. La ética del carácter (integridad, humildad, valentía, justicia) produce cambios genuinos y duraderos porque está alineada con las leyes naturales de la vida humana. Sin carácter, las técnicas son manipulación que otros perciben.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es un "cambio de paradigma" según Covey y por qué es necesario?',
        opciones: [
          'Cambiar de trabajo o de carrera cuando el actual no genera los resultados esperados',
          'Una transformación en la manera fundamental de interpretar la realidad — necesaria porque el mapa influye en el territorio',
          'Adaptar las técnicas de trabajo cuando cambia el entorno o el mercado en que se opera',
          'Actualizar las metas y objetivos para que reflejen las nuevas condiciones de vida y trabajo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Un paradigma es el mapa mental a través del cual interpretamos la realidad. La calidad de nuestros resultados depende de la exactitud de ese mapa. Un cambio de paradigma — una transformación en la manera fundamental de ver — produce cambios duraderos que las técnicas sin ese cambio no pueden lograr. Las técnicas sin cambio de paradigma son como reordenar las sillas en el Titanic.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa "empezar con el fin en mente" como segundo hábito?',
        opciones: [
          'Conocer el resultado deseado de cada reunión o proyecto antes de comenzar la ejecución',
          'Planear el retiro o el cierre de un negocio antes de iniciarlo para anticipar las salidas',
          'Crear conscientemente la visión de quién quieres ser — todas las cosas se crean dos veces: primero en la mente',
          'Estudiar los casos de éxito en tu campo antes de emprender para evitar errores conocidos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El segundo hábito se basa en que todas las cosas se crean dos veces: primero en la mente y luego en la realidad. Empezar con el fin en mente significa crear conscientemente la visión de quién quieres ser y qué quieres lograr — no solo al inicio de proyectos sino al inicio de cada día, guiado por los valores y misión personal del líder.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los cuatro aspectos que renueva el séptimo hábito "afilar la sierra"?',
        opciones: [
          'Trabajo, familia, dinero y salud — las cuatro áreas más importantes de cualquier vida',
          'Metas, hábitos, relaciones y tiempo — los cuatro recursos fundamentales del ser efectivo',
          'El físico, el mental, el espiritual y el social/emocional — los cuatro aspectos del ser humano completo',
          'El profesional, el financiero, el recreativo y el comunitario — los cuatro roles del adulto moderno',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El séptimo hábito renueva los cuatro aspectos del ser humano: físico (ejercicio, nutrición, descanso), mental (lectura, escritura, aprendizaje), espiritual (valores, meditación, conexión), y social/emocional (relaciones, empatía, servicio). Un desequilibrio prolongado en cualquiera deteriora los otros tres y la efectividad en todas las áreas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué afirma Covey sobre el "pensar ganar-ganar" del cuarto hábito?',
        opciones: [
          'Es siempre posible si ambas partes están dispuestas a comprometerse y ceder por igual',
          'Es una mentalidad que busca soluciones donde todas las partes se benefician genuinamente',
          'Es un idealismo útil para relaciones personales pero poco práctico en el mundo empresarial competitivo',
          'Significa dividir los recursos disponibles de forma equitativa entre todas las partes involucradas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Ganar-ganar no es compromiso (donde cada parte cede algo) sino búsqueda de soluciones que satisfacen los intereses legítimos de todos. Covey la distingue de ganar-perder, perder-ganar y perder-perder. Aunque no siempre posible, la mentalidad ganar-ganar produce las relaciones más duraderas y los acuerdos más robustos a largo plazo.',
      ),
    ],
  ),

  Libro(
    id: 'mot05',
    titulo: 'La Actitud Mental Positiva',
    autor: 'Napoleon Hill y W. Clement Stone',
    anio: '1960',
    emoji: '☀️',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'Hill y Stone demuestran que una actitud mental positiva no es optimismo ingenuo sino el catalizador científico del éxito en todas las áreas de la vida.',
    gemasRecompensa: 42,
    capitulos: [
      const CapituloResumen(
        titulo: 'La AMP: El Catalizador del Éxito',
        emoji: '⚡',
        contenido: '''
Napoleon Hill, el autor de "Piense y Hágase Rico", se une en este libro con W. Clement Stone, un multimillonario que construyó un imperio empresarial desde la pobreza absoluta, para presentar uno de los conceptos más poderosos del desarrollo personal: la Actitud Mental Positiva (AMP).

La AMP no es sonreír cuando algo va mal ni ignorar los problemas reales. Es algo mucho más profundo y más práctico: es la disposición a buscar activamente lo positivo, lo constructivo y lo posible en cualquier situación, al tiempo que se reconocen honestamente los desafíos.

Hill y Stone comenzan con una observación empírica que ninguno de sus lectores puede negar: ante la misma situación, diferentes personas reaccionan de maneras radicalmente diferentes y obtienen resultados radicalmente diferentes. La diferencia no está siempre en las habilidades técnicas ni en los recursos disponibles; está frecuentemente en la actitud.

Stone describe su propia historia: comenzó vendiendo periódicos a los seis años, vendiendo seguros a los trece, y fundó su compañía de seguros siendo adolescente. No tenía ventajas externas significativas: no tenía dinero, no tenía educación formal, no tenía contactos. Tenía una actitud positiva que lo hacía persistir donde otros se rendían, buscar oportunidades donde otros veían obstáculos y relacionarse con posibilidad donde otros veían imposibilidad.

La AMP, argumentan Hill y Stone, actúa como catalizador que acelera el efecto de todas las demás habilidades y recursos que una persona posee. Una persona con habilidades ordinarias y AMP supera consistentemente a una persona con habilidades extraordinarias y Actitud Mental Negativa.
''',
      ),
      const CapituloResumen(
        titulo: 'El Poder del Autosugestión y la Mente Subconsciente',
        emoji: '🧠',
        contenido: '''
Hill y Stone desarrollan en profundidad el mecanismo mediante el cual la actitud mental se instala y se transforma: la autosugestión y el subconsciente.

El subconsciente trabaja continuamente, procesando información e influyendo en el comportamiento de maneras que la conciencia no siempre registra. Esta naturaleza invisible del subconsciente tiene una consecuencia importante: instala actitudes y creencias sin que necesariamente lo sepamos.

La autosugestión es el proceso de alimentar deliberadamente al subconsciente con los pensamientos, creencias y actitudes que queremos que operen. No es magia; es el reconocimiento de que el subconsciente acepta lo que se le presenta con emoción y repetición como "real" y actúa en consecuencia.

Hill y Stone proponen un ejercicio específico que llaman "fórmula de autosugestión": escribir un objetivo claro y específico, escribir qué se dará a cambio de ese objetivo, crear un plan de acción inicial, leer este documento en voz alta mañana y noche con convicción. La repetición y la emoción instalan el objetivo en el subconsciente, que luego trabaja activamente para encontrar la manera de alcanzarlo.

Esta práctica puede sonar mística, pero su fundamento es psicológico: las personas con objetivos claros y una creencia profunda en ellos actúan diferente que las que no los tienen. Buscan activamente la información relevante, notan las oportunidades que otros dejan pasar y persisten ante obstáculos que desaniman a quienes no tienen esa claridad y esa creencia.

El subconsciente es el aliado más poderoso disponible para cualquier persona que sepa cómo alimentarlo.
''',
      ),
      const CapituloResumen(
        titulo: 'Vencer los Obstáculos con AMP',
        emoji: '🏔️',
        contenido: '''
Hill y Stone dedican un capítulo central a cómo la Actitud Mental Positiva transforma la relación con los obstáculos. No los elimina (nadie puede hacer eso) sino que transforma la manera en que se los experimenta y se los enfrenta.

El obstáculo visto desde la Actitud Mental Negativa es una señal de que el camino está bloqueado, de que el objetivo no es alcanzable para esa persona, de que quizás es mejor rendirse. El obstáculo visto desde la AMP es un desafío a resolver, una oportunidad de creatividad, una prueba que, si se supera, fortalece la capacidad para el siguiente.

Hill y Stone cuentan decenas de historias de personas que transformaron obstáculos aparentemente insuperables en trampolines hacia el éxito. La historia de Thomas Edison es quizás la más famosa: más de 10,000 intentos fallidos antes de que la bombilla funcionara. Cuando le preguntaron cómo se sentía después de tantos fracasos, respondió: "No fracasé 10,000 veces. Descubrí 10,000 maneras de cómo no hacer una bombilla."

Esta reencuadración del fracaso como información en lugar de condena es una de las manifestaciones más poderosas de la AMP. El fracaso con AMP produce aprendizaje. El fracaso con AMN produce derrota.

Hill y Stone también hablan de la importancia del "balance positivo de pensamientos": asegurarse de que los pensamientos positivos sobre un objetivo superen a los negativos. Esto no significa ignorar los riesgos (que deben analizarse honestamente) sino no permitir que el pensamiento negativo tome más espacio del que merece.

La mente que se alimenta más de posibilidad que de imposibilidad produce más intentos, más aprendizaje y eventualmente más éxito.
''',
      ),
      const CapituloResumen(
        titulo: 'El Servicio como Camino al Éxito',
        emoji: '🤲',
        contenido: '''
Una de las enseñanzas más contraculturales de Hill y Stone es su afirmación de que el servicio genuino a otros es el camino más seguro hacia el éxito personal. No el servicio como estrategia manipuladora para obtener algo a cambio, sino el servicio como expresión genuina del deseo de contribuir.

Esta enseñanza desafía la narrativa de que el éxito se logra compitiendo y ganando a costa de otros. Hill y Stone argumentan que las personas y empresas más exitosas a largo plazo son las que crean más valor para más personas. El valor creado para otros se convierte, eventualmente, en valor recibido por uno.

Stone describe su filosofía de ventas basada en el servicio: su objetivo en cada venta no era vender la póliza de seguro sino asegurarse de que el cliente tuviera la protección que realmente necesitaba. Esta orientación genuina hacia el bienestar del cliente producía una confianza que resultaba en ventas mucho más sostenibles que cualquier técnica de presión.

El principio de servicio también aplica al liderazgo. Los líderes más efectivos en el estudio de Hill y Stone son los que más energía dedican al desarrollo y bienestar de sus equipos. La paradoja del servicio en el liderazgo es que quien más da a su equipo recibe el mayor compromiso, lealtad y esfuerzo de ese equipo.

Hill y Stone identifican la Regla de Oro ("trata a otros como quieres ser tratado") no como un precepto moral abstracto sino como la estrategia más efectiva de negocios y relaciones disponible. Las personas tratadas con respeto, honestidad y generosidad responden con lo mismo.

El servicio con AMP es una filosofía de vida que produce éxito sostenible en todas las áreas.
''',
      ),
      const CapituloResumen(
        titulo: 'El Viaje hacia la Grandeza Personal',
        emoji: '🌟',
        contenido: '''
Hill y Stone cierran con una reflexión sobre el viaje hacia lo que llaman la "grandeza personal": no la fama ni la riqueza extrema sino el desarrollo pleno de las capacidades únicas de cada persona en servicio de algo más grande que ella misma.

La grandeza personal no requiere circunstancias excepcionales. Requiere una decisión: la decisión de no desperdiciar el potencial que cada persona lleva dentro. Hill y Stone observan que la mayoría de las personas llega al final de su vida habiendo usado solo una fracción de sus capacidades reales. No por falta de capacidad sino por falta de la actitud que las moviliza.

La AMP como práctica de vida significa comenzar cada día con una decisión consciente de orientar la mente hacia lo positivo, lo posible y lo constructivo. No de manera artificial o forzada, sino como reconocimiento genuino de que esta orientación produce mejores resultados en todas las circunstancias.

Hill y Stone también hablan del efecto de la AMP en la salud física. La investigación psicosomática (la conexión entre mente y cuerpo) muestra consistentemente que las personas con actitud positiva tienen mejor salud, se recuperan más rápido de enfermedades y viven más tiempo en promedio que las personas con actitud negativa. La actitud no es solo una cuestión de bienestar subjetivo; tiene efectos biológicos medibles.

El viaje hacia la grandeza personal con AMP es una espiral hacia arriba: cada logro refuerza la actitud, que produce más acción, que produce más logros. Una vez que este ciclo virtuoso comienza, produce resultados que se acumulan exponencialmente.

La actitud mental positiva no es el resultado del éxito; es su causa.
''',
      ),
    ],
    preguntas: [
      const PreguntaLibro(
        enunciado: '¿Qué enseña Stone sobre las ventas desde la perspectiva del servicio genuino?',
        opciones: [
          'Que el precio competitivo es más importante que la calidad del servicio',
          'Que técnicas de presión amigable son necesarias para cerrar ventas',
          'Que el objetivo real es asegurarse de que el cliente tenga lo que genuinamente necesita, lo que produce confianza y ventas sostenibles',
          'Que las ventas son un juego de números donde más llamadas producen más ventas',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Stone vendía seguros orientándose al bienestar real del cliente, no a la comisión. Esta genuina orientación al servicio producía confianza profunda y ventas más sostenibles que cualquier técnica de presión.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña Stone sobre el papel del liderazgo en el éxito de un equipo?',
        opciones: [
          'Que el líder debe monitorear y controlar a cada miembro del equipo constantemente',
          'Que el líder debe establecer metas claras y luego dejar al equipo trabajar de forma independiente',
          'Que los líderes más efectivos dedican más energía al desarrollo y bienestar de su equipo',
          'Que el liderazgo es innato y no puede desarrollarse con práctica o estudio',
        ],
        respuestaCorrecta: 2,
        explicacion: 'En el estudio de Hill y Stone, los líderes más efectivos son los que más energía dedican al desarrollo y bienestar de sus equipos. La paradoja del servicio en el liderazgo es que quien más da a su equipo recibe el mayor compromiso, lealtad y esfuerzo de regreso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Hill el mecanismo por el cual el subconsciente ayuda a alcanzar los objetivos?',
        opciones: [
          'El subconsciente envía señales al cuerpo para que trabaje más intensamente',
          'El subconsciente conecta misteriosamente con los subconscientes de otras personas que pueden ayudar',
          'El subconsciente acepta lo que se le presenta con emoción y repetición como "real" y actúa en consecuencia, orientando la percepción y la acción',
          'El subconsciente solo trabaja durante el sueño, enviando sueños con soluciones a los problemas',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El subconsciente acepta como "real" lo que se le presenta repetidamente con emoción. Una vez instalado el objetivo, trabaja orientando la atención a información relevante, haciendo notar oportunidades que antes se pasaban por alto y generando energía para la acción persistente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las tres principales influencias que moldean el compuesto personal según Hardy?',
        opciones: [
          'Genética, educación e inteligencia',
          'Dinero, tiempo y conexiones sociales',
          'Personas cercanas, información consumida y entorno físico',
          'Suerte, oportunidad y trabajo duro',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Hardy identifica tres fuerzas moldeadoras: 1) Las personas con quienes pasamos tiempo (somos el promedio de los cinco más cercanos), 2) La información que consumimos (libros, medios, contenido), 3) El entorno físico que envía señales constantes al cerebro.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "zona de resistencia" que describe Hardy respecto a los hábitos?',
        opciones: [
          'El período inicial donde el hábito requiere esfuerzo antes de automatizarse',
          'La oposición social que enfrentamos al cambiar nuestros hábitos',
          'La resistencia física del cuerpo al ejercicio en los primeros días',
          'La tentación de volver a malos hábitos después del éxito',
        ],
        respuestaCorrecta: 0,
        explicacion: 'La "zona de resistencia" son las primeras semanas de un nuevo hábito cuando el circuito neural no está mielinizado. Es el período más difícil y donde la mayoría abandona, justo antes de que el hábito se automatice. Hardy recomienda comprometerse 90 días antes de evaluar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué representa la estadía de Santiago con el cristalero en Tánger?',
        opciones: [
          'Que el trabajo honesto siempre lleva al éxito',
          'Que África es más difícil que Europa para los negocios',
          'Las pruebas necesarias del camino y el peligro de postergar los sueños',
          'Que los sueños deben esperar hasta tener suficiente dinero',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El cristalero postergó su sueño (peregrinar a La Meca) toda su vida por miedo. Representa el peligro de "vivir para mañana". Para Santiago, fue una prueba del camino donde aprendió paciencia y a hablar el lenguaje del mundo, antes de continuar su Leyenda.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mayor obstáculo para alcanzar un sueño según el Alquimista?',
        opciones: [
          'La falta de recursos económicos y conexiones sociales',
          'La distancia física entre el soñador y su objetivo',
          'El miedo al fracaso',
          'La competencia de otras personas con el mismo sueño',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El Alquimista enseña: "Hay una sola cosa que hace imposible alcanzar un sueño: el miedo al fracaso." No es la dificultad objetiva del camino sino el miedo interno lo que detiene a la mayoría de personas antes de comenzar o a mitad del camino.',
      ),
      const PreguntaLibro(
        enunciado: '¿Dónde estaba finalmente el tesoro que Santiago buscó en Egipto?',
        opciones: [
          'En las pirámides, exactamente donde había soñado',
          'En el oasis donde conoció a Fátima',
          'En España, en el mismo campo donde comenzó su viaje',
          'Dentro de sí mismo, no era un tesoro físico',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El tesoro estaba enterrado en España, donde comenzó el viaje. Esta ironía es intencional: sin emprender el viaje, Santiago nunca hubiera sabido dónde buscar. La verdadera riqueza fue la transformación personal durante el camino; el tesoro físico es solo la recompensa final.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué representa el "jardín magnífico" en la fábula de los Sabios de Sivana?',
        opciones: [
          'La naturaleza como fuente de paz y claridad',
          'La riqueza material cultivada con disciplina',
          'La mente humana y los pensamientos que elegimos cultivar',
          'El paraíso que espera a quienes viven virtuosamente',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El jardín magnífico representa la mente humana. La enseñanza central es: lo que plantes en tu mente, crecerá. Pensamientos de miedo producen una vida de miedo; pensamientos de posibilidad producen una vida extraordinaria. Debemos "cultivar la mente como un jardín", eligiendo cuidadosamente qué pensamientos permitimos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo enseñan los Sabios de Sivana a medir una "vida significativa"?',
        opciones: [
          'Por los logros materiales y reconocimientos acumulados',
          'Por la cantidad de personas que conociste y los lugares visitados',
          'No por lo que obtienes sino por lo que das: el servicio a los demás',
          'Por la paz interior que sientes al final de cada día',
        ],
        respuestaCorrecta: 2,
        explicacion: '"La medida de una vida significativa no es lo que obtienes sino lo que das." Las rosas en la fábula representan el servicio desinteresado. Los Sabios enseñan a comenzar cada día preguntando "¿cómo puedo servir hoy?" y a medir el éxito por el impacto positivo generado en la vida de otros.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa el principio de "siempre dar un poco más" en la filosofía de Wattles?',
        opciones: [
          'Donar el 10% de los ingresos a causas benéficas',
          'Trabajar más horas que los competidores para superar el mercado',
          'Dar siempre más valor del que se recibe en dinero como inversión cósmica de reciprocidad',
          'Ser generoso con los empleados para obtener mayor lealtad y productividad',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Wattles enseña que dar siempre más valor del que se recibe en dinero no es sacrificio sino inversión: el universo devuelve en abundancia lo dado generosamente. Este principio de "impresión y expresión" es la base de su ética económica y el mecanismo de la prosperidad sostenida.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué responsabilidad viene con el poder que produce seguir los principios de Wattles?',
        opciones: [
          'La responsabilidad de enseñar a otros cómo hacerse ricos siguiendo los mismos principios',
          'La responsabilidad de reinvertir el 50% de las ganancias en proyectos comunitarios',
          'Usar el poder para elevar a otros, no para dominarlos',
          'La responsabilidad de demostrar públicamente que la riqueza se logró de manera ética',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Wattles cierra su libro señalando que quien sigue sus principios se vuelve poderoso, y con ese poder viene responsabilidad: usarlo para elevar a otros, no para dominarlos. La riqueza bien ganada y bien usada es, para Wattles, uno de los mayores servicios que una persona puede prestar al mundo.',
      ),
    ],
  ),

  Libro(
    id: 'mot10',
    titulo: 'El Poder del Ahora',
    autor: 'Eckhart Tolle',
    anio: '1997',
    emoji: '🌿',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'Una guía espiritual transformadora que enseña cómo liberarse del sufrimiento mental identificando y trascendiendo al "ego" para vivir con plena conciencia en el momento presente.',
    gemasRecompensa: 44,
    capitulos: [
      const CapituloResumen(
        titulo: 'Tú No Eres Tu Mente',
        emoji: '📖',
        contenido: 'Eckhart Tolle comienza con la afirmación más radical del libro: "Tú no eres tu mente." Esto contradice la suposición fundamental de la cultura occidental que identifica la identidad con los pensamientos. Tolle describe su propia experiencia de iluminación a los 29 años: en el umbral de lo que parecía una crisis suicida, experimentó una profunda disociación entre el "yo" y el "que observa al yo", y en esa separación encontró una paz que nunca antes había conocido. La mente, explica Tolle, es una herramienta extraordinariamente poderosa, pero en la mayoría de personas se ha convertido en el amo en lugar del sirviente. El "ruido mental" —el flujo constante de pensamientos, juicios, recuerdos, preocupaciones y fantasías— ocupa tanto espacio que nunca hay silencio. Y en ese silencio, dice Tolle, es donde reside la conciencia real. Introduce la práctica del "observador": en lugar de identificarse con los pensamientos ("yo soy ansioso", "yo soy un fracasado"), observarlos desde afuera ("noto que hay un pensamiento de ansiedad"). Esta pequeña distancia transforma la experiencia: ya no eres el pensamiento, eres quien lo observa. Esta distinción —entre la mente y el Ser que la observa— es la base de toda la filosofía del libro.',
      ),
      const CapituloResumen(
        titulo: 'La Conciencia: El Acceso al Ahora',
        emoji: '📖',
        contenido: 'Tolle introduce el concepto del "cuerpo de dolor": la acumulación de emociones negativas no procesadas que se almacenan en el cuerpo y en la psique. Cada vez que sufrimos y no procesamos completamente la emoción, un residuo queda atrapado. Con el tiempo, estos residuos forman una entidad cuasi-autónoma que Tolle llama el "cuerpo de dolor", que busca alimentarse de nuevas emociones negativas. Esto explica por qué algunas personas parecen atraer el drama, los conflictos y las crisis: no es mala suerte sino que su cuerpo de dolor está buscando el "alimento" emocional que lo mantiene vivo. La solución que propone Tolle no es analizar el pasado —lo cual refuerza la identificación mental— sino traer conciencia plena a la emoción cuando surge. "Siente la emoción completamente, sin juzgarla, sin resistirla, sin identificarte con ella." En presencia de la conciencia pura, el cuerpo de dolor no puede sobrevivir. También introduce el concepto del "Poder del Ahora": solo en el momento presente tenemos acceso real a la vida. El pasado es memoria (ya terminó) y el futuro es anticipación (aún no existe). Todo dolor real proviene del pasado; todo miedo real proviene del futuro. En el ahora, libre de ambos, hay paz.',
      ),
      const CapituloResumen(
        titulo: 'El Ego: La Fuente del Sufrimiento',
        emoji: '📖',
        contenido: 'Tolle dedica un capítulo central a analizar el ego: no como orgullo o vanidad (el uso coloquial) sino como la estructura mental que crea la ilusión de un "yo" separado del resto de la existencia. El ego necesita constantemente afirmarse, compararse, diferenciarse y protegerse. "Necesita estar en contra de algo para existir: un problema, un enemigo, una queja, una persona difícil." Sin problemas, el ego se disuelve, lo cual percibe como una amenaza existencial. Esto explica por qué tantas personas, conscientemente sin querer sufrir, inconscientemente generan o perpetúan sus propios problemas. El ego opera principalmente en dos modos: lamentando el pasado o anticipando el futuro. Nunca puede estar completamente en el presente porque en el presente la ilusión de separación se disuelve. Tolle propone observar el propio ego sin juzgarlo: "La observación consciente del ego es el comienzo de su fin." Cuando ves el ego operando —cuando lo "cachas" generando un drama, comparándose, defendiéndose— pierdes un poco de identificación con él. Con práctica constante, la identificación se reduce y emergen períodos de "presencia" —momentos donde simplemente eres, sin la narrativa constante del ego. Estos momentos son los más vivos, creativos y pacíficos que podemos experimentar.',
      ),
      const CapituloResumen(
        titulo: 'Relaciones Conscientes e Inconscientes',
        emoji: '📖',
        contenido: 'Tolle aplica sus principios a las relaciones interpersonales con perspicacia considerable. La mayoría de relaciones, argumenta, son relaciones "egóticas": cada persona usa a la otra para satisfacer necesidades del ego (validación, seguridad, identidad, estimulación). Cuando el otro deja de satisfacer estas necesidades, surge el conflicto. Las relaciones egóticas oscilan entre la "luna de miel" (el otro satisface perfectamente las necesidades del ego) y el conflicto (el otro deja de hacerlo). Una relación consciente es fundamentalmente diferente: no busca en el otro aquello que el ego cree necesitar, sino que parte de la plenitud del Ser. "Puedes amar genuinamente cuando ya no necesitas al otro para completarte." Tolle también aborda el amor romántico con honestidad: el enamoramiento inicial frecuentemente es una proyección del ego (el otro representa lo que nos falta), no amor real. El amor real emerge después: cuando la proyección se disuelve y ves a la persona real, con sus imperfecciones, y la eliges conscientemente. La práctica que propone para mejorar relaciones es simple y poderosa: en tu próxima conversación, dedica toda tu atención a la otra persona sin planear tu respuesta mientras habla. Esta presencia plena —tan rara en el mundo moderno— transforma la calidad de cualquier relación.',
      ),
      const CapituloResumen(
        titulo: 'Más Allá de la Felicidad: La Paz del Ser',
        emoji: '📖',
        contenido: 'Tolle cierra con una distinción crucial entre la felicidad (un estado emocional condicionado por circunstancias externas) y la paz del Ser (un estado interno incondicional). La cultura moderna promete felicidad si obtienes las cosas correctas: el trabajo ideal, la pareja perfecta, el cuerpo deseado, el dinero suficiente. Pero cada vez que obtienes lo que querías, la felicidad dura poco antes de ser reemplazada por el siguiente deseo. Esto no es falla personal sino la naturaleza del ego: siempre quiere más. La paz del Ser, en cambio, no depende de circunstancias. Es la quietud que emerge cuando el ruido mental se silencia momentáneamente. No es aburrimiento ni indiferencia: es una plenitud vibrante que no requiere nada externo para completarse. Tolle propone prácticas concretas para acceder a esta paz: atención plena al cuerpo (sentir las sensaciones físicas actuales), atención a los sentidos (ver, escuchar, oler sin etiquetar), y pausas de presencia (varios momentos durante el día donde simplemente "eres" sin hacer ni pensar). El libro cierra con un mensaje universal: el sufrimiento no es inevitable. Es el precio de la identificación con el ego y con los pensamientos. Cuando esa identificación se afloja —cuando recuerdas que eres el observador, no los pensamientos observados— la vida se transforma sin que cambie ninguna circunstancia exterior.',
      ),
    ],
    preguntas: [
      const PreguntaLibro(
        enunciado: '¿Qué distingue la "paz del Ser" de la "felicidad" según Tolle?',
        opciones: [
          'La felicidad es superficial; la paz requiere sufrimiento para alcanzarse',
          'La felicidad dura más; la paz del Ser es temporal pero más intensa',
          'La felicidad depende de circunstancias externas; la paz del Ser es un estado interno incondicional',
          'La felicidad es para personas ordinarias; la paz del Ser solo para los iluminados',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La felicidad es un estado emocional condicionado por circunstancias (siempre temporal, el ego siempre quiere más). La paz del Ser es incondicional — no depende de nada externo — y emerge cuando el ruido mental se silencia. Es plenitud vibrante que cualquier persona puede experimentar a través de la presencia plena.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Tolle dice que "todo dolor real proviene del pasado y todo miedo real proviene del futuro"?',
        opciones: [
          'Porque el cerebro solo puede procesar eventos que ya ocurrieron o que anticipa',
          'Porque recordar el pasado produce depresión y anticipar el futuro produce ansiedad según la psicología moderna',
          'Porque en el momento presente, libre del pasado y el futuro, solo existe la paz del Ser',
          'Porque las heridas del pasado determinan los miedos al futuro de manera predecible',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El pasado ya terminó (es solo memoria) y el futuro aún no existe (es solo anticipación). El dolor se aloja en los recuerdos del pasado; el miedo, en las proyecciones del futuro. Solo el momento presente es real. En el ahora, libre de ambos, hay paz: no es posible sufrir o temer lo que simplemente "es" en este instante.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "cuerpo de dolor" según Eckhart Tolle?',
        opciones: [
          'El dolor físico crónico que almacena el cuerpo por traumas y lesiones no tratadas',
          'La acumulación de emociones negativas no procesadas que busca alimentarse de nuevas experiencias negativas',
          'La mente subconsciente que procesa el sufrimiento del pasado durante el sueño',
          'La resistencia corporal al cambio que se manifiesta como enfermedad psicosomática',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El cuerpo de dolor es la acumulación de emociones negativas no procesadas. Cada sufrimiento no procesado deja un residuo que forma una entidad cuasi-autónoma que busca alimentarse de nuevas emociones negativas. Esto explica por qué algunas personas parecen atraer el drama. La solución es traer conciencia plena a la emoción cuando surge, sin resistirla ni identificarse con ella.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Tolle la práctica del "observador"?',
        opciones: [
          'Observar el comportamiento de otros para aprender de sus errores sin juzgarlos',
          'En lugar de identificarse con los pensamientos, observarlos desde afuera como quien nota que hay un pensamiento',
          'Meditar durante horas hasta alcanzar un estado de vacío mental completo y sostenido',
          'Registrar en un diario los pensamientos automáticos para analizarlos racionalmente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La práctica del observador es: en lugar de "soy ansioso" (identificación), notar "hay un pensamiento de ansiedad" (observación). Esta pequeña distancia transforma la experiencia — ya no eres el pensamiento, eres quien lo observa. Esa distinción entre la mente y el Ser que la observa es la base de toda la filosofía del libro.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo opera el ego según Tolle y por qué necesita problemas?',
        opciones: [
          'El ego opera protegiendo la autoestima y necesita problemas para demostrar su capacidad de resolverlos',
          'El ego opera comparándose y diferenciándose, y necesita estar en contra de algo para existir',
          'El ego opera buscando placer y necesita problemas para justificar la búsqueda de compensaciones',
          'El ego opera acumulando logros y necesita problemas para crear nuevas oportunidades de éxito',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Tolle describe el ego como la estructura mental que crea la ilusión de un "yo" separado. Necesita compararse, diferenciarse y protegerse. "Necesita estar en contra de algo para existir." Sin problemas, el ego se disuelve — lo cual percibe como amenaza existencial. Por eso muchas personas inconscientemente generan o perpetúan sus propios problemas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre una relación "egótica" y una relación consciente según Tolle?',
        opciones: [
          'Las relaciones egóticas son intensas al inicio y las conscientes son más estables y duraderas',
          'Las egóticas usan al otro para satisfacer necesidades del ego; las conscientes parten de la plenitud del Ser',
          'Las relaciones egóticas son superficiales y las conscientes implican mayor compromiso emocional',
          'Las egóticas funcionan en el corto plazo y las conscientes requieren años de práctica espiritual',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las relaciones egóticas buscan en el otro lo que el ego cree necesitar (validación, seguridad, identidad). Cuando el otro deja de proveerlo, surge el conflicto. Las relaciones conscientes parten de la plenitud: "Puedes amar genuinamente cuando ya no necesitas al otro para completarte." No buscan llenar un vacío sino compartir desde la plenitud.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Tolle sobre el amor romántico inicial y el amor real?',
        opciones: [
          'El amor romántico inicial es el amor más puro y debe preservarse a través de rituales y compromisos',
          'El enamoramiento inicial frecuentemente es una proyección del ego; el amor real emerge cuando ves a la persona real y la eliges',
          'El amor romántico y el amor real son la misma experiencia en diferentes etapas del ciclo de la relación',
          'El amor romántico es siempre más intenso que el amor maduro aunque este último sea más sostenible',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Tolle es honesto sobre el enamoramiento: frecuentemente es una proyección del ego (el otro representa lo que nos falta). El amor real emerge después, cuando la proyección se disuelve, ves a la persona real con sus imperfecciones y la eliges conscientemente. No es la chispa del principio — es la decisión continua de una persona ante la persona completa.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué práctica concreta recomienda Tolle para mejorar la calidad de las relaciones?',
        opciones: [
          'Practicar la comunicación asertiva expresando necesidades sin culpar ni atacar al otro',
          'En la próxima conversación, dedicar toda la atención al otro sin planear la respuesta mientras habla',
          'Establecer rituales diarios de gratitud mutua para mantener el vínculo emocional activo',
          'Aprender a reconocer y comunicar las propias emociones antes de reaccionar ante las del otro',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Tolle propone una práctica simple: en tu próxima conversación, dedica toda tu atención a la otra persona sin planear tu respuesta mientras habla. Esta presencia plena — tan rara en el mundo moderno — transforma la calidad de cualquier relación. La persona siente que realmente es escuchada, y eso genera una conexión que ninguna técnica de comunicación puede replicar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las prácticas concretas que Tolle sugiere para acceder a la paz del Ser?',
        opciones: [
          'Yoga diario, meditación prolongada y abstención de redes sociales y noticias negativas',
          'Atención plena al cuerpo, atención a los sentidos sin etiquetar, y pausas de presencia durante el día',
          'Lectura de textos espirituales, oración regular y retiros de silencio periódicos',
          'Journaling de gratitud, visualización creativa y afirmaciones positivas repetidas en la mañana',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Tolle propone tres prácticas: atención plena al cuerpo (sentir las sensaciones físicas actuales), atención a los sentidos (ver, escuchar, oler sin etiquetar mentalmente), y pausas de presencia (momentos durante el día donde simplemente "eres" sin hacer ni pensar). Son prácticas accesibles en cualquier momento sin condiciones especiales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Tolle dice que "la observación consciente del ego es el comienzo de su fin"?',
        opciones: [
          'Porque analizarlo racionalmente revela su naturaleza irracional y lo hace perder fuerza gradualmente',
          'Porque cuando ves el ego operando pierdes identificación con él — con práctica la identificación se reduce',
          'Porque el ego no puede sobrevivir la crítica intelectual sostenida de sus propios mecanismos',
          'Porque la observación activa el hemisferio derecho del cerebro que compensa la dominancia del ego',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Cuando "cachas" al ego generando un drama, comparándose, defendiéndose — perdiste un poco de identificación con él. Ya no eres completamente el ego; hay algo que lo observa. Con práctica constante, la identificación se reduce y emergen períodos de "presencia" — los momentos más vivos, creativos y pacíficos que podemos experimentar.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 2 — El Poder del Pensamiento Positivo
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'mot02',
    titulo: 'El Poder del Pensamiento Positivo',
    autor: 'Norman Vincent Peale',
    anio: '1952',
    emoji: '☀️',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'Norman Vincent Peale combina principios psicológicos y espirituales para mostrar cómo transformar el pensamiento negativo habitual en una fuerza positiva que desbloquea la confianza, la salud y el éxito en todas las áreas de la vida.',
    gemasRecompensa: 55,
    capitulos: const [
      CapituloResumen(
        titulo: 'Creer en Ti Mismo: El Primer Paso',
        emoji: '🌟',
        contenido: '''Norman Vincent Peale, pastor y escritor estadounidense, publicó en 1952 uno de los libros de autoayuda más vendidos del siglo XX. Su premisa central es directa: la mayoría de las personas vive por debajo de su potencial no por falta de capacidad sino por falta de fe en sí mismas — y esa fe puede cultivarse deliberadamente.

Peale comienza con la observación de que el pensamiento negativo habitual funciona como una profecía autocumplida. La persona que entra a una reunión pensando "seguro lo voy a hacer mal" ya perdió antes de comenzar: su cuerpo transmite inseguridad, su mente busca confirmación del fracaso, y su comportamiento genera exactamente el resultado que temía. El pensamiento negativo no es solo un estado mental — es una fuerza activa que moldea la experiencia.

El antídoto que Peale propone es cultivar lo que llama "confianza tranquila" — no arrogancia ni optimismo superficial, sino la convicción serena de que uno tiene lo necesario para enfrentar lo que viene. Esta convicción no se genera pretendiendo que los problemas no existen, sino entrenando la mente para buscar primero lo que es posible, lo que está disponible, lo que puede funcionar.

Peale usa extensamente la técnica de la VISUALIZACIÓN POSITIVA: imaginar con detalle y emoción el resultado deseado, no como fantasía escapista sino como entrenamiento mental que programa el sistema nervioso para buscar activamente las condiciones que producen ese resultado.

La práctica central del primer capítulo es simple: cada mañana, antes de cualquier otra actividad, afirmar con convicción tres veces: "Con la ayuda de Dios, puedo hacer esto." La repetición con emoción instala gradualmente una nueva disposición mental que reemplaza el hábito del pensamiento negativo.''',
      ),
      CapituloResumen(
        titulo: 'Una Mente Tranquila: Superar la Ansiedad',
        emoji: '🕊️',
        contenido: '''Peale dedica un capítulo extenso a la ansiedad — que describe como "el mal más paralizante de nuestro tiempo" — y propone un sistema concreto para superarla basado en la combinación de técnicas psicológicas y espirituales.

La ansiedad, observa Peale, casi siempre opera sobre el futuro: aquello que podría salir mal, que podría perderse, que podría ocurrir. Rara vez el objeto del miedo es algo que está ocurriendo ahora mismo — es siempre una proyección a un futuro imaginado. Esta observación es el primer punto de apoyo para reducirla: la pregunta "¿está ocurriendo esto ahora mismo?" frecuentemente revela que no, y esa claridad reduce la intensidad de la ansiedad.

Peale propone el "método de la vaciante mental": así como una tina se vacía abriendo el tapón, la mente puede vaciarse de pensamientos negativos y ansiosos a través de la práctica deliberada. El proceso incluye: identificar los pensamientos ansiosos con claridad (sin evitarlos), examinar cada uno honestamente preguntando "¿qué es lo peor que podría pasar?", prepararse mentalmente para el peor escenario, y luego liberar el pensamiento en lugar de seguir rumiándolo.

La técnica complementaria es lo que Peale llama "saturación espiritual": llenar la mente con pensamientos, lecturas, oraciones y conversaciones que nutren la paz y la confianza. La mente no puede estar simultáneamente saturada de ansiedad y de paz — si llenas activamente el espacio mental con paz, el espacio para la ansiedad se reduce.

Peale también enseña la PRÁCTICA DE SOLTAR: reconocer que hay muchas cosas fuera del control propio, y liberar la ansiedad sobre ellas como un acto deliberado de confianza. "He hecho todo lo que puedo hacer; el resto no está en mis manos."''',
      ),
      CapituloResumen(
        titulo: 'Cómo Usar la Fe como Fuerza',
        emoji: '⚡',
        contenido: '''Peale propone que la fe — entendida no solo como creencia religiosa sino como la disposición fundamental de confiar en que las cosas pueden funcionar — es una fuerza psicológica y espiritual real que produce resultados tangibles.

La fe actúa de varias formas simultáneas. Primera: como filtro de atención. La persona con fe busca activamente las oportunidades, los recursos y los aliados disponibles. La persona sin fe busca activamente los obstáculos, las razones para no intentar, las excusas para no comprometerse. Ambas encuentran lo que buscan.

Segunda: como motor de acción. La persona con fe actúa aunque no tenga certeza de éxito. Esa acción genera información, experiencia y ajuste que eventualmente produce resultados. La persona sin fe espera la certeza antes de actuar — y esa certeza nunca llega, porque la certeza solo viene de la acción.

Tercera: como fuente de resiliencia. Cuando las cosas fallan (como inevitablemente ocurre), la persona con fe interpreta el fracaso como temporal e instructivo. La persona sin fe lo interpreta como confirmación de que nunca iba a funcionar.

Peale propone técnicas concretas para desarrollar fe: la lectura regular de textos inspiradores (la Biblia para él, aunque reconoce que cada persona tiene sus fuentes), la práctica de la gratitud como entrenamiento para ver lo que funciona en lugar de lo que falta, y la asociación con personas positivas que alimentan la fe en lugar de erosionarla.

El mensaje central: la fe no es una disposición mágica que algunos tienen y otros no. Es una habilidad que se desarrolla con práctica deliberada, como cualquier otra habilidad.''',
      ),
      CapituloResumen(
        titulo: 'La Energía del Pensamiento Positivo en la Salud',
        emoji: '💪',
        contenido: '''Peale dedica capítulos significativos a la conexión entre el pensamiento y la salud física — un tema que en 1952 era más radical de lo que parece hoy, pero que la psicología y la medicina contemporáneas han confirmado extensamente en sus fundamentos.

La observación central: el pensamiento negativo crónico tiene costos físicos reales. El estrés y la ansiedad sostenidos producen tensión muscular, problemas digestivos, deterioro del sistema inmune, fatiga crónica y presión arterial elevada. Esto no es solo metáfora — es fisiología bien documentada. La mente y el cuerpo no son sistemas separados que se afectan independientemente; son un sistema integrado donde el estado mental afecta directamente el estado físico y viceversa.

El pensamiento positivo — entendido como la disposición habitual de buscar lo que es posible, de interpretar el presente constructivamente y de confiar en la capacidad propia — produce el efecto opuesto: reduce el nivel de cortisol (la hormona del estrés), mejora el funcionamiento del sistema inmune, aumenta la energía disponible para la acción, y promueve la capacidad de recuperación tras las adversidades.

Peale propone prácticas concretas en la frontera de lo psicológico y lo espiritual: la "oración de relajación" (combinar respiración profunda con afirmaciones de paz para reducir la tensión física), la "renovación mental nocturna" (terminar el día liberando mentalmente las tensiones antes de dormir), y la "visualización de salud" (imaginar el cuerpo funcionando con vitalidad como complemento de los cuidados médicos).

También advierte contra la hipocondría y el pensamiento enfermizo: darle demasiada atención mental a síntomas leves puede amplificarlos. El equilibrio es tomar los cuidados físicos necesarios sin construir una identidad de enfermedad alrededor de las dolencias menores.''',
      ),
      CapituloResumen(
        titulo: 'El Pensamiento Positivo en las Relaciones y el Trabajo',
        emoji: '🌐',
        contenido: '''Peale cierra integrando los principios del pensamiento positivo en las dos áreas más importantes de la vida cotidiana: las relaciones interpersonales y el trabajo.

En las relaciones, el pensamiento positivo actúa como un modificador del ambiente social. La persona que entra a una conversación con disposición positiva hacia el otro — genuinamente esperando encontrar algo valioso, genuinamente interesada en el bienestar del otro — genera una respuesta diferente a la que genera alguien que entra con desconfianza o indiferencia. Las personas son extraordinariamente sensibles a estas disposiciones aunque no siempre puedan articularlas.

Peale identifica el PENSAMIENTO POSITIVO SOBRE LOS DEMÁS como una práctica particularmente poderosa: en lugar de buscar activamente los defectos de las personas con quienes interactúas, buscar activamente sus virtudes. No como autoengaño — como entrenamiento de la atención. Las personas que practican esto frecuentemente descubren que las mismas personas que antes les parecían difíciles resultan tener cualidades genuinas que nunca habían notado porque no estaban buscándolas.

En el trabajo, Peale propone combinar entusiasmo genuino con competencia técnica. El entusiasmo sin competencia es vacío; la competencia sin entusiasmo es mecánica. La combinación de ambas crea el desempeño de más alto nivel. El entusiasmo no se finge — se cultiva buscando activamente lo que es genuinamente interesante, retador y significativo en el trabajo actual, incluso cuando no es el trabajo ideal.

El libro cierra con una invitación a la práctica diaria: el pensamiento positivo no es un estado que se alcanza una vez — es un hábito que se construye con práctica deliberada, un pensamiento a la vez, durante suficiente tiempo para que se vuelva la disposición por defecto.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la premisa central del libro de Norman Vincent Peale?',
        opciones: [
          'La mayoría de las personas fracasa por falta de habilidades técnicas que se pueden desarrollar',
          'La mayoría vive por debajo de su potencial no por falta de capacidad sino por falta de fe en sí mismas',
          'El éxito es principalmente una función del entorno social y las oportunidades disponibles',
          'El pensamiento positivo puede reemplazar la acción y el trabajo duro en el logro de metas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Peale afirma que la mayoría de las personas vive por debajo de su potencial no por falta de capacidad sino por falta de fe en sí mismas — y esa fe puede cultivarse deliberadamente. El pensamiento negativo habitual actúa como profecía autocumplida, generando exactamente el resultado temido.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "método de la vaciante mental" que propone Peale para superar la ansiedad?',
        opciones: [
          'Un proceso de meditación que vacía la mente de todo pensamiento durante periodos específicos',
          'Identificar los pensamientos ansiosos, examinar el peor escenario posible, prepararse para él y luego soltar',
          'Reemplazar cada pensamiento negativo con una afirmación positiva equivalente de forma inmediata',
          'Evitar activamente los temas y situaciones que generan ansiedad hasta reducir su intensidad',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El método de la vaciante mental de Peale: identificar los pensamientos ansiosos claramente, examinar honestamente cada uno preguntando "¿qué es lo peor que podría pasar?", prepararse mentalmente para ese escenario, y luego liberar el pensamiento en lugar de seguir rumiándolo. Así como la tina se vacía abriendo el tapón, la mente se vacía de ansiedad con este proceso deliberado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo actúa la fe como "filtro de atención" según Peale?',
        opciones: [
          'La fe filtra las influencias negativas del entorno para proteger la mente de información dañina',
          'La persona con fe busca activamente oportunidades y aliados; la sin fe busca activamente obstáculos',
          'La fe filtra los deseos superficiales para que la mente se enfoque en los objetivos más importantes',
          'La fe actúa como filtro reduciendo las expectativas para que los resultados parezcan mejores',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Peale describe la fe como filtro de atención: la persona con fe busca activamente las oportunidades, recursos y aliados disponibles. La persona sin fe busca activamente los obstáculos y razones para no intentar. Ambas encuentran lo que buscan. La diferencia en resultados no es suerte — es lo que cada disposición lleva a notar y a buscar activamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué relación establece Peale entre el pensamiento y la salud física?',
        opciones: [
          'El pensamiento negativo solo afecta la salud mental, no el estado físico del cuerpo',
          'La conexión entre mente y cuerpo es metafórica pero no tiene base fisiológica real',
          'El pensamiento negativo crónico tiene costos físicos reales: tensión, deterioro inmune, fatiga y estrés sostenido',
          'Solo el pensamiento sobre la propia salud afecta al cuerpo — otros pensamientos negativos no tienen impacto',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Peale argumenta que la mente y el cuerpo son un sistema integrado. El estrés y la ansiedad crónicos producen tensión muscular, problemas digestivos, deterioro inmune y fatiga — efectos fisiológicos reales, no solo metáforas. El pensamiento positivo reduce el cortisol, mejora el sistema inmune y aumenta la energía disponible para la acción.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Peale como práctica del "pensamiento positivo sobre los demás"?',
        opciones: [
          'Pretender que los defectos de las personas no existen para mantener la armonía en las relaciones',
          'Buscar activamente las virtudes de las personas en lugar de sus defectos — entrenamiento de la atención',
          'Evitar pensar en personas con quienes tenemos conflictos para no generar negatividad innecesaria',
          'Expresar pensamientos positivos sobre los demás verbalmente aunque no los sintamos genuinamente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Peale propone buscar activamente las virtudes de las personas — no como autoengaño sino como entrenamiento de la atención. Las personas que practican esto frecuentemente descubren que quienes les parecían difíciles tienen cualidades genuinas que nunca notaron porque no las estaban buscando. Dirigir la atención deliberadamente cambia lo que encontramos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "saturación espiritual" que propone Peale para reducir la ansiedad?',
        opciones: [
          'Practicar rituales espirituales durante varias horas al día para mantener la mente enfocada en lo sagrado',
          'Llenar la mente activamente con pensamientos, lecturas y conversaciones que nutren la paz y la confianza',
          'Suprimir completamente todos los pensamientos mundanos durante períodos de meditación intensa',
          'Estudiar textos religiosos como único antídoto efectivo contra la ansiedad crónica y el pesimismo',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La saturación espiritual de Peale es llenar la mente activamente con pensamientos, lecturas, oraciones y conversaciones que nutren la paz y la confianza. La mente no puede estar saturada simultáneamente de ansiedad y de paz — si llenas activamente el espacio con paz, el espacio para la ansiedad se reduce. No requiere practicar una religión específica.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Peale la relación entre entusiasmo y competencia técnica en el trabajo?',
        opciones: [
          'El entusiasmo puede compensar la falta de competencia técnica si es suficientemente intenso',
          'La competencia técnica es más importante que el entusiasmo porque produce resultados medibles',
          'El entusiasmo sin competencia es vacío; la competencia sin entusiasmo es mecánica — la combinación es lo óptimo',
          'El entusiasmo natural es innato y no puede cultivarse en trabajos que no se elige voluntariamente',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Peale propone que el desempeño de más alto nivel combina entusiasmo genuino con competencia técnica. El entusiasmo sin competencia es vacío; la competencia sin entusiasmo es mecánica. El entusiasmo se cultiva — no se finge — buscando lo genuinamente interesante y significativo en el trabajo actual, incluso cuando no es el trabajo ideal.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "confianza tranquila" que Peale propone como alternativa al optimismo superficial?',
        opciones: [
          'Un estado de calma que se logra reduciendo las ambiciones para que los fracasos duelan menos',
          'La convicción serena de que uno tiene lo necesario para enfrentar lo que viene, sin negar los desafíos',
          'La actitud de ignorar conscientemente los problemas para mantener un estado emocional positivo',
          'La capacidad de proyectar confianza externamente aunque internamente se sienta inseguridad real',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La confianza tranquila de Peale no es arrogancia ni optimismo superficial — es la convicción serena de que uno tiene lo necesario para enfrentar lo que viene. No se genera pretendiendo que los problemas no existen, sino entrenando la mente para buscar primero lo posible, lo disponible y lo que puede funcionar en cada situación.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué el pensamiento positivo actúa como motor de acción según Peale?',
        opciones: [
          'Porque genera la certeza de éxito necesaria para comprometerse completamente con un objetivo',
          'Porque la persona con fe actúa aunque no tenga certeza — esa acción genera información que produce resultados',
          'Porque activa el pensamiento mágico que permite ver oportunidades que otros no pueden percibir',
          'Porque reduce el miedo al punto de eliminar la parálisis por análisis que frena la mayoría de personas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Peale describe la fe como motor de acción: la persona con fe actúa aunque no tenga certeza de éxito. Esa acción genera información, experiencia y ajuste que eventualmente produce resultados. La persona sin fe espera la certeza antes de actuar — y esa certeza nunca llega porque la certeza solo viene de la acción misma.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo entiende Peale la práctica de "soltar" dentro de su sistema de pensamiento positivo?',
        opciones: [
          'Abandonar las metas que han demostrado ser demasiado difíciles después de múltiples intentos fallidos',
          'Reconocer lo que está fuera del control propio y liberar la ansiedad sobre ello como acto deliberado de confianza',
          'Dejar de pensar en los problemas del pasado para concentrar toda la energía mental en el futuro deseado',
          'Reducir las expectativas sobre los resultados para que los fracasos sean más fáciles de aceptar emocionalmente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La práctica de soltar de Peale reconoce que hay muchas cosas fuera del control propio. Liberar la ansiedad sobre ellas — "he hecho todo lo que puedo hacer; el resto no está en mis manos" — es un acto deliberado de confianza, no de resignación. Reduce el sufrimiento sin reducir la acción en lo que sí está dentro del alcance propio.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 3 — Despertando al Gigante Interior
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'mot03',
    titulo: 'Despertando al Gigante Interior',
    autor: 'Tony Robbins',
    anio: '1991',
    emoji: '🔥',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'Tony Robbins presenta su sistema completo para tomar el control de la mente, las emociones, las relaciones y las finanzas, con herramientas concretas de programación neurolingüística y psicología del cambio.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'Las Decisiones que Forjan el Destino',
        emoji: '🎯',
        contenido: '''Tony Robbins abre con la afirmación que subyace a todo su trabajo: es la calidad de las decisiones que tomamos — no las circunstancias que enfrentamos — lo que determina la calidad de nuestra vida. Y la más poderosa de esas decisiones es la decisión de cambiar.

El cambio genuino, argumenta Robbins, no ocurre gradualmente — ocurre en un instante. El fumador que lleva veinte años intentando dejar no lo logra aumentando el número de intentos; lo logra cuando tiene un momento de claridad absoluta en el que su perspectiva cambia de raíz. El instante del cambio ya existía; lo que cambia es el umbral de dolor necesario para activarlo.

Robbins introduce el concepto de PUNTO DE DOLOR Y PLACER como los dos motores de toda conducta humana. Las personas se mueven hacia lo que asocian con placer y se alejan de lo que asocian con dolor. Entender tus propias asociaciones de dolor y placer sobre cualquier comportamiento que quieres cambiar es el primer paso para cambiar ese comportamiento.

Si quieres dejar de procrastinar, necesitas asociar más dolor a procrastinar (consecuencias reales y vívidas de no actuar) y más placer a actuar (beneficios claros y emocionalmente reales de hacerlo). Esta no es manipulación — es el reconocimiento honesto de cómo funciona la motivación humana.

El mensaje más poderoso del capítulo: no esperes a que el dolor externo sea suficientemente grande para obligarte a cambiar. Toma la decisión ahora, conscientemente, de elevar tus estándares — lo que estás dispuesto a tolerar y lo que no — y observa cómo tu vida responde a esa decisión.''',
      ),
      CapituloResumen(
        titulo: 'El Sistema de las Creencias: Cambiar lo que Crees',
        emoji: '🔮',
        contenido: '''Robbins dedica una parte central del libro al sistema de creencias — cómo se forman, cómo limitan, y cómo cambiarlas deliberadamente. Sus observaciones se apoyan en la programación neurolingüística (PNL), que estudia cómo el lenguaje y los patrones mentales influyen en el comportamiento.

Una creencia, en el sistema de Robbins, no es necesariamente verdad — es algo que la mente trata como verdad. Y lo que la mente trata como verdad, gobierna el comportamiento. Una persona que cree "soy malo para las matemáticas" actuará de maneras que confirman esa creencia (evitando las matemáticas, no esforzándose cuando las enfrenta, interpretando cada dificultad como confirmación de que tiene razón). Con el tiempo, la creencia se convierte en una profecía autocumplida irrefutable — no porque sea verdad sino porque nunca fue cuestionada.

Robbins propone el proceso de CUESTIONAMIENTO DE CREENCIAS LIMITANTES: primero identificarlas (¿qué creencia está detrás de este comportamiento que quiero cambiar?), luego desafiarlas activamente (¿es absolutamente verdad? ¿siempre ha sido verdad? ¿existe alguna excepción?), y finalmente reemplazarlas con creencias que empoderan.

También presenta el concepto de CREENCIAS GLOBALES — las creencias sobre uno mismo que afectan todas las áreas de la vida ("no soy suficientemente bueno", "no merezco el éxito", "las cosas siempre salen mal para mí") versus creencias específicas que solo afectan un área. Las creencias globales son las más importantes de transformar porque su impacto es más amplio.

El lenguaje que usamos sobre nosotros mismos es tanto reflejo como creador de nuestras creencias. Robbins presta especial atención a las palabras que usamos habitualmente para describir nuestra experiencia y propone ejercicios específicos para modificar ese lenguaje.''',
      ),
      CapituloResumen(
        titulo: 'El Control de las Emociones',
        emoji: '🌊',
        contenido: '''Robbins propone un sistema específico para el manejo de las emociones que va más allá de las técnicas convencionales de "control emocional". Su perspectiva: las emociones no son el enemigo a suprimir — son señales que hay que aprender a leer e interpretar correctamente para usarlas como información.

El concepto central es la EMOCIÓN COMO SEÑAL DE ACCIÓN. Cada emoción contiene un mensaje sobre qué necesita cambiarse. La rabia dice que algo importante está siendo violado. El miedo dice que algo necesita preparación o acción. La tristeza dice que algo o alguien valioso fue perdido y necesita duelo. Suprimir la emoción suprime el mensaje sin resolver la situación que lo generó.

Robbins introduce el modelo de los "diez estados emocionales más comunes" y su contraparte positiva, y propone técnicas para cambiar el estado emocional de forma deliberada. La más conocida es la de FISIOLOGÍA: cambiar la postura corporal, la respiración y los gestos cambia el estado emocional. Es imposible estar deprimido mientras caminas con energía, respiras profundamente y sonríes — no porque estés fingiendo, sino porque el cuerpo y la mente son un sistema bidireccional.

También propone el método de los "interrogatorios de calidad": las preguntas que te haces en un momento difícil determinan en qué se enfoca tu mente y por tanto cómo te sientes. "¿Por qué siempre me pasan estas cosas?" es una pregunta que garantiza respuestas que confirman el victimismo. "¿Qué puedo aprender de esto?" garantiza respuestas que generan crecimiento.

Robbins también aborda las emociones de referencia — los estados emocionales que la persona visita con más frecuencia — y la importancia de cultivar deliberadamente estados que producen los comportamientos y resultados deseados.''',
      ),
      CapituloResumen(
        titulo: 'Los Valores y las Reglas: Lo que Realmente Mueve',
        emoji: '⚖️',
        contenido: '''Uno de los capítulos más sofisticados del libro aborda los VALORES — lo que más importa a cada persona — y las REGLAS — las condiciones que determinan cuándo una persona siente que sus valores están siendo satisfechos o violados.

Robbins argumenta que la mayoría del sufrimiento interpersonal no viene de tener valores diferentes sino de tener reglas diferentes para el mismo valor. Dos personas pueden valorar igualmente el "respeto" pero tener reglas completamente distintas sobre qué comportamientos lo demuestran. Para una, respeto significa ser escuchado en silencio. Para otra, significa recibir retroalimentación directa. Cuando ambas interactúan usando sus propias reglas, ambas sienten que la otra las irrespeta — aunque ninguna tenga esa intención.

Clarificar los propios valores y las propias reglas — hacerlos conscientes — es un trabajo profundo que pocas personas hacen pero que transforma tanto la comprensión de sí mismo como la comprensión de las relaciones.

Robbins también introduce la distinción entre VALORES DE MOVIMIENTO (lo que buscamos: amor, éxito, libertad, seguridad) y VALORES DE EVITACIÓN (lo que evitamos: dolor, rechazo, fracaso, humillación). Los valores de evitación son frecuentemente más poderosos que los de movimiento — no buscamos el éxito tanto como evitamos el fracaso. Cuando los valores de evitación son muy intensos, paralizan.

La práctica propuesta: ordenar los propios valores por importancia, escribir las reglas para cada uno, y examinar si esas reglas son razonables (si es relativamente fácil sentir que el valor está siendo satisfecho) o si son punitivas (si nunca o rara vez se puede sentir que el valor está satisfecho, sin importar lo que ocurra).''',
      ),
      CapituloResumen(
        titulo: 'El Poder de las Preguntas y el Vocabulario',
        emoji: '💬',
        contenido: '''Robbins cierra el libro con dos herramientas que considera entre las más poderosas para transformar la experiencia: la calidad de las preguntas que nos hacemos y la calidad del vocabulario con que describimos nuestra experiencia.

LAS PREGUNTAS GOBIERNAN EL ENFOQUE, y el enfoque gobierna cómo nos sentimos y qué hacemos. La persona que se pregunta "¿por qué no puedo hacer nada bien?" garantiza que su mente encuentre evidencia de que en efecto no puede hacer nada bien. La persona que se pregunta "¿qué estoy haciendo bien en este momento?" garantiza que encuentre evidencia de lo que sí está funcionando. Ambas encontrarán respuestas — la diferencia es en qué dirección van esas respuestas.

Robbins propone una práctica de "preguntas de mañana": comenzar cada día haciéndose una serie de preguntas de alta calidad (¿qué estoy agradecido hoy? ¿qué me entusiasma de este día? ¿cómo puedo aprender algo hoy?) que sintoniza la mente hacia estados y enfoques productivos antes de que comience la rutina.

EL VOCABULARIO DE LA EXPERIENCIA es igualmente transformador. Las palabras que usamos para describir la experiencia interna no son neutrales — modulan la intensidad de esa experiencia. "Estoy furioso" versus "estoy molesto" no son descripciones del mismo estado — son creaciones parcialmente distintas. "Estoy desolado" versus "estoy un poco triste" no son la misma experiencia. Reducir el vocabulario de las emociones negativas y expandir el vocabulario de las emociones positivas cambia gradualmente la distribución de lo que se experimenta.

Robbins propone el "desafío del vocabulario emocional": durante diez días, cada vez que uses una palabra emocionalmente negativa intensa ("odio", "estoy destruido", "me muero"), cámbiala por algo más moderado. Observa qué pasa con tu experiencia.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la afirmación central de Tony Robbins sobre qué determina la calidad de la vida?',
        opciones: [
          'Las circunstancias que enfrentamos determinan en gran medida los resultados que obtenemos',
          'La calidad de las decisiones — no las circunstancias — determina la calidad de la vida',
          'El entorno social y la familia de origen determinan el potencial de desarrollo personal',
          'La genética y el temperamento innato son los factores más determinantes del éxito personal',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Robbins afirma que es la calidad de las decisiones que tomamos — no las circunstancias que enfrentamos — lo que determina la calidad de nuestra vida. Y la más poderosa de esas decisiones es la decisión de cambiar. Las circunstancias son la misma para muchas personas; las decisiones sobre cómo responder son lo que las diferencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué son los "dos motores de toda conducta humana" según Robbins?',
        opciones: [
          'El miedo y la esperanza — las dos emociones fundamentales que mueven el comportamiento humano',
          'El dolor y el placer — las personas se mueven hacia el placer y se alejan del dolor',
          'La razón y la emoción — la tensión entre ambas determina el comportamiento final',
          'El hábito y la decisión — la mayor parte del comportamiento es automático o deliberado',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Robbins identifica el dolor y el placer como los dos motores de toda conducta: las personas se mueven hacia lo que asocian con placer y se alejan de lo que asocian con dolor. Para cambiar un comportamiento, necesitas cambiar las asociaciones de dolor y placer que lo rodean, haciendo el comportamiento no deseado más doloroso y el deseado más placentero.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué son las "creencias globales" y por qué son especialmente importantes?',
        opciones: [
          'Creencias sobre el mundo en general que afectan la manera de relacionarse con la sociedad',
          'Creencias sobre uno mismo que afectan todas las áreas de la vida — su impacto es más amplio que las creencias específicas',
          'Creencias compartidas por muchas culturas que reflejan verdades universales sobre la experiencia humana',
          'Creencias sobre el dinero y el éxito que determinan los resultados financieros principalmente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las creencias globales son creencias sobre uno mismo ("no soy suficientemente bueno", "no merezco el éxito") que afectan todas las áreas de la vida. A diferencia de las creencias específicas que solo afectan un área, las globales tienen impacto generalizado. Son las más importantes de identificar y transformar porque su alcance es mucho mayor.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo usa Robbins la "fisiología" para cambiar el estado emocional?',
        opciones: [
          'A través de ejercicio físico intenso que libera endorfinas y mejora el estado de ánimo naturalmente',
          'Cambiando la postura corporal, la respiración y los gestos — el cuerpo y la mente son un sistema bidireccional',
          'Usando técnicas de relajación muscular progresiva que reducen la tensión física del estrés',
          'Modificando la dieta y el sueño para optimizar la química cerebral que produce los estados emocionales',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Robbins enseña que el cuerpo y la mente son un sistema bidireccional. Cambiar la postura (erguirse), la respiración (profunda y rítmica) y los gestos cambia el estado emocional porque es imposible que el cuerpo esté en postura de energía y la mente en estado de depresión simultáneamente. No es fingir — es usar la conexión mente-cuerpo deliberadamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre "valores de movimiento" y "valores de evitación" según Robbins?',
        opciones: [
          'Los valores de movimiento son más abstractos y los de evitación son más concretos y medibles',
          'Los de movimiento son lo que buscamos (amor, éxito); los de evitación son lo que evitamos (rechazo, fracaso)',
          'Los valores de movimiento cambian con la edad y los de evitación permanecen constantes toda la vida',
          'Los de movimiento generan motivación extrínseca y los de evitación generan motivación intrínseca',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los valores de movimiento son lo que buscamos activamente (amor, éxito, libertad). Los de evitación son lo que evitamos (dolor, rechazo, fracaso, humillación). Los valores de evitación son frecuentemente más poderosos — no buscamos el éxito tanto como evitamos el fracaso. Cuando los valores de evitación son muy intensos, paralizan la acción.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Robbins dice que las preguntas que nos hacemos "gobiernan el enfoque"?',
        opciones: [
          'Porque las preguntas activan el pensamiento lógico que supera las respuestas emocionales automáticas',
          'Porque las preguntas determinan en qué busca información la mente y por tanto qué encuentra y cómo se siente',
          'Porque hacer preguntas en lugar de afirmaciones es más respetuoso con la autonomía del subconsciente',
          'Porque las preguntas crean diálogo interno que es más efectivo que los monólogos de afirmaciones',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las preguntas determinan el enfoque de la mente y el enfoque determina cómo nos sentimos. "¿Por qué siempre me pasan estas cosas?" garantiza que la mente encuentre evidencia del victimismo. "¿Qué puedo aprender de esto?" garantiza que encuentre oportunidades de crecimiento. Ambas preguntas generan respuestas — la diferencia está en la dirección que toman.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia Robbins entre las "reglas" y los "valores" en las relaciones?',
        opciones: [
          'Los valores son más importantes que las reglas porque son más profundos y universales',
          'Los valores son lo que importa; las reglas son las condiciones que determinan cuándo sentimos que el valor está satisfecho',
          'Las reglas son racionales y los valores son emocionales, siendo los valores más auténticos',
          'Los valores cambian poco con el tiempo pero las reglas pueden modificarse fácilmente con práctica',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los valores son lo que más importa (respeto, amor, éxito). Las reglas son las condiciones que determinan cuándo sentimos que ese valor está siendo satisfecho. Dos personas pueden compartir el valor "respeto" pero tener reglas completamente distintas sobre qué comportamientos lo demuestran. Esta diferencia de reglas — no de valores — es la fuente de la mayoría de los conflictos interpersonales.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Robbins con el "desafío del vocabulario emocional"?',
        opciones: [
          'Ampliar el vocabulario emocional para describir con más precisión lo que se siente en cada momento',
          'Durante diez días, cambiar palabras emocionalmente negativas intensas por versiones más moderadas',
          'Aprender el vocabulario emocional de otras culturas para ampliar la perspectiva sobre las propias emociones',
          'Eliminar el vocabulario emocional negativo del lenguaje cotidiano para mantener un estado positivo constante',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El desafío es: durante diez días, cada vez que uses una palabra emocionalmente negativa intensa ("odio", "estoy destruido", "me muero"), cámbiala por algo más moderado. Las palabras que usamos para describir la experiencia interna no son neutrales — modulan la intensidad de esa experiencia. Reducir la intensidad del vocabulario negativo cambia la intensidad de lo que se experimenta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Robbins el momento del cambio genuino?',
        opciones: [
          'Es un proceso gradual de práctica constante que ocurre a lo largo de semanas o meses de esfuerzo',
          'Ocurre en un instante cuando la perspectiva cambia de raíz — el cambio ya estaba disponible, cambia el umbral de dolor',
          'Es el resultado acumulado de pequeñas decisiones correctas tomadas consistentemente durante años',
          'Ocurre cuando el entorno externo cambia suficientemente para hacer inevitable el cambio interno',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Robbins afirma que el cambio genuino no ocurre gradualmente — ocurre en un instante. El fumador de veinte años no lo logra aumentando intentos; lo logra cuando tiene un momento de claridad absoluta que cambia su perspectiva de raíz. El instante del cambio ya existía; lo que cambia es el umbral de dolor necesario para activarlo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo ve Robbins las emociones como "señales de acción"?',
        opciones: [
          'Las emociones señalan cuándo descansar (emociones negativas) y cuándo actuar (emociones positivas)',
          'Cada emoción contiene un mensaje sobre qué necesita cambiarse — suprimirla suprime el mensaje sin resolver la situación',
          'Las emociones señalan el nivel de energía disponible para la acción en cada momento específico',
          'Las emociones positivas señalan que las decisiones tomadas fueron correctas y las negativas que fueron erróneas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Robbins ve las emociones como señales que contienen mensajes: la rabia señala que algo importante está siendo violado; el miedo señala que algo necesita preparación; la tristeza señala que algo valioso fue perdido. Suprimir la emoción suprime el mensaje sin resolver la situación que lo generó. Las emociones son información, no el enemigo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 6 — El Monje que Vendió su Ferrari
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'mot06',
    titulo: 'El Monje que Vendió su Ferrari',
    autor: 'Robin Sharma',
    anio: '1997',
    emoji: '🏔️',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'A través de la fábula de Julian Mantle, un abogado estrella que lo abandona todo para buscar sabiduría en los Himalayas, Robin Sharma comparte siete virtudes para una vida con propósito, significado y alegría.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Crisis del Éxito: Cuando Ganar No es Suficiente',
        emoji: '⚡',
        contenido: '''Robin Sharma cuenta la historia de Julian Mantle, un abogado de litigación extraordinariamente exitoso: mansiones, Ferrari rojo, fama, dinero. Y completamente vacío. A los cincuenta y tres años, en plena audiencia judicial, Julian sufre un infarto fulminante que cambia todo.

La crisis de Julian no es solo física — es existencial. Ha logrado todo lo que se suponía que debía lograr, y descubre que no ha logrado nada de lo que realmente importa. No tiene paz. No tiene alegría. No tiene sentido. Tiene un cuerpo agotado, relaciones dañadas, y un alma que no ha alimentado en décadas.

Sharma usa esta historia para plantear la pregunta que más incomoda a las personas exitosas: ¿es posible que hayas subido toda la escalera del éxito para descubrir que estaba apoyada en la pared equivocada? El éxito convencional — dinero, poder, reconocimiento — puede construirse sin que su construcción incluya lo que la vida realmente vale: conexión, crecimiento, contribución, paz interior.

Julian vende todas sus posesiones incluyendo el Ferrari, y se va a la India. Lo que encuentra en los Himalayas, en un monasterio llamado Sivana, en compañía de los Grandes Sabios, es el tema del resto del libro. Cuando regresa, transformado, comparte con su colega John todo lo que aprendió — y el libro es esa conversación.

La fábula usa siete símbolos que forman el sistema de sabiduría que Julian trajo de regreso: un hermoso jardín, un faro poderoso, un maestro de lucha japonés, un cable dorado, un diamante brillante, un reloj de oro y unas rosas perfumadas. Cada símbolo representa una de las siete virtudes para una vida con propósito.''',
      ),
      CapituloResumen(
        titulo: 'Las Primeras Virtudes: Mente, Propósito y Autodisciplina',
        emoji: '🧘',
        contenido: '''Las primeras tres virtudes del sistema de Sivana — representadas por el jardín, el faro y el maestro japonés — abordan los fundamentos internos de la vida con propósito.

EL JARDÍN (Primera virtud): El dominio de la mente. Los Grandes Sabios enseñan que la mente es como un jardín que puede cultivarse o abandonarse. Si se abandona, crece la maleza — pensamientos negativos, miedos, resentimientos, preocupaciones. Si se cultiva activamente, florece lo que se planta: gratitud, posibilidad, paz.

La práctica central del primer principio es el SILENCIO DIARIO: al menos una hora de quietud intencional cada día para calmar la mente y acceder a la sabiduría interior que el ruido constante bloquea. Sharma enseña que la mente brillante necesita descanso tanto como el cuerpo — sin ese descanso, pierde agudeza, claridad y creatividad.

EL FARO (Segunda virtud): El propósito de vida. Julian aprende que las personas sin propósito claro son como barcos sin timón — son movidos por las corrientes externas en lugar de navegar hacia un destino elegido. El propósito da energía, dirección y resiliencia ante las dificultades.

EL MAESTRO DE LUCHA (Tercera virtud): La autodisciplina. En el sistema de los Grandes Sabios, la autodisciplina es la madre de todas las virtudes — sin ella, el propósito permanece como intención, el conocimiento permanece como teoría, y el crecimiento permanece como potencial. La autodisciplina convierte las intenciones en acciones y las acciones en resultados.

Sharma enseña que la autodisciplina no se construye con fuerza de voluntad sino con hábitos: pequeñas acciones repetidas consistentemente hasta que se vuelven automáticas, lo cual libera la energía de la fuerza de voluntad para los desafíos más grandes.''',
      ),
      CapituloResumen(
        titulo: 'Respeta el Tiempo y Cultiva las Relaciones',
        emoji: '⏰',
        contenido: '''Las virtudes cuarta y quinta — el cable dorado y el diamante — abordan el tiempo y el cuidado personal como fundamentos del florecimiento.

EL CABLE DORADO (Cuarta virtud): El respeto por el tiempo. Los Grandes Sabios enseñan que el tiempo es el activo más valioso e irreemplazable que cualquier ser humano posee — y que la mayoría lo trata como si fuera infinito. Julian aprende la práctica del ENFOQUE EN LO ESENCIAL: identificar las pocas actividades que producen el mayor impacto y construir la vida alrededor de esas actividades, diciendo no con gracia a todo lo demás.

Sharma presenta la filosofía del tiempo como un maestro: cada hora que pasa sin intención es una hora que no puede recuperarse. No se trata de productividad frenética sino de vivir con conciencia de que el tiempo es finito y elegir conscientemente cómo se invierte.

EL DIAMANTE (Quinta virtud): El propósito de servir. Julian aprende que la vida más significativa no se construye acumulando sino sirviendo. El diamante representa la idea de que el verdadero valor personal surge de la contribución que haces a la vida de otros — tu familia, tu comunidad, tu trabajo.

Sharma enseña el concepto de KAIZEN — el término japonés para la mejora continua — aplicado a todas las dimensiones de la vida. El compromiso de mejorar un poco cada día en la mente, el cuerpo, el espíritu y las relaciones produce transformaciones extraordinarias a lo largo del tiempo sin requerir esfuerzos heroicos en ningún momento particular.

La práctica propuesta: cada noche, antes de dormir, preguntarte "¿mejoré algo hoy? ¿serví a alguien hoy? ¿invertí mi tiempo en lo que más importa?"''',
      ),
      CapituloResumen(
        titulo: 'La Importancia del Momento Presente y el Legado',
        emoji: '🌸',
        contenido: '''Las últimas dos virtudes — el reloj de oro y las rosas — integran todo el sistema con una perspectiva de largo plazo que transforma la manera de vivir cada día.

EL RELOJ DE ORO (Sexta virtud): El poder del momento presente. Los Grandes Sabios enseñan que el pasado ya no existe y el futuro aún no existe — la única vida real ocurre en este instante. La mayoría de las personas vive en el pasado (rumiando, arrepintiéndose) o en el futuro (preocupándose, esperando) y pierde el único momento en que puede actuar: ahora.

Esta virtud también enseña la práctica de SABOREAR EL DÍA: encontrar el valor y la belleza en las experiencias ordinarias — una comida, una conversación, un atardecer. Las personas que viven corriendo de un logro al siguiente rara vez saborearon el camino. Y el camino es donde transcurre la vida real.

LAS ROSAS (Séptima virtud): El legado. La pregunta que los Grandes Sabios hacen a Julian — y que Julian lleva a John — es la pregunta más importante que cualquier persona puede hacerse: ¿cómo recordarán tu vida las personas cuando ya no estés? No qué logros tuviste sino qué impacto tuviste en las personas que amaste y en la comunidad que habitaste.

Sharma cierra con el mensaje central de toda la fábula: la vida de propósito no comienza cuando tienes suficiente dinero, cuando te retiras, cuando los hijos crecen, cuando las condiciones son perfectas. Comienza con una decisión que puedes tomar ahora — la decisión de vivir de manera intencional, de cuidar tu mente, de respetar tu tiempo, de servir a otros, de saborear cada momento.

Julian nunca recuperó su Ferrari. Encontró algo mucho más valioso.''',
      ),
      CapituloResumen(
        titulo: 'Los Rituales del Amanecer y la Vida Diaria',
        emoji: '🌅',
        contenido: '''Sharma dedica capítulos específicos a las prácticas diarias concretas que Julian trajo de Sivana — los rituales que permiten encarnar las siete virtudes en la vida cotidiana, no solo entenderlas intelectualmente.

El más importante de estos rituales es LO QUE LOS SABIOS LLAMAN "LA HORA DE ORO DEL AMANECER": los primeros sesenta minutos del día, antes de que el mundo externo demande atención, dedicados a los ejercicios que nutren el espíritu y afilan la mente. Sharma argumenta que cómo comienza el día determina en gran medida cómo transcurre — y que comenzar con intención y quietud en lugar de con el teléfono y las noticias transforma la calidad de toda la jornada.

Los rituales del amanecer incluyen ejercicio físico (Julian aprende que el cuerpo y la mente son un sistema — sin cuerpo sano, la mente no alcanza su potencial), lectura inspiradora (alimentar la mente con ideas que expanden la perspectiva), meditación o reflexión en silencio (acceder a la quietud interior que el ruido cotidiano bloquea), y escritura en un diario de gratitud y propósito.

Sharma también enseña el RITUAL DE LA NOCHE: revisar el día antes de dormir, identificar lo que funcionó y lo que aprender, liberar las tensiones del día para no llevarlas al sueño, y preparar la mente para el día siguiente con intención.

Una práctica específica que Julian comparte: el "diario de propósito" — un cuaderno donde se registra la visión de la vida ideal, los objetivos de cada área, y las acciones específicas de hoy que avanzan hacia esa visión. Revisarlo regularmente mantiene la alineación entre las acciones cotidianas y el propósito más profundo.

Los rituales son las herramientas concretas que hacen de las siete virtudes una práctica vivida, no solo un ideal admirado.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué descubrimiento existencial representa la crisis de Julian Mantle al inicio del libro?',
        opciones: [
          'Que el éxito profesional y el éxito personal siempre están en conflicto inevitable',
          'Que es posible lograr todo lo que se supone que debes lograr y descubrir que no has logrado lo que realmente importa',
          'Que la salud física es el único activo verdadero y debe priorizarse sobre cualquier logro profesional',
          'Que las personas exitosas son más infelices que las personas ordinarias estadísticamente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Julian representa el arquetipo del éxito sin significado: mansiones, Ferrari, fama — y completamente vacío. Su infarto revela que ha subido toda la escalera del éxito solo para descubrir que estaba apoyada en la pared equivocada. Logró todo lo que el mundo mide como éxito sin lograr nada de lo que realmente importa: paz, alegría, conexión, propósito.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué representa el "jardín" como primera virtud del sistema de Sivana?',
        opciones: [
          'La importancia del entorno físico natural para mantener la salud mental y emocional',
          'El dominio de la mente — que puede cultivarse (pensamientos positivos) o abandonarse (pensamientos negativos)',
          'El crecimiento gradual de las virtudes a través de la práctica diaria constante',
          'La conexión con la naturaleza como práctica espiritual para recuperar la perspectiva',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El jardín representa el dominio de la mente. Si se abandona, crece la maleza — pensamientos negativos, miedos, resentimientos. Si se cultiva activamente, florece lo que se planta: gratitud, posibilidad, paz. La práctica central es el silencio diario — al menos una hora de quietud intencional — para calmar la mente y acceder a la sabiduría interior.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo enseña Sharma a construir la autodisciplina según los principios de Sivana?',
        opciones: [
          'A través de la fuerza de voluntad intensiva aplicada consistentemente durante suficiente tiempo',
          'Con hábitos pequeños repetidos consistentemente hasta que se vuelven automáticos, liberando la fuerza de voluntad',
          'Mediante el compromiso público con los objetivos que genera responsabilidad social sostenida',
          'Con sistemas de recompensa y castigo que refuerzan los comportamientos deseados gradualmente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Sharma enseña que la autodisciplina no se construye con fuerza de voluntad sino con hábitos: pequeñas acciones repetidas consistentemente hasta que se vuelven automáticas. Esto libera la energía de la fuerza de voluntad para los desafíos más grandes. La autodisciplina es la madre de todas las virtudes porque sin ella el propósito permanece como intención.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña el "diamante" como quinta virtud del sistema de Sivana?',
        opciones: [
          'Que el valor personal se mide por la calidad del carácter, no por los logros externos acumulados',
          'El propósito de servir — el verdadero valor personal surge de la contribución que haces a la vida de otros',
          'La importancia de la excelencia en cada tarea como forma de desarrollar el carácter progresivamente',
          'Que las personas más valiosas son las que se han pulido a través de la adversidad superada',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El diamante representa el propósito de servir. Los Grandes Sabios enseñan que la vida más significativa no se construye acumulando sino sirviendo. El verdadero valor personal surge de la contribución que haces a la vida de otros — tu familia, tu comunidad, tu trabajo. El kaizen (mejora continua) aplicado a todas las dimensiones es la práctica central.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la pregunta del legado que los Grandes Sabios hacen reflexionar a Julian?',
        opciones: [
          '¿Cuántas personas lograron sus metas gracias a tu ayuda directa e indirecta?',
          '¿Cómo recordarán tu vida las personas cuando ya no estés — qué impacto tuviste, no qué logros acumulaste?',
          '¿Cuál fue el mayor obstáculo que superaste y qué enseñó ese proceso sobre tu carácter?',
          '¿Qué porcentaje de tu potencial desarrollaste a lo largo de tu vida en las áreas más importantes?',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La pregunta del legado es: ¿cómo recordarán tu vida las personas cuando ya no estés? No qué logros tuviste sino qué impacto tuviste en las personas que amaste y en la comunidad que habitaste. Esta pregunta — el símbolo de las rosas — integra todas las virtudes en una perspectiva de largo plazo que transforma cómo se vive cada día.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es "la hora de oro del amanecer" según el sistema de Sharma?',
        opciones: [
          'El período entre las 5 y las 6 de la mañana que científicamente produce la mayor claridad mental',
          'Los primeros sesenta minutos del día dedicados a ejercicio, lectura, meditación y gratitud antes de que el mundo demande',
          'Una hora semanal de reflexión profunda sobre el propósito de vida y los avances hacia él',
          'El momento al amanecer para planear el día con detalle antes de comenzar cualquier actividad',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La hora de oro del amanecer son los primeros sesenta minutos del día — antes de que el mundo externo demande atención — dedicados a ejercicio físico, lectura inspiradora, meditación o reflexión en silencio, y escritura de gratitud y propósito. Cómo comienza el día determina en gran medida cómo transcurre, según los Grandes Sabios de Sivana.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña el "reloj de oro" como sexta virtud de Sivana?',
        opciones: [
          'La importancia de la puntualidad y el respeto por el tiempo de los demás como práctica de integridad',
          'El poder del momento presente — la única vida real ocurre ahora, no en el pasado ni en el futuro proyectado',
          'La necesidad de planear con anticipación para no desperdiciar el tiempo en actividades de bajo impacto',
          'El valor de las tradiciones y rituales que conectan el pasado familiar con el presente cotidiano',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El reloj de oro representa el poder del momento presente. Los Grandes Sabios enseñan que el pasado ya no existe y el futuro aún no existe — la única vida real ocurre ahora. La práctica de "saborear el día" — encontrar valor y belleza en las experiencias ordinarias — permite vivir plenamente el único momento en que se puede actuar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo dice Sharma que comienza la vida de propósito?',
        opciones: [
          'Cuando se tiene suficiente seguridad financiera para dejar de preocuparse por el dinero',
          'Cuando los hijos crecen y las responsabilidades familiares se reducen suficientemente',
          'Comienza con una decisión que puedes tomar ahora — no cuando las condiciones sean perfectas',
          'Cuando encuentras un mentor o guía espiritual que te acompañe en el proceso de transformación',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Sharma insiste en que la vida de propósito no comienza cuando tienes suficiente dinero, cuando te retiras, cuando los hijos crecen, o cuando las condiciones son perfectas. Comienza con una decisión que puedes tomar ahora — la decisión de vivir intencionalmente, de cuidar la mente, de respetar el tiempo, de servir a otros y de saborear cada momento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el concepto de KAIZEN aplicado a la vida personal según Sharma?',
        opciones: [
          'Una técnica japonesa de gestión que mejora los procesos de trabajo eliminando los desperdicios',
          'El compromiso de mejorar un poco cada día en mente, cuerpo, espíritu y relaciones — que produce transformaciones extraordinarias',
          'Un sistema de planificación diaria que divide los grandes objetivos en pequeñas tareas manejables',
          'La práctica de evaluar cada acción según si contribuye al propósito principal o no contribuye',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Sharma aplica el kaizen (mejora continua japonesa) a todas las dimensiones de la vida: mente, cuerpo, espíritu y relaciones. El compromiso de mejorar un poco cada día — sin esfuerzos heroicos en ningún momento particular — produce transformaciones extraordinarias a lo largo del tiempo. La pregunta nocturna que propone: "¿mejoré algo hoy? ¿serví a alguien hoy?"',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué simboliza que Julian vendió su Ferrari?',
        opciones: [
          'Que el éxito material es intrínsecamente malo y debe abandonarse para alcanzar la paz espiritual',
          'Que es necesario renunciar a todas las posesiones para comenzar un camino de crecimiento personal',
          'El abandono de la identidad construida alrededor de los símbolos externos de éxito para buscar lo que realmente importa',
          'Que la humildad material es una virtud superior al éxito profesional en cualquier medida',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El Ferrari no es el villano del libro — es el símbolo de la identidad de Julian construida alrededor del éxito externo. Venderlo representa el abandono de esa identidad para buscar lo que realmente importa. Sharma no condena el éxito material — condena el éxito que viene a costa del crecimiento interior, las relaciones auténticas y el sentido de propósito.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 7 — ¿Quién se ha Llevado mi Queso?
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'mot07',
    titulo: '¿Quién se ha Llevado mi Queso?',
    autor: 'Spencer Johnson',
    anio: '1998',
    emoji: '🧀',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'Una fábula sobre el cambio con cuatro personajes — dos ratones y dos personas pequeñas — que ilustra las diferentes formas en que enfrentamos los cambios inevitables de la vida y cómo adaptarse con más rapidez y menos sufrimiento.',
    gemasRecompensa: 45,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Laberinto y el Queso',
        emoji: '🗺️',
        contenido: '''Spencer Johnson usa una fábula simple con simbolismo profundo. Cuatro personajes viven en un laberinto: los ratones Fisgón y Escurridizo, y los hombrecillos Hemm y Haw. Todos buscan Queso — el símbolo de lo que queremos en la vida: un buen trabajo, una relación, dinero, salud, paz interior, cualquier cosa que creemos que nos hará felices.

Al inicio, todos encuentran el Queso C — un depósito enorme de queso del tipo que más les gusta. Fisgón y Escurridizo, como ratones, lo celebran pero siguen revisando el laberinto para conocerlo bien. Hemm y Haw, como seres con pensamientos complejos, construyen una vida alrededor del Queso C. Decoran el área, llevan amigos a verlo, se sienten seguros con su abundancia.

Entonces el queso se acaba. En realidad, para los ratones esto no fue sorpresa — habían notado que el queso se iba reduciendo gradualmente. Sin dudarlo, salen a buscar más queso. Para Hemm y Haw, la situación es completamente diferente: el queso que organizó toda su identidad, sus rutinas y sus expectativas ha desaparecido, y el choque es devastating.

La fábula representa la realidad universal: el cambio ocurre. Los trabajos terminan, las relaciones cambian, los mercados se transforman, las circunstancias evolucionan. La pregunta no es si el queso cambiará — es qué harás cuando cambie.

Los cuatro personajes representan cuatro formas diferentes de responder al cambio, y sus historias revelan qué actitudes producen adaptación rápida y qué actitudes producen sufrimiento innecesario.''',
      ),
      CapituloResumen(
        titulo: 'Los Ratones: La Simplicidad de la Adaptación',
        emoji: '🐭',
        contenido: '''Fisgón y Escurridizo representan la simplicidad como virtud adaptativa. Los ratones no tienen el bagaje cognitivo que tienen Hemm y Haw — no analizan en exceso, no se apegan emocionalmente, no construyen identidades alrededor del queso. Cuando el queso se acaba, salen corriendo a buscar más. Así de simple.

Johnson reconoce que esta simplicidad no es estupidez — es la sabiduría de no complicar innecesariamente lo que es fundamentalmente simple: el cambio ocurre, te adaptas o sufres. Los ratones representan el instinto de adaptación que los seres humanos a menudo sofocan con análisis, apego y resistencia.

Lo que los ratones hacen bien, según Johnson, es mantener su PERSPECTIVA SIMPLE: hay queso en el laberinto; cuando el queso que teníamos se acaba, vamos a buscar más. No es personal. No es una injusticia. No es una tragedia. Es simplemente cómo funciona el laberinto.

Fisgón representa la anticipación: estaba atento a las señales de que el queso se estaba acabando mucho antes de que ocurriera. Esta es la virtud de mantenerse consciente de los cambios en el ambiente en lugar de suponer que las cosas siempre serán como son hoy.

Escurridizo representa la acción rápida: cuando el cambio llegó, no se quedó a analizar ni a deliberar — corrió. Esta es la virtud de actuar sin parálisis cuando el cambio ya es evidente.

Johnson propone una reflexión: ¿qué parte de ti es más como los ratones? ¿Qué pasaría si aplicaras esa simplicidad a los cambios que estás enfrentando actualmente?''',
      ),
      CapituloResumen(
        titulo: 'Hemm: La Resistencia al Cambio',
        emoji: '😤',
        contenido: '''Hemm representa la resistencia al cambio en su forma más pura. Cuando el queso desaparece, su primera reacción es la negación: "¿Quién se ha llevado mi queso? ¡Esto no puede estar pasando!" Luego viene la ira: "¡Alguien se lo ha llevado! ¡Esto es injusto!" Y después la nostalgia paralizante: "Era tan bueno... recuerdo cuando..."

La resistencia de Hemm tiene varias capas. Primera: el apego a lo conocido. El queso C era familiar, predecible, seguro. Cambiar significa enfrentar la incertidumbre del laberinto desconocido, y la incertidumbre asusta. Segunda: la identidad construida alrededor del queso. Hemm no solo perdió el queso — perdió la persona que era cuando tenía queso. Tiene que reconstruir quién es, y eso es amenazante.

Tercera capa: el pensamiento de justicia. Hemm siente que "merecía" el queso, que había trabajado duro para conseguirlo, y que por tanto no debería haberse ido. Este pensamiento convierte el cambio neutral en una injusticia personal — lo cual hace la adaptación mucho más difícil porque ahora involucra no solo ajustarse a la nueva realidad sino también superar el resentimiento.

Johnson no juzga a Hemm cruelmente — reconoce que estas reacciones son completamente humanas. Pero muestra que el sufrimiento de Hemm no es causado por el cambio del queso sino por su resistencia al cambio. El laberinto siguió igual; la diferencia estaba dentro de él.

La pregunta que el libro propone: ¿en qué áreas de tu vida estás siendo como Hemm, resistiendo un cambio que ya ocurrió y cuya resistencia solo está generando sufrimiento?''',
      ),
      CapituloResumen(
        titulo: 'Haw: El Camino de la Adaptación',
        emoji: '🚀',
        contenido: '''Haw es el personaje más rico de la fábula: el que cambia. Comienza como Hemm — resistiendo, negando, sufriendo — pero eventualmente decide moverse. Y el proceso de cómo cambia su perspectiva mientras explora el laberinto es el corazón del libro.

Mientras camina por el laberinto en busca de nuevo queso, Haw va escribiendo mensajes en las paredes — observaciones sobre su experiencia que espera que Hemm encuentre si alguna vez se decide a seguirlo. Estos mensajes son las lecciones centrales del libro.

"Si no cambias, puedes extinguirte" — Haw reconoce que aferrarse a una realidad que ya cambió no protege de la extinción, la garantiza. "Qué harías si no tuvieras miedo?" — el miedo a explorar el laberinto era más grande que el hambre de queso. Una vez que Haw decidió que el miedo ya no podía dirigirlo, todo cambió.

"Cuando superas el miedo, te sientes libre" — el momento en que Haw sale al laberinto a pesar del miedo, descubre algo inesperado: hay vida en el laberinto, hay pequeños trozos de queso que sustentan mientras busca el depósito grande, y la exploración misma es mejor que quedarse paralizado.

La adaptación de Haw no es sin miedo — es a pesar del miedo. Y mientras avanza, el miedo disminuye a medida que la acción reemplaza la parálisis. Eventualmente encuentra el Queso N — nuevo queso, abundante, diferente al que conocía pero igualmente satisfactorio.

El detalle final que Johnson añade: Haw sigue revisando el laberinto para no volver a ser sorprendido. Ha aprendido que el queso siempre cambia, y estar atento a ese cambio es la forma más inteligente de vivir en el laberinto.''',
      ),
      CapituloResumen(
        titulo: 'Las Lecciones del Laberinto',
        emoji: '💡',
        contenido: '''Johnson cierra con las lecciones extraídas de la fábula, que en el libro son enmarcadas como una conversación entre amigos adultos que reflexionan sobre cómo la historia se aplica a sus propias vidas — laborales, personales, y relacionales.

La primera lección es la más fundamental: EL CAMBIO SIEMPRE OCURRE. El queso se mueve — siempre. No es una anomalía ni una injusticia ni un fracaso de alguien. Es la naturaleza del laberinto de la vida. Las personas que construyen sus vidas como si el queso fuera permanente son las que más sufren cuando cambia.

La segunda lección: ANTICIPA EL CAMBIO. No esperes a que el queso desaparezca para empezar a explorar. Fisgón seguía revisando el laberinto incluso cuando había queso abundante. Esta vigilancia anticipatoria es lo que permitió a los ratones adaptarse sin drama.

La tercera lección: MUÉVETE CON EL QUESO RÁPIDAMENTE. Cuanto más tiempo esperas para adaptarte, más difícil se vuelve la adaptación — porque mientras esperas, el hambre crece, el miedo aumenta, y la narrativa de que el cambio fue injusto se consolida.

La cuarta lección: DISFRUTA DEL CAMBIO Y AVENTURA. Haw descubrió que explorar el laberinto era mejor de lo que esperaba. El cambio, que había temido, abrió posibilidades que el queso viejo nunca hubiera permitido.

La quinta lección: PREPÁRATE PARA CAMBIAR RÁPIDAMENTE DE NUEVO. El nuevo queso también cambiará eventualmente. La actitud adaptativa no es una respuesta de emergencia — es un modo de vida permanente que hace el cambio inevitable menos traumático y más rico en posibilidades.

La fábula termina con una imagen que resume todo: Haw explorando el laberinto, bien alimentado, en movimiento, listo para lo que viene.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué simboliza el "Queso" en la fábula de Spencer Johnson?',
        opciones: [
          'Exclusivamente el dinero y la seguridad financiera en la vida adulta',
          'Lo que queremos en la vida — trabajo, relación, salud, paz interior, cualquier cosa que creemos nos hará felices',
          'Los recursos materiales que se acumulan con el trabajo duro a lo largo del tiempo',
          'Las relaciones personales que dan sentido y propósito a la existencia humana',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El Queso es el símbolo de lo que queremos en la vida: puede ser un trabajo, una relación, dinero, salud, paz interior — cualquier cosa que la persona cree que la hará feliz o que le da seguridad. El libro aplica a todos esos dominios porque el cambio ocurre en todos ellos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué virtudes representan los ratones Fisgón y Escurridizo?',
        opciones: [
          'Fisgón: persistencia; Escurridizo: creatividad para encontrar soluciones alternativas',
          'Fisgón: anticipación (noto las señales de cambio); Escurridizo: acción rápida cuando el cambio llega',
          'Fisgón: análisis cuidadoso; Escurridizo: optimismo ante las situaciones adversas',
          'Fisgón: planificación estratégica; Escurridizo: ejecución eficiente del plan acordado',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Fisgón representa la anticipación: estaba atento a las señales de que el queso se reducía antes de que se acabara. Escurridizo representa la acción rápida: cuando el cambio llegó, no se quedó a analizar sino que actuó inmediatamente. Juntos representan la vigilancia anticipatoria y la adaptación sin parálisis.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las tres capas de resistencia de Hemm ante el cambio?',
        opciones: [
          'Ira, tristeza y aceptación — las tres fases del duelo ante una pérdida importante',
          'Apego a lo conocido, identidad construida alrededor del queso, y pensamiento de justicia que lo convierte en injusticia',
          'Negación, negociación y depresión — etapas clásicas de resistencia al cambio organizacional',
          'Miedo, pereza y comodidad — los tres obstáculos más comunes a la adaptación personal',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Johnson identifica tres capas en la resistencia de Hemm: el apego a lo conocido (familiar y predecible), la identidad construida alrededor del queso (perder el queso es perder quién era), y el pensamiento de justicia que convierte el cambio neutral en una injusticia personal, añadiendo resentimiento a la dificultad.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué descubre Haw cuando finalmente sale al laberinto a pesar del miedo?',
        opciones: [
          'Que el laberinto era más peligroso de lo que imaginaba y que Hemm tenía razón en esperar',
          'Que explorar era mejor de lo esperado — había queso en el camino y la exploración era mejor que la parálisis',
          'Que los ratones habían encontrado todo el queso disponible y no quedaba nada para los hombrecillos',
          'Que el miedo desaparecía completamente en el momento de salir a explorar el laberinto desconocido',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Haw descubre que explorar el laberinto era mejor de lo que esperaba: había pequeños trozos de queso que sustentaban en el camino, y la exploración misma era mejor que quedarse paralizado. Y mientras avanzaba, el miedo disminuía porque la acción reemplazaba la parálisis. La adaptación no fue sin miedo — fue a pesar del miedo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la causa real del sufrimiento de Hemm según Johnson?',
        opciones: [
          'La desaparición del queso — un evento externo que está completamente fuera de su control',
          'La decisión de otros personajes de buscar nuevo queso en lugar de ayudarle a recuperar el anterior',
          'Su resistencia al cambio — no el cambio mismo, sino su negativa a adaptarse a él',
          'La inseguridad del laberinto que hace razonable esperar hasta tener más información disponible',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Johnson es claro: el sufrimiento de Hemm no es causado por el cambio del queso sino por su resistencia al cambio. El laberinto siguió igual para todos. Fisgón, Escurridizo y eventualmente Haw encontraron nuevo queso. La diferencia no estaba en el laberinto — estaba en la actitud interna de cada personaje ante el mismo cambio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Haw sigue revisando el laberinto después de encontrar el Queso N?',
        opciones: [
          'Para ayudar a Hemm a encontrar el camino hacia el nuevo queso que descubrió',
          'Porque ha aprendido que el queso siempre cambia — mantenerse atento es la forma más inteligente de vivir',
          'Para marcar el territorio y asegurarse de que los ratones no acaben con el nuevo queso también',
          'Porque el nuevo queso no satisface completamente sus necesidades y sigue buscando algo mejor',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Haw sigue revisando el laberinto porque ha aprendido la lección más importante: el queso siempre cambia. Estar atento a ese cambio — como los ratones siempre lo estuvieron — es la forma más inteligente de vivir en el laberinto. La actitud adaptativa no es una respuesta de emergencia sino un modo de vida permanente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pregunta clave escribe Haw en la pared del laberinto que cambia su perspectiva?',
        opciones: [
          '"¿Qué tan rápido puede moverse el queso y cómo puedo anticiparlo?"',
          '"¿Qué harías si no tuvieras miedo?" — el miedo a explorar era más grande que el hambre de queso',
          '"¿A dónde se fue el queso y quién fue el responsable de moverlo?"',
          '"¿Vale la pena el riesgo de explorar el laberinto para encontrar nuevo queso?"',
        ],
        respuestaCorrecta: 1,
        explicacion: '"¿Qué harías si no tuvieras miedo?" es la pregunta que transforma la perspectiva de Haw. El miedo a explorar el laberinto desconocido era más grande que el hambre. Cuando se preguntó qué haría sin ese miedo, la respuesta fue clara: buscaría nuevo queso. Y esa pregunta le dio la dirección que la parálisis le había quitado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la primera lección que Johnson extrae de la fábula del queso?',
        opciones: [
          'La colaboración entre los cuatro personajes habría producido resultados mejores para todos',
          'El cambio siempre ocurre — el queso se mueve siempre, no es anomalía ni injusticia ni fracaso',
          'La preparación anticipada hace innecesaria la adaptación rápida en la mayoría de los casos',
          'Los instintos simples de los ratones son superiores al pensamiento complejo de los hombrecillos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La primera lección es la más fundamental: el cambio siempre ocurre. El queso se mueve — siempre. No es una anomalía, una injusticia ni un fracaso de alguien. Es la naturaleza del laberinto de la vida. Las personas que construyen sus vidas como si el queso fuera permanente son las que más sufren cuando inevitablemente cambia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia la adaptación de los ratones de la de Haw, según la fábula?',
        opciones: [
          'Los ratones tenían más recursos y experiencia que Haw para navegar el laberinto eficientemente',
          'Los ratones no tenían apego emocional ni identidad construida alrededor del queso, Haw sí — por eso tardó más',
          'Haw logró adaptarse mejor porque usó el pensamiento complejo que los ratones no tenían disponible',
          'No hay diferencia real — todos adaptaron de forma igualmente exitosa por diferentes caminos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los ratones no tenían el bagaje cognitivo de Hemm y Haw — no construyeron identidad alrededor del queso, no lo convirtieron en injusticia cuando cambió. Haw tardó más porque primero tuvo que superar el apego, el pensamiento de justicia y la parálisis por miedo. Eventualmente lo logró, pero el costo fue mayor. La simplicidad de los ratones fue su ventaja adaptativa.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Johnson dice que esperar para adaptarse hace la adaptación más difícil?',
        opciones: [
          'Porque el nuevo queso se agota más rápido mientras se espera y hay menos disponible al llegar',
          'Porque mientras se espera el hambre crece, el miedo aumenta y la narrativa de injusticia se consolida',
          'Porque la inactividad genera hábitos de parálisis que son cada vez más difíciles de romper',
          'Porque los competidores que actúan antes ocupan los mejores territorios del laberinto disponibles',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Johnson advierte que cuanto más tiempo se espera para adaptarse, más difícil se vuelve: el hambre crece (el sufrimiento de la situación actual aumenta), el miedo al cambio aumenta (la amenaza imaginada de lo desconocido se amplifica), y la narrativa de que el cambio fue injusto se consolida (haciendo más difícil aceptarla). La demora multiplica el costo del cambio.',
      ),
    ],
  ),

  Libro(
    id: 'mot08',
    titulo: 'El Secreto',
    autor: 'Rhonda Byrne',
    anio: '2006',
    emoji: '🔮',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'La ley de la atracción como principio universal: tus pensamientos y emociones dominantes crean tu realidad, y puedes usarlos conscientemente para atraer lo que deseas.',
    gemasRecompensa: 55,
    capitulos: [
      const CapituloResumen(
        titulo: 'La Ley de la Atracción',
        emoji: '🧲',
        contenido: '''
Rhonda Byrne afirma que existe una ley universal tan poderosa como la gravedad: la ley de la atracción. Esta ley dice que lo semejante atrae a lo semejante. Tus pensamientos son frecuencias magnéticas que se envían al universo y atraen de vuelta lo que vibra en la misma frecuencia.

Todo lo que existe en tu vida — tu cuenta bancaria, tus relaciones, tu salud, tu trabajo — llegó a ti porque en algún momento fue el foco dominante de tu pensamiento. Ya seas consciente de ello o no, siempre estás atrayendo. La pregunta no es si funciona la ley, sino si la estás usando deliberadamente o por defecto.

Byrne recopiló testimonios de filósofos, científicos y empresarios a lo largo de la historia que conocían este principio. Desde Platón hasta Einstein, desde Shakespeare hasta Emerson — todos apuntaban a la misma verdad: la mente humana tiene un poder creativo sobre la realidad exterior que la mayoría nunca aprende a usar conscientemente.

La ley no distingue entre lo que quieres y lo que no quieres. Si te enfocas en "no quiero deudas", el universo procesa "deudas" y atrae más de eso. Por eso el secreto no es desear sino afirmar, no es huir de lo que no quieres sino correr hacia lo que sí quieres. Pensar en abundancia atrae abundancia. Pensar en carencia atrae carencia.
''',
      ),
      const CapituloResumen(
        titulo: 'El Proceso: Pedir, Creer, Recibir',
        emoji: '✨',
        contenido: '''
Byrne describe un proceso de tres pasos para usar el secreto deliberadamente. El primer paso es pedir: ser absolutamente claro sobre lo que quieres. No pidas de forma vaga — el universo no puede procesar "quiero más dinero" con la misma precisión que "tengo 10,000 dólares en mi cuenta". La claridad es el primer poder.

El segundo paso es creer: actuar, hablar y pensar como si ya tuvieras lo que deseas. Esta es la parte más desafiante para la mayoría, porque nuestra realidad presente contradice lo que pedimos. El secreto es que el universo responde a tu estado interno, no a tu estado externo. Si sientes que ya tienes lo que deseas, esa es la frecuencia que emites y atrae.

El tercer paso es recibir: estar en el estado emocional de cómo te sentirías si ya tuvieras lo que quieres. La emoción es el combustible del proceso. Las emociones positivas como gratitud, amor y alegría son las frecuencias más poderosas para atraer. Las emociones negativas son señales de que tus pensamientos están desalineados con lo que deseas.

Muchos leen esto como pasividad — solo pensar y nada llegará. Pero Byrne aclara que la ley de la atracción inspira acción: cuando vibras en la frecuencia correcta, recibes intuiciones, inspiraciones y te encuentras en el lugar correcto en el momento correcto. La acción inspirada fluye naturalmente de la alineación interna.
''',
      ),
      const CapituloResumen(
        titulo: 'El Poder de los Pensamientos y las Emociones',
        emoji: '💭',
        contenido: '''
Byrne argumenta que los pensamientos son cosas reales con frecuencia y poder. Cada pensamiento que tienes se convierte en una señal que el universo recibe y devuelve en forma de experiencias concordantes. Por eso la vigilancia mental no es un lujo espiritual sino una necesidad práctica para quien quiere crear deliberadamente su vida.

Las emociones son el sistema de retroalimentación que te dice qué frecuencia estás emitiendo. Cuando te sientes bien, estás en alineación con tus deseos y la ley trabaja a tu favor. Cuando te sientes mal, estás en desalineación. Por eso el trabajo fundamental del secreto es aprender a gestionar tu estado emocional independientemente de las circunstancias externas.

La gratitud es una de las herramientas más poderosas en este sistema. Cuando aprecias lo que ya tienes, emites una frecuencia de abundancia que atrae más abundancia. Byrne sugiere comenzar cada día listando las cosas por las que estás agradecido antes de revisar tu teléfono, noticias o preocupaciones. Este simple acto reorienta tu frecuencia desde el inicio del día.

La visualización — imaginar vívidamente que ya tienes lo que deseas, con detalles sensoriales y emocionales — es otro instrumento clave. No es fantasía inútil: es programación deliberada de la mente subconsciente, que no distingue entre experiencia real e imaginada vívidamente. Grandes atletas y empresarios la han usado sistemáticamente para crear resultados reales.
''',
      ),
      const CapituloResumen(
        titulo: 'El Secreto en el Dinero, la Salud y las Relaciones',
        emoji: '💰',
        contenido: '''
Byrne aplica la ley de la atracción a las áreas específicas de la vida. En cuanto al dinero, dice que la razón por la que la mayoría tiene dificultades financieras es porque piensan más en la falta que en la abundancia. Las deudas generan más deudas cuando son el foco dominante. La solución es dirigir conscientemente la mente hacia la abundancia: visualizar cuentas llenas, sentir gratitud por el dinero que ya se tiene, y actuar como alguien que sabe que el dinero fluye hacia él.

En la salud, Byrne va más lejos y argumenta que el cuerpo responde a los pensamientos. Cita casos de remisión espontánea de enfermedades y atribuye la sanación al cambio de estado mental y emocional. La fe en la recuperación, la visualización de salud perfecta y la eliminación del pensamiento de enfermedad son los pilares de su enfoque de salud. Aunque esta posición es la más controversial del libro, Byrne la defiende como una extensión lógica de la ley universal.

En las relaciones, el secreto funciona de la misma forma: atraes lo que eres. Si quieres amor, conviértete en amor. Si quieres respeto, ofrece respeto. Si quieres amigos leales, sé un amigo leal. No puedes atraer desde la carencia — "necesito amor" repele el amor porque vibra en frecuencia de necesidad. "Tengo amor para dar" atrae amor porque vibra en abundancia.

Una de las ideas más poderosas del libro es que no puedes cambiar a otra persona con tus pensamientos sobre ella. Pero sí puedes cambiar la relación cambiando tus propios pensamientos y estado. Cuando cambias tu frecuencia, cambia lo que atraes en la persona y en la dinámica.
''',
      ),
      const CapituloResumen(
        titulo: 'El Secreto y el Yo — La Visión Más Profunda',
        emoji: '🌌',
        contenido: '''
En la conclusión de su mensaje, Byrne va más allá de la aplicación práctica y toca la dimensión filosófica del secreto. La ley de la atracción no es solo una técnica para obtener cosas — es una ventana hacia la naturaleza de la realidad y del yo. Cuando entiendes que tus pensamientos crean tu experiencia, comprendes que eres el creador de tu vida, no la víctima de las circunstancias.

Este cambio de identidad — de víctima a creador — es la transformación más profunda que el libro propone. No eres el resultado de tu historia, tu familia, tu economía o tu país. Eres un ser con poder creativo que ha estado creando inconscientemente. El secreto es simplemente aprender a crear con conciencia.

Byrne conecta esto con las tradiciones espirituales más antiguas: el Hinduismo habla del ser como creador; el Budismo habla de que la mente precede a la realidad; el Cristianismo habla de que todo lo que pides creyendo lo recibirás. El secreto no es nueva age ni pseudo-ciencia según sus defensores — es la re-descubierta verdad de que la mente es el origen de la experiencia.

La responsabilidad que conlleva esta visión es absoluta: si tú creas tu realidad, no puedes culpar a nadie más por lo que tienes o no tienes. Esto puede sentirse pesado inicialmente, pero Byrne lo presenta como la noticia más liberadora posible: si tú lo creaste, tú puedes cambiarlo. El poder siempre ha estado en ti.
''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué afirma Byrne que es la ley de la atracción en su principio fundamental?',
        opciones: [
          'Una ley espiritual que premia a los que rezan más con abundancia material proporcional a su fe',
          'Una ley universal según la cual los pensamientos dominantes atraen experiencias y realidades concordantes',
          'Una técnica de programación neurolingüística para reprogramar el subconsciente mediante afirmaciones',
          'Un principio de autoayuda basado en que la acción positiva genera resultados positivos proporcionales',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Byrne presenta la ley de la atracción como una ley universal — tan real como la gravedad — que dice que los pensamientos y emociones dominantes actúan como frecuencias magnéticas que atraen experiencias y realidades de igual frecuencia. No es exclusivamente espiritual ni psicológica en su presentación, sino una ley del universo que funciona para todos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los tres pasos del proceso que Byrne describe para usar el secreto?',
        opciones: [
          'Visualizar, actuar, perseverar — la tríada de la manifestación consciente según el libro',
          'Estudiar, practicar, compartir — aprender el secreto y enseñárselo a otros para amplificar el efecto',
          'Pedir, creer, recibir — los tres pasos secuenciales para atraer conscientemente lo que se desea',
          'Limpiar, alinear, manifestar — primero eliminar bloqueos, luego alinearse y finalmente recibir',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El proceso de tres pasos de Byrne es: Pedir (ser claro y específico sobre lo que quieres), Creer (actuar, hablar y sentir como si ya lo tuvieras) y Recibir (estar en el estado emocional de quien ya tiene lo que desea). Las emociones son el combustible del proceso — la emoción de ya tener es lo que activa la ley.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué según Byrne pensar "no quiero deudas" es contraproducente?',
        opciones: [
          'Porque la negación debilita la intención y hace que el subconsciente no procese el mensaje correctamente',
          'Porque el universo no procesa negaciones — procesa el objeto del pensamiento, en este caso "deudas"',
          'Porque la palabra "deudas" tiene una vibración negativa que anula el poder de la intención detrás del pensamiento',
          'Porque es señal de que la persona no cree de verdad que puede tener abundancia y eso la bloquea',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Según Byrne, la ley de la atracción no distingue entre lo que quieres y lo que no quieres — procesa el objeto dominante del pensamiento. Si piensas "no quiero deudas", el universo procesa "deudas" y atrae más situaciones de deuda. Por eso el secreto requiere pensar hacia lo que sí quieres: "tengo abundancia financiera", no alejarse de lo que no quieres.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué papel cumplen las emociones en la ley de la atracción según el libro?',
        opciones: [
          'Son el sistema de retroalimentación que indica qué frecuencia estás emitiendo en cada momento',
          'Son obstáculos que hay que controlar para que los pensamientos puedan fluir sin interferencia emocional',
          'Son señales del pasado que deben procesarse antes de poder usar el secreto con efectividad real',
          'Son el resultado de las atracciones pasadas y no tienen poder sobre las atracciones futuras del universo',
        ],
        respuestaCorrecta: 0,
        explicacion: 'Las emociones son el sistema de retroalimentación del proceso: cuando te sientes bien, estás emitiendo una frecuencia alineada con lo que deseas; cuando te sientes mal, estás desalineado. Las emociones positivas como gratitud, amor y alegría son las frecuencias más poderosas de atracción. El trabajo fundamental es aprender a gestionar el estado emocional independientemente de las circunstancias externas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Byrne señala que la gratitud es una herramienta tan poderosa en este sistema?',
        opciones: [
          'Porque la gratitud activa el sistema límbico y libera neurotransmisores que mejoran la toma de decisiones',
          'Porque reconocer lo que ya tienes te coloca en una frecuencia de abundancia que atrae más abundancia',
          'Porque la gratitud reduce el ego y en ese estado de humildad el universo responde más favorablemente',
          'Porque practicar gratitud crea hábitos positivos que eventualmente generan resultados tangibles por acción',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Byrne explica que cuando aprecias lo que ya tienes, emites una frecuencia de abundancia porque estás reconociendo que tienes, no que careces. Esta frecuencia atrae más de lo mismo — más abundancia. Por eso sugiere comenzar el día con gratitud antes de revisar preocupaciones: reorienta tu frecuencia desde el inicio del día hacia la abundancia en lugar de la carencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo aborda Byrne la aplicación del secreto al dinero?',
        opciones: [
          'Sugiere invertir en activos específicos y visualizar el rendimiento mientras se estudian los mercados financieros',
          'Dice que el dinero solo fluye cuando abandonas el deseo de tenerlo y te enfocas en el servicio a otros',
          'Argumenta que pensar en la abundancia y sentirse agradecido por el dinero que ya se tiene atrae más dinero',
          'Propone crear un plan financiero detallado y visualizarlo para que el subconsciente programe las acciones necesarias',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Byrne aplica la ley al dinero explicando que la causa de las dificultades financieras es enfocarse en la falta. Pensar en deudas atrae deudas; pensar en abundancia atrae abundancia. Su enfoque es visualizar cuentas llenas, sentir gratitud por el dinero ya presente (aunque sea poco) y actuar desde la identidad de alguien para quien el dinero fluye naturalmente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el cambio de identidad más profundo que propone el secreto según Byrne?',
        opciones: [
          'De persona ordinaria a persona espiritual conectada con fuerzas superiores del universo consciente',
          'De consumidor a creador — de alguien que toma lo que el mercado ofrece a quien crea su propio mercado',
          'De víctima de las circunstancias a creador consciente de la propia realidad mediante el poder del pensamiento',
          'De individuo aislado a ser interconectado que entiende que todo está relacionado con todo lo demás',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El cambio de identidad más fundamental que propone el libro es de víctima a creador: dejar de verse como el resultado de la historia, la familia, la economía o las circunstancias externas, y reconocerse como un ser con poder creativo que ha estado creando inconscientemente. El secreto es aprender a crear con conciencia plena.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo funciona el secreto en las relaciones según Byrne?',
        opciones: [
          'Puedes cambiar a otras personas visualizando cómo quieres que sean — el secreto actúa sobre su subconsciente',
          'Las relaciones mejoran automáticamente cuando ambas partes aprenden el secreto y lo practican juntas de forma consciente',
          'No puedes cambiar a otros con tus pensamientos, pero cambiar tu propia frecuencia cambia la dinámica relacional',
          'Las relaciones son el área donde el secreto funciona menos porque dependen de la libre voluntad de otros',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Byrne aclara que no puedes cambiar a otra persona con tus pensamientos sobre ella. Pero sí puedes cambiar la relación cambiando tu propia frecuencia. Cuando cambias lo que emites, cambia lo que atraes — incluyendo lo que atraes de las personas que ya están en tu vida. Y si quieres amor, primero sé amor; si quieres respeto, ofrece respeto. Atraes lo que eres, no lo que quieres.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué rol cumple la visualización como herramienta del secreto?',
        opciones: [
          'Es una técnica decorativa motivacional sin mecanismo real — funciona como placebo para mantener la motivación',
          'Programa deliberadamente el subconsciente, que no distingue entre experiencia real e imaginada vívidamente',
          'Funciona solo cuando se combina con afirmaciones verbales repetidas diariamente frente al espejo personal',
          'Es útil para metas pequeñas pero pierde efectividad con metas grandes que el subconsciente rechaza como irreales',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Byrne explica que la visualización vívida — imaginar con detalles sensoriales y emocionales que ya tienes lo que deseas — programa deliberadamente el subconsciente, que no distingue entre lo imaginado vívidamente y lo experimentado realmente. Por eso grandes atletas y empresarios la han usado sistemáticamente. No es fantasía inútil sino programación intencional de la mente más profunda.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué responsabilidad implica la visión del secreto de que "tú creas tu realidad"?',
        opciones: [
          'La obligación moral de compartir el secreto con otros para que también puedan crear mejores realidades propias',
          'Responsabilidad total sin posibilidad de culpar a otros — y con ello, el poder de cambiarlo todo desde dentro',
          'La responsabilidad de estudiar metafísica para entender cómo funciona la ley y aplicarla con más precisión',
          'Aceptar que lo malo que ocurrió en el pasado fue causado por ti, lo cual puede generar culpa improductiva',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Si tú creas tu realidad, no puedes culpar a nadie más por lo que tienes o no tienes. Aunque inicialmente esto puede sentirse pesado, Byrne lo presenta como la noticia más liberadora: si tú lo creaste, tú puedes cambiarlo. El poder siempre ha estado en ti. Esta responsabilidad absoluta es la otra cara de un poder absoluto sobre la propia experiencia de vida.',
      ),
    ],
  ),

  Libro(
    id: 'mot09',
    titulo: 'Juan Salvador Gaviota',
    autor: 'Richard Bach',
    anio: '1970',
    emoji: '🕊️',
    categoria: CategoriaLibro.motivacion,
    resumenCorto: 'La historia de una gaviota que rompe con su clan para perseguir la perfección del vuelo — una parábola sobre la libertad, el propósito y la excelencia más allá de la conformidad.',
    gemasRecompensa: 50,
    capitulos: [
      const CapituloResumen(
        titulo: 'El Pájaro que Soñaba con Volar Más Alto',
        emoji: '✈️',
        contenido: '''
Mientras el resto del clan de gaviotas vuela solo para encontrar comida y sobrevivir, Juan Salvador Gaviota siente un llamado diferente: la pasión por el vuelo en sí mismo. No como medio sino como fin. No para comer sino para perfeccionarse. Esta diferencia fundamental lo separa desde el principio de su comunidad, que no comprende por qué alguien dedicaría su vida a algo más allá de la subsistencia.

Juan practica durante horas, cayendo, fallando, lastimándose, volviendo a intentar. Experimenta con velocidades que ninguna gaviota ha intentado. Aprende la geometría del vuelo, la física de la resistencia al aire, los ángulos de las alas. Su curiosidad no tiene límite y su ambición no tiene precedente. Y cada nuevo récord de velocidad o altitud es para él una forma de alegría pura que el resto del clan no puede entender.

Bach utiliza a Juan como símbolo del inconformista, del artista, del emprendedor, del buscador — cualquier ser que siente que hay algo más allá de lo que el grupo considera normal y suficiente. La gaviota media come y duerme y repite. Juan vuela y sueña y aprende. Esta diferencia no es arrogancia sino vocación: algo dentro de él insiste en que el vuelo tiene profundidades que vale la pena explorar.

La primera parte del libro establece la pregunta central de la obra: ¿qué haces cuando lo que te apasiona no es lo que el grupo considera valioso? ¿Sacrificas tu pasión por pertenecer, o sacrificas la pertenencia por tu pasión? Juan elige su pasión, y esa elección tiene un costo.
''',
      ),
      const CapituloResumen(
        titulo: 'El Exilio y el Descubrimiento',
        emoji: '🌊',
        contenido: '''
El clan expulsa a Juan Salvador Gaviota. Lo declaran paria. Le dicen que su obsesión con el vuelo es una vergüenza y que ha puesto el propósito equivocado en el centro de su vida. La gaviota existe para vivir dentro del clan, buscar comida, reproducirse y proteger el grupo — no para perseguir la excelencia individual en el arte del vuelo. Juan es desterrado a los Acantilados de la Lejanía.

En el exilio, sin la presión del clan, sin la necesidad de conformarse, Juan experimenta la libertad más profunda de su vida. Solo con el cielo y el mar, vuela con una libertad que nunca tuvo cuando intentaba pertenecer. Sin nadie que lo juzgue ni nadie que imponer como modelo, puede ser completamente lo que es. El exilio se convierte en el mayor regalo que le hicieron.

Y en esa soledad libre, Juan descubre algo que cambia todo: aprende que no hay límite para lo que puede aprender. Cada día de práctica revela nuevas posibilidades. El vuelo nocturno — imposible para cualquier gaviota según la sabiduría convencional — lo domina. La inmersión submarina — ninguna gaviota lo hace — la descubre. La velocidad extrema — la logra. El exilio le enseña que los límites que el clan le imponía no eran límites del vuelo sino límites de la imaginación del clan.

Bach usa el exilio como metáfora de la soledad creativa que muchos innovadores y artistas deben atravesar. El mundo exterior puede expulsarte por no conformarte — pero si usas ese exilio para profundizar en tu vocación en lugar de amargarte por el rechazo, el exilio se convierte en escuela y laboratorio.
''',
      ),
      const CapituloResumen(
        titulo: 'El Aprendizaje con Chiang',
        emoji: '⭐',
        contenido: '''
En el punto más profundo de su vuelo solitario, Juan encuentra a dos gaviotas de luz brillante que lo llevan a un plano diferente — una especie de cielo o dimensión superior donde los más avanzados en el arte del vuelo han llegado. Allí encuentra a su maestro: Chiang, la gaviota más anciana y más sabia, que puede volar instantáneamente de un lugar a otro con solo pensarlo.

Chiang enseña a Juan que el vuelo no es físico en su esencia más profunda — es una expresión del ser. Que el cuerpo de la gaviota es solo pensamiento, y que el pensamiento no tiene límites. Que la velocidad infinita está disponible para quien comprende que no hay ningún lugar a donde ir — que ya estás en todas partes. Esta enseñanza metafísica transforma la comprensión de Juan: el vuelo ya no es solo aerodinámica sino consciencia.

Bach toca aquí temas del misticismo oriental y la filosofía idealista: la realidad material como manifestación del pensamiento, el tiempo y el espacio como ilusiones de la mente limitada, la perfectibilidad infinita como naturaleza del ser. Chiang no enseña técnicas — enseña una comprensión del ser que hace posibles todas las técnicas.

Lo más importante que aprende Juan de Chiang no es una habilidad sino una certeza: que tiene derecho y capacidad de buscar la perfección indefinidamente, y que el amor perfecto es la base de todo vuelo verdadero. Aprender, practicar, y enseñar — este es el ciclo del progreso espiritual que Chiang le transmite.
''',
      ),
      const CapituloResumen(
        titulo: 'El Regreso al Clan',
        emoji: '🏠',
        contenido: '''
Con todo lo que ha aprendido, Juan siente el llamado de regresar. No para vindicarse ni para mostrar que tenía razón. Sino porque sabe que en el clan hay gaviotas que sienten lo mismo que él sentía — la incomodidad de ser diferente, el sueño de volar más alto — y que pueden beneficiarse de lo que aprendió. El maestro, como dijo Chiang, necesita volver al mundo del que fue exiliado.

El regreso no es fácil. El clan lo recibe con hostilidad, suspicacia y burla. Quienes lo expulsaron no quieren que regrese con pretensiones de sabiduría. Pero hay algunos — los jóvenes rebeldes, los curiosos, los que sienten que también tienen un llamado diferente — que se acercan a escuchar. Juan los acepta como estudiantes sin condiciones.

Enseña lo que aprendió: no como dogma sino como posibilidad. No como reglas sino como invitación. Cada gaviota debe volar su propio camino. Pero puede hacerlo sabiendo que hay más de lo que le dijeron, que los límites son más amplios de lo que le enseñaron, y que la excelencia no es traición al clan sino el mayor regalo que puede hacerle.

La resistencia del clan ilustra una verdad universal: los sistemas cerrados no aman a quienes regresan del exterior con conocimiento que cuestiona sus límites. El mensajero es más fácil de rechazar que el mensaje. Pero Juan sigue enseñando con paciencia y amor — sabiendo que su trabajo es plantar semillas, no controlar su florecimiento.
''',
      ),
      const CapituloResumen(
        titulo: 'El Legado de Juan Salvador',
        emoji: '🌅',
        contenido: '''
Uno de los estudiantes de Juan, Fletcher Lynd Gaviota, se convierte en el más dedicado y talentoso. Aprende rápido, practica con fervor y empieza a ver los mismos horizontes que Juan vio. Pero Fletcher también comete el error de Juan: se impacienta con los que no quieren aprender, siente frustración ante la resistencia del clan, y en un momento de arrogancia casi se rompe contra un acantilado.

Juan rescata a Fletcher de ese momento de quiebre y le enseña la lección más importante: el amor perfecto como base del vuelo perfecto. No puedes enseñar desde la superioridad — solo desde el amor. No puedes volar bien si estás lleno de resentimiento hacia quienes no quieren volar. La excelencia en el vuelo y la compasión hacia los que no han llegado todavía son inseparables en el maestro maduro.

Llega el momento en que Juan, como Chiang antes que él, necesita partir hacia el siguiente nivel. Su trabajo en ese plano está hecho — ha plantado semillas, ha formado al próximo maestro, ha mostrado que el vuelo tiene dimensiones que el clan no imaginaba. Antes de partir, le dice a Fletcher: "Sigue trabajando en el amor, Fletcher. Cuando hayas conquistado el amor, aprenderás a volar."

El legado de Juan no son sus técnicas de vuelo sino su ejemplo: que uno puede vivir fiel a su llamado más profundo incluso cuando el mundo lo expulsa por ello, que el exilio puede ser escuela, que el regreso puede ser servicio, y que la cadena de maestros y estudiantes es la forma en que la sabiduría viaja de alma en alma a través del tiempo.
''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué distingue fundamentalmente a Juan Salvador Gaviota del resto de su clan?',
        opciones: [
          'Juan es físicamente más grande y fuerte, lo que le permite volar más alto y rápido naturalmente',
          'Juan ve el vuelo como propósito en sí mismo y busca la perfección en él, mientras el clan vuela solo para comer',
          'Juan tiene acceso a conocimiento secreto que el resto del clan no ha descubierto todavía en el libro',
          'Juan rechaza conscientemente las tradiciones del clan como acto de rebeldía política contra la autoridad',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La diferencia fundamental de Juan no es física ni ideológica — es de propósito. El clan vuela como medio para comer y sobrevivir. Juan vuela por el vuelo mismo: como arte, como perfección, como vocación. Esta diferencia de propósito — más que cualquier habilidad o conocimiento — es lo que lo separa del grupo y eventualmente causa su exilio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué simboliza el exilio de Juan según la lectura de la obra?',
        opciones: [
          'El fracaso inevitable del individuo que se separa de su comunidad y pierde su base de apoyo social',
          'La soledad creativa que muchos innovadores deben atravesar y que puede convertirse en libertad y laboratorio',
          'El castigo justo que los sistemas sociales aplican a quienes no respetan las normas establecidas del grupo',
          'La necesidad de que el héroe sufra para merecer el conocimiento que eventualmente recibirá de sus mentores',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Bach usa el exilio como metáfora de la soledad creativa: el mundo puede expulsarte por no conformarte, pero si usas ese espacio para profundizar en tu vocación en lugar de amargarte, el exilio se convierte en escuela. Juan descubre en el exilio una libertad que nunca tuvo bajo la presión del clan, y sus mayores descubrimientos — vuelo nocturno, inmersión submarina, velocidad extrema — los hace allí.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseñanza central transmite Chiang a Juan sobre la naturaleza del vuelo?',
        opciones: [
          'Que el vuelo perfecto requiere décadas de práctica diaria disciplinada y solo así se alcanzan sus límites reales',
          'Que el vuelo en su esencia más profunda no es físico sino una expresión del ser — el cuerpo es solo pensamiento',
          'Que la verdadera habilidad de vuelo está en la cooperación con el viento en lugar de resistirlo con la fuerza',
          'Que los límites del vuelo son los límites de la física, pero estos pueden superarse con tecnología y conocimiento',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Chiang enseña a Juan que el vuelo en su nivel más profundo no es aerodinámica sino consciencia: el cuerpo de la gaviota es pensamiento, y el pensamiento no tiene límites. La velocidad infinita está disponible para quien comprende que no hay lugar a donde ir — ya estás en todas partes. Esta comprensión metafísica transforma el vuelo de habilidad física a expresión del ser ilimitado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Juan regresa al clan que lo expulsó?',
        opciones: [
          'Para demostrar que tenía razón y que el clan estaba equivocado al expulsarlo por buscar la excelencia',
          'Porque Chiang le ordena que regrese como condición para haber recibido su enseñanza y conocimiento',
          'Para enseñar a las gaviotas que sienten el mismo llamado que él sentía y que pueden beneficiarse de lo que aprendió',
          'Porque extraña al clan y la soledad del exilio se vuelve insoportable después de años de aislamiento total',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Juan regresa no por rencor ni por orden sino por vocación de servicio: sabe que en el clan hay gaviotas que sienten lo mismo que él sentía — el sueño de volar más alto, la incomodidad de ser diferente — y que pueden beneficiarse de lo que aprendió. El maestro, como le enseñó Chiang, necesita volver al mundo del que fue exiliado para enseñar lo que descubrió.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué lección aprende Fletcher Lynd Gaviota en su momento de crisis contra el acantilado?',
        opciones: [
          'Que la velocidad extrema requiere técnica perfecta y que la arrogancia de saltarse pasos genera accidentes inevitables',
          'Que el amor perfecto es la base del vuelo perfecto, y que la impaciencia y superioridad bloquean el aprendizaje real',
          'Que los estudiantes deben respetar el ritmo del grupo y no avanzar demasiado rápido para no perder la conexión',
          'Que el exilio es necesario también para él y que debe partir del clan para continuar su desarrollo personal',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La crisis de Fletcher ilustra que la excelencia técnica sin amor es incompleta. Su arrogancia ante los que no quieren aprender y su frustración con el clan lo llevan a un momento de quiebre. Juan le enseña que no puedes enseñar desde la superioridad sino solo desde el amor, y que el vuelo perfecto y la compasión hacia los que no han llegado todavía son inseparables en el maestro maduro.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo interpreta Bach la relación entre la vocación individual y la comunidad?',
        opciones: [
          'La comunidad siempre tiene razón y los individuos deben sacrificar sus sueños por el bien del grupo colectivo',
          'La vocación auténtica inevitablemente choca con los sistemas cerrados, pero el llamado a servir supera el rechazo',
          'Los individuos deben abandonar definitivamente sus comunidades para poder desarrollar plenamente su potencial real',
          'La verdadera vocación se expresa dentro de la comunidad o no es auténtica, porque el ser humano es social por naturaleza',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Bach presenta una relación tensa pero no irresuelta: la vocación auténtica inevitablemente choca con los sistemas cerrados que prefieren la conformidad. Pero el final no es abandono definitivo sino regreso como servicio. Juan no puede crecer dentro del clan, pero su crecimiento culmina en volver a enseñar al clan. La vocación individual y el servicio comunitario son dos momentos del mismo arco vital.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué representa el vuelo en los diferentes niveles del libro?',
        opciones: [
          'Representa exclusivamente la libertad física — el deseo humano de liberarse de las limitaciones de la gravedad terrestre',
          'Es solo una metáfora de la rebelión política contra las instituciones y la búsqueda de autonomía individual',
          'Es simultáneamente la búsqueda de excelencia en la vocación, la libertad del ser y la expresión de la consciencia',
          'Representa el éxito material y social — llegar más alto que los demás como medida del valor personal propio',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El vuelo en el libro opera en múltiples niveles simultáneamente: como habilidad física (la técnica de volar), como metáfora de la vocación (perseguir la excelencia en lo que te apasiona), como expresión espiritual (la consciencia sin límites que enseña Chiang), y como servicio (enseñar a otros a volar más alto). Bach los entrelaza para crear una parábola compleja sobre la naturaleza del ser y el crecimiento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué descubrimiento hace Juan en el exilio respecto a los límites del vuelo?',
        opciones: [
          'Que los límites del vuelo son físicos y reales, pero que con entrenamiento intenso pueden expandirse gradualmente',
          'Que los límites que el clan imponía no eran límites del vuelo sino límites de la imaginación del clan mismo',
          'Que volar solo sin la guía del clan es peligroso y que los límites existentes protegen a las gaviotas de accidentes',
          'Que sus habilidades de vuelo son mediocres comparadas con otras gaviotas, y que el exilio lo ayuda a ser honesto',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El descubrimiento clave del exilio es que los límites que el clan presentaba como absolutos — no puedes volar de noche, no puedes sumergirte bajo el agua, no puedes alcanzar esa velocidad — no eran límites del vuelo sino límites de la imaginación del clan. En libertad, sin esas restricciones mentales, Juan los supera todos. Los límites eran creencias, no realidades.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mensaje final de Juan a Fletcher antes de partir hacia el siguiente nivel?',
        opciones: [
          'Que continúe enseñando las técnicas de vuelo y que documente todo lo aprendido para futuras generaciones',
          'Que regrese con el clan principal y pida perdón para reintegrarse y liderar desde adentro el cambio institucional',
          'Que siga trabajando en el amor, porque cuando haya conquistado el amor aprenderá a volar verdaderamente',
          'Que encuentre a su propio Chiang porque el siguiente nivel de aprendizaje requiere un maestro más avanzado que Juan',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Las palabras finales de Juan a Fletcher — "Sigue trabajando en el amor, Fletcher. Cuando hayas conquistado el amor, aprenderás a volar" — revelan la jerarquía de valores del libro: la técnica de vuelo es la superficie; el amor es la profundidad. El maestro perfecto no es el más habilidoso sino el más amoroso. La excelencia exterior sin amor interior es incompleta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Bach la cadena de maestros y estudiantes que conecta a Chiang, Juan y Fletcher?',
        opciones: [
          'Como una institución formal de enseñanza que preserva y transmite el conocimiento de generación en generación',
          'Como la forma en que la sabiduría viaja de alma en alma — cada maestro fue estudiante y cada estudiante se vuelve maestro',
          'Como una jerarquía rígida donde cada nivel controla a los niveles inferiores para mantener el orden del sistema',
          'Como una casualidad evolutiva donde los más habilidosos naturalmente atraen a otros habilidosos como seguidores',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Bach presenta la cadena Chiang → Juan → Fletcher como la forma orgánica en que la sabiduría viaja a través del tiempo: de alma en alma, de maestro a estudiante que eventualmente se convierte en maestro. No es institución ni jerarquía de control sino transmisión de luz: cada maestro fue primero estudiante, cada estudiante lleva la semilla de enseñar a otros. El legado de Juan no son sus técnicas sino este patrón de transmisión.',
      ),
    ],
  ),

];
