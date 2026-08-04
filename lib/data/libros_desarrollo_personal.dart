// lib/data/libros_desarrollo_personal.dart
import '../models/libro_model.dart';

List<Libro> crearLibrosDesarrolloPersonal() => [

  // ══════════════════════════════════════════════════════════
  //  LIBRO 1 — Los 7 Hábitos de la Gente Altamente Efectiva
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp01',
    titulo: 'Los 7 Hábitos de la Gente Altamente Efectiva',
    autor: 'Stephen R. Covey',
    anio: '1989',
    emoji: '✅',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Los principios universales del carácter que transforman tu vida personal y profesional.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'Del Carácter a la Efectividad',
        emoji: '🗺️',
        contenido: '''Durante décadas los libros de autoayuda enseñaron la "Ética de la Personalidad": técnicas para caer bien, trucos para parecer seguro, fórmulas para influir. Covey descubrió que eso solo produce cambios superficiales. La transformación real viene de la "Ética del Carácter": integridad, humildad, valentía y justicia.

Un PARADIGMA es el mapa con que interpretas el mundo. Si tu mapa está equivocado, trabajar más duro solo te llevará al lugar incorrecto más rápido. Imagina perdida en una ciudad con el mapa de otra ciudad: el esfuerzo no sirve de nada. El primer paso es cuestionar tus propios paradigmas.

La efectividad verdadera significa equilibrar dos cosas a la vez: los RESULTADOS que deseas (los huevos de oro) y la CAPACIDAD de producirlos (la gallina que pone los huevos). Un jefe que explota a su equipo consigue resultados a corto plazo, pero destruye la gallina. Un atleta que entrena sin descanso gana hoy pero se lesiona mañana.

Covey organiza los 7 hábitos en tres etapas:
• Hábitos 1-3: Victoria Privada (dominar tu relación contigo misma)
• Hábitos 4-6: Victoria Pública (relacionarte efectivamente con otros)
• Hábito 7: Renovación constante (el hábito que mantiene a todos los demás)

Antes de aprender técnicas, pregúntate con honestidad: ¿Mis creencias sobre el éxito, el trabajo y las relaciones son mapas correctos de la realidad, o me los enseñaron sin cuestionarlos? Cambiar paradigmas es el trabajo más difícil y el más importante que harás.''',
      ),
      CapituloResumen(
        titulo: 'Hábito 1: Sé Proactiva',
        emoji: '💪',
        contenido: '''Entre un estímulo y una respuesta existe un espacio. En ese espacio está tu libertad y tu poder para elegir. Las personas REACTIVAS actúan empujadas por sus emociones, el clima, las palabras de otros, las circunstancias. Las personas PROACTIVAS toman la responsabilidad de sus propias vidas: "yo elijo cómo responder".

La palabra "responsabilidad" viene de "habilidad para responder". Los proactivos no dicen "no puedo hacer nada al respecto" sino "¿qué puedo hacer al respecto?". No dicen "así soy yo" sino "puedo elegir ser diferente si lo decido".

Covey introduce dos círculos: el CÍRCULO DE PREOCUPACIÓN (todo lo que te afecta: la economía, el clima, lo que dijeron de ti) y el CÍRCULO DE INFLUENCIA (lo que puedes controlar: tus acciones, tus hábitos, tus respuestas). Las personas reactivas gastan su energía en el círculo de preocupación, donde no tienen poder. Las proactivas concentran toda su energía en el círculo de influencia, haciéndolo crecer.

¿Cómo saber si eres reactiva? Escucha tu propio lenguaje:
• Reactiva: "No puedo", "Tengo que", "Si tan solo...", "Me hace enojar"
• Proactiva: "Elijo", "Prefiero", "Voy a", "Controlo mis sentimientos"

El reto de 30 días: Por un mes, comprométete a trabajar solo en tu círculo de influencia. Cuando algo te moleste, pregunta: ¿Puedo hacer algo al respecto? Si sí, hazlo. Si no, libéralo. Observa cómo tu círculo de influencia crece semana a semana. Este es el fundamento de todos los demás hábitos: sin proactividad, los otros seis son imposibles.''',
      ),
      CapituloResumen(
        titulo: 'Hábitos 2 y 3: El Propósito y las Prioridades',
        emoji: '🧭',
        contenido: '''HÁBITO 2: Empieza con el Fin en Mente. Todo se crea dos veces: primero en la mente, luego en la realidad. Una casa existe como plano antes de existir como edificio. Tu vida existe como visión antes de existir como realidad. Si no tienes una visión clara de adónde vas, otros escribirán tu guión.

Covey propone el ejercicio más impactante del libro: Imagina que asistes a tu propio funeral. Cuatro personas hablan: tu familia, tus amigos, tus colegas, y tu comunidad. ¿Qué quieres que digan de ti? ¿Qué tipo de hija, amiga, líder, persona quieres haber sido? Eso es tu MISIÓN DE VIDA: el destino que guía todas tus decisiones.

Una declaración de misión personal es como una constitución: los principios que nunca negocias. Cuando tienes claridad sobre quién quieres ser, las decisiones difíciles se vuelven más fáciles porque tienes un criterio claro.

HÁBITO 3: Primero lo Primero. Covey presenta una matriz de 4 cuadrantes según urgencia e importancia:
• Cuadrante 1: Urgente e Importante (crisis, emergencias) — reacciona
• Cuadrante 2: No Urgente pero Importante (planificar, aprender, relacionarse) — AQUÍ VIVEN LOS EFECTIVOS
• Cuadrante 3: Urgente pero No Importante (interrupciones, emails sin importancia) — trampa del tiempo
• Cuadrante 4: No Urgente y No Importante (distracción pura) — pérdida total

La mayoría vive en los cuadrantes 1 y 3, apagando fuegos. Los altamente efectivos viven en el cuadrante 2: previenen los incendios antes de que ocurran. Dedica tiempo a planificar, estudiar, construir relaciones y cuidar tu salud. Eso reduce dramáticamente las crisis del cuadrante 1.''',
      ),
      CapituloResumen(
        titulo: 'Hábitos 4, 5 y 6: La Victoria Pública',
        emoji: '🤝',
        contenido: '''HÁBITO 4: Piensa en Ganar-Ganar. Existen seis paradigmas de la interacción humana: Ganar-Perder (yo gano, tú pierdes), Perder-Ganar (yo cedo siempre), Perder-Perder (los dos nos destruimos), Ganar (solo me importa yo), Ganar-Ganar o No Hay Trato (el más maduro). Las personas con mentalidad Ganar-Ganar buscan acuerdos donde todas las partes queden satisfechas. No es debilidad: es el único modelo que construye relaciones duraderas.

HÁBITO 5: Procura Primero Comprender, y Después Ser Comprendida. Este es el hábito de la comunicación más transformador. La mayoría escucha para responder, no para entender. Cuando alguien habla, ya estás preparando tu respuesta. Covey llama a esto "escucha autobiográfica": filtras todo a través de tu propia experiencia.

La escucha empática significa escuchar con la intención genuina de entender el mundo del otro. No das consejos hasta haber entendido completamente. No dices "sé cómo te sientes" porque no lo sabes. Escuchas con los ojos (lenguaje corporal), los oídos (palabras) y el corazón (emociones). Cuando alguien se siente verdaderamente escuchada, su guardia baja y puede recibir tus ideas.

HÁBITO 6: Sinergiza. Sinergia significa que el todo es mayor que la suma de las partes. 1+1 puede igual 3, 10 o 100. Cuando dos personas con perspectivas diferentes colaboran con mente abierta, crean soluciones que ninguna hubiera encontrado sola. La sinergia requiere confianza (hábito 4) y comunicación real (hábito 5). Con inseguridad y mala comunicación, 1+1 puede igual 0,5.

Busca las diferencias de los demás como una fortaleza, no como una amenaza.''',
      ),
      CapituloResumen(
        titulo: 'Hábito 7: Afile la Sierra',
        emoji: '🔄',
        contenido: '''Un leñador lleva horas cortando un árbol con una sierra sin filo. Alguien le pregunta: "¿Por qué no afilas la sierra?" Responde: "No tengo tiempo, estoy cortando el árbol." Este es el error más común en la vida: estar tan ocupada produciendo que nunca inviertes en mejorar tu capacidad de producir.

Afilar la sierra significa renovar las cuatro dimensiones de tu naturaleza:

DIMENSIÓN FÍSICA: Ejercicio, nutrición y descanso. Tu cuerpo es la plataforma de todo lo demás. Treinta minutos de ejercicio diario no te quitan el tiempo: te dan más energía, claridad mental y productividad durante el resto del día.

DIMENSIÓN MENTAL: Leer, aprender, escribir y planificar. Si dejas de aprender, empiezas a deteriorarte. Leer una hora diaria en tu campo te convierte en experta en pocos años. Escribir un diario desarrolla tu pensamiento y te ayuda a procesar experiencias.

DIMENSIÓN SOCIAL/EMOCIONAL: Construir relaciones, servir, empatizar. Tus relaciones son tu activo más valioso. Invertir tiempo en las personas importantes de tu vida no es un lujo: es una necesidad para tu bienestar y el de ellas.

DIMENSIÓN ESPIRITUAL: Clarificar tus valores, meditar, conectar con lo que te da sentido. No necesariamente en términos religiosos: puede ser la naturaleza, la música, la meditación o cualquier práctica que te conecte con tu propósito.

El hábito 7 es el que alimenta a todos los demás. Sin renovación constante, los seis hábitos anteriores se deterioran. Covey dice: "El ser humano es la única criatura que puede 'afilar su propia sierra'." Esa capacidad de auto-renovación es tu mayor ventaja.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: 'Según Covey, ¿qué diferencia a una persona PROACTIVA de una REACTIVA?',
        opciones: [
          'La persona proactiva siempre está de buen humor',
          'La persona proactiva elige conscientemente cómo responder a los estímulos',
          'La persona proactiva no tiene problemas en su vida',
          'La persona proactiva trabaja más horas que los demás',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Entre un estímulo y una respuesta existe un espacio, y ahí vive la libertad de elegir. Los proactivos usan ese espacio; los reactivos reaccionan automáticamente.',
      ),
      PreguntaLibro(
        enunciado: 'En la Matriz de Covey, ¿en qué cuadrante viven las personas altamente efectivas la mayor parte del tiempo?',
        opciones: [
          'Cuadrante 1: Urgente e Importante (apagando incendios)',
          'Cuadrante 2: No Urgente pero Importante (planificar, aprender, prevenir)',
          'Cuadrante 3: Urgente pero No Importante (interrupciones)',
          'Cuadrante 4: No Urgente y No Importante (distracciones)',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El Cuadrante 2 es donde ocurre la magia: planificar, aprender, construir relaciones. Vivir ahí reduce las crisis del Cuadrante 1.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué significa "Piensa en Ganar-Ganar" según Covey?',
        opciones: [
          'Que debes ganar siempre sin importar lo que le pase al otro',
          'Que debes ceder siempre para que el otro gane',
          'Buscar acuerdos donde todas las partes queden satisfechas',
          'Que el éxito de uno hace fracasar al otro',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Muy bien! Ganar-Ganar no es debilidad, es el único modelo que construye relaciones duraderas y negocios sostenibles.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué representa "Afilar la Sierra" en el Hábito 7?',
        opciones: [
          'Trabajar más rápido para terminar antes',
          'Renovar continuamente tus cuatro dimensiones: física, mental, social y espiritual',
          'Delegar tu trabajo a otras personas',
          'Comprar herramientas nuevas para el trabajo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Genial! "Afilar la sierra" es invertir en tu capacidad de producir. Sin renovación, todos los otros hábitos se deterioran.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es el primer paso del Hábito 5: "Procura Primero Comprender"?',
        opciones: [
          'Preparar tu respuesta mientras el otro habla',
          'Dar consejos basados en tu propia experiencia',
          'Escuchar con la intención genuina de entender el mundo del otro',
          'Interrumpir cuando ya sabes lo que van a decir',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Perfecto! La escucha empática significa escuchar para entender, no para responder. Cuando alguien se siente comprendida, todo cambia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la definición de Inteligencia Emocional según Goleman?',
        opciones: [
          'La capacidad de suprimir emociones negativas para actuar con lógica',
          'El cociente intelectual emocional medido en tests psicológicos',
          'La habilidad de reconocer, entender y gestionar las propias emociones y las de los demás',
          'La tendencia natural a ser empático desde el nacimiento',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Goleman define la IE como un conjunto de habilidades: autoconciencia, autorregulación, motivación, empatía y habilidades sociales. No es un rasgo fijo — se puede desarrollar.',
      ),
      const PreguntaLibro(
        enunciado: 'Según Goleman, ¿cuál es la diferencia entre autorregulación y supresión emocional?',
        opciones: [
          'No hay diferencia — ambas consisten en controlar las emociones',
          'La supresión es sana; la autorregulación es dañina a largo plazo',
          'La autorregulación gestiona cómo expresas la emoción; la supresión la niega por completo',
          'La autorregulación solo aplica a emociones negativas',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! La autorregulación no significa no sentir — significa elegir cuándo y cómo expresar la emoción. La supresión crónica, en cambio, daña la salud y deteriora las relaciones.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Goleman afirma que la empatía es una habilidad, no solo un rasgo de personalidad?',
        opciones: [
          'Porque se puede fingir con técnicas de comunicación',
          'Porque depende exclusivamente de la inteligencia verbal',
          'Porque se puede entrenar mediante práctica consciente de escucha activa y perspectiva-toma',
          'Porque es genéticamente heredada pero activable con esfuerzo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! Goleman distingue empatía cognitiva (entender el punto de vista del otro), empatía emocional (sentir lo que siente) y preocupación empática (querer ayudar). Las tres son entrenables.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña Covey con la metáfora de "comenzar con el fin en mente" (Hábito 2)?',
        opciones: [
          'Que debes visualizar el resultado de cada tarea antes de empezarla',
          'Que toda creación ocurre dos veces: primero en la mente y luego en la realidad — quienes no se imaginan el fin construyen vidas por accidente',
          'Que el éxito requiere planificación detallada de todos los pasos antes de actuar',
          'Que es importante poner metas SMART al inicio de cada proyecto',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El Hábito 2 enseña que todo se crea dos veces: una creación mental (la visión, los valores, el propósito) y una creación física (la acción). Quienes actúan sin claridad sobre su fin construyen sus vidas según los guiones que otros les dieron — éxito sin significado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia Covey entre "independencia" e "interdependencia" en el desarrollo personal?',
        opciones: [
          'La independencia es el estado más alto — no necesitar a nadie es el máximo logro',
          'La interdependencia es dependencia disfrazada — los verdaderamente maduros son completamente autosuficientes',
          'La interdependencia es el estado más maduro: combinar la capacidad propia con la fuerza de otros para lograr lo que ninguno podría solo',
          'Son igualmente valiosas según el contexto — no hay un estado superior al otro',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Covey describe una progresión: dependencia (necesitas a otros), independencia (puedes hacerlo solo — lo que la cultura occidental premia como meta) e interdependencia (puedes hacerlo solo PERO elijes combinar con otros para lograr más). La interdependencia es el nivel más maduro y efectivo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 12 — Fluir (Flow)
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp12',
    titulo: 'Fluir: La Psicología de la Experiencia Óptima',
    autor: 'Mihaly Csikszentmihalyi',
    anio: '1990',
    emoji: '🌊',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'La felicidad duradera no viene de la relajación ni el placer, sino de los momentos de absorción total en actividades desafiantes y significativas.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Problema de la Felicidad',
        emoji: '🎯',
        contenido: '''Csikszentmihalyi comenzó su investigación con una pregunta simple: ¿Cuándo se sienten las personas más vivas, más felices, más completamente humanas? Entrevistó a miles de personas de docenas de culturas: alpinistas, cirujanos, artistas, ajedrecistas, madres, trabajadores de fábricas. La respuesta lo sorprendió.

Las personas no reportaban sus mejores momentos descansando, consumiendo, o simplemente relajándose. Sus mejores momentos ocurrían cuando se esforzaban voluntariamente hasta el límite para lograr algo difícil y valioso. A este estado lo llamó FLOW o FLUIR: una experiencia de absorción total donde el tiempo desaparece, el ego se disuelve y la actividad se convierte en su propia recompensa.

El problema es que nuestra cultura confunde placer con felicidad. El placer es la satisfacción de necesidades biológicas programadas — comer, descansar, el sexo. El placer es pasivo y temporal. El DISFRUTE es diferente: es activo, requiere esfuerzo, y deja a la persona sintiéndose más compleja y capaz que antes. Los mejores momentos de la vida son de disfrute, no de placer.

Csikszentmihalyi identificó que las personas tienen una cantidad limitada de ATENCIÓN disponible cada día. La calidad de tu vida depende de dónde diriges esa atención. Si la gastas en preocupaciones, miedos y distracciones, la vida se siente vacía. Si la diriges hacia actividades que generan flow, la vida se llena de significado.

La pregunta entonces no es "¿Cómo puedo relajarme más?" sino "¿Cómo puedo estructurar mi vida para experimentar más flow?". Esa es la diferencia entre una vida pasiva consumida y una vida activamente vivida.''',
      ),
      CapituloResumen(
        titulo: 'Las Condiciones del Flow',
        emoji: '⚡',
        contenido: '''El flow no ocurre al azar. Tiene condiciones precisas que puedes aprender a crear deliberadamente. La condición más importante es el BALANCE ENTRE DESAFÍO Y HABILIDAD.

Imagina un eje. Si el desafío es muy alto y tu habilidad es baja: ANSIEDAD. Si tu habilidad es alta y el desafío es bajo: ABURRIMIENTO. Pero en el punto exacto donde el desafío estira tu capacidad actual sin romperla, aparece el flow. Es la zona donde no estás segura de poder lograrlo, pero tampoco estás completamente perdida.

Otras condiciones del flow incluyen: METAS CLARAS (sabes exactamente qué intentas lograr), RETROALIMENTACIÓN INMEDIATA (sabes en tiempo real si lo estás logrando), CONCENTRACIÓN TOTAL (toda tu atención está enfocada, sin distracciones), SENSACIÓN DE CONTROL (sientes que tus acciones marcan una diferencia), PÉRDIDA DE AUTOCONCIENCIA (el ego se disuelve, dejas de preocuparte por cómo te ven), y DISTORSIÓN DEL TIEMPO (horas pasan como minutos o minutos parecen horas).

Las actividades que más fácilmente generan flow tienen estas características incorporadas: música (meta clara, retroalimentación inmediata, desafío escalable), deportes, cirugía, programación, escritura, cocinar con creatividad, jardinería. Pero el flow también puede ocurrir lavando platos si traes la actitud correcta.

Lo fascinante es que el flow en el trabajo es más frecuente que en el tiempo libre. Las personas en trabajo estructurado reportan estados de flow el 54% del tiempo versus solo el 18% en ocio no estructurado. Sin embargo, prefieren el tiempo libre. Csikszentmihalyi llama a esto la "paradoja del trabajo": hacemos más flow en el trabajo pero preferimos no estar ahí.''',
      ),
      CapituloResumen(
        titulo: 'El Yo y el Flow',
        emoji: '🌟',
        contenido: '''Uno de los descubrimientos más sorprendentes de Csikszentmihalyi es lo que le ocurre al "yo" durante el flow. Paradójicamente, la experiencia donde el ego desaparece durante la actividad es la que más fortalece el yo después de ella.

Durante el flow, eres demasiado absorbida en la actividad para pensar en ti misma. No hay "¿Cómo me veo haciendo esto?" ni "¿Qué pensarán de mí?". Simplemente eres la actividad. Esta pérdida temporal del ego es liberadora — muchas personas la describen como una de las experiencias más placenteras de su vida.

Pero cuando el flow termina, el yo regresa más fuerte. Cada experiencia de flow deposita confianza, habilidad y complejidad en tu identidad. Aprendes que puedes hacer cosas difíciles. Tu sentido de competencia crece. Tu umbral para el aburrimiento sube. Tu tolerancia a la incomodidad aumenta. Cada episodio de flow te hace más capaz del siguiente.

El opuesto también es verdad. Cuando evitamos desafíos, buscamos solo comodidad y placer pasivo, nuestra capacidad de disfrutar disminuye. La mente sin estímulos suficientes cae en ENTROPÍA PSÍQUICA: se vuelve ansiosa, aburrida, o busca estímulos artificiales (redes sociales, televisión, comida). El flow es literalmente el antídoto a la entropía mental.

Csikszentmihalyi observó que las personas con las vidas más ricas en significado son aquellas que han aprendido a transformar casi cualquier actividad en flow. No dependen de que el mundo les dé experiencias perfectas — crean las condiciones para el flow internamente, con la actitud que traen a cada tarea.''',
      ),
      CapituloResumen(
        titulo: 'Flow en el Trabajo y las Relaciones',
        emoji: '💼',
        contenido: '''¿Puede un trabajo aburrido generar flow? Csikszentmihalyi encontró evidencia sorprendente: sí, si adoptas la actitud correcta. Estudió a trabajadores de una fábrica de Chicago haciendo tareas repetitivas y descubrió que algunos sufrían de aburrimiento crónico mientras que otros —haciendo exactamente las mismas tareas— reportaban altos niveles de flow.

La diferencia era la TRANSFORMACIÓN DEL YO EN EL TRABAJO. Los trabajadores que experimentaban flow habían creado desafíos personales dentro de sus tareas: competir consigo mismos en velocidad, buscar la perfección técnica, inventar variaciones. Habían convertido tareas externas en juegos internos.

En las relaciones, el flow ocurre cuando dos o más personas sincronizan metas y habilidades en actividades compartidas. Una conversación profunda puede ser flow. Un proyecto colaborativo bien diseñado genera flow colectivo. Los matrimonios más satisfactorios son los que tienen más actividades de flow compartidas, no necesariamente los que tienen más "tiempo de calidad" pasivo.

Para diseñar más flow en tu trabajo: busca proyectos donde tu habilidad actual sea retada (no aplastada), pide retroalimentación más frecuente, crea métricas propias de éxito, y encuentra los momentos de "zona" donde el tiempo vuela. Para el hogar: cocinen juntos algo complejo, construyan algo, aprendan una habilidad nueva como pareja o familia. Las actividades pasivas juntas (ver televisión) son las que menos conectan.

El trabajo y las relaciones son los dos dominios donde más tiempo pasamos. Diseñar flow en ambos no es un lujo — es la arquitectura de una vida con significado.''',
      ),
      CapituloResumen(
        titulo: 'La Vida como Obra de Arte',
        emoji: '🎨',
        contenido: '''El capítulo final de Csikszentmihalyi responde la pregunta más grande: ¿Cómo se construye una vida entera orientada al flow? Su respuesta es el concepto de UNIDAD DE PROPÓSITO: encontrar un tema central que dé coherencia a toda tu existencia.

Las personas que reportan las vidas más significativas no necesariamente tuvieron las más fáciles. Muchas enfrentaron adversidad, pérdida, enfermedad. Pero todas tenían algo en común: un propósito que organizaba sus actividades, sus relaciones, su tiempo. Ese propósito les permitía encontrar flow incluso en circunstancias difíciles.

Csikszentmihalyi estudió a personas que habían sufrido graves accidentes, pérdidas catastróficas, enfermedades terminales. Las que experimentaban mayor bienestar no eran las que habían tenido "más suerte" — eran las que habían encontrado significado en su experiencia y habían reorganizado su vida alrededor de ese nuevo entendimiento.

La AUTOTÉLICA PERSONALIDAD es el término que usa para describir a alguien que puede generar flow en casi cualquier circunstancia. Auto = sí mismo, telos = meta. Una persona autotélica no depende de recompensas externas (dinero, fama, aprobación) para disfrutar la vida — encuentra la recompensa en la actividad misma.

Desarrollar una personalidad autotélica requiere: fijar metas propias (no solo las que otros esperan de ti), sumergirte completamente en tus actividades, prestar atención a la experiencia de cada momento, y aprender a disfrutar la experiencia presente en lugar de siempre diferir la felicidad al futuro. La vida no es un ensayo para algo mejor después — cada momento de atención plena es la vida misma.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la condición más importante para que ocurra el estado de flow?',
        opciones: [
          'Que la actividad sea completamente fácil y sin esfuerzo',
          'Que exista un balance entre el nivel de desafío y tu nivel de habilidad actual',
          'Que la actividad sea silenciosa y sin interrupciones',
          'Que recibas una recompensa económica al terminar',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El flow ocurre en la zona donde el desafío estira tu capacidad sin romperla. Demasiado fácil produce aburrimiento; demasiado difícil produce ansiedad.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es la "paradoja del trabajo" que describe Csikszentmihalyi?',
        opciones: [
          'Que trabajar más horas produce menos resultados',
          'Que las personas experimentan más flow en el trabajo que en el ocio, pero prefieren no trabajar',
          'Que el trabajo creativo es siempre más satisfactorio que el técnico',
          'Que el dinero nunca motiva tanto como el reconocimiento',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Las personas reportan más flow en el trabajo que en el tiempo libre, pero subjetivamente prefieren el tiempo libre. Somos malos jueces de dónde somos más felices.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué le ocurre al ego durante una experiencia de flow?',
        opciones: [
          'Se fortalece y la persona se vuelve más egocéntrica',
          'Desaparece temporalmente — la persona se funde con la actividad',
          'Se convierte en la fuente principal de energía creativa',
          'Permanece igual, solo cambia la percepción del tiempo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Durante el flow, el ego se disuelve. Eres tan absorbida por la actividad que no hay espacio para el automonitoreo. Paradójicamente, esto fortalece el yo después.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué es una "personalidad autotélica" según Csikszentmihalyi?',
        opciones: [
          'Alguien que solo disfruta actividades artísticas',
          'Una persona que puede generar flow en casi cualquier circunstancia sin depender de recompensas externas',
          'Alguien con un alto coeficiente intelectual y grandes logros',
          'Una persona que nunca experimenta aburrimiento ni ansiedad',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Perfecto! La persona autotélica encuentra la recompensa en la actividad misma, no en aprobación o dinero externos. Puede crear flow incluso en situaciones difíciles.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre PLACER y DISFRUTE según el libro?',
        opciones: [
          'El placer es más duradero porque satisface necesidades profundas',
          'El disfrute requiere esfuerzo activo y deja a la persona más capaz; el placer es pasivo y temporal',
          'Solo el placer genera el estado de flow',
          'No hay diferencia significativa entre los dos conceptos',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Excelente! El placer (comer, descansar) es pasivo y temporal. El disfrute requiere esfuerzo y te deja más compleja y capaz. El flow es la forma más intensa de disfrute.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el estado de "flow" o fluir según Csikszentmihalyi?',
        opciones: [
          'Un estado de relajación profunda similar a la meditación',
          'La sensación de placer intenso al consumir algo gratificante',
          'Un estado de absorción total donde el tiempo desaparece y la actividad es su propia recompensa',
          'La motivación que surge al recibir recompensas externas',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! El flow ocurre cuando el desafío de una tarea equilibra exactamente el nivel de habilidad. Ni demasiado fácil (aburrimiento) ni demasiado difícil (ansiedad) — el punto exacto genera absorción total.',
      ),
      const PreguntaLibro(
        enunciado: 'Según Csikszentmihalyi, ¿de qué depende fundamentalmente la calidad de tu vida?',
        opciones: [
          'De los recursos económicos disponibles y la seguridad material',
          'De las relaciones afectivas y el apoyo social',
          'De dónde diriges tu atención consciente cada día',
          'De los genes y la predisposición biológica a la felicidad',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! Las personas tienen atención limitada. Gastarla en preocupaciones vacía la vida; dirigirla hacia actividades generadoras de flow la llena de significado. La atención es el recurso más valioso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Csikszentmihalyi dice que ver televisión pasivamente rara vez produce flow?',
        opciones: [
          'Porque el contenido televisivo es intelectualmente inferior',
          'Porque es una actividad solitaria sin interacción social',
          'Porque es pasiva y no requiere esfuerzo ni habilidad creciente',
          'Porque genera ondas cerebrales incompatibles con el aprendizaje',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! El flow requiere participación activa y retroalimentación inmediata. La televisión pasiva puede dar placer temporal, pero no el disfrute profundo que te deja más capaz que antes.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo puede una persona cultivar más experiencias de flow en su vida diaria según el libro?',
        opciones: [
          'Eliminando todas las actividades que no produzcan placer inmediato',
          'Estructurando deliberadamente actividades donde el desafío esté justo por encima de la habilidad actual',
          'Meditando durante horas para alcanzar estados de conciencia alterados',
          'Reduciendo el trabajo y aumentando el tiempo de ocio y descanso',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El flow no ocurre al azar — se puede cultivar diseñando actividades donde el desafío estira levemente la habilidad actual. Esto requiere buscar progresivamente tareas más difíciles en el dominio elegido y tener metas claras con retroalimentación inmediata.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué descubrió Csikszentmihalyi al estudiar a artistas, alpinistas y cirujanos en sus mejores momentos?',
        opciones: [
          'Que sus mejores momentos ocurrían cuando recibían reconocimiento externo por su trabajo',
          'Que la felicidad máxima se alcanzaba durante el descanso y la relajación después del esfuerzo',
          'Que sus mejores momentos eran de esfuerzo voluntario máximo en algo difícil y valioso, no de relajación',
          'Que la felicidad dependía principalmente del nivel socioeconómico y la seguridad material',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Contrario a la intuición popular, los mejores momentos de vida reportados por miles de personas de docenas de culturas no eran de descanso o consumo — eran de esfuerzo máximo voluntario. Esto redefinió la psicología del bienestar: la felicidad duradera viene del disfrute activo, no del placer pasivo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 13 — Tus Zonas Erróneas
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp13',
    titulo: 'Tus Zonas Erróneas',
    autor: 'Wayne W. Dyer',
    anio: '1976',
    emoji: '🚫',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Identifica y elimina los patrones de pensamiento autodestructivos que te impiden vivir plenamente y ser responsable de tu propia felicidad.',
    gemasRecompensa: 55,
    capitulos: const [
      CapituloResumen(
        titulo: 'Tú Eres Responsable de Ti',
        emoji: '🎯',
        contenido: '''La premisa central de Dyer es radical y liberadora a la vez: eres completamente responsable de cómo te sientes. No el clima, no tu jefe, no tu pareja, no tu pasado. TÚ. Esta idea incomoda porque implica que no puedes culpar a nadie de tu infelicidad, pero también libera porque significa que tienes el poder de cambiarla.

Las ZONAS ERRÓNEAS son patrones de pensamiento y comportamiento autodestructivos que aprendiste, probablemente en la infancia, y que sigues repitiendo aunque ya no te sirven. No son parte de tu naturaleza — son hábitos que se pueden cambiar.

El primer gran error es buscar la aprobación de otros. Vivimos aterrorizadas de lo que pensarán los demás y tomamos decisiones basadas en esa opinión imaginada en lugar de en lo que realmente queremos y valoramos. La búsqueda de aprobación es una trampa que te mantiene perpetuamente dependiente de otros para sentirte bien contigo misma.

Dyer no dice que la opinión de otros no importe en absoluto — dice que no debe DICTAR tus decisiones ni tu autoestima. Hay una diferencia entre apreciar el feedback y necesitar desesperadamente la aprobación. La primera es sana; la segunda es una zona errónea.

La segunda gran zona errónea es la CULPA y el RESENTIMIENTO. Seguir enojada con alguien que te lastimó en el pasado no te protege de que vuelva a suceder — solo te mantiene atrapada en un evento que ya terminó. La persona que te lastimó siguió viviendo su vida; el resentimiento solo te lastima a ti.''',
      ),
      CapituloResumen(
        titulo: 'El Pasado que ya no Existe',
        emoji: '⏳',
        contenido: '''Una de las zonas erróneas más comunes es vivir atrapada en el pasado. "Siempre fui así", "Así me criaron", "Nunca he podido hacer X" — estos pensamientos usan el pasado como una prisión invisible. Dyer argumenta que el pasado no existe excepto en tu mente, y que usarlo para justificar comportamientos presentes es una elección, no una fatalidad.

El pasado puede explicar por qué llegaste a ser quien eres, pero no tiene por qué determinar quién serás. Cada momento presente es una oportunidad de elegir diferente. La neurofisiología moderna respalda esta idea: el cerebro es plástico y puede crear nuevos patrones a cualquier edad.

Igualmente destructivo es el pensamiento de "Y si...": "Y si me hubiera casado con otra persona", "Y si hubiera estudiado otra carrera", "Y si hubiera tomado esa oportunidad". El pensamiento hipotético sobre el pasado es completamente inútil porque el pasado no puede cambiarse. Solo sirve para generar angustia en el presente.

Dyer propone un ejercicio poderoso: por un día entero, prohibirte mencionar o pensar en eventos del pasado para explicar cómo eres hoy. Solo habla en términos de elecciones presentes. "Elijo hacer X", "Decido sentir Y". Este ejercicio muestra con claridad cuántas veces usamos el pasado como excusa.

El futuro tiene su propia trampa simétrica: la preocupación excesiva por lo que podría salir mal. La preocupación es una zona errónea porque raramente cambia el resultado pero consume enormes cantidades de energía presente. Dyer propone distinguir entre PLANEAR (útil, produce acción) y PREOCUPARSE (inútil, produce parálisis).''',
      ),
      CapituloResumen(
        titulo: 'La Independencia Emocional',
        emoji: '🦅',
        contenido: '''La independencia emocional es la capacidad de sentirte bien contigo misma sin necesitar que nadie te lo confirme. Es uno de los estados más difíciles de alcanzar en nuestra cultura, que constantemente nos enseña a buscar validación externa.

Dyer habla del AMOR PROPIO como el fundamento de toda salud psicológica. No el amor propio narcisista que se engrandece comparándose con otros, sino el amor propio genuino que no necesita comparaciones porque está fundado en el propio valor intrínseco.

Una zona errónea relacionada es la DEPENDENCIA. Las personas que no han desarrollado amor propio buscan relaciones donde otra persona las complete, las valide, les diga que son suficientes. Esto pone una carga imposible sobre la relación: el otro no puede ser tu fuente principal de autoestima porque ningún ser humano puede llenar ese vacío de forma consistente.

Las relaciones más saludables son las que Dyer llama INTERDEPENDENTES: dos personas completas en sí mismas que eligen estar juntas, no porque se necesiten para sobrevivir emocionalmente, sino porque se enriquecen mutuamente. El amor desde la plenitud es profundamente diferente al amor desde la necesidad.

Para desarrollar independencia emocional: practica hacer cosas solo que normalmente necesitarías compañía para hacer, aprende a disfrutar tu propia compañía, identifica qué opiniones y aprobaciones específicas buscas y cuestiona si realmente las necesitas. El objetivo no es aislarte — es poder elegir la conexión desde un lugar de fortaleza, no de miedo a la soledad.''',
      ),
      CapituloResumen(
        titulo: 'La Trampa de la Justicia y la Ira',
        emoji: '⚖️',
        contenido: '''Una zona errónea especialmente común es la ira. Dyer no dice que la ira sea mala en sí misma — es una emoción humana natural. El problema es cuando la convertimos en una forma de vida, cuando nos enganchamos en ciclos de indignación, resentimiento y explosiones que dañan nuestras relaciones y nuestra salud.

La ira habitual generalmente viene de la creencia de que el mundo debería ser justo y que cuando no lo es, tenemos derecho —y obligación— de estar furiosas. Dyer cuestiona esta premisa. El mundo no es justo. Nunca lo ha sido. Insistir en que debería serlo y enojarse cuando no lo es es como insistir en que el agua no debería estar mojada.

Esto no significa aceptar la injusticia pasivamente ni no actuar contra ella. Significa no gastar energía emocional en indignación que no produce acción. Puedes actuar para cambiar algo injusto desde un estado de calma deliberada; no necesitas la ira para motivarte.

La BAJA TOLERANCIA A LA FRUSTRACIÓN es otra zona errónea relacionada. Muchas personas se enojan o deprimen ante cualquier obstáculo menor porque han desarrollado la expectativa de que la vida debería ser fácil y sin roces. Cada semáforo en rojo, cada cola larga, cada error menor se convierte en una catástrofe emocional.

Desarrollar tolerancia a la frustración requiere practicar deliberadamente el cambio de expectativas: "Los obstáculos son normales y no son señal de que algo está fundamentalmente mal". También requiere preguntarte en el momento de frustración: "¿Importará esto en cinco años? ¿En un año? ¿En una semana?". La perspectiva temporal es un antídoto poderoso contra la reactividad.''',
      ),
      CapituloResumen(
        titulo: 'Romper las Zonas Erróneas',
        emoji: '🔓',
        contenido: '''El camino para salir de las zonas erróneas no es la fuerza de voluntad ni la autodisciplina extrema — es la CONCIENCIA. No puedes cambiar lo que no puedes ver. El primer paso es identificar tus zonas erróneas específicas con honestidad radical.

Dyer propone un proceso de cuatro pasos: RECONOCER el patrón sin juzgarlo ("noto que busco aprobación constantemente"), ENTENDER su origen ("aprendí que mi valor dependía de lo que otros pensaban"), DECIDIR si quieres seguir pagando su costo ("¿Qué me está costando esta zona errónea en energía, relaciones, libertad?"), y PRACTICAR nuevas respuestas una pequeña situación a la vez.

El cambio no ocurre en grandes gestos dramáticos sino en pequeñas decisiones cotidianas. La primera vez que no defiendes tu posición desesperadamente cuando nadie la aprueba. La primera vez que haces algo para ti aunque otros no lo entiendan. La primera vez que sueltas el resentimiento no porque el otro lo merezca sino porque tú mereces estar libre.

Dyer introduce el concepto de TRAMPA DE LA JUSTICIA: la creencia de que mereces que el mundo te trate de cierta manera y que tienes derecho a sufrir cuando no lo hace. Renunciar a esta trampa no significa renunciar a la dignidad — significa renunciar al sufrimiento inútil.

La libertad que describe Dyer no es la libertad de que el mundo sea como quieres. Es la libertad de elegir cómo responder al mundo tal como es. Esa libertad siempre ha estado disponible para ti — simplemente nadie te enseñó a ejercerla. Este libro es esa enseñanza.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuáles son las "zonas erróneas" según Wayne Dyer?',
        opciones: [
          'Áreas geográficas donde las personas son menos productivas',
          'Patrones de pensamiento y comportamiento autodestructivos que aprendiste y puedes cambiar',
          'Etapas del desarrollo psicológico que todos atraviesan',
          'Tipos de personalidad que predisponen al fracaso',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Las zonas erróneas son hábitos mentales autodestructivos aprendidos, generalmente en la infancia. No son tu naturaleza — son patrones que puedes cambiar.',
      ),
      PreguntaLibro(
        enunciado: '¿Por qué Dyer dice que el resentimiento solo te lastima a ti?',
        opciones: [
          'Porque hace que la otra persona se sienta culpable y busque venganza',
          'Porque te mantiene atrapada en un evento pasado mientras la otra persona siguió su vida',
          'Porque el resentimiento produce enfermedades físicas específicas',
          'Porque hace que los demás te eviten socialmente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La persona que te lastimó siguió viviendo. El resentimiento no la afecta — te afecta a ti, manteniéndote emocionalmente prisionera de un evento que ya terminó.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre PLANEAR y PREOCUPARSE según Dyer?',
        opciones: [
          'Planear es más difícil y requiere más tiempo que preocuparse',
          'Planear produce acción útil; preocuparse consume energía sin producir nada',
          'La preocupación es más efectiva para evitar problemas futuros',
          'No hay diferencia real entre los dos conceptos',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Planear es útil porque produce acción. Preocuparse es inútil porque consume energía presente sin cambiar el resultado futuro.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué tipo de relaciones considera Dyer las más saludables?',
        opciones: [
          'Las dependientes, donde cada persona necesita a la otra para estar completa',
          'Las independientes, donde cada persona se basta completamente a sí misma',
          'Las interdependientes, donde dos personas completas eligen enriquecerse mutuamente',
          'Las basadas exclusivamente en objetivos comunes y metas compartidas',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Perfecto! Las relaciones interdependientes son entre personas que se sienten completas individualmente y eligen estar juntas por enriquecimiento mutuo, no por necesidad de validación.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es el primer paso del proceso de Dyer para salir de las zonas erróneas?',
        opciones: [
          'Actuar inmediatamente con fuerza de voluntad',
          'Culpar a quien te enseñó el patrón para liberarte de él',
          'Reconocer el patrón con honestidad y sin juzgarte',
          'Evitar todas las situaciones que activen el patrón',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! No puedes cambiar lo que no puedes ver. El primer paso es reconocer el patrón sin juzgarlo. La conciencia es la puerta de la transformación.',
      ),
      const PreguntaLibro(
        enunciado: 'Según Dyer, ¿qué significa verdaderamente la culpa como zona errónea?',
        opciones: [
          'Un mecanismo útil que evita repetir errores del pasado',
          'Un sentimiento que demuestra madurez moral y conciencia ética',
          'Una energía desperdiciada en el pasado que no puede cambiarse, usada para evitar el presente',
          'La respuesta natural y sana al haber causado daño a alguien',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Dyer distingue entre aprender del pasado (útil) y quedarse atrapado en él con culpa (inútil). La culpa crónica es una forma de evitar vivir el presente y tomar responsabilidad ahora.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Dyer considera que la hostilidad y el enojo crónico son "zonas erróneas"?',
        opciones: [
          'Porque el enojo siempre es una reacción desproporcionada',
          'Porque hacen que los demás te rechacen socialmente',
          'Porque consumen tu energía castigándote a ti mismo por el comportamiento de otros',
          'Porque son emociones prohibidas en una persona espiritualmente desarrollada',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! El enojo crónico es autocastigo: cuando te enojas con alguien, tú eres quien experimenta el malestar. Dyer no dice que nunca te enojes, sino que no vivas ahí — es una celda que tú mismo construyes.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña Dyer sobre la búsqueda de aprobación externa como fuente de autoestima?',
        opciones: [
          'Que es natural y necesaria en los primeros años de vida pero debe superarse',
          'Que la aprobación de personas clave como familia o pareja siempre es sana y necesaria',
          'Que es una trampa que mantiene perpetuamente dependiente de otros para sentirte bien — la autoestima real es interna',
          'Que buscar aprobación es señal de madurez social y buenas habilidades interpersonales',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Dyer distingue entre apreciar el feedback (sano) y necesitar desesperadamente la aprobación (zona errónea). Cuando tu autoestima depende de lo que otros piensen, no tienes autoestima — tienes una imagen prestada que puede retirarse en cualquier momento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Dyer como alternativa al pensamiento de "Y si hubiera...?"',
        opciones: [
          'Aceptar el pasado con resignación y no pensar en alternativas',
          'Consultar con otros qué decisiones deberían haberse tomado para aprender de ello',
          'Enfocarse exclusivamente en las elecciones que se pueden tomar ahora en el presente',
          'Perdonar a quienes te influyeron a tomar las decisiones pasadas incorrectas',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El pensamiento de "Y si..." sobre el pasado es completamente inútil porque el pasado no puede cambiarse. Dyer propone redirigir toda esa energía hacia las elecciones presentes: "¿Qué elijo hacer ahora?" Esta pregunta tiene poder real; la otra, ninguno.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué rol atribuye Dyer a la "necesidad de ser siempre justo" en el sufrimiento personal?',
        opciones: [
          'La justicia es un valor fundamental y perseguirla siempre conduce al bienestar',
          'La necesidad de que el mundo sea siempre justo crea sufrimiento porque el mundo con frecuencia no lo es',
          'La injusticia percibida es siempre real y debe combatirse para el bienestar psicológico',
          'Solo las personas con bajo coeficiente emocional reaccionan con sufrimiento ante la injusticia',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Dyer señala que insistir en que la vida debe ser siempre justa es otra zona errónea: la vida frecuentemente no es justa. Aceptar esa realidad no es resignación — es sabiduría que libera la energía que antes se gastaba en la queja y el resentimiento por lo que "debería ser".',
      ),
    ],
  ),


  // ══════════════════════════════════════════════════════════
  //  LIBRO 14 — El Alquimista
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp14',
    titulo: 'El Alquimista',
    autor: 'Paulo Coelho',
    anio: '1988',
    emoji: '✨',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Una fábula sobre seguir tu Leyenda Personal — el camino único que el universo ha preparado para ti — y las fuerzas que conspiran a tu favor cuando te atreves a soñar.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Leyenda Personal',
        emoji: '🌟',
        contenido: '''Santiago, un joven pastor andaluz, sueña repetidamente con un tesoro escondido en las pirámides de Egipto. Este sueño es la metáfora central del libro: la LEYENDA PERSONAL, el destino único que cada alma viene a cumplir en este mundo.

Coelho presenta la Leyenda Personal no como algo que se inventa sino como algo que se descubre. En la infancia, todos sabemos lo que queremos ser y lo que queremos hacer. Pero la sociedad, la familia y el miedo van enterrando esos sueños bajo capas de "deberías" y "no puedes". El trabajo de la vida es desenterrar esa verdad original.

El Alquimista que Santiago encuentra en su viaje explica: "Hay una fuerza que quiere que realices tu Leyenda Personal. Es una fuerza tan grande que parece magia". Coelho la llama el ALMA DEL MUNDO: la energía que conecta todo y que colabora con quienes persiguen su verdadera misión.

La señal más clara de que estás en tu Leyenda Personal es lo que el libro llama "la suerte del principiante": al inicio de cualquier búsqueda genuina, el universo conspira para mostrar que el camino es posible. Esto no dura para siempre — después vienen las pruebas — pero ese impulso inicial es una confirmación de que vas en la dirección correcta.

El mayor obstáculo no es el peligro ni la dificultad — es el miedo al fracaso. Muchas personas viven con la creencia de que es mejor no intentarlo que intentarlo y fallar. Coelho muestra que el mayor fracaso es llegar al final de la vida sin haber intentado vivir la historia que viniste a contar.''',
      ),
      CapituloResumen(
        titulo: 'Las Pruebas del Camino',
        emoji: '⚔️',
        contenido: '''Santiago vende sus ovejas, cruza el estrecho hacia África, y casi inmediatamente es robado. Se queda sin dinero en una ciudad extraña, sin conocer el idioma, sin nadie que lo ayude. Este momento simboliza algo que Coelho llama la PRUEBA REAL del compromiso con tu sueño.

Cuando el universo prueba si realmente quieres tu sueño, la tentación más grande es interpretar los obstáculos como señales de que ibas en la dirección equivocada. "Si realmente fuera mi destino, no sería tan difícil". Pero Coelho invierte esta lógica: las pruebas son precisamente la señal de que estás en el camino correcto. Son el filtro que separa a quienes realmente quieren algo de quienes solo lo quieren cuando es fácil.

Santiago trabaja en una tienda de cristales durante casi un año, ahorrando dinero para continuar. En ese tiempo, transforma la tienda con sus ideas y el negocio florece. El Alquimista enseña: incluso cuando no avanzas directamente hacia tu sueño, si estás presente y comprometido donde estás, el universo está trabajando a tu favor.

Las señales del universo son otro tema central. El libro introduce la idea de que el mundo habla continuamente a quienes aprenden a escuchar: coincidencias, encuentros casuales, intuiciones fuertes. No como superstición — como atención al flujo de la vida. Las personas más exitosas en cualquier campo describen una capacidad muy desarrollada para detectar oportunidades que otros no ven.

Fatima, el amor que Santiago encuentra en el desierto, introduce otro principio: el amor verdadero no encadena — libera. Ella le dice que parta, que cumpla su Leyenda, que si ella es parte de su historia el universo los reunirá. El amor que te impide ser quien eres no es amor — es miedo disfrazado.''',
      ),
      CapituloResumen(
        titulo: 'El Alma del Mundo',
        emoji: '🌍',
        contenido: '''En el corazón del libro está la idea del ALMA DEL MUNDO: la inteligencia o energía que permea todo lo existente y que responde a quienes persiguen genuinamente su Leyenda Personal. Coelho no lo presenta como dogma religioso sino como experiencia vivida.

El Alquimista enseña a Santiago a leer el mundo: el vuelo de los pájaros, la dirección del viento, los patrones del desierto. Este "Lenguaje del Mundo" no es magia de libro de cuentos — es la capacidad de atención profunda que permite ver lo que otros ignoran. Es lo que los científicos llaman serendipia y los artistas llaman inspiración.

El concepto de MAKTUB (árabe: "está escrito") aparece repetidamente. Coelho lo usa no para negar el libre albedrío sino para describir la sensación de estar en el flujo de tu destino: cuando todo parece encajar, cuando los encuentros correctos ocurren en el momento preciso, cuando las puertas se abren sin que tengas que forzarlas.

Santiago aprende la distinción entre OMENS (señales que el mundo te da) e interpretaciones erróneas de esas señales. La diferencia: las señales genuinas llevan hacia tu Leyenda Personal; las que te alejan de ella son proyecciones de tu propio miedo. Aprender a distinguirlas es parte del trabajo espiritual del viaje.

El principio del Alma del Mundo también aparece en las ciencias: la teoría de sistemas complejos muestra que las partes de un sistema se influyen mutuamente de formas no lineales. Pequeñas acciones en la dirección correcta pueden producir efectos desproporcionados. El universo no es indiferente a tus intenciones — responde a ellas de formas que la lógica lineal no puede predecir.''',
      ),
      CapituloResumen(
        titulo: 'La Alquimia Interior',
        emoji: '⚗️',
        contenido: '''El Alquimista que Santiago finalmente conoce no trabaja solo con metales — trabaja con almas. La alquimia física (convertir plomo en oro) es una metáfora de la alquimia espiritual: convertir tus miedos, limitaciones y heridas en sabiduría, poder y amor.

La enseñanza central del Alquimista es simple pero profunda: "Cuando quieres algo con todo tu corazón, toda la creación conspira para que lo logres". No es pensamiento mágico — es la descripción de lo que ocurre cuando una persona se alinea completamente con su propósito y deja de dispersar su energía en dudas, quejas y resistencia.

Santiago aprende la LENGUA DEL MUNDO: la capacidad de comunicarse con las cosas a nivel de alma, no solo de mente. Este concepto anticipa lo que la psicología moderna llama estados alterados de conciencia, flow profundo, y experiencias cumbres — momentos donde la separación entre el observador y lo observado se disuelve.

El Alquimista explica por qué pocas personas realizan sus Leyendas Personales: en el camino hacia el sueño, descubren un tesoro menor y se conforman. La tienda de cristales se convierte en el negocio principal de la vida. Fatima en el desierto se convierte en el destino. La comodidad en el campamento se convierte en la vida entera. No por maldad — por miedo a perder lo que ya se tiene.

La prueba final en el campamento militar, cuando Sntiago debe convertirse en viento sin saber cómo, simboliza el salto de fe definitivo: en el momento donde ya no quedan opciones racionales, la única salida es la confianza total en la fuerza que te ha traído hasta aquí.''',
      ),
      CapituloResumen(
        titulo: 'El Tesoro y el Regreso',
        emoji: '💎',
        contenido: '''El final del Alquimista contiene la revelación más irónica y profunda del libro: el tesoro que Santiago buscó cruzando continentes estaba enterrado en el mismo lugar donde empezó su viaje, debajo del árbol donde solía dormir con sus ovejas.

Esta no es una broma del destino ni una crueldad — es la enseñanza más importante del libro. Si Santiago no hubiera emprendido el viaje, jamás habría encontrado el tesoro, porque el hombre que encontró el tesoro no era el mismo que salió en busca de él. El viaje lo transformó. Sin la transformación, no podría haber reconocido el tesoro aunque lo hubiera tenido en frente todo el tiempo.

Coelho dice que el TESORO REAL de cualquier viaje hacia tu Leyenda Personal no es el resultado externo — es la persona en que te conviertes durante el camino. Las habilidades, la sabiduría, la fe, la capacidad de leer el mundo que desarrollas son más valiosas que cualquier meta específica.

El regreso de Santiago también enseña sobre la GRATITUD hacia los maestros del camino: el anciano Melquisedec que le explicó la Leyenda Personal, el mercader de cristales que le dio trabajo cuando lo necesitaba, el inglés que buscaba al Alquimista, Fatima que lo amó sin encadenarlo, y el Alquimista mismo. Cada persona en tu camino es un maestro si sabes verlo así.

La promesa final del libro: cuando emprendes genuinamente tu Leyenda Personal, nunca estás solo. El universo entero — visto y no visto — se convierte en tu aliado. No porque seas especial, sino porque cumplir tu propósito más profundo es la contribución que viniste a hacer al mundo. Esa contribución, el mundo la necesita.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es la "Leyenda Personal" en El Alquimista?',
        opciones: [
          'Una historia que uno inventa para impresionar a otros',
          'El destino único que cada alma viene a cumplir, descubierto al seguir los sueños profundos',
          'Un texto religioso que guía el comportamiento moral',
          'La narrativa que uno construye sobre su pasado',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La Leyenda Personal es el destino único de cada persona. No se inventa — se descubre cuando uno tiene el valor de seguir sus sueños más profundos.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué significa el hecho de que el tesoro estaba donde Santiago empezó su viaje?',
        opciones: [
          'Que viajar es una pérdida de tiempo y es mejor quedarse en casa',
          'Que el universo se burla de quienes buscan aventuras',
          'Que la transformación personal durante el viaje era el verdadero tesoro — sin ella no podría haberlo encontrado',
          'Que los sueños repetitivos siempre llevan al lugar equivocado',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! El tesoro no era el destino — era la persona en que Santiago se convirtió durante el viaje. Sin esa transformación, no podría haber reconocido ni encontrado nada.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué enseña el Alquimista sobre los obstáculos en el camino hacia tu sueño?',
        opciones: [
          'Que son señales de que ibas en la dirección equivocada',
          'Que son el filtro que prueba si realmente quieres tu sueño — y la señal de que vas en el camino correcto',
          'Que deben evitarse cambiando de sueño cuando aparecen',
          'Que solo les ocurren a las personas sin talento',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Las pruebas no indican que ibas mal — son la confirmación de que ibas bien. Separan a quienes realmente quieren algo de quienes solo lo quieren cuando es fácil.',
      ),
      PreguntaLibro(
        enunciado: '¿Cómo describe Coelho al "Alma del Mundo"?',
        opciones: [
          'Un dios específico de una religión organizada',
          'La energía que conecta todo y que colabora con quienes persiguen genuinamente su propósito',
          'Una fuerza negativa que pone obstáculos en el camino',
          'El destino inevitable que no se puede cambiar',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Perfecto! El Alma del Mundo es la inteligencia o energía que permea todo. Coelho muestra que conspira a favor de quienes persiguen autenticamente su Leyenda Personal.',
      ),
      PreguntaLibro(
        enunciado: '¿Por qué Coelho dice que muchas personas no realizan sus Leyendas Personales?',
        opciones: [
          'Porque no tienen suficiente dinero ni recursos materiales',
          'Porque el universo no colabora con todos por igual',
          'Porque en el camino encuentran un tesoro menor y se conforman, por miedo a perder lo que ya tienen',
          'Porque las Leyendas Personales solo existen para personas especialmente dotadas',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! La mayoría se conforma con algo bueno antes de llegar a algo extraordinario. La comodidad se convierte en el enemigo de lo excepcional.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué afirma Dispenza sobre la relación entre pensamientos y emociones en la creación de hábitos?',
        opciones: [
          'Los pensamientos crean emociones, y las emociones repetidas se convierten en el estado de ánimo habitual',
          'Las emociones son independientes de los pensamientos y no pueden cambiarse conscientemente',
          'Solo las experiencias físicas intensas pueden cambiar patrones emocionales profundos',
          'Los pensamientos positivos automáticamente eliminan las emociones negativas',
        ],
        respuestaCorrecta: 0,
        explicacion: '¡Correcto! Dispenza explica que pensamiento → emoción → estado de ánimo → personalidad. Romper ese ciclo requiere cambiar primero el pensamiento, luego sostener la nueva emoción, hasta que el cuerpo "aprende" el nuevo estado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué evidencia científica cita Dispenza para respaldar sus afirmaciones sobre neuroplasticidad?',
        opciones: [
          'Estudios de tomografía que muestran cambios en la estructura cerebral tras prácticas meditativas intensivas',
          'Registros de curación espontánea en pacientes terminales sin intervención médica',
          'Experimentos de laboratorio que demuestran telepatía entre meditadores avanzados',
          'Estadísticas de longevidad en comunidades que practican meditación diaria',
        ],
        respuestaCorrecta: 0,
        explicacion: '¡Brillante! Dispenza usa neuroimagen (escáneres cerebrales) en retiros para mostrar cambios físicos en cerebros de participantes. La neuroplasticidad — la capacidad del cerebro de cambiar con la práctica mental — es ciencia establecida.',
      ),
      const PreguntaLibro(
        enunciado: 'Según Dispenza, ¿por qué muchas personas fracasan en cambiar hábitos a pesar de querer hacerlo?',
        opciones: [
          'Porque carecen de la fuerza de voluntad necesaria para sostener el esfuerzo',
          'Porque sus genes determinan su personalidad y no pueden modificarse',
          'Porque cambian el pensamiento pero el cuerpo sigue adicto a las emociones del viejo yo',
          'Porque no tienen acceso a las técnicas correctas de meditación',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! El cuerpo se vuelve adicto a las emociones habituales — el estrés, la ansiedad, el resentimiento. Aunque la mente quiere cambiar, el cuerpo "pide" su dosis emocional familiar. El cambio real requiere romper esa adicción corporal.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña Coelho sobre la relación entre el amor y la Leyenda Personal a través del personaje de Fatima?',
        opciones: [
          'Que el amor verdadero siempre exige sacrificar la Leyenda Personal por la pareja',
          'Que el amor y la Leyenda Personal son incompatibles y se debe elegir uno',
          'Que el amor verdadero libera en lugar de encadenar — Fatima le dice a Santiago que parta y cumpla su misión',
          'Que el amor solo puede encontrarse después de completar la Leyenda Personal',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Fatima dice a Santiago que parta: "Si eres parte de mi historia, el universo nos reunirá." Coelho enseña que el amor que te impide ser quien eres no es amor — es miedo disfrazado. El amor genuino honra la Leyenda Personal del otro.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué simboliza el "Lenguaje del Mundo" que aprende Santiago en el desierto?',
        opciones: [
          'La capacidad de hablar con personas de diferentes culturas e idiomas',
          'Un sistema de señales místicas accesible solo a los alquimistas iniciados',
          'La atención profunda que permite ver conexiones y señales que la mente distraída no percibe',
          'El árabe y otros idiomas que Santiago debe aprender para completar su viaje',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El Lenguaje del Mundo no es magia — es la capacidad de atención profunda que permite leer el vuelo de los pájaros, el viento, los patrones del mundo. Es lo que la psicología moderna llama intuición experta: la habilidad de detectar señales sutiles que la mente concentrada percibe y la distraída ignora.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 16 — El Arte de Amar
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp16',
    titulo: 'El Arte de Amar',
    autor: 'Erich Fromm',
    anio: '1956',
    emoji: '❤️',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'El amor no es un sentimiento que simplemente ocurre — es un arte que requiere conocimiento y esfuerzo, una práctica que se desarrolla con dedicación y madurez.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Amor como Arte',
        emoji: '🎨',
        contenido: '''La premisa de Fromm es provocadora desde la primera página: la mayoría de las personas no saben amar porque no lo consideran un arte que requiere aprendizaje. Pensamos que el amor es un sentimiento que nos "pasa", algo que "cae del cielo", una química que existe o no existe entre dos personas. Esta visión pasiva del amor es la fuente de la mayor parte del sufrimiento romántico.

Un arte —la música, la carpintería, la medicina— requiere dos cosas: conocimiento teórico y práctica. El pianista estudia teoría musical pero también practica horas al día. El cirujano estudia anatomía pero también opera miles de veces antes de dominar su arte. Fromm propone que el amor requiere exactamente lo mismo: aprender sus principios y practicarlo conscientemente.

La primera confusión es entre ENAMORARSE y AMAR. Enamorarse —esa experiencia de disolución de fronteras con otra persona, esa excitación intensa del principio— es universal y no requiere habilidad. Cualquiera puede enamorarse. Pero el enamoramiento es por naturaleza temporal: las fronteras del yo regresan, la novedad se disuelve, y lo que queda es o amor real o desilusión.

La segunda confusión es creer que el problema del amor es SER AMADO, no AMAR. Nos preocupamos por ser lo suficientemente atractivos, interesantes, exitosos para merecer amor. Fromm invierte esto: el problema no es encontrar el objeto correcto para amar sino desarrollar la CAPACIDAD de amar. Una persona incapaz de amar encontrará que "el amor" no dura con nadie.

La tercera confusión es entre la CAÍDA en el amor (intenso pero temporal) y el ESTAR en amor (profundo pero que requiere trabajo). La sociedad celebra y dramatiza la primera — películas, canciones, historias — e ignora la segunda. El resultado: generaciones que no saben qué hacer cuando el enamoramiento inicial se disipa.''',
      ),
      CapituloResumen(
        titulo: 'La Teoría del Amor',
        emoji: '💭',
        contenido: '''Fromm define el amor a partir de la condición humana fundamental: la SEPARATIDAD. Somos individuos separados, conscientes de nuestra propia existencia como algo distinto del mundo. Esta consciencia produce una angustia existencial básica: la soledad. El amor es la respuesta humana a esa soledad, la única que produce unión sin sacrificar la individualidad.

Hay muchas respuestas a la soledad, pero la mayoría son inadecuadas: las orgías y el consumo generan unión momentánea pero crean más soledad después; el conformismo —ser como todos— alivia la angustia individual diluyendo la individualidad; la creatividad une al artista con el material, pero es unión incompleta porque falta el otro.

El amor genuino une a dos personas sin destruir la individualidad de ninguna. Fromm lo define con una paradoja: el amor es la experiencia de unidad que mantiene la integridad e individualidad de cada persona. No fusión —communion.

Los componentes del amor maduro según Fromm son cuatro: CUIDADO (el amor implica preocupación activa por el crecimiento del ser amado), RESPONSABILIDAD (responder activamente a las necesidades del otro), RESPETO (ver al otro como es, sin distorsiones de lo que queremos que sea), y CONOCIMIENTO (entender profundamente al otro, no la imagen idealizada sino la persona real).

Estos cuatro componentes no son estados — son PRÁCTICAS. El cuidado se practica. La responsabilidad se ejerce. El respeto se cultiva. El conocimiento se profundiza. Esto es lo que convierte el amor en un arte: requiere trabajo activo y continuo, no solo sentimientos.''',
      ),
      CapituloResumen(
        titulo: 'Tipos de Amor',
        emoji: '🌈',
        contenido: '''Fromm analiza las diferentes formas que el amor toma en la vida humana, mostrando que el amor es más un CARÁCTER que una emoción específica. Una persona que genuinamente ama lo manifiesta en todas sus relaciones, no solo en la romántica.

El AMOR FRATERNAL es el más fundamental: el amor por toda la humanidad, la capacidad básica de ver a cualquier ser humano con cuidado y respeto. Sin amor fraternal, el amor romántico se convierte en egoísmo a dúo: dos personas que se excluyen del mundo y se usan mutuamente para evitar la realidad.

El AMOR MATERNO tiene una cualidad única: es incondicional. La madre ama al hijo no por lo que es o lo que hace, sino porque existe. Fromm señala que todos necesitamos experimentar ambos tipos: el amor incondicional que nos da seguridad fundamental (el materno) y el amor condicional que nos muestra que nuestras acciones y carácter importan (el paterno). Los problemas psicológicos más comunes vienen de recibir demasiado de uno sin suficiente del otro.

El AMOR A UNO MISMO merece capítulo especial. El mandamiento "ama a tu prójimo como a ti mismo" asume que el amor propio es correcto y posible. Fromm distingue entre amor propio sano (base para amar a otros) y narcisismo (incapacidad de ver y amar a otros porque uno está demasiado ocupado amándose). El narcisista no se ama demasiado — en el fondo se ama muy poco, por eso necesita afirmación constante.

El AMOR A DIOS evoluciona en la historia humana desde el dios tribal que castiga y recompensa hasta la experiencia mística de unidad con el principio de la existencia. Fromm lo ve como la expresión más abstracta de la necesidad humana de superar la separatidad y experimentar unión.''',
      ),
      CapituloResumen(
        titulo: 'El Amor en la Sociedad Moderna',
        emoji: '🏙️',
        contenido: '''Fromm hace una crítica social profunda: la sociedad capitalista occidental es estructuralmente incompatible con el amor. El capitalismo requiere personas que traten todo —incluyendo a otras personas— como mercancías intercambiables. El amor genuino, que requiere ver a cada persona como única e irreemplazable, va contra la lógica del mercado.

La MENTALIDAD DE MERCADO del amor se manifiesta así: buscamos la "mejor oferta disponible", tomando en cuenta nuestro "valor en el mercado" y el de la otra persona. Calculamos si podemos "conseguir algo mejor". Tenemos miedo de "invertir" emocionalmente y "salir perdiendo". Este lenguaje revela cómo hemos mercantilizado algo que debería estar fuera del mercado.

El PROBLEMA DEL AMOR EN OCCIDENTE también viene de la confusión entre ser amado y ser popular. La persona que "cae bien", que es entretenida, que tiene una "personalidad atractiva" —estas son habilidades de mercadeo, no de amor. Desde niños se nos enseña a ser agradables, a vendernos bien, a proyectar imagen. Nadie nos enseña a amar.

La distracción y la superficialidad también son obstáculos. Amar requiere ATENCIÓN PROFUNDA: la capacidad de estar completamente presente con otra persona, de escuchar genuinamente, de ver sin proyección. En una sociedad de distracciones, atención profunda es una capacidad que se atrofia por desuso.

Fromm no es pesimista — es diagnóstico. Señala los obstáculos precisamente para que puedan superarse. La solución: elegir conscientemente valores humanos sobre valores de mercado en tus relaciones, practicar atención y presencia, y comprometerte con el amor como una disciplina de vida.''',
      ),
      CapituloResumen(
        titulo: 'La Práctica del Amor',
        emoji: '🌱',
        contenido: '''El último capítulo de Fromm responde la pregunta práctica: ¿Cómo se practica el arte de amar? No con técnicas de seducción ni fórmulas de comunicación, sino con el desarrollo de una orientación fundamental hacia la vida.

La primera práctica es la DISCIPLINA: el amor maduro requiere la misma disciplina que cualquier arte. Levantarse temprano para meditar, practicar un instrumento cuando no tienes ganas, estudiar cuando podrías distraerte — estas son formas de disciplina que fortalecen la voluntad. La disciplina en el amor significa estar presente incluso cuando es incómodo, comunicar incluso cuando es difícil, permanecer incluso cuando sería más fácil escapar.

La segunda es la CONCENTRACIÓN: la capacidad de estar completamente con otra persona cuando estás con ella. Fromm era un crítico feroz de la vida fragmentada y distraída, donde nunca estás completamente en ningún lugar. La concentración es el regalo más profundo que puedes dar a alguien: toda tu atención.

La tercera es la PACIENCIA: el amor maduro no busca resultados inmediatos. Permite al otro ser quien es hoy mientras confía en su capacidad de crecer. La impaciencia convierte el amor en control.

La cuarta es el INTERÉS SUPREMO: el amor como orientación hacia la vida. Las personas que más aman son las que tienen un interés activo y genuino en casi todo: en las personas, en las ideas, en la naturaleza, en el arte. No es que el amor hacia todos sea idéntico —tiene diferentes intensidades y formas— sino que viene del mismo carácter amoroso.

Fromm concluye: aprender a amar es la tarea más difícil y la más importante que un ser humano puede emprender. No porque sea complicado conceptualmente — sus principios son simples. Sino porque requiere superar nuestra tendencia natural a la pereza, el miedo y el narcisismo. El amor maduro es el más grande logro del desarrollo humano.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es el error fundamental en la forma en que pensamos sobre el amor según Fromm?',
        opciones: [
          'Que esperamos demasiado de nuestras parejas',
          'Que creemos que el amor es algo que nos "pasa" en lugar de un arte que requiere aprendizaje y práctica',
          'Que no expresamos suficientemente nuestros sentimientos',
          'Que confundimos amistad con amor romántico',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Tratamos el amor como un sentimiento pasivo que ocurre solo, en lugar de como un arte que requiere conocimiento, práctica y disciplina constante.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuáles son los cuatro componentes del amor maduro según Fromm?',
        opciones: [
          'Pasión, compatibilidad, atracción y compromiso',
          'Cuidado, responsabilidad, respeto y conocimiento',
          'Comunicación, honestidad, lealtad y perdón',
          'Atracción, confianza, tiempo compartido y valores comunes',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Cuidado (preocupación activa por el crecimiento del otro), responsabilidad (responder a sus necesidades), respeto (verlo como es) y conocimiento (entender a la persona real).',
      ),
      PreguntaLibro(
        enunciado: '¿Por qué Fromm dice que el narcisista no se ama demasiado sino muy poco?',
        opciones: [
          'Porque el narcisismo es una enfermedad que impide sentir amor propio real',
          'Porque su aparente amor propio es en realidad inseguridad — necesita afirmación constante porque en el fondo no se siente suficiente',
          'Porque los narcisistas sufren más que las personas promedio',
          'Porque el narcisismo se hereda genéticamente y no refleja elecciones propias',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El narcisista busca aprobación constante precisamente porque su amor propio es frágil. El amor propio genuino no necesita confirmación externa permanente.',
      ),
      PreguntaLibro(
        enunciado: '¿Cómo describe Fromm la "mentalidad de mercado" en el amor romántico?',
        opciones: [
          'Una forma sana de establecer estándares en relaciones',
          'Tratar a las personas como mercancías — calcular su "valor", buscar la "mejor oferta", tener miedo de "salir perdiendo"',
          'Usar el dinero como sustituto del amor en la sociedad moderna',
          'La tendencia a priorizar el trabajo sobre las relaciones personales',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Perfecto! La lógica del mercado ha invadido las relaciones. Fromm muestra que buscar la "mejor oferta" y calcular "valor" convierte el amor en transacción, no en arte.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué distingue el amor fraternal de todos los otros tipos de amor?',
        opciones: [
          'Es el amor más intenso emocionalmente de todos los tipos',
          'Es exclusivo de las relaciones familiares de sangre',
          'Es el amor hacia toda la humanidad — la capacidad básica de ver a cualquier ser humano con cuidado',
          'Es el amor más fácil de practicar por no requerir intimidad',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! El amor fraternal es la base de todos los demás tipos. Sin él, el amor romántico se convierte en egoísmo a dúo donde dos personas se excluyen del resto del mundo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Fromm la diferencia entre amor propio sano y narcisismo?',
        opciones: [
          'El amor propio sano es egoísta; el narcisismo incluye a otros',
          'El narcisismo es amor propio exagerado; el amor propio sano es moderado',
          'El amor propio sano es la base para amar a otros; el narcisismo es incapacidad de amar por falta profunda de autoestima',
          'No hay diferencia real — ambos llevan al mismo resultado en las relaciones',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! El narcisista no se ama demasiado — se ama demasiado poco, por eso necesita afirmación constante de otros. El amor propio sano, en cambio, libera de esa dependencia y permite amar genuinamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el significado del "viaje a la montaña" que Sócrates envía a Dan a completar solo?',
        opciones: [
          'Una prueba física para demostrar resistencia corporal',
          'Una metáfora del entrenamiento que requiere aislamiento del mundo',
          'El enfrentamiento directo con sus miedos más profundos sin el apoyo del maestro',
          'Un ritual de iniciación necesario para convertirse en guerrero',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! El maestro puede señalar el camino, pero el discípulo debe recorrerlo solo. El viaje a la montaña fuerza a Dan a aplicar internamente todo lo que ha aprendido externamente — la prueba real del guerrero.',
      ),
      const PreguntaLibro(
        enunciado: 'Según El Guerrero Pacífico, ¿qué distingue a un "guerrero" de alguien ordinario?',
        opciones: [
          'La fuerza física superior y la disciplina extrema de entrenamiento',
          'La ausencia de miedo y la capacidad de dominar las emociones negativas',
          'Actuar con plena presencia y responsabilidad en cada momento, sin importar las circunstancias',
          'Haber superado experiencias traumáticas que forjaron un carácter excepcional',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! El guerrero pacífico no es el que nunca siente miedo — es quien actúa conscientemente a pesar de él. La "paz" del guerrero viene de vivir plenamente el presente, no de la ausencia de conflicto.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Fromm afirma que el amor es un arte que se aprende y no un sentimiento que simplemente ocurre?',
        opciones: [
          'Porque las emociones son incontrolables y solo el arte del amor las puede canalizar',
          'Porque el amor requiere conocimiento, esfuerzo y práctica deliberada como cualquier otra habilidad — no es solo un estado que se "cae"',
          'Porque solo las personas con educación artística pueden amar verdaderamente',
          'Porque el amor romántico es una construcción cultural que debe aprenderse de la sociedad',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Fromm parte de que la mayoría trata el amor como un problema de encontrar al objeto correcto, no de desarrollar la capacidad de amar. El amor activo requiere dar (no solo recibir), conocer al otro en profundidad, respetar su autonomía y tener responsabilidad por su bienestar — habilidades que se desarrollan con práctica.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia Fromm entre "caer en el amor" y el amor maduro?',
        opciones: [
          'Caer en el amor es más intenso; el amor maduro es más cómodo pero menos apasionado',
          'Caer en el amor es la fusión temporal de dos egos; el amor maduro preserva la individualidad de cada uno mientras se unen',
          'No hay diferencia real — el amor maduro es el resultado natural del amor inicial',
          'Caer en el amor es ilusión; el amor maduro es la única forma real de amor que existe',
        ],
        respuestaCorrecta: 1,
        explicacion: '"Caer en el amor" es la disolución de barreras entre dos extraños — intenso pero temporal. El amor maduro es la unión activa que preserva la integridad de cada uno. Fromm dice: el amor maduro es "Soy uno contigo, siendo yo mismo" — no la fusión que borra las individualidades.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 18 — Un Mundo Nuevo, Ahora
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp18',
    titulo: 'Un Mundo Nuevo, Ahora',
    autor: 'Eckhart Tolle',
    anio: '2005',
    emoji: '🌍',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'La transformación de la conciencia humana comienza con reconocer el ego como la fuente de sufrimiento, y descubrir la paz que existe más allá de los pensamientos compulsivos.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Ego y el Dolor',
        emoji: '🎭',
        contenido: '''Eckhart Tolle propone que la mayor parte del sufrimiento humano individual y colectivo tiene una sola fuente: el EGO. No en el sentido psicoanalítico de Freud, sino como la voz interna que se cree tu identidad, que necesita constantemente afirmarse, compararse, defenderse y expandirse.

El ego es fundamentalmente una HISTORIA que tu mente cuenta sobre ti mismo. Es el conjunto de pensamientos, memorias, opiniones y roles que has acumulado y que confundes con quién eres. "Soy buena madre", "Soy un fracasado", "Soy inteligente", "Soy víctima" — todas estas son narrativas del ego, no tu verdadera identidad.

El ego funciona por IDENTIFICACIÓN: se identifica con objetos ("mi auto", "mi casa"), roles ("soy maestra", "soy madre"), opiniones ("tengo razón sobre esto"), grupos ("somos mejores que ellos") y el cuerpo. Cuando algo amenaza cualquiera de estas identificaciones, el ego experimenta existencialmente peligro. Por eso las personas reaccionan con tanta intensidad a críticas aparentemente menores: no es el comentario lo que duele — es la amenaza a la identidad del ego.

El CUERPO DEL DOLOR es el concepto más original del libro: la acumulación de dolor emocional no procesado que vive en el campo energético del cuerpo. Todos tenemos uno. Cuando es activado por algún evento —una crítica, un tono de voz, una situación que evoca el pasado— puede apoderarse completamente de tus respuestas, llevándote a decir y hacer cosas que después no reconoces como tuyas.

La clave no es luchar contra el ego —eso solo lo fortalece. Es RECONOCERLO. Cuando puedes observar el ego en acción —"ah, esto es mi ego que se siente amenazado"— ya no estás completamente identificado con él. Esa pequeña distancia es el comienzo de la libertad.''',
      ),
      CapituloResumen(
        titulo: 'El Rol del Ego en las Relaciones',
        emoji: '💔',
        contenido: '''Tolle dedica una parte significativa del libro a las relaciones porque es donde el ego se manifiesta con mayor intensidad y causa mayor sufrimiento. La mayoría de los conflictos relacionales no son sobre lo que parecen ser — son batallas entre egos.

La dinámica típica: el ego de una persona necesita afirmarse → el ego de la otra persona se siente amenazado → el primero necesita defender su posición → se escala. No es porque sean malas personas — es el patrón automático del ego sin consciencia. El contenido del conflicto raramente importa; la dinámica siempre es la misma.

La trampa más común en las relaciones es lo que Tolle llama el AMOR ADICTIVO: usar a otra persona para completarse, para llenar el vacío interior, para escapar de uno mismo. Esto no es amor —es dependencia. Y como cualquier adicción, crea sufrimiento cuando el "suministro" se interrumpe o no satisface las expectativas.

El amor genuino, dice Tolle, no puede venir del ego porque el ego siempre quiere algo a cambio. El amor genuino viene del estado de presencia —cuando estás completamente aquí, con otra persona, sin la agenda del ego. En ese estado, no necesitas que el otro sea diferente. No proyectas tus necesidades sobre él. Lo ves tal como es, no como herramienta para tu propia compleción.

Tolle introduce el concepto de COMPLEMENTARSE VS. COMPLETARSE. Las relaciones más disfuncionales son las de complementación: busco en el otro lo que me falta, el otro busca en mí lo que le falta. Cuando cambiamos, esa complementación ya no funciona y la relación se rompe. Las relaciones más sanas son las de dos personas que se sienten completas en sí mismas y eligen enriquecerse mutuamente.''',
      ),
      CapituloResumen(
        titulo: 'El Propósito de la Vida',
        emoji: '🌱',
        contenido: '''Una de las contribuciones más originales de Tolle es su distinción entre el propósito EXTERNO de la vida y el propósito INTERNO. La mayoría de libros de autoayuda se enfocan en el propósito externo: encontrar tu misión, tu pasión, tu vocación. Tolle dice que esto es importante pero secundario.

El propósito interno es DESPERTAR: la transformación de tu conciencia de un estado gobernado por el ego a un estado de presencia. Este propósito trasciende cualquier rol, actividad o logro específico. Puede cumplirse lavando platos tanto como liderando una empresa, criando hijos tanto como escribiendo libros.

¿Cómo se manifiesta el propósito interno en lo cotidiano? A través de hacer lo que haces con CONCIENCIA PLENA. No hacer las cosas en piloto automático mientras la mente divaga. Estar completamente en lo que estás haciendo. Esta cualidad de presencia transforma cualquier actividad —lavar platos, conversar, manejar— en una práctica espiritual.

Tolle hace una distinción importante entre ACEPTACIÓN y resignación. Aceptar la situación presente no significa que no intentes cambiarla. Significa que no añades resistencia mental a lo que ya es. La resistencia al momento presente —"esto no debería estar pasando", "por qué a mí", "no puedo soportar esto"— crea sufrimiento adicional sin cambiar nada. La aceptación, paradójicamente, es lo que te libera para actuar efectivamente.

El propósito de la vida también se manifiesta a nivel colectivo. Tolle escribió el libro en el contexto de lo que describe como una transformación en la conciencia humana —un salto evolutivo donde más personas en más lugares simultáneamente están despertando del sueño del ego. No como fenómeno místico sino como una respuesta evolutiva a los problemas que el ego humano ha creado.''',
      ),
      CapituloResumen(
        titulo: 'El Espacio Interior',
        emoji: '🌌',
        contenido: '''Tolle habla de un "espacio" que existe entre tus pensamientos — un silencio breve que se puede aprender a habitar y ampliar. Cuando lo descubres, te das cuenta de que no eres tus pensamientos; eres el espacio consciente donde los pensamientos ocurren.

Esta distinción — entre ser el pensamiento y ser el observador del pensamiento — es la más importante del libro. La mayoría de las personas se identifican completamente con sus pensamientos: si piensas "soy un fracasado", eso se convierte en tu realidad. Pero si puedes observar ese pensamiento —"mi mente acaba de producir el pensamiento de que soy un fracasado"— inmediatamente aparece la perspectiva. El pensamiento es un evento mental; tú eres quien lo observa.

El SILENCIO INTERIOR no es el silencio externo. Puedes estar en un ambiente ruidoso y habitar el silencio interior. Y puedes estar en completo silencio externo y tener un ruido mental ensordecedor. El silencio interior es la pausa entre estímulo y respuesta, el espacio donde la presencia vive.

Tolle propone prácticas concretas para ampliar ese espacio: hacer pausas aleatorias durante el día para observar tu estado interno, practicar escuchar sin agregar comentario mental, observar los pensamientos compulsivos sin identificarse con ellos, y llevar atención al cuerpo (sensaciones físicas) como ancla al momento presente.

El espacio interior no es un estado de letargo o ausencia — es un estado de alerta sin contenido, presencia sin agenda. Los atletas lo llaman "la zona", los contemplativos "contemplación", los artistas "inspiración". Es el mismo estado con diferentes nombres, y es el fundamento de toda actividad excelente.''',
      ),
      CapituloResumen(
        titulo: 'Un Mundo Nuevo',
        emoji: '🌟',
        contenido: '''El título del libro no es metafórico —Tolle sostiene literalmente que un mundo nuevo se construye persona a persona, cada vez que alguien se libera del dominio del ego y habita la presencia. No como utopía política sino como transformación que comienza en la conciencia individual.

Los problemas más grandes del mundo —la guerra, la destrucción ambiental, la pobreza extrema— tienen en su raíz el mismo mecanismo: el ego colectivo (nación, religión, ideología, etnia) que necesita afirmarse, compararse y defenderse a expensas de otros. Los seres humanos individualmente no son "malos" — están actuando desde el mismo programa ego-identificado que produce sufrimiento también en sus vidas privadas.

La transformación colectiva no puede comenzar desde afuera —desde leyes, sistemas o líderes que "arreglen" el mundo. Debe comenzar desde adentro, desde el cambio en la conciencia de individuos. No porque los sistemas no importen —importan enormemente— sino porque los sistemas son creados y mantenidos por conciencias. Una conciencia diferente crea sistemas diferentes.

Tolle ve señales esperanzadoras: el crecimiento de la meditación y el mindfulness en todo el mundo, el auge de conversaciones sobre propósito y significado, la creciente insatisfacción con el materialismo puro como camino a la felicidad. Estas son señales de que algo está cambiando en la conciencia humana colectiva.

El libro termina con una invitación: no esperes que el mundo cambie para sentir paz. La paz no es el resultado de vivir en el mundo que deseas — es el fundamento desde el cual construyes ese mundo. Cuando suficientes personas habiten ese fundamento, el mundo cambiará. Comienza ahora, aquí, en este momento, con esta respiración. El mundo nuevo empieza en ti.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cómo define Tolle el "ego" en Un Mundo Nuevo, Ahora?',
        opciones: [
          'La parte más fuerte e inteligente de la personalidad humana',
          'La voz interna que se cree tu identidad — la historia de pensamientos, memorias y roles que confundes con quién eres',
          'El instinto de supervivencia que todos los seres vivos comparten',
          'La capacidad de lograr metas y proyectar confianza',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El ego es la narrativa que la mente construye sobre ti mismo. No es quien eres — es quien crees ser. Reconocer la diferencia es el comienzo del despertar.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué es el "cuerpo del dolor" según Tolle?',
        opciones: [
          'El cuerpo físico cuando experimenta enfermedad o lesión',
          'La acumulación de dolor emocional no procesado que vive en el campo energético del cuerpo',
          'Las tensiones musculares causadas por el estrés crónico',
          'Los recuerdos almacenados en la memoria a largo plazo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El cuerpo del dolor es el dolor emocional acumulado que puede apoderarse de tus respuestas cuando algo lo activa, llevándote a reaccionar de formas que después no reconoces.',
      ),
      PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre ACEPTACIÓN y resignación según Tolle?',
        opciones: [
          'Son conceptos idénticos que Tolle usa de forma intercambiable',
          'La resignación es activa; la aceptación es pasiva',
          'Aceptar no significa no actuar para cambiar algo — significa no añadir resistencia mental a lo que ya es',
          'La resignación viene del ego; la aceptación viene del miedo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Aceptar la situación presente paradójicamente te libera para actuar efectivamente. La resistencia mental al "lo que es" crea sufrimiento sin cambiar nada.',
      ),
      PreguntaLibro(
        enunciado: '¿Qué distingue el propósito INTERNO del EXTERNO según Tolle?',
        opciones: [
          'El propósito interno es más importante que cualquier vocación o misión externa',
          'El externo es tu misión o vocación específica; el interno es despertar — transformar tu conciencia del dominio del ego a la presencia',
          'El propósito externo lo define la sociedad; el interno lo define la familia',
          'Solo el propósito externo produce resultados medibles',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Perfecto! El propósito interno es despertar y puede cumplirse en cualquier actividad. El externo (tu vocación) es importante pero secundario al trabajo de la conciencia.',
      ),
      PreguntaLibro(
        enunciado: '¿Por qué Tolle dice que la transformación colectiva debe comenzar desde adentro?',
        opciones: [
          'Porque los sistemas políticos y económicos son imposibles de cambiar',
          'Porque la meditación es más efectiva que el activismo social',
          'Porque los sistemas son creados por conciencias — una conciencia diferente crea sistemas diferentes',
          'Porque los líderes políticos siempre bloquean el cambio externo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! No porque los sistemas no importen — sino porque son creados y mantenidos por conciencias. Cambiar la conciencia es el cambio más fundamental que existe.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia principal entre "Un Mundo Nuevo" y "El Poder del Ahora" de Tolle?',
        opciones: [
          'Un Mundo Nuevo tiene un enfoque más colectivo y social, mientras El Poder del Ahora es más individual',
          'Un Mundo Nuevo está orientado a la meditación; El Poder del Ahora a la filosofía práctica',
          'Son esencialmente iguales con diferente título para distintos mercados',
          'Un Mundo Nuevo es para principiantes; El Poder del Ahora para lectores avanzados',
        ],
        respuestaCorrecta: 0,
        explicacion: '¡Correcto! El Poder del Ahora es sobre el despertar individual. Un Mundo Nuevo amplía la visión: el despertar colectivo de la humanidad para crear una civilización diferente. La conciencia personal como palanca del cambio global.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "ego" según la conceptualización de Tolle en Un Mundo Nuevo?',
        opciones: [
          'El instinto de supervivencia biológico que nos mantiene seguros',
          'La autoestima excesiva que lleva al narcisismo y la arrogancia',
          'La identificación con pensamientos, historias y formas mentales que creemos que somos',
          'La parte racional de la mente que toma decisiones conscientes',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Para Tolle, el ego no es el "yo real" — es la colección de historias, roles e identificaciones mentales que tomamos por nosotros mismos. El sufrimiento surge de identificarnos con esa estructura ilusoria.',
      ),
      const PreguntaLibro(
        enunciado: 'Según Canfield, ¿qué significa la fórmula E + R = O (Evento + Respuesta = Resultado)?',
        opciones: [
          'Los eventos externos determinan tus resultados independientemente de tu respuesta',
          'Los resultados son la suma inevitable de los eventos que enfrentas en la vida',
          'No controlas los eventos, pero sí tu respuesta — y esa respuesta determina el resultado',
          'El esfuerzo más la resistencia genera los outcomes esperados',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Este es el principio central de Canfield: el mismo evento (E) puede producir resultados completamente diferentes según la respuesta (R) que eliges. Cambiar R es el único poder real que tienes.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Canfield enfatiza tanto la claridad de visión como prerequisito del éxito?',
        opciones: [
          'Porque el universo solo ayuda a quienes saben exactamente lo que quieren',
          'Porque la claridad impresiona a mentores y socios potenciales',
          'Porque sin claridad, el Sistema de Activación Reticular no puede filtrar oportunidades relevantes',
          'Porque las metas vagas generan ansiedad y parálisis por análisis',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Excelente! El Sistema de Activación Reticular (SAR) del cerebro filtra la realidad según lo que declaras importante. Una visión clara "programa" el SAR para notar oportunidades, personas y recursos que siempre estuvieron ahí pero eran invisibles.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña Tolle sobre el "cuerpo del dolor" y cómo manejarlo?',
        opciones: [
          'Que debe combatirse activamente con técnicas de supresión emocional',
          'Que desaparece naturalmente con el tiempo si se ignora completamente',
          'Que reconocerlo con presencia consciente cuando se activa es la clave — la luz de la conciencia lo disuelve',
          'Que requiere terapia profesional para procesarse adecuadamente',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El cuerpo del dolor —acumulación de dolor emocional no procesado— se activa ante eventos que evocan el pasado. Tolle enseña que la solución no es luchar contra él (eso lo fortalece) sino reconocerlo con presencia: "Observo que mi cuerpo del dolor está activo ahora." Esa conciencia crea la distancia que lo disuelve.',
      ),
    ],
  ),

  Libro(
    id: 'dp02',
    titulo: 'Inteligencia Emocional',
    autor: 'Daniel Goleman',
    anio: '1995',
    emoji: '❤️',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Goleman demuestra que el coeficiente emocional predice el éxito mejor que el intelectual y que la inteligencia emocional se puede desarrollar.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'Por Qué el CI No lo es Todo',
        emoji: '🧠',
        contenido: '''Daniel Goleman publicó este libro en 1995 y cambió radicalmente la forma en que pensamos sobre la inteligencia y el éxito. Su premisa es simple pero revolucionaria: el coeficiente intelectual predice entre el 4 y el 10% del éxito en la vida. El 90% restante depende de algo más.

Ese "algo más" es la inteligencia emocional (IE): la capacidad de reconocer, entender y gestionar las propias emociones y las de los demás. Goleman identificó cinco dominios de la IE: autoconciencia, autorregulación, motivación, empatía y habilidades sociales.

Los estudios de seguimiento a largo plazo son contundentes. Los niños del experimento del "malvavisco" de Stanford (quienes podían retrasar la gratificación a los cuatro años) tenían en la adultez mejores calificaciones, mejores trabajos y relaciones más estables que los que no podían. No porque fueran más inteligentes — porque tenían mayor autocontrol emocional.

Goleman muestra que las regiones cerebrales que regulan las emociones (la amígdala y el sistema límbico) evolucionaron antes que la corteza prefrontal racional. En situaciones de estrés alto, la amígdala puede "secuestrar" la corteza prefrontal, llevando a reacciones emocionales que anulan el pensamiento racional. Comprender este mecanismo es el primer paso para gestionarlo.

La buena noticia: a diferencia del CI, que es relativamente estable, la IE es significativamente desarrollable con práctica consciente.
''',
      ),
      CapituloResumen(
        titulo: 'Autoconciencia: La Base de Todo',
        emoji: '🔍',
        contenido: '''La autoconciencia es el primero y más fundamental de los cinco dominios de la inteligencia emocional. Es la capacidad de reconocer tus propias emociones en tiempo real — saber que estás enojado, ansioso, triste o eufórico mientras lo experimentas, no solo después.

Goleman distingue tres niveles de autoconciencia. El nivel básico es reconocer que tienes una emoción. El nivel intermedio es identificar de qué emoción se trata con precisión (no solo "me siento mal" sino "me siento frustrado porque mi contribución no fue reconocida"). El nivel avanzado es entender el patrón: qué situaciones activan qué emociones, y por qué.

La autoconciencia es la base de todo lo demás en la IE porque no puedes gestionar lo que no puedes ver. Las personas con alta autoconciencia toman mejores decisiones porque saben cuándo sus emociones están distorsionando su juicio. Dicen cosas como "Estoy enojado ahora, déjame pensar esto cuando esté más tranquilo" en lugar de tomar decisiones reactivas.

Las personas con baja autoconciencia son las que más frecuentemente dicen "yo no tengo problemas emocionales" — precisamente porque no tienen acceso a sus propios estados internos. Esta ceguera emocional no las protege de sus emociones; solo las hace más vulnerables a ser controladas por ellas sin saberlo.

El desarrollo de la autoconciencia se logra principalmente a través de la práctica contemplativa: meditación, diario de emociones, retroalimentación honesta de otros de confianza.
''',
      ),
      CapituloResumen(
        titulo: 'Autorregulación y el Manejo del Estrés',
        emoji: '⚖️',
        contenido: '''La autorregulación es la capacidad de gestionar las propias emociones: no suprimirlas sino elegir conscientemente cómo y cuándo expresarlas. Goleman muestra que las personas con alta autorregulación son más confiables, crean mejores ambientes de trabajo y toman decisiones más consistentes.

La clave de la autorregulación no es la supresión emocional sino la regulación. La supresión (fingir que no sientes lo que sientes) es contraproducente: las emociones suprimidas aumentan el estrés fisiológico y eventualmente estallan con mayor intensidad. La regulación reconoce la emoción y elige cuándo y cómo expresarla.

El manejo del estrés es el aspecto más práctico de la autorregulación. Goleman describe el "secuestro amigdalar": cuando la amígdala percibe amenaza, dispara una respuesta de estrés que puede anular la corteza prefrontal en segundos. El resultado es que la persona dice o hace cosas que "no reconoce como propias" después.

Las técnicas de manejo del estrés (respiración diafragmática, reencuadre cognitivo, pausa antes de responder) actúan interrumpiendo el secuestro amigdalar antes de que se complete. El simple hecho de nombrar la emoción ("estoy enojado", "siento ansiedad") activa la corteza prefrontal y reduce la intensidad de la respuesta amigdalar.

La autorregulación también incluye la gestión de los impulsos: la capacidad de resistir tentaciones en el corto plazo en favor de objetivos de largo plazo. Esta es la misma capacidad medida en el experimento del malvavisco que predice el éxito futuro.
''',
      ),
      CapituloResumen(
        titulo: 'Empatía y Habilidades Sociales',
        emoji: '🤝',
        contenido: '''La empatía —la capacidad de percibir y entender las emociones de otros— es el puente entre la inteligencia emocional personal y la interpersonal. Goleman identifica tres tipos de empatía. La empatía cognitiva es entender el punto de vista del otro intelectualmente. La empatía emocional es sentir lo que el otro siente. La preocupación empática es querer activamente ayudar al otro.

Las personas con alta empatía cognitiva son excelentes negociadoras y líderes porque entienden cómo sus palabras y acciones impactan a otros antes de actuar. Las personas con empatía emocional alta son terapistas, cuidadores y confidentes naturales. La combinación de ambas con la preocupación empática produce las personas más efectivas en roles de servicio y liderazgo.

La empatía se aprende principalmente por modelado: quienes crecieron con cuidadores emocionalmente presentes y empáticos desarrollaron circuitos de empatía más robustos. Pero la neurociencia muestra que los circuitos de empatía son plásticos y se pueden fortalecer en la adultez.

Las habilidades sociales son la aplicación externa de todos los demás dominios de la IE. Incluyen la gestión de conflictos, la influencia, el trabajo en equipo, la comunicación efectiva y la construcción de redes. Las personas con altas habilidades sociales son las que hacen que las cosas pasen a través de otros, no a pesar de ellos.

Goleman concluye que las habilidades sociales son la forma más visible de la IE en el mundo laboral, pero que sin las otras cuatro (autoconciencia, autorregulación, motivación, empatía) las habilidades sociales se convierten en manipulación.
''',
      ),
      CapituloResumen(
        titulo: 'La IE en el Liderazgo y la Crianza',
        emoji: '👨‍👧',
        contenido: '''Goleman cierra examinando las implicaciones de la inteligencia emocional en dos de los contextos más importantes de la vida humana: el liderazgo y la crianza de hijos.

En el liderazgo, los estudios de Goleman y sus colaboradores mostraron que el clima emocional de un equipo explica entre el 20 y el 30% de la varianza en el rendimiento. El clima emocional lo crea principalmente el líder, a través de contagio emocional: los estados emocionales de quien está en posición de poder se "contagian" al resto del grupo con más rapidez e intensidad que en cualquier otra dirección.

Un líder con alta IE crea un ambiente donde las personas se sienten seguras para contribuir sus mejores ideas, admitir errores y pedir ayuda. Un líder con baja IE —aunque técnicamente brillante— crea un ambiente de miedo que suprime la creatividad, la honestidad y la colaboración.

En la crianza, Goleman muestra que los padres emocionalmente inteligentes producen hijos con mejor regulación emocional, mejor desempeño académico y relaciones más sanas. El mecanismo es simple: los niños aprenden a manejar las emociones observando cómo sus cuidadores manejan las suyas. No por instrucción sino por modelado.

La conclusión de Goleman es esperanzadora: la IE no está fijada al nacer. Cada interacción donde gestionas conscientemente tus emociones en lugar de reaccionar automáticamente es un entrenamiento de IE. El cerebro es plástico; los circuitos emocionales se pueden fortalecer a cualquier edad.
''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuáles son los cinco dominios de la inteligencia emocional según Goleman?',
        opciones: [
          'Inteligencia, motivación, comunicación, trabajo en equipo y liderazgo',
          'Autoconciencia, autorregulación, motivación, empatía y habilidades sociales',
          'Pensamiento positivo, resiliencia, empatía, comunicación y autocontrol',
          'Cognición, emoción, comportamiento, socialización y adaptación',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los cinco dominios de la IE de Goleman son: autoconciencia (reconocer tus emociones), autorregulación (gestionarlas), motivación (usarlas para los objetivos), empatía (reconocer las de otros) y habilidades sociales (gestionar las relaciones). Cada uno se apoya en los anteriores.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué porcentaje del éxito en la vida predice el CI según Goleman?',
        opciones: [
          'El 80-90% — es el factor más determinante del éxito',
          'El 50% — igual que los factores emocionales',
          'Solo entre el 4 y el 10% — el resto depende de la inteligencia emocional',
          'El 30% — significativo pero no determinante',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Goleman cita estudios que muestran que el CI predice solo entre el 4-10% del éxito en la vida. El 90% restante depende de factores de inteligencia emocional. Esto explica por qué personas de CI alto fracasan y personas de CI moderado triunfan.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "secuestro amigdalar" que describe Goleman?',
        opciones: [
          'Un trastorno neurológico que impide regular las emociones',
          'Cuando la amígdala en situaciones de estrés "secuestra" la corteza prefrontal, produciendo reacciones emocionales que anulan el pensamiento racional',
          'La tendencia del ego a apropiarse de las emociones positivas',
          'El proceso por el cual las memorias emocionales dominan a las racionales en la vejez',
        ],
        respuestaCorrecta: 1,
        explicacion: 'En situaciones de estrés alto, la amígdala puede disparar una respuesta que anula la corteza prefrontal en segundos. El resultado es que la persona dice o hace cosas que "no reconoce como propias". Nombrar la emoción activa la corteza prefrontal y reduce la intensidad del secuestro.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué mostró el experimento del malvavisco de Stanford sobre la inteligencia emocional?',
        opciones: [
          'Que la capacidad de retrasar la gratificación a los 4 años predice el éxito en la adultez mejor que el CI',
          'Que los niños que esperaron comieron más malvaviscos en total durante su vida',
          'Que la inteligencia emocional se forma completamente antes de los 5 años y no cambia',
          'Que el placer diferido es siempre superior al placer inmediato en términos de bienestar',
        ],
        respuestaCorrecta: 0,
        explicacion: 'Los niños de 4 años que podían esperar 15 minutos para obtener dos malvaviscos en lugar de comer uno inmediatamente tenían en la adultez mejores calificaciones, mejores trabajos y relaciones más estables. El autocontrol emocional temprano predice el éxito futuro mejor que el CI.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo afecta el clima emocional del líder al rendimiento del equipo según Goleman?',
        opciones: [
          'Solo afecta la satisfacción de los empleados, no su rendimiento real',
          'Tiene un efecto marginal — los procesos y sistemas son más importantes',
          'El clima emocional del equipo explica entre el 20-30% de la varianza en rendimiento, y lo crea principalmente el líder',
          'El efecto es real pero solo en equipos creativos, no en equipos técnicos o administrativos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El clima emocional del equipo explica 20-30% de la varianza en rendimiento. El líder lo crea principalmente a través del contagio emocional: sus estados emocionales se propagan al grupo más rápida e intensamente que en cualquier otra dirección.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia Goleman entre autorregulación y supresión emocional?',
        opciones: [
          'La autorregulación es suprimir completamente; la supresión es canalizar constructivamente',
          'Son sinónimos — ambos consisten en controlar las emociones para que no interfieran',
          'La autorregulación gestiona cuándo y cómo expresar la emoción; la supresión la niega, aumentando el estrés fisiológico',
          'La supresión es aplicable a emociones negativas; la autorregulación a las positivas',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La autorregulación no es suprimir — es elegir. Reconoce la emoción y elige cuándo y cómo expresarla. La supresión crónica es contraproducente: aumenta el estrés fisiológico y hace que las emociones eventualmente estallen con mayor intensidad.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los tres tipos de empatía que distingue Goleman?',
        opciones: [
          'Empatía superficial, empatía media y empatía profunda',
          'Empatía cognitiva (entender), empatía emocional (sentir) y preocupación empática (querer ayudar)',
          'Empatía activa, empatía pasiva y empatía reflexiva',
          'Empatía hacia familia, empatía hacia amigos y empatía hacia extraños',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Goleman distingue: empatía cognitiva (entender el punto de vista del otro intelectualmente — útil en negociación), empatía emocional (sentir lo que el otro siente — útil en cuidado) y preocupación empática (querer activamente ayudar — base del liderazgo de servicio).',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Goleman dice que las habilidades sociales sin los otros cuatro dominios de IE se convierten en manipulación?',
        opciones: [
          'Porque las habilidades sociales solo son útiles cuando se usan para el bien colectivo',
          'Porque sin autoconciencia, autorregulación, motivación y empatía, las habilidades sociales se usan para objetivos personales sin consideración genuina por otros',
          'Porque la manipulación es simplemente el uso incorrecto de habilidades sociales correctas',
          'Porque las habilidades sociales avanzadas inevitablemente llevan a la manipulación sin importar la intención',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las habilidades sociales (influencia, persuasión, gestión de conflictos) son poderosas. Sin autoconciencia que detecte los propios sesgos, autorregulación que controle los impulsos, motivación que oriente hacia metas genuinas y empatía que considere el impacto en otros, se usan para la propia agenda a expensas de los demás.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo transmiten los padres la inteligencia emocional a sus hijos según Goleman?',
        opciones: [
          'A través de enseñanza explícita y lecciones estructuradas sobre emociones',
          'Principalmente por modelado: los hijos aprenden observando cómo sus cuidadores gestionan sus propias emociones',
          'Mediante reglas claras sobre qué emociones son aceptables y cuáles no',
          'A través del elogio cuando muestran comportamientos emocionalmente inteligentes',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los niños aprenden a manejar emociones observando cómo sus cuidadores manejan las suyas — no por instrucción sino por modelado. Los padres emocionalmente inteligentes que gestionan sus propias emociones conscientemente producen hijos con mejor regulación emocional, sin necesitar un "programa de IE".',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué implica la autoconciencia emocional de nivel avanzado según Goleman?',
        opciones: [
          'Poder predecir con exactitud las emociones propias ante situaciones futuras',
          'Entender los patrones: qué situaciones activan qué emociones, y por qué, no solo reconocer la emoción presente',
          'Compartir abiertamente las emociones propias con el equipo para crear confianza',
          'Tener vocabulario emocional amplio para describir los propios estados con precisión',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El nivel avanzado de autoconciencia va más allá de identificar la emoción actual ("estoy enojado") hasta entender el patrón: qué situaciones disparan ese enojo, qué necesidad no atendida está debajo, y qué consecuencias predecibles tiene en el comportamiento. Este nivel permite intervenir antes de que el patrón se active.',
      ),
    ],
  ),

  Libro(
    id: 'dp03',
    titulo: 'Cómo Ganar Amigos e Influir sobre las Personas',
    autor: 'Dale Carnegie',
    anio: '1936',
    emoji: '🤝',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'El clásico de las habilidades interpersonales que enseña principios atemporales para influir genuinamente en las personas y construir relaciones duraderas.',
    gemasRecompensa: 58,
    capitulos: const [
      CapituloResumen(
        titulo: 'Principios Fundamentales para Tratar con Personas',
        emoji: '🌟',
        contenido: '''Dale Carnegie escribió este libro en 1936 y vendió más de 30 millones de copias, convirtiéndolo en uno de los más vendidos de la historia. Su premisa central es que el éxito en cualquier área de la vida depende en un 85% de habilidades interpersonales y solo en un 15% de conocimiento técnico.

El primer principio, y el más fundamental, es no criticar, condenar ni quejarse. Carnegie argumenta que la crítica directa rara vez produce el cambio que busca y casi siempre produce resentimiento. La razón es neurológica y psicológica: el ego humano se defiende automáticamente cuando se siente atacado, cerrando la mente al mensaje aunque el mensaje sea correcto.

El segundo principio es elogiar honesta y sinceramente. Carnegie distingue entre el halago vacío (que todos detectan y rechaza) y el reconocimiento genuino. El cerebro humano está programado para responder al reconocimiento genuino con apertura y disposición a contribuir. Un líder que reconoce honestamente lo que su equipo hace bien tiene más influencia que uno que solo señala errores.

El tercer principio es despertar en el otro un deseo vehemente. No manipulación — comprensión. Antes de intentar persuadir a alguien, Carnegie propone preguntarse: "¿Qué quiere esta persona? ¿Cómo lo que propongo sirve a sus intereses?" Cuando puedes presentar tu idea en términos de los beneficios del otro, la persuasión fluye naturalmente.

Carnegie observó que el deseo más profundo del ser humano es sentirse importante y valioso. Las personas que más influencia tienen no son las más inteligentes ni las más poderosas — son las que más genuinamente hacen sentir a otros que importan.
''',
      ),
      CapituloResumen(
        titulo: 'Cómo Hacer que las Personas Te Aprecien',
        emoji: '💛',
        contenido: '''Carnegie dedica una sección completa a los principios que hacen que las personas genuinamente te aprecien, más allá de la simpatía superficial. La diferencia entre agradar y ser genuinamente apreciado es la autenticidad.

El primer principio es interesarse genuinamente en los demás. Carnegie distingue entre el interés fingido (que la gente detecta inmediatamente) y el interés genuino. Las personas que tienen más amigos y relaciones más profundas son invariablemente las que se interesan genuinamente en la vida, los sueños y los problemas de otros — no como técnica sino como actitud fundamental.

Sonreír parece trivial pero Carnegie lo respalda con evidencia: la sonrisa genuina es uno de los señales de bienestar y apertura más poderosos que el cerebro humano detecta. En interacciones breves, una sonrisa genuina puede determinar si una persona te percibe como aliada o como amenaza.

El nombre de una persona es, para ella, el sonido más importante de cualquier idioma. Recordar y usar el nombre de alguien en la conversación le envía una señal profunda: "Eres lo suficientemente importante para mí como para recordar quién eres." Carnegie reporta docenas de ejemplos donde este simple principio transformó relaciones de negocios y personales.

La escucha activa es el principio más contraintuitivo: para ser interesante, sé interesado. Las personas que hablan sobre sí mismas durante toda una conversación se perciben como egocéntricas aunque no sea intencional. Las personas que hacen preguntas interesantes y escuchan con genuina curiosidad se perciben como fascinantes, aunque hayan hablado poco.
''',
      ),
      CapituloResumen(
        titulo: 'Cómo Influir sin Ofender',
        emoji: '🕊️',
        contenido: '''La sección más práctica y contraintuitiva del libro es la que trata sobre cómo cambiar el comportamiento de otros sin generar resentimiento. Carnegie argumenta que la confrontación directa casi nunca produce el resultado que busca.

El primer principio es comenzar de manera amistosa. Cuando se necesita corregir o cambiar algo, la tentación es ir directamente al problema. Pero el cerebro en modo defensivo no aprende — solo se protege. Comenzar con algo genuinamente positivo sobre la persona o su trabajo abre la mente a recibir el feedback que sigue.

La técnica del "sí, sí" propone comenzar la conversación en territorio donde el otro puede decir sí. Cuando alguien ha dicho sí dos o tres veces, su mente está en un estado más abierto y cooperativo que si hubiera comenzado defendiendo una posición contraria. Esta técnica no es manipulación — es comprensión de cómo funciona la mente humana.

Carnegie propone hacer que los errores parezcan fáciles de corregir. La persona que llega con energía que dice "cometiste un error grave" crea vergüenza y defensividad. La persona que dice "aquí hay una oportunidad de mejorar esto" crea apertura y motivación. El contenido puede ser idéntico; el efecto es radicalmente diferente.

Dejar que la otra persona sienta que la idea es suya es otro principio poderoso. Las ideas que la gente siente como propias las defiende con más energía que las que le fueron impuestas, aunque el contenido sea el mismo. El líder que hace preguntas que llevan al equipo a descubrir la solución produce más compromiso que el que dictamina la respuesta.
''',
      ),
      CapituloResumen(
        titulo: 'Liderazgo: Cómo Cambiar sin Provocar Resentimiento',
        emoji: '👑',
        contenido: '''La sección final de Carnegie sobre liderazgo sintetiza todos los principios anteriores en una pregunta: ¿Cómo puede un líder cambiar el comportamiento de otros de manera que produzca mejora duradera en lugar de resentimiento temporal?

El primer principio es que si debes señalar un error, hazlo de manera indirecta cuando sea posible. En lugar de "estás equivocado en esto", preguntar "¿Consideraste este aspecto?" permite al otro llegar a la corrección por sí mismo, preservando su dignidad y produciendo aprendizaje real.

Hablar de los propios errores antes de criticar los del otro es un principio poderoso. "Cometí este error muchas veces antes de aprender..." hace al otro más receptivo a la corrección porque le muestra que quien corrige no se cree perfecto y que el error es parte del proceso normal de aprendizaje.

Carnegie propone hacer preguntas en lugar de dar órdenes directas. "¿Crees que sería mejor hacerlo así?" en lugar de "hazlo así" produce el mismo resultado pero con un nivel de autonomía que genera compromiso en lugar de cumplimiento mecánico.

El principio final es hacer que la persona se sienta feliz de hacer lo que sugieres. No por manipulación sino porque genuinamente alineas la sugerencia con los intereses del otro. Cuando las personas sienten que algo es beneficioso para ellas — no solo para el líder — lo hacen con energía propia, no con la energía prestada de la obediencia.
''',
      ),
      CapituloResumen(
        titulo: 'El Poder de la Genuinidad',
        emoji: '💎',
        contenido: '''A través de todo el libro, Carnegie regresa a un tema central que distingue su obra de los manuales de manipulación: la genuinidad. Los principios solo funcionan cuando son auténticos.

El interés falso se detecta. El elogio vacío produce más desconfianza que su ausencia. La sonrisa calculada se percibe como máscara. Carnegie enseña que la genuinidad no solo es éticamente correcta — es pragmáticamente necesaria. Las personas que intentan aplicar estos principios como técnicas sin la actitud genuina detrás fracasan invariablemente.

La pregunta que Carnegie propone como fundamento de todas las interacciones es: "¿Qué quiere esta persona? ¿Qué está sintiendo? ¿Cómo puedo serle genuinamente útil?" Esta pregunta, formulada antes de cada conversación importante, reorienta la atención del yo al otro, que es precisamente la actitud que hace que los principios funcionen.

Carnegie también aborda el fracaso: las relaciones, como cualquier habilidad, requieren práctica y habrá errores. La respuesta correcta al fracaso no es la autocrítica destructiva sino la reflexión honesta: "¿Qué principio no apliqué? ¿Qué haré diferente la próxima vez?"

El legado del libro es su confirmación de algo que todos intuimos pero pocas veces practicamos: el éxito más profundo en la vida no viene de ser el más inteligente, el más trabajador o el más ambicioso — viene de ser la persona que más genuinamente hace sentir a otros que importan, que son vistos y que son valiosos.
''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es el primer principio fundamental de Carnegie para tratar con personas?',
        opciones: [
          'Siempre dar la razón al otro para evitar conflictos innecesarios',
          'No criticar, condenar ni quejarse — la crítica directa genera resentimiento y cierra la mente',
          'Hablar siempre con claridad y directamente sobre los problemas observados',
          'Demostrar superioridad técnica para ganar el respeto del interlocutor',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El primer principio de Carnegie es no criticar, condenar ni quejarse. La crítica directa rara vez produce el cambio que busca — casi siempre produce resentimiento. El ego se defiende automáticamente cuando se siente atacado, cerrando la mente al mensaje aunque el mensaje sea correcto.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue el elogio genuino del halago vacío según Carnegie?',
        opciones: [
          'El elogio genuino siempre es más largo y detallado que el halago vacío',
          'El halago vacío es detectado y rechazado; el reconocimiento genuino es honesto y específico sobre lo que realmente valoras',
          'El elogio genuino debe ser público; el halago solo funciona en privado',
          'No hay diferencia práctica — ambos producen el mismo efecto de apertura en el receptor',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las personas detectan inmediatamente el halago vacío ("¡Qué maravilloso!") y lo rechaza o lo toman con desconfianza. El reconocimiento genuino es específico, honesto y basado en algo que realmente valoras del otro. Solo este tipo activa la apertura y la disposición a contribuir.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Carnegie dice que para ser interesante, debes ser interesado?',
        opciones: [
          'Porque hablar sobre tus propios logros hace que los demás quieran conocerte más',
          'Porque las personas que hacen preguntas y escuchan genuinamente se perciben como fascinantes aunque hayan hablado poco',
          'Porque el interés mutuo es la base de cualquier negociación exitosa',
          'Porque fingir interés eventualmente produce interés real por el otro',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las personas que hablan sobre sí mismas toda la conversación se perciben como egocéntricas. Las que hacen preguntas interesantes y escuchan con genuina curiosidad se perciben como fascinantes — porque el interlocutor sale sintiendo que fue visto y escuchado, que es la experiencia que más valora.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Carnegie cuando hay que corregir un error de alguien?',
        opciones: [
          'Hacerlo inmediatamente y en público para que todos aprendan del error',
          'Ignorarlo si no es grave para mantener la armonía del equipo',
          'Hablar de los propios errores primero, luego señalar el del otro de manera indirecta cuando sea posible',
          'Documentar el error por escrito antes de hablar con la persona para tener respaldo',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Carnegie propone: habla de tus propios errores primero ("yo también cometía esto"), luego señala el del otro de forma indirecta cuando sea posible ("¿consideraste este aspecto?"). Esta secuencia hace al otro más receptivo porque muestra que el error es parte del aprendizaje normal y preserva su dignidad.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el deseo más profundo del ser humano según Carnegie?',
        opciones: [
          'La seguridad económica y la comodidad material',
          'El reconocimiento sexual y el amor romántico',
          'Sentirse importante y valioso — ser genuinamente reconocido como persona que importa',
          'La libertad y la autonomía sin restricciones sociales',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Carnegie observó a lo largo de su carrera que el deseo más universal y profundo del ser humano es sentirse importante y valioso — no de manera arrogante sino genuina. Las personas que más influencia tienen son las que más genuinamente hacen sentir a otros que importan, que son vistos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué hace que las personas defiendan con más energía una idea?',
        opciones: [
          'Haber recibido un argumento lógico y convincente sobre sus méritos',
          'Sentir que la idea es suya — las ideas percibidas como propias se defienden con más energía que las impuestas',
          'Tener una recompensa económica vinculada al éxito de la idea',
          'Haber sido elegidas para ejecutarla entre varias personas competentes',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Carnegie muestra que las personas defienden con mucha más energía las ideas que sienten como propias, aunque el contenido sea el mismo que si alguien se las dictara. El líder que hace preguntas que llevan al equipo a descubrir la solución produce más compromiso que el que dictamina la respuesta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué la técnica del "sí, sí" funciona según Carnegie?',
        opciones: [
          'Porque la repetición del sí crea un estado hipnótico que reduce la resistencia',
          'Porque comenzar en territorio donde el otro dice sí pone su mente en estado más abierto y cooperativo',
          'Porque el sí es la palabra más corta y fácil de decir en cualquier negociación',
          'Porque compromete al interlocutor contractualmente con las afirmaciones previas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Cuando alguien ha dicho sí dos o tres veces, su mente está en un estado de apertura y cooperación que facilita el sí posterior en territorio más desafiante. No es hipnosis — es comprensión de que la mente en estado defensivo (diciendo no) no está abierta a nuevas ideas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuánto del éxito en la vida depende de habilidades interpersonales según Carnegie?',
        opciones: [
          'El 15% — principalmente el conocimiento técnico determina el éxito',
          'El 50% — habilidades técnicas e interpersonales tienen igual peso',
          'El 85% — las habilidades interpersonales determinan el éxito mucho más que el conocimiento técnico',
          'El 70% en roles de liderazgo, pero solo el 30% en roles técnicos',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Carnegie citaba estudios de la época que mostraban que el 85% del éxito financiero dependía de habilidades interpersonales y solo el 15% del conocimiento técnico. La investigación moderna respalda esta proporción — las habilidades blandas predicen el éxito laboral con más fuerza que las habilidades técnicas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo recomienda Carnegie dar órdenes para producir compromiso en lugar de mera obediencia?',
        opciones: [
          'Dar órdenes claras y directas con plazos específicos para cada tarea',
          'Hacer preguntas en lugar de dar órdenes directas: "¿Crees que sería mejor hacerlo así?"',
          'Presentar las órdenes como sugerencias de superiores fuera del equipo',
          'Acompañar cada orden con una explicación detallada de todos sus fundamentos',
        ],
        respuestaCorrecta: 1,
        explicacion: '"¿Crees que sería mejor hacerlo así?" en lugar de "hazlo así" produce el mismo resultado pero con un nivel de autonomía que genera compromiso en lugar de cumplimiento mecánico. Las personas que sienten que participaron en la decisión la ejecutan con más energía propia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Carnegie insiste en que sus principios requieren genuinidad para funcionar?',
        opciones: [
          'Por razones éticas únicamente — en términos prácticos el fingimiento funcionaría igual',
          'Porque el fingimiento es detectado: el interés falso, el elogio vacío y la sonrisa calculada se perciben y producen desconfianza en lugar de apertura',
          'Porque la genuinidad hace sentir mejor al que aplica los principios',
          'Porque en contextos culturales latinoamericanos la autenticidad es especialmente valorada',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Carnegie enseña que la genuinidad es pragmáticamente necesaria, no solo éticamente correcta. Las personas que intentan los principios como técnicas sin la actitud auténtica detrás fracasan porque el interés falso, el halago vacío y la sonrisa calculada se detectan y producen más desconfianza que su ausencia.',
      ),
    ],
  ),

  Libro(
    id: 'dp04',
    titulo: 'El Poder del Ahora',
    autor: 'Eckhart Tolle',
    anio: '1997',
    emoji: '⏱️',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'El momento presente es el único lugar donde la vida ocurre realmente. Tolle enseña cómo liberarse del pensamiento compulsivo para encontrar la paz y la plenitud del ahora.',
    gemasRecompensa: 62,
    capitulos: const [
      CapituloResumen(
        titulo: 'No Eres Tu Mente',
        emoji: '🧘',
        contenido: '''Eckhart Tolle comenzó a escribir El Poder del Ahora después de una experiencia de transformación profunda a los 29 años, cuando se encontró en el límite de la desesperación y de repente tuvo la intuición de que "no podía vivir consigo mismo" — y se preguntó: ¿quién es el que no puede vivir con "yo"? Esa pregunta abrió un estado de claridad que se convirtió en la base de este libro.

El primer principio radical de Tolle es que tú no eres tu mente. La voz en tu cabeza — el flujo continuo de pensamientos, juicios, memorias y proyecciones — es un instrumento que has confundido con tu identidad. Esta confusión es la fuente de todo el sufrimiento psicológico humano.

El pensamiento puede ser extraordinariamente útil: para resolver problemas, planificar, crear. El problema es el pensamiento compulsivo: la mente que no puede detenerse, que rumia el pasado, que anticipa ansiosamente el futuro, que juzga constantemente todo lo que encuentra. Este pensamiento no produce ningún valor — solo consume energía y genera sufrimiento.

Tolle introduce la distinción entre el observador y lo observado: hay en ti algo que puede observar tus pensamientos sin ser los pensamientos. Cuando eres consciente de un pensamiento, ya no estás completamente identificado con él — hay una separación. Esa separación es el principio de la conciencia que trasciende la mente.

La práctica fundamental es la observación sin juicio: simplemente notar que hay pensamientos, sin seguirlos ni luchar contra ellos. "Veo que hay un pensamiento de preocupación." Esta sola frase crea la distancia que transforma la relación con la mente.
''',
      ),
      CapituloResumen(
        titulo: 'El Pasado, el Futuro y la Presencia',
        emoji: '⏰',
        contenido: '''El argumento central de Tolle sobre el tiempo es aparentemente simple pero profundamente transformador: el pasado y el futuro solo existen en la mente. El único momento donde la vida realmente ocurre es el ahora.

El pasado es un conjunto de memorias — imágenes y historias que la mente almacena y puede reproducir. Pero el pasado no existe ahora, excepto como actividad mental presente. Del mismo modo, el futuro es una proyección mental — anticipaciones, esperanzas y miedos. El futuro nunca llega en el sentido de que cuando "llegue", será siempre un "ahora".

La mente pasa la mayor parte de su actividad en el pasado o el futuro, que son los únicos lugares donde el sufrimiento psicológico puede existir. El arrepentimiento vive en el pasado; la ansiedad vive en el futuro. El dolor físico vive en el presente; el sufrimiento psicológico vive en la mente que resiste el presente o que escapa hacia el pasado o el futuro.

Tolle no dice que el pasado o el futuro sean irrelevantes. Dice que deben ser visitados conscientemente cuando son útiles (recordar un hecho, planificar una acción) y luego soltados para volver al presente. El problema es la mente que vive permanentemente en otro tiempo, usando el presente solo como un portal de paso hacia el pasado que recuerda o el futuro que teme.

La presencia es la antítesis de este patrón: estar completamente aquí, en este momento, con lo que es. No como resignación — como una elección activa de participar plenamente en lo que la vida ofrece ahora.
''',
      ),
      CapituloResumen(
        titulo: 'La Conciencia del Cuerpo y el Portal del Ahora',
        emoji: '🌿',
        contenido: '''Tolle ofrece una técnica práctica para anclar la conciencia al momento presente: la atención al cuerpo. El cuerpo siempre existe en el presente. No puede estar en el pasado ni en el futuro — solo aquí y ahora. Dirigir la atención a las sensaciones corporales es una de las formas más directas de salir del pensamiento compulsivo.

La práctica comienza con una simple pregunta: "¿Hay vida en mis manos ahora mismo?" Al dirigir la atención a las manos, inmediatamente hay una sensación de energía o vitalidad que la mente normalmente ignora completamente absorbida en su actividad de pensar. Ese momento de atención a la sensación corporal es un momento de presencia.

La respiración consciente es otra práctica fundamental. No controlar la respiración sino simplemente observarla: la entrada del aire, la pausa, la salida. La respiración también existe solo en el presente, y observarla lleva la atención al ahora de manera inmediata y efectiva.

Tolle introduce el concepto de la "conciencia del ser interior": la sensación tranquila y despierta que subyace a todos los pensamientos y estados emocionales. Esta conciencia siempre está presente, pero la actividad mental constante la oscurece. En momentos de presencia plena — mirando un paisaje, escuchando música con atención total, en una conversación sin distracciones — esa conciencia emerge naturalmente.

La práctica de la presencia no requiere retiros de meditación ni horas de práctica formal. Puede practicarse en cualquier momento de la vida cotidiana: lavando los platos, caminando, en conversación. Cada momento de presencia genuina es un entrenamiento.
''',
      ),
      CapituloResumen(
        titulo: 'Las Relaciones y la Presencia',
        emoji: '💞',
        contenido: '''Tolle examina cómo la presencia transforma las relaciones interpersonales, que son el área donde la mente inconsciente causa mayor sufrimiento. La mayoría de los conflictos relacionales no ocurren entre personas — ocurren entre los ego-mente de esas personas.

La mente en piloto automático trae a cada interacción el bagaje del pasado: los resentimientos, las expectativas acumuladas, las proyecciones sobre lo que el otro "siempre" o "nunca" hace. En este estado, la persona no está realmente interactuando con quien tiene enfrente — está interactuando con la imagen mental que tiene de esa persona.

La presencia en las relaciones significa encontrarse con el otro como si fuera la primera vez, sin el filtro de la historia acumulada. Esta presencia crea un tipo de calidad de atención que el otro percibe inmediatamente como algo diferente y valioso: la sensación de ser realmente visto, no catalogado.

Las relaciones adictivas que describe Tolle son aquellas donde cada persona busca en la otra el complemento que siente que le falta a su propia existencia. Esta búsqueda no puede satisfacerse porque la falta percibida no es real — es la mente que no encuentra paz en sí misma. La persona que ha encontrado paz en la presencia puede entrar en relación desde la completud, no desde la necesidad.

Tolle no dice que las relaciones sean secundarias — dice que las relaciones más profundas y satisfactorias son entre personas que han encontrado paz en su propia presencia, porque desde ahí pueden dar sin contar, escuchar sin agenda y estar con el otro sin necesitar que sea diferente.
''',
      ),
      CapituloResumen(
        titulo: 'La Rendición y la Transformación',
        emoji: '🌅',
        contenido: '''El capítulo final de Tolle trata sobre la "rendición" — uno de los conceptos más malentendidos del libro. La rendición no es pasividad, resignación ni fatalismo. Es la aceptación de la realidad tal como es ahora, sin la resistencia mental que el ego añade.

La resistencia mental a lo que es toma muchas formas: la queja ("esto no debería ser así"), el juicio ("esto está mal"), la negación ("no puedo aceptar esto") y la añoranza ("antes era mejor"). Tolle muestra que esta resistencia no cambia la realidad — solo añade sufrimiento mental a lo que ya existe.

La rendición dice: "Esto es lo que es ahora. ¿Qué puedo hacer desde aquí?" Es activa, no pasiva. El piloto de avión que encuentra una tormenta no entra en pánico ni en queja — acepta que hay una tormenta y ajusta el vuelo. La rendición es ese ajuste: acción desde la aceptación de la realidad, no desde la resistencia a ella.

Tolle describe dos posibles respuestas ante cualquier situación difícil: cambiarla o aceptarla. Si puedes cambiarla, hazlo. Si no puedes, la única opción que elimina el sufrimiento innecesario es la aceptación. La tercera opción que la mayoría elige — no cambiarla y no aceptarla, sino quejarse — es la que produce el sufrimiento más prolongado.

La transformación que el libro propone es, en última instancia, simple pero extraordinariamente difícil: reconocer que la paz no está en el futuro ni en el pasado — está disponible en este momento, si dejas de resistir lo que es y de buscar en otro tiempo lo que solo puede encontrarse aquí.
''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la distinción fundamental que Tolle establece entre "tú" y "tu mente"?',
        opciones: [
          'La mente es el cerebro físico y tú eres la personalidad que emerge de él',
          'Tú eres la mente — son lo mismo y distinguirlos produce confusión',
          'Tú no eres tu mente — hay en ti algo que puede observar los pensamientos sin ser los pensamientos',
          'La mente es la parte racional y tú eres la parte emocional del ser humano',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Tolle propone que cuando eres consciente de un pensamiento, ya no estás completamente identificado con él — hay una separación entre el observador y lo observado. Tú eres esa conciencia que observa, no los pensamientos que observa. Esta distinción es el fundamento de toda la práctica del libro.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Tolle dice que el sufrimiento psicológico solo puede existir en el pasado o en el futuro?',
        opciones: [
          'Porque el presente siempre contiene experiencias positivas que el pasado y futuro oscurecen',
          'Porque el arrepentimiento vive en el pasado y la ansiedad en el futuro — en el presente puro solo puede haber lo que es',
          'Porque el cerebro solo procesa negativamente las experiencias no presentes',
          'Porque la memoria y la imaginación son las facultades que distorsionan la realidad',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El arrepentimiento vive en el pasado; la ansiedad vive en el futuro. El dolor físico puede existir en el presente, pero el sufrimiento psicológico requiere una mente que resiste el presente o que escapa hacia otro tiempo. El presente puro, aceptado completamente, no contiene sufrimiento psicológico.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué propone Tolle como práctica para anclar la conciencia al momento presente?',
        opciones: [
          'Leer textos espirituales durante al menos 30 minutos cada mañana',
          'Practicar la negación de todos los pensamientos durante períodos de meditación',
          'Dirigir la atención a las sensaciones corporales — el cuerpo siempre existe en el presente',
          'Escribir un diario detallado de todos los pensamientos que aparecen durante el día',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El cuerpo siempre existe en el presente — no puede estar en el pasado ni en el futuro. Preguntar "¿Hay vida en mis manos ahora?" y notar la sensación es un ancla inmediata al presente. También la respiración consciente — observarla, no controlarla — lleva la atención al ahora de manera directa.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "rendición" según Tolle y qué NO es?',
        opciones: [
          'Es resignación y pasividad — aceptar que no se puede cambiar nada',
          'Es la aceptación de la realidad tal como es, sin la resistencia mental del ego — es activa, no pasiva: "Esto es lo que es, ¿qué puedo hacer desde aquí?"',
          'Es el abandono de todas las metas y aspiraciones para vivir en el presente',
          'Es un estado espiritual avanzado accesible solo para personas con práctica meditativa de décadas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La rendición de Tolle no es pasividad. Es la aceptación de la realidad presente que libera la energía gastada en resistirla y la dirige hacia la acción posible. El piloto que acepta la tormenta (rendición) puede ajustar el vuelo (acción); el que la resiste mentalmente consume energía sin cambiar nada.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo transforma la presencia las relaciones interpersonales según Tolle?',
        opciones: [
          'Elimina todos los conflictos relacionales porque las personas presentes nunca discrepan',
          'Permite encontrarse con el otro sin el filtro de la historia acumulada, creando la sensación de ser realmente visto',
          'Hace las relaciones más superficiales porque se elimina la profundidad del contexto compartido',
          'Solo es relevante en meditación individual, no en las interacciones cotidianas',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La mente en piloto automático interactúa con la imagen mental del otro, no con el otro real. La presencia permite el encuentro real: sin el bagaje de resentimientos, expectativas y proyecciones del pasado. Esta calidad de atención produce la experiencia de "ser realmente visto" que el otro percibe inmediatamente como algo valioso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "pensamiento compulsivo" que Tolle identifica como fuente de sufrimiento?',
        opciones: [
          'El pensamiento obsesivo sobre problemas que requieren solución urgente',
          'El pensamiento que no puede detenerse: que rumia el pasado y anticipa ansiosamente el futuro sin producir ningún valor',
          'Los pensamientos negativos automáticos identificados en la psicología cognitiva',
          'El pensamiento de alta velocidad que produce errores por precipitación',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El pensamiento compulsivo es la mente que no puede detenerse: que rumia el pasado, anticipa el futuro, juzga constantemente. No es el pensamiento útil (resolver problemas, planificar) sino el pensamiento que ocurre sin ningún propósito práctico, consumiendo energía y generando sufrimiento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué producen las relaciones "adictivas" que describe Tolle?',
        opciones: [
          'Dependencia emocional que Tolle considera la base de las relaciones más profundas',
          'El mejor contexto para el crecimiento espiritual porque los conflictos aceleran la conciencia',
          'Sufrimiento inevitable porque buscan en el otro el complemento que creen faltarles, falta que no puede satisfacerse desde afuera',
          'Relaciones estables porque la mutua dependencia crea compromiso fuerte',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Las relaciones adictivas buscan en el otro lo que falta en la propia existencia. Esta búsqueda no puede satisfacerse porque la falta percibida no es real — es la mente sin paz que busca fuera lo que solo puede encontrarse dentro. Las relaciones más profundas son entre personas que ya encontraron paz en su presencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué pregunta propone Tolle como práctica para iniciar la conciencia de presencia corporal?',
        opciones: [
          '"¿Qué estoy pensando en este momento?"',
          '"¿Estoy respirando conscientemente ahora?"',
          '"¿Hay vida en mis manos ahora mismo?" — dirigir la atención a la sensación en las manos',
          '"¿Cuánto tiempo llevo sin pensar en el pasado o el futuro?"',
        ],
        respuestaCorrecta: 2,
        explicacion: '"¿Hay vida en mis manos ahora mismo?" dirige la atención inmediatamente a la sensación de energía o vitalidad en las manos, que la mente normalmente ignora. Esta simple pregunta crea un momento de presencia porque las sensaciones corporales solo existen en el ahora.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las tres respuestas posibles ante una situación difícil según Tolle?',
        opciones: [
          'Luchar, huir o paralizarse — las respuestas evolutivas del sistema nervioso',
          'Cambiarla, aceptarla, o no cambiarla ni aceptarla (quejarse) — la tercera produce el sufrimiento más prolongado',
          'Actuar, reflexionar o pedir ayuda — las tres vías de resolución constructiva',
          'Resistirla, negarla o racionalizarla — los mecanismos de defensa del ego',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Tolle propone: si puedes cambiar la situación, cámbiala (acción). Si no puedes, la única opción que elimina el sufrimiento innecesario es aceptarla (rendición). La tercera opción — no cambiarla y no aceptarla sino quejarse — no cambia la situación y añade sufrimiento mental indefinido.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "conciencia del ser interior" que Tolle describe?',
        opciones: [
          'El conjunto de valores y creencias que definen la personalidad de cada uno',
          'La voz interna de la conciencia moral que guía las decisiones éticas',
          'La conciencia tranquila y despierta que subyace a todos los pensamientos y que emerge en momentos de presencia plena',
          'El estado de relajación profunda que se alcanza durante la meditación avanzada',
        ],
        respuestaCorrecta: 2,
        explicacion: 'La conciencia del ser interior es la presencia silenciosa que siempre está ahí, pero que la actividad mental constante oscurece. Emerge en momentos de presencia plena — mirando un paisaje con atención total, en conversación genuina, en meditación — como la sensación tranquila de estar plenamente vivo y despierto.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 5 — El Monje que Vendió su Ferrari
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp05',
    titulo: 'El Monje que Vendió su Ferrari',
    autor: 'Robin Sharma',
    anio: '1997',
    emoji: '🏺',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Un abogado exitoso colapsa en plena sala de justicia y viaja a India, donde descubre los secretos de una vida con propósito, disciplina y paz interior.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Colapso de Julian Mantle',
        emoji: '⚡',
        contenido: '''Julian Mantle lo tenía todo: el mejor despacho de abogados, la mansión, el Ferrari rojo, el reloj de \$5,000. Y una mañana, en plena sala de tribunal, su corazón colapsó. El ataque al corazón fue su llamado de despertar.

Julian vende todo — incluyendo el Ferrari — y viaja a los Himalayas. Allí, en un monasterio remoto, los Sabios de Sivana le enseñan los secretos de una vida extraordinaria. Cuando regresa, comparte esos secretos con su colega John, y eso es el libro.

El mensaje central: el éxito externo sin riqueza interior es una trampa mortal. Julian era una persona que todos admiraban y que por dentro se estaba destruyendo. Trabajaba 18 horas al día, comía mal, no dormía, no tenía relaciones significativas — y lo llamaba "éxito".

Sharma propone que la vida extraordinaria no se mide por lo que tienes sino por quien eres. El autodominio —dominar tu mente, tus emociones, tu tiempo y tus acciones— es la fuente de todo éxito verdadero y durable.

La fábula del jardín: Sharma estructura su filosofía alrededor de imágenes simbólicas. Un jardín con plantas es tu mente — si no la cultivas deliberadamente, las malas hierbas (pensamientos negativos, miedos, hábitos destructivos) la tomarán. El cuidado del jardín mental es trabajo de toda la vida.''',
      ),
      CapituloResumen(
        titulo: 'El Dominio de la Mente',
        emoji: '🧘',
        contenido: '''Los Sabios de Sivana enseñan que la mente es como un lago. Cuando está agitada, no puedes ver el fondo — no puedes pensar con claridad ni tomar buenas decisiones. Cuando está tranquila, el fondo es perfectamente visible: tienes acceso a tu sabiduría más profunda.

La meditación del corazón de la rosa es la primera práctica: siéntate en silencio y concentra toda tu atención en una rosa. Cuando la mente divague, regresa suavemente a la rosa. Esta práctica desarrolla la concentración y el control sobre el flujo de pensamientos.

Los 10,000 pensamientos diarios: la mente produce miles de pensamientos sin parar. La mayoría son inútiles, negativos o repetitivos. El primer paso hacia el autodominio es darse cuenta de que TIENES pensamientos pero NO ERES tus pensamientos. Puedes observarlos en lugar de ser arrastrada por ellos.

La técnica de la oposición: cuando un pensamiento negativo aparece, reemplázalo inmediatamente con su opuesto positivo. No suprimas el negativo — eso lo fortalece. Substitúyelo activamente. La mente no puede sostener dos pensamientos contrarios simultáneamente.

El principio de la mente maestra: tu vida exterior siempre refleja tu vida interior. Si cambias lo que sucede en tu mente — los pensamientos dominantes, las creencias, las imágenes — el mundo exterior inevitablemente cambia para reflejarlo. Este es el fundamento de todo el sistema de Sharma.''',
      ),
      CapituloResumen(
        titulo: 'El Propósito y las Metas',
        emoji: '🎯',
        contenido: '''Los Sabios enseñan que una vida sin propósito es como un barco sin timón: llega a cualquier puerto excepto al que quería. Definir tu propósito de vida — tu DHARMA — es el acto más importante que puedes hacer.

Las cinco preguntas del propósito: ¿Qué te apasiona genuinamente? ¿Qué actividades te hacen perder la noción del tiempo? ¿Qué harías si supieras que no puedes fallar? ¿Qué legado quieres dejar? ¿Qué quieres que digan de ti cuando ya no estés? Las respuestas señalan hacia tu propósito.

El sistema de metas de los Sabios incluye cuatro dimensiones: metas físicas (salud, energía), mentales (aprendizaje continuo), familiares/sociales (relaciones profundas) y espirituales (conexión con algo mayor que uno mismo). La persona que solo tiene metas económicas tiene una vida plana, sin dimensión.

La visualización creativa: los Sabios practican ver sus metas como ya logradas, con detalle sensorial completo — qué ven, qué sienten, qué escuchan cuando han alcanzado lo que desean. Esta práctica no es magia: activa el sistema de activación reticular del cerebro, que empieza a detectar oportunidades y recursos relevantes que antes ignoraba.

El mapa de las metas: escribe todas tus metas en una hoja. Clasifícalas por las cuatro dimensiones. Para cada una, escribe por qué la quieres (el propósito emocional) y un primer paso que puedes dar esta semana. Un sueño sin primer paso es solo fantasía.''',
      ),
      CapituloResumen(
        titulo: 'El Poder de la Disciplina',
        emoji: '⚔️',
        contenido: '''Sharma enseña que la autodisciplina es el puente entre tus sueños y tu realidad. Sin ella, los mejores propósitos quedan en intenciones. Con ella, cualquier meta se vuelve alcanzable.

La práctica del dolor deliberado: los Sabios se exponen deliberadamente a situaciones de incomodidad leve (duchas frías, ayunos cortos, ejercicio intenso) no para sufrir sino para fortalecer la voluntad. La mente que puede tolerar incomodidad física menor puede tolerar los desafíos de la vida con mayor ecuanimidad.

Los rituales de la mañana son la práctica más poderosa del libro. Los primeros 20 minutos del día establecen el tono de todo lo que sigue. Los Sabios dedican su mañana a: 5 minutos de meditación, 5 minutos de visualización de metas, 10 minutos de lectura inspiradora. Esta práctica, repetida diariamente, transforma la vida en 30 días.

El principio del kaizen japonés: mejora continua, pequeña e incesante. No necesitas una transformación dramática de la noche a la mañana. Pequeñas mejoras del 1% aplicadas consistentemente producen resultados extraordinarios con el tiempo. El compuesto de hábitos pequeños es asombroso.

Sharma propone la regla de las 21 respiraciones: antes de reaccionar a cualquier situación que te provoque, toma 21 respiraciones lentas y profundas. Este simple hábito crea el espacio entre estímulo y respuesta que es la diferencia entre reactividad y autodominio.''',
      ),
      CapituloResumen(
        titulo: 'El Tiempo, las Relaciones y el Legado',
        emoji: '⏳',
        contenido: '''Los Sabios enseñan que el tiempo es el recurso más precioso de la vida — más que el dinero, porque el dinero se puede recuperar pero el tiempo no. Tratar el tiempo con respeto es tratar la vida con respeto.

La agenda de prioridades: cada domingo por la noche, reserva 30 minutos para planificar la semana. Identifica las 3-5 actividades que tendrán el mayor impacto en tu vida y agenda tiempo sagrado para ellas. Todo lo demás se acomoda en el espacio restante, no al revés.

Las relaciones como espejo: las personas en tu vida reflejan quién eres. Si quieres elevar tu vida, eleva tus relaciones. Busca personas que ya encarnen lo que quieres ser — su influencia gradual es más poderosa que cualquier libro o seminario.

El legado no es lo que dejas cuando mueres — es lo que das mientras vives. Cada acto de bondad, cada momento de generosidad genuina, cada vez que iluminas el camino de otra persona, estás construyendo tu legado. El servicio a otros es el camino más directo a la satisfacción profunda.

Sharma concluye con el mensaje de Julian: no esperes un ataque al corazón para cambiar de dirección. El momento de vivir una vida extraordinaria es ahora. No cuando tengas más dinero, más tiempo, más seguridad. Ahora. Con lo que tienes. Donde estás. La vida se vive en el presente, no en la preparación del presente.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Por qué Julian Mantle vendió su Ferrari y viajó a India?',
        opciones: [
          'Porque quebró económicamente y necesitaba empezar de nuevo',
          'Porque sufrió un ataque al corazón que lo hizo replantearse su vida de excesos y trabajo sin sentido',
          'Porque ganó un caso importante y decidió tomarse un año sabático',
          'Porque descubrió que su socio le robaba dinero del despacho',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El colapso de Julian en plena sala de tribunal fue su llamado de despertar. Tenía todo el éxito externo pero su vida interior estaba destruida. El Ferrari simbolizaba ese éxito vacío.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué simboliza el "jardín" en la fábula de Sharma?',
        opciones: [
          'El entorno físico donde vivimos y que debemos mantener ordenado',
          'La mente: si no la cultivas deliberadamente, las malas hierbas de pensamientos negativos la invaden',
          'El dinero que debemos cultivar y hacer crecer con inversiones',
          'La familia, que requiere cuidado y atención constante',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El jardín es tu mente. Las plantas son pensamientos positivos y hábitos que nutres deliberadamente. Las malas hierbas son los pensamientos negativos que crecen solos si no las arrancas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el propósito de la "meditación del corazón de la rosa"?',
        opciones: [
          'Conectar con energías espirituales que atraen abundancia',
          'Reducir la presión arterial y el estrés físico',
          'Desarrollar la concentración y el control sobre el flujo de pensamientos',
          'Cultivar el amor romántico y las relaciones de pareja',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Concentrar la atención en una rosa entrena la mente para enfocarse. Cuando divaga, la regresas suavemente. Esta práctica desarrolla el músculo de la concentración y muestra que puedes dirigir tu atención.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué incluyen las cuatro dimensiones de metas que enseñan los Sabios de Sivana?',
        opciones: [
          'Financiera, profesional, social y recreativa',
          'Física, mental, familiar/social y espiritual',
          'Intelectual, emocional, económica y comunitaria',
          'Personal, laboral, familiar y religiosa',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Perfecto! Las cuatro dimensiones son: física (salud), mental (aprendizaje), familiar/social (relaciones) y espiritual (propósito). La persona que solo tiene metas económicas vive una vida plana.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué los Sabios se exponen deliberadamente a incomodidades como duchas frías?',
        opciones: [
          'Por tradición religiosa milenaria que forma parte de su cultura',
          'Para fortalecer la voluntad: la mente que tolera incomodidad menor maneja los desafíos de la vida con más ecuanimidad',
          'Para demostrar que pueden sobrevivir en condiciones extremas',
          'Para limpiar el cuerpo de toxinas que bloquean el pensamiento claro',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El dolor deliberado leve fortalece la voluntad como el ejercicio fortalece los músculos. No es masoquismo — es entrenamiento del carácter para que nada externo te controle.',
      ),
      const PreguntaLibro(
        enunciado: '¿En qué consiste el ritual de la mañana que propone Sharma?',
        opciones: [
          'Dos horas de ejercicio físico intenso antes del desayuno',
          'Leer un libro completo cada mañana antes de revisar el teléfono',
          'Los primeros 20 minutos dedicados a meditación, visualización de metas y lectura inspiradora',
          'Escribir en un diario durante una hora reflexionando sobre el día anterior',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Los primeros 20 minutos del día establecen el tono de todo. Sharma propone: 5 min meditación + 5 min visualización + 10 min lectura inspiradora. Este ritual diario transforma la vida en 30 días.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el mensaje central sobre el tiempo según los Sabios de Sivana?',
        opciones: [
          'El tiempo es dinero y debe usarse para generar ingresos',
          'El tiempo libre es esencial y debe protegerse de las obligaciones laborales',
          'Es el recurso más precioso porque el dinero puede recuperarse pero el tiempo no',
          'El tiempo es una ilusión y lo importante es la calidad de la experiencia, no la cantidad',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! Tratar el tiempo con respeto es tratar la vida con respeto. Por eso Sharma propone la agenda de prioridades dominical: decidir conscientemente a qué le darás tu tiempo antes de que otros lo decidan por ti.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "legado" según la filosofía de Sharma?',
        opciones: [
          'La herencia económica que dejamos a nuestra familia cuando morimos',
          'Los libros, proyectos y obras que creamos durante nuestra vida',
          'Lo que damos mientras vivimos: bondad, generosidad, iluminar el camino de otros',
          'El impacto que tiene nuestro trabajo profesional en la sociedad',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El legado no es lo que dejas cuando mueres — es lo que das mientras vives. Cada acto de bondad genuina, cada vez que ayudas a otra persona a crecer, estás construyendo tu legado ahora mismo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué técnica propone Sharma para manejar pensamientos negativos?',
        opciones: [
          'Ignorarlos completamente y enfocarse en otra cosa',
          'Suprimirlos con fuerza de voluntad hasta que desaparezcan',
          'Reemplazarlos activamente con su opuesto positivo — la mente no puede sostener dos pensamientos contrarios',
          'Analizarlos profundamente para entender su origen y desactivarlos',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! La supresión fortalece el pensamiento negativo. La técnica de la oposición lo desplaza: activamente substitúyelo por su contrario. La mente no puede sostener simultáneamente "soy un fracaso" y "soy capaz y crezco cada día".',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo debe comenzar según Sharma a vivir una vida extraordinaria?',
        opciones: [
          'Cuando hayas acumulado suficiente dinero para tener seguridad financiera',
          'Cuando encuentres tu propósito de vida con total claridad',
          'Ahora, con lo que tienes, donde estás — sin esperar condiciones perfectas',
          'Cuando hayas completado un programa de formación personal estructurado',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Perfecto! No esperes un ataque al corazón para cambiar de dirección. El momento es ahora. La vida se vive en el presente, no en la preparación perpetua del presente.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 6 — El Poder del Subconsciente
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp06',
    titulo: 'El Poder del Subconsciente',
    autor: 'Joseph Murphy',
    anio: '1963',
    emoji: '🧠',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Tu mente subconsciente acepta todo lo que le presentas como verdad y trabaja para convertirlo en realidad. Aprende a programarla conscientemente para transformar tu salud, finanzas y relaciones.',
    gemasRecompensa: 55,
    capitulos: const [
      CapituloResumen(
        titulo: 'Dos Mentes en Una',
        emoji: '🔀',
        contenido: '''Murphy propone que la mente humana tiene dos partes que funcionan de manera radicalmente diferente: la mente CONSCIENTE (el razonamiento lógico, el pensamiento crítico, la voluntad) y la mente SUBCONSCIENTE (el almacén de todos tus hábitos, creencias, memorias y convicciones más profundas).

La diferencia crucial: la mente consciente puede aceptar o rechazar ideas. La mente subconsciente NO tiene esa capacidad crítica — acepta todo lo que recibe como verdad y trabaja para convertirlo en realidad. Si tu subconsciente cree que eres mala con el dinero, producirá comportamientos que confirmen esa creencia.

La analogía del jardín: la mente consciente es el jardinero que elige qué semillas plantar. La mente subconsciente es el suelo fértil que hace crecer todo lo que se planta — sin discriminar entre semillas de flores y malas hierbas. Plantas miedo y crece miedo. Plantas confianza y crece confianza.

Los hábitos son programas subconscientes. Cuando aprendiste a caminar, era un proceso consciente y difícil. Ahora es automático — lo ejecuta tu subconsciente sin esfuerzo consciente. De la misma manera, tus creencias sobre el dinero, el éxito y tu propio valor fueron "aprendidas" y ahora se ejecutan automáticamente.

La clave de Murphy: puedes reprogramar tu subconsciente deliberadamente. No ocurre de un día para otro, pero con práctica consistente, puedes instalar nuevas creencias que reemplacen las antiguas y limitan.''',
      ),
      CapituloResumen(
        titulo: 'Cómo Comunicarte con tu Subconsciente',
        emoji: '📡',
        contenido: '''Murphy identifica los momentos y métodos más efectivos para comunicarse con el subconsciente. El estado hipnagógico — ese momento entre la vigilia y el sueño — es el más receptivo. En ese estado, la mente consciente afloja su control y el subconsciente queda expuesto directamente.

La técnica del soaking: justo antes de dormir, repite mentalmente (o en voz baja) la afirmación o imagen que quieres instalar en tu subconsciente. Hazlo con la sensación de que ya es verdad, no con la esperanza de que ocurra. El subconsciente responde a los sentimientos, no solo a las palabras.

Las afirmaciones funcionan cuando se hacen correctamente: en tiempo presente ("soy próspera", no "seré próspera"), con emoción genuina, repetidas consistentemente, y sin la voz interna que contradice ("pero eso no es verdad todavía"). La contradicción interna cancela la afirmación.

La visualización es otra herramienta: crea en tu mente una imagen detallada de lo que deseas. Añade los cinco sentidos. Visita esa imagen regularmente con la intensidad emocional de quien ya lo tiene. Murphy cita numerosos casos de personas que usaron esta técnica para recuperarse de enfermedades, encontrar trabajos, mejorar sus finanzas.

La oración científica de Murphy es la integración de todos estos elementos: define claramente lo que quieres → crea la imagen mental → añade el sentimiento de gratitud por haberlo recibido → suéltalo con confianza. Este proceso activa los mecanismos subconscientes que trabajan en su materialización.''',
      ),
      CapituloResumen(
        titulo: 'El Subconsciente y el Dinero',
        emoji: '💰',
        contenido: '''Una de las aplicaciones más poderosas del libro es la relación entre la mente subconsciente y la prosperidad económica. Murphy argumenta que la mayoría de las personas tienen creencias subconscientes negativas sobre el dinero instaladas en la infancia.

Creencias comunes que sabotean la prosperidad: "el dinero es la raíz de todos los males", "la gente rica es mala", "no nací para ser rica", "el dinero no crece en los árboles", "trabajar duro apenas alcanza para vivir". Estas frases, escuchadas repetidamente en la infancia, se convierten en programas subconscientes que literalmente bloquean la prosperidad.

Murphy propone la reprogramación activa: identifica tus creencias limitantes sobre el dinero, cuestiona su veracidad (¿hay personas ricas que son generosas y buenas?), y reemplázalas con afirmaciones de prosperidad repetidas durante el estado hipnagógico.

La mentalidad de prosperidad incluye: sentir genuina alegría cuando ves éxito y riqueza en otros (porque lo que aplaudes en otros, lo atraes hacia ti), dar generosamente desde cualquier nivel de ingresos (la generosidad programa el subconsciente para recibir más), y visualizar regularmente el estilo de vida que deseas con detalle y gratitud.

Murphy insiste en un punto importante: el subconsciente no distingue entre lo real y lo imaginado con intensidad emocional. Por eso el miedo a la pobreza produce pobreza igual que la confianza en la prosperidad produce prosperidad. La moneda que usas con tu subconsciente son los sentimientos, no las palabras.''',
      ),
      CapituloResumen(
        titulo: 'El Subconsciente y la Salud',
        emoji: '💚',
        contenido: '''Murphy presenta numerosos casos documentados de personas que se recuperaron de enfermedades graves usando técnicas de programación mental. La medicina moderna reconoce ahora la conexión mente-cuerpo: el estrés crónico causa enfermedades físicas reales; las emociones positivas fortalecen el sistema inmune.

La hipnosis médica funciona exactamente a través de este mecanismo: al acceder al subconsciente, puede influir en funciones corporales que normalmente no están bajo control consciente — frecuencia cardíaca, respuesta al dolor, procesos de curación.

El efecto placebo es la demostración científica más conocida del poder del subconsciente: las personas se curan tomando pastillas de azúcar cuando creen genuinamente que son medicamento real. El subconsciente recibe la instrucción "hay curación en camino" y activa los mecanismos de curación del cuerpo.

Murphy propone afirmaciones específicas de salud: "Cada día mi cuerpo se fortalece y sana", "Mi sistema inmune es fuerte y eficiente", "Tengo energía y vitalidad abundantes". Estas afirmaciones, repetidas en el estado entre sueño y vigilia, instruyen al subconsciente sobre cómo tratar el cuerpo.

El límite importante: Murphy no propone reemplazar la medicina con afirmaciones. Propone usarlas como complemento poderoso. El médico trata el cuerpo; las afirmaciones programan la mente que controla gran parte de los procesos corporales. Ambos son necesarios.''',
      ),
      CapituloResumen(
        titulo: 'El Subconsciente en las Relaciones y el Éxito',
        emoji: '🌟',
        contenido: '''Lo que crees subconscientemente sobre ti misma determina qué relaciones atraes y qué nivel de éxito alcanzas. Murphy propone que si crees en tu interior que no mereces amor, atraerás relaciones que confirmen esa creencia. Si crees que el éxito no es para ti, inconscientemente sabotearás las oportunidades que se presenten.

La autoestima subconsciente: puedes presentar externamente confianza y aún tener profundamente instalada la creencia de que no eres suficiente. Esa creencia subconsciente es la que determina tu realidad, no la fachada. Por eso trabajar la autoestima superficialmente no funciona — hay que ir a la raíz subconsciente.

El perdón como herramienta de liberación: los resentimientos y rencores que mantienes no dañan a la otra persona — programan tu subconsciente con emociones negativas que afectan tu salud, tus relaciones y tu prosperidad. Murphy enseña técnicas de perdón no por bondad hacia el otro, sino como higiene mental necesaria para tu propio bienestar.

La gratitud activa el subconsciente hacia la abundancia. Cuando agradeces genuinamente lo que tienes — no de manera mecánica sino con sentimiento real — envías la señal de "tengo suficiente y más llega". El subconsciente, que acepta esta instrucción, abre la percepción hacia nuevas oportunidades.

Murphy concluye con un recordatorio poderoso: tu destino no está escrito en las estrellas ni determinado por tu pasado. Está siendo escrito ahora mismo por los pensamientos dominantes de tu mente subconsciente. Tienes el poder de ser tú quien los elige.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la diferencia fundamental entre mente consciente y subconsciente según Murphy?',
        opciones: [
          'La mente consciente es más poderosa; la subconsciente solo maneja funciones automáticas básicas',
          'La consciente puede aceptar o rechazar ideas; la subconsciente acepta todo lo que recibe como verdad',
          'La subconsciente solo opera durante el sueño; la consciente opera durante la vigilia',
          'No hay diferencia real — son dos nombres para el mismo proceso mental',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La mente subconsciente carece de capacidad crítica — acepta todo lo que recibe como verdad y trabaja para convertirlo en realidad. Por eso lo que le "instalas" importa tanto.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Murphy dice que el estado entre sueño y vigilia es ideal para programar el subconsciente?',
        opciones: [
          'Porque el cerebro produce ondas alfa que tienen propiedades sanadoras especiales',
          'Porque en ese estado la mente consciente afloja su control crítico y el subconsciente queda directamente accesible',
          'Porque el cuerpo está relajado y puede absorber mejor la energía de las afirmaciones',
          'Porque los sueños procesan las afirmaciones y las convierten en realidad durante la noche',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El estado hipnagógico (entre sueño y vigilia) es la ventana de acceso más directa al subconsciente porque la mente crítica consciente está suspendida. Es el momento ideal para instalar nuevas creencias.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué "moneda" acepta el subconsciente según Murphy?',
        opciones: [
          'Las palabras repetidas con suficiente frecuencia y volumen',
          'Las imágenes mentales detalladas y precisas',
          'Los sentimientos y emociones asociados a los pensamientos, no solo las palabras',
          'La lógica y la razón que demuestran por qué algo es verdad',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! El subconsciente no responde a palabras vacías — responde a los sentimientos. Una afirmación dicha sin emoción no tiene efecto. La misma afirmación dicha con genuina emoción de gratitud penetra profundamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo explica Murphy el efecto placebo en términos del subconsciente?',
        opciones: [
          'El placebo libera sustancias químicas que el cuerpo produce naturalmente',
          'La expectativa consciente de curación activa el sistema inmune directamente',
          'El subconsciente recibe la instrucción de "curación en camino" y activa los mecanismos de curación del cuerpo',
          'El placebo es solo un fenómeno psicológico sin efecto físico real',
        ],
        respuestaCorrecta: 2,
        explicacion: 'El placebo es la demostración científica más conocida del poder subconsciente: la persona cree genuinamente que recibe tratamiento. El subconsciente acepta esa instrucción y activa los mecanismos de curación reales del cuerpo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es una creencia subconsciente común que bloquea la prosperidad según Murphy?',
        opciones: [
          'Creer que necesitas estudiar más antes de merecer el éxito',
          'Pensar que el trabajo duro es la única fuente legítima de ingresos',
          'Frases aprendidas en infancia como "el dinero es la raíz del mal" o "la gente rica es mala"',
          'La creencia de que el dinero es un recurso limitado que se agota',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Frases escuchadas repetidamente en la infancia se convierten en programas subconscientes. Si tu subconsciente asocia "dinero" con "maldad", inconscientemente te alejará de él para ser "buena persona".',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Murphy recomienda sentir alegría cuando ves éxito en otras personas?',
        opciones: [
          'Porque la alegría es una emoción sana que mejora el bienestar general',
          'Porque lo que aplaudes en otros programas tu subconsciente para atraer lo mismo hacia ti',
          'Porque el éxito ajeno crea un modelo a imitar que guía tu comportamiento',
          'Porque la envidia crea conflictos sociales que dañan tus relaciones',
        ],
        respuestaCorrecta: 1,
        explicacion: 'La envidia envía la señal subconsciente de "eso no es para mí" que literalmente bloquea la prosperidad. La alegría genuina ante el éxito ajeno envía la señal de "eso es posible y también puede ser para mí".',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Murphy recomienda el perdón como práctica de "higiene mental"?',
        opciones: [
          'Porque perdonar demuestra carácter moral y genera respeto social',
          'Porque el rencor programa el subconsciente con emociones negativas que afectan tu salud, relaciones y prosperidad',
          'Porque la persona que perdonas puede convertirse en un aliado valioso',
          'Porque las religiones enseñan el perdón y tienen sabiduría acumulada',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Murphy recomienda el perdón no por bondad hacia el otro — sino como egoísmo inteligente. Los rencores que cargas te dañan a ti. Liberarlos es limpiar tu subconsciente de veneno que bloquea tu propia prosperidad.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue una afirmación efectiva de una que no funciona según Murphy?',
        opciones: [
          'Las afirmaciones efectivas son largas y detalladas; las inefectivas son cortas y simples',
          'Las efectivas se dicen en voz alta; las inefectivas se piensan en silencio',
          'Las efectivas se enuncian en tiempo presente y con emoción genuina; sin emoción, las palabras no penetran el subconsciente',
          'Las efectivas se repiten 100 veces; cualquier número menor no tiene efecto',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Tiempo presente ("soy próspera") + emoción genuina de gratitud = afirmación efectiva. Sin la emoción, son solo palabras que el subconsciente ignora. La intensidad emocional es la que abre la puerta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué papel juegan los hábitos en relación con el subconsciente?',
        opciones: [
          'Los hábitos son comportamientos conscientes que elegimos repetir hasta automatizarlos',
          'Los hábitos son programas subconscientes: conductas aprendidas que ahora se ejecutan automáticamente sin esfuerzo consciente',
          'Los hábitos existen solo en la mente consciente y pueden cambiarse instantáneamente con suficiente voluntad',
          'Los hábitos son respuestas instintivas determinadas genéticamente, no mentalmente',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Los hábitos son exactamente programas subconscientes. Aprender a caminar fue difícil y consciente; ahora es automático. Tus hábitos financieros, relacionales y de pensamiento funcionan igual — ejecutados por el subconsciente sin supervisión consciente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es el límite que Murphy reconoce sobre usar afirmaciones para la salud?',
        opciones: [
          'Las afirmaciones solo funcionan para condiciones leves — las enfermedades graves requieren medicina exclusivamente',
          'Las afirmaciones son complemento de la medicina, no reemplazo — el médico trata el cuerpo; la mente trata la mente',
          'Las afirmaciones funcionan para cualquier condición si se hacen con suficiente fe',
          'Las afirmaciones de salud son las menos efectivas porque el cuerpo no responde a la mente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Murphy es claro: las afirmaciones complementan la medicina, no la reemplazan. Ambas son necesarias. El médico trata el cuerpo con su conocimiento; las técnicas mentales programan la mente que influye poderosamente en el cuerpo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 7 — Piense y Hágase Rico
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp07',
    titulo: 'Piense y Hágase Rico',
    autor: 'Napoleon Hill',
    anio: '1937',
    emoji: '💡',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Después de 20 años estudiando a 500 personas exitosas, Hill destila los 13 principios universales que transforman el deseo ardiente en riqueza material y personal.',
    gemasRecompensa: 62,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Deseo: El Punto de Partida',
        emoji: '🔥',
        contenido: '''Hill pasó 20 años entrevistando a más de 500 de las personas más exitosas de su época, incluyendo a Andrew Carnegie, Henry Ford, Thomas Edison y Theodore Roosevelt. Lo que encontró fue un conjunto de principios comunes que aparecían una y otra vez, independientemente del campo o la personalidad.

El primer principio es el más importante: DESEO. No un deseo vago de "quiero ser rica" sino un deseo ardiente, específico y obsesivo. Hill llama a esto "una ardiente obsesión" — la diferencia entre querer algo y necesitarlo como el ahogado necesita aire.

La historia de Edwin C. Barnes: Barnes quería asociarse con Thomas Edison. No tenía dinero, conexiones ni experiencia. Pero tenía un deseo tan intenso que literalmente se presentó en la fábrica de Edison a pedir trabajo. Años después, se convirtió en el distribuidor exclusivo de Edison. Hill pregunta: ¿qué tenía Barnes que otros no tenían? No era talento ni dinero — era la intensidad del deseo.

Los seis pasos para transformar el deseo en oro: 1) Fija la cantidad exacta de dinero que deseas. 2) Determina exactamente qué darás a cambio. 3) Establece una fecha definida. 4) Crea un plan concreto. 5) Escribe todo en un párrafo claro. 6) Lee ese párrafo en voz alta dos veces al día, una vez al despertar y una antes de dormir.

Hill insiste: cuando leas, siente y cree que ya posees ese dinero. El deseo emocional — no el intelectual — es lo que activa los mecanismos de la mente subconsciente que trabajan para materializar el objetivo.''',
      ),
      CapituloResumen(
        titulo: 'Fe y Autosugestión',
        emoji: '🙏',
        contenido: '''La fe según Hill no es religiosa — es un estado mental creado por la práctica repetida de afirmaciones e instrucciones al subconsciente. Es la certeza de que lo que deseas se materializará, no la esperanza de que quizás ocurra.

La fe se desarrolla, no nace. A través de la AUTOSUGESTIÓN — repetición deliberada de pensamientos específicos a la mente subconsciente — se construye progresivamente una confianza inquebrantable que eventualmente se vuelve un estado permanente.

Hill describe la fe como "el eterno elíxir": quienes la tienen logran lo que otros llaman imposible. No porque el universo les favorezca especialmente sino porque la fe elimina la duda y la vacilación que sabotean la acción. Una persona que actúa con absoluta certeza actúa de manera diferente a quien duda — y esa diferencia determina el resultado.

La autosugestión es el método práctico: cada mañana y cada noche, en voz alta y con emoción, repite tu declaración de propósito. Incluye exactamente cuánto dinero deseas ganar, cuándo, y qué darás a cambio. Hazlo hasta que las palabras dejen de sonar huecas y empieces a sentirlas como tu realidad actual.

El peligro de la duda: Hill advierte que la duda y el miedo son "criminales" del éxito. No porque sean pecados morales sino porque destruyen el estado mental necesario para actuar con la confianza que produce resultados. Ambas son aprendidas — ningún ser humano nace con miedo al fracaso económico. Lo que se aprendió puede desaprenderse.''',
      ),
      CapituloResumen(
        titulo: 'Conocimiento y Planificación',
        emoji: '📚',
        contenido: '''Hill distingue entre CONOCIMIENTO GENERAL (lo que aprendes en la escuela, cultura general) y CONOCIMIENTO ESPECIALIZADO (el expertise específico que el mercado paga). La escuela enseña conocimiento general. El mundo paga conocimiento especializado.

Henry Ford tenía poca educación formal pero rodeó su ignorancia con personas que tenían el conocimiento que él no tenía. Un periodista lo insultó diciendo que era ignorante. Ford respondió que podía resolver cualquier problema presionando un botón en su escritorio y en minutos tendría a los mejores expertos del mundo respondiendo. "¿Para qué necesito llevar esa información en mi cabeza?"

El "grupo de cerebros" o MASTERMIND: Hill propone que las personas más exitosas forman alianzas estratégicas con personas cuyos conocimientos y habilidades complementan los propios. Dos mentes pensando juntas no producen el doble sino el décuplo, porque crean una tercera mente emergente que ninguna tiene individualmente.

La IMAGINACIÓN es la herramienta de planificación: hay dos tipos. La imaginación sintética reorganiza ideas, conceptos y planes existentes. La imaginación creativa recibe ideas originales de la mente universal (lo que los artistas llaman inspiración). Ambas requieren práctica deliberada.

El plan concreto: Hill insiste en que el deseo sin plan es solo sueño. Necesitas un plan específico de acción, aunque sea imperfecto. Un plan imperfecto que se ejecuta siempre supera al plan perfecto que solo existe en la mente. La acción imperfecta produce información que mejora el plan.''',
      ),
      CapituloResumen(
        titulo: 'La Decisión y la Persistencia',
        emoji: '🪨',
        contenido: '''El análisis de los 500 exitosos reveló una característica universal: toman decisiones rápidamente y las cambian lentamente. Las personas que fallan hacen exactamente lo opuesto: toman decisiones lentamente (indecisión crónica) y las cambian rápidamente (ante la primera resistencia).

La PROCRASTINACIÓN es el enemigo universal del éxito. Hill observó que prácticamente todos los fracasos económicos tienen como denominador común la incapacidad o falta de voluntad para tomar decisiones definitivas.

La opinión ajena como obstáculo: Hill advierte enfáticamente contra compartir los sueños y planes con personas negativas o que no los apoyan. La opinión de quien no ha logrado lo que tú buscas no tiene valor; la del que sí lo ha logrado vale su peso en oro. Los no-creyentes no son tus aliados — son el ruido que debes silenciar.

La PERSISTENCIA es el único antídoto al fracaso. Hill dice algo radical: no existe el fracaso permanente, solo el abandono prematuro. Prácticamente todos los grandes éxitos en cualquier campo vinieron después de múltiples fracasos. La única diferencia entre los que triunfaron y los que no es que los primeros siguieron cuando los demás pararon.

La historia de R.U. Darby: excavó en busca de oro, desistió a tres pies del filón más rico de la mina, y vendió su equipo por centavos a alguien que terminó encontrando el oro. La persistencia habría significado la fortuna; el abandono significó la pérdida. ¿Cuántas personas abandonan a tres pies del oro?''',
      ),
      CapituloResumen(
        titulo: 'El Subconsciente y el Poder Invisible',
        emoji: '🌌',
        contenido: '''Hill presenta los capítulos finales como los más controvertidos del libro, pero insiste en que son los más poderosos: la mente subconsciente como medio de comunicación entre la mente humana individual y lo que llama la "Inteligencia Infinita".

El subconsciente trabaja siempre — de día y de noche. Cuando le das un problema con claridad y emoción, sigue procesando mientras duermes. Las soluciones aparecen frecuentemente como inspiraciones repentinas al despertar, bajo la ducha, durante una caminata — cuando la mente consciente no interfiere.

Los seis miedos básicos que bloquean el subconsciente: miedo a la pobreza, a la crítica, a la enfermedad, a perder el amor, a la vejez, y a la muerte. Hill dedica un capítulo entero al miedo a la pobreza porque lo considera el más destructivo: paráliza la acción, destruye la iniciativa y produce exactamente lo que se teme.

Los síntomas del miedo a la pobreza incluyen: indifferencia (aceptar la pobreza sin resistencia), indecisión (incapacidad de tomar decisiones definitivas), duda (buscar excusas para el fracaso), preocupación crónica, exceso de precaución, y procrastinación. Si reconoces varios de estos patrones en ti, el miedo a la pobreza está operando en tu subconsciente.

Hill concluye: la fortuna comienza en la mente. No es un proceso misterioso — es la aplicación disciplinada de principios que pueden aprenderse y practicarse. Lo que separa a los que logran de los que solo desean no es la suerte, el origen o la educación — es la aplicación consistente de estos 13 principios.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuántos años y cuántas personas exitosas estudió Napoleon Hill para escribir el libro?',
        opciones: [
          '5 años estudiando 100 personas',
          '10 años estudiando 200 personas',
          '20 años estudiando más de 500 personas incluyendo Carnegie, Ford y Edison',
          '30 años estudiando 1,000 personas de todo el mundo',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Hill pasó 20 años entrevistando a más de 500 de los más exitosos de su época. Andrew Carnegie fue quien encargó la investigación, convencido de que los principios del éxito podían codificarse y enseñarse.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue el "deseo ardiente" del deseo común según Hill?',
        opciones: [
          'El deseo ardiente incluye un plan detallado; el común es solo una aspiración vaga',
          'El deseo ardiente es una obsesión intensa y específica, como el ahogado que necesita aire — no un deseo vago de "ser rico"',
          'El deseo ardiente viene de haber experimentado la pobreza; el común de no haberla vivido',
          'El deseo ardiente es espiritual; el común es meramente material',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La diferencia es de intensidad. Un deseo vago no activa los mecanismos mentales que producen resultados. El deseo ardiente — como la obsesión de Barnes con asociarse a Edison — moviliza toda la energía de la persona.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es un "grupo de cerebros" o Mastermind según Hill?',
        opciones: [
          'Un grupo de personas con alto coeficiente intelectual que colaboran en proyectos',
          'Una alianza estratégica donde las mentes se combinan y crean una tercera mente emergente más poderosa que cualquiera individualmente',
          'Un grupo de meditación donde se amplifican las intenciones colectivas',
          'Un equipo de asesores financieros que gestionan la riqueza de una persona exitosa',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Dos mentes pensando juntas no producen el doble — producen el décuplo, porque emerge una tercera mente colectiva. Ford no necesitaba saber todo; tenía los mejores expertos a su alcance.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué patrón de decisión comparten los 500 personas exitosas estudiadas por Hill?',
        opciones: [
          'Consultan extensamente antes de decidir pero luego actúan con velocidad',
          'Evitan decisiones irreversibles hasta tener toda la información disponible',
          'Deciden rápidamente y cambian sus decisiones lentamente — lo opuesto a quienes fallan',
          'Delegan las decisiones importantes a asesores de confianza',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! La indecisión crónica es el enemigo del éxito. Los que triunfan deciden rápido y se mantienen en su decisión ante la resistencia. Los que fallan tardan mucho en decidir y abandonan ante el primer obstáculo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué enseña la historia de R.U. Darby en la mina de oro?',
        opciones: [
          'Que la suerte determina el éxito más que el esfuerzo',
          'Que abandonar a tres pies del filón más rico: la persistencia era la diferencia entre la fortuna y la pérdida',
          'Que es importante vender en el momento justo antes de agotar recursos',
          'Que el trabajo en equipo es esencial para el éxito en cualquier proyecto',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Darby abandonó a tres pies del filón de oro más rico de la mina. Hill usa esta historia para ilustrar que la mayoría de los fracasos ocurren justo antes del éxito — y que la única diferencia entre los que triunfan y los que fallan es la persistencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Hill considera el miedo a la pobreza el más destructivo de los seis miedos?',
        opciones: [
          'Porque produce más sufrimiento emocional que los otros cinco miedos combinados',
          'Porque es el más común y afecta a más personas en más culturas',
          'Porque paraliza la acción, destruye la iniciativa y produce exactamente lo que se teme',
          'Porque es el único miedo que tiene consecuencias físicas tangibles',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! El miedo a la pobreza es especialmente cruel: produce los síntomas (indecisión, procrastinación, exceso de precaución) que garantizan la pobreza que se teme. Es una profecía que se cumple a sí misma.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre imaginación sintética y creativa según Hill?',
        opciones: [
          'La sintética usa los dos hemisferios cerebrales; la creativa usa solo el derecho',
          'La sintética reorganiza ideas existentes; la creativa recibe ideas originales que no existían antes',
          'La sintética es racional y planificada; la creativa es emocional e impredecible',
          'La sintética es individual; la creativa requiere colaboración con otros',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La imaginación sintética reorganiza lo existente en nuevas combinaciones — útil para planificación y resolución de problemas. La imaginación creativa recibe ideas originales de la "Inteligencia Infinita" — lo que artistas y científicos experimentan como inspiración.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuándo aparecen frecuentemente las soluciones generadas por el subconsciente?',
        opciones: [
          'Durante la meditación profunda cuando la mente está completamente quieta',
          'Al despertar, bajo la ducha o en caminatas — cuando la mente consciente no interfiere',
          'En los sueños nocturnos que pueden registrarse inmediatamente al despertar',
          'Durante la lectura de material relacionado con el problema que se busca resolver',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El subconsciente trabaja continuamente. Las soluciones emergen cuando la mente consciente está ocupada o relajada — en la ducha, caminando, al despertar. Por eso Hill recomienda estudiar un problema intensamente y luego soltarlo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué dice Hill sobre compartir los sueños y planes con personas negativas?',
        opciones: [
          'Es necesario para recibir crítica honesta que mejore el plan',
          'No importa porque tus planes son propios y la opinión ajena no puede afectarlos',
          'La opinión de quien no ha logrado lo que buscas no tiene valor y puede destruir el estado mental necesario para actuar',
          'Es recomendable compartirlos para crear accountability y comprometerte con otros',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Hill es enfático: los no-creyentes son ruido que destruye el estado mental necesario para actuar con confianza. La opinión valiosa es la de quien YA logró lo que buscas. Todo lo demás es interferencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los seis pasos de Hill para transformar el deseo en dinero?',
        opciones: [
          'Ahorrar, invertir, reinvertir, diversificar, proteger y donar',
          'Fijar cantidad exacta, determinar qué dar a cambio, establecer fecha, crear plan, escribirlo, leerlo dos veces al día',
          'Visualizar, afirmar, actuar, persistir, agradecer y compartir',
          'Estudiar, planificar, ejecutar, medir, ajustar y escalar',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Los seis pasos son: 1) Cantidad exacta, 2) Qué darás a cambio, 3) Fecha definida, 4) Plan concreto, 5) Escribirlo todo, 6) Leerlo dos veces al día con emoción. La especificidad y la emoción son las claves.',
      ),
    ],
  ),


  // ══════════════════════════════════════════════════════════
  //  LIBRO 8 — El Hombre en Busca de Sentido
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp08',
    titulo: 'El Hombre en Busca de Sentido',
    autor: 'Viktor Frankl',
    anio: '1946',
    emoji: '🕯️',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Sobreviviente del Holocausto, Frankl descubrió que la última libertad humana que nadie puede quitarnos es elegir nuestra actitud ante cualquier circunstancia. El sentido transforma el sufrimiento.',
    gemasRecompensa: 68,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Vida en los Campos',
        emoji: '⛓️',
        contenido: '''Viktor Frankl era un psiquiatra austriaco cuando fue deportado con su familia a los campos de concentración nazis. Pasó tres años en Auschwitz y otros campos. Su esposa, padres y hermano murieron. Él sobrevivió, y lo que observó cambió la psicología para siempre.

En las condiciones más extremas imaginables — hambre, frío, trabajo forzado, humillación sistemática, amenaza constante de muerte — Frankl observó un fenómeno que lo fascinó: la respuesta psicológica al sufrimiento variaba enormemente entre los prisioneros. Algunos se derrumbaban rápidamente. Otros mantenían una dignidad interior que parecía imposible dadas las circunstancias.

¿Qué determinaba quién sobrevivía psicológicamente? No la fortaleza física, no el estatus previo, no la inteligencia. Era algo invisible: la presencia o ausencia de un PROPÓSITO, de una razón para seguir viviendo.

Frankl observó prisioneros que daban su último mendrugo de pan a alguien más débil. Que consolaban a otros en condiciones donde tenían todo el derecho a ocuparse solo de su propia supervivencia. Que mantenían su humanidad cuando todas las condiciones externas la aplastaban. "A un hombre le pueden quitar todo, excepto la última de las libertades humanas: la libertad de elegir su propia actitud ante cualquier circunstancia dada."

Esta observación se convirtió en el fundamento de la logoterapia — la tercera escuela vienesa de psicoterapia — basada no en el placer (Freud) ni en el poder (Adler) sino en el SENTIDO como fuerza motivadora primaria del ser humano.''',
      ),
      CapituloResumen(
        titulo: 'La Logoterapia: La Terapia del Sentido',
        emoji: '🌱',
        contenido: '''La logoterapia parte de una premisa: el ser humano no busca primariamente placer ni poder — busca sentido. La falta de sentido — a la que Frankl llama "vacío existencial" — es la fuente de gran parte de la depresión, la agresión y la adicción en las sociedades modernas.

El sentido no se inventa — se descubre. No puedes decidir racionalmente que tu vida tiene sentido. El sentido te encuentra cuando estás genuinamente involucrada en algo más grande que tú misma: un amor, una obra, una causa, una persona que depende de ti.

Tres caminos hacia el sentido: 1) Crear una obra o realizar un acto. 2) Experimentar algo o encontrar a alguien (amor genuino). 3) La actitud que tomamos ante el sufrimiento inevitable. El tercero es el más profundo: incluso cuando ya no podemos crear ni amar, aún podemos ELEGIR cómo sufrir.

El sufrimiento con sentido es cualitativamente diferente al sufrimiento sin él. Frankl compara a un animal en el consultorio del veterinario: sufre igual que un humano, pero no puede entender por qué. El ser humano que comprende el propósito de su sufrimiento puede soportar casi cualquier cosa.

La "voluntad de sentido" no significa optimismo ingenuo. Frankl era brutalmente honesto sobre las condiciones del campo. Pero incluso en Auschwitz, podía imaginar a su esposa, podía contemplar el amanecer, podía decidir no ceder a la brutalidad del sistema. Esas pequeñas decisiones de mantener el sentido eran actos de resistencia y de vida.''',
      ),
      CapituloResumen(
        titulo: 'La Libertad Interior',
        emoji: '🕊️',
        contenido: '''La contribución más poderosa de Frankl a la psicología es su demostración experimental — con su propia vida como laboratorio — de que la libertad interior es indestructible si la elegimos conscientemente.

Los nazis podían controlar casi todo: la comida, el trabajo, el espacio, las relaciones, el destino físico. No podían controlar lo que Frankl pensaba, cómo interpretaba su sufrimiento, o qué significado le atribuía. Esa pequeña zona de libertad era, sin embargo, todo.

La "neurosis noogénica": Frankl observó que muchas enfermedades mentales modernas no tienen origen en conflictos psicológicos del pasado (como decía Freud) sino en la frustración existencial presente — la falta de sentido, propósito y valores auténticos. Tratar estas condiciones solo con fármacos o análisis del pasado es insuficiente.

La paradoja de la intención: una de las técnicas de la logoterapia. Cuando alguien sufre de insomnio ansioso, preocupándose por no poder dormir, Frankl propone pedirle que INTENTE no dormirse. Al quitarle la amenaza al sueño, la ansiedad desaparece y el sueño llega. Lo mismo aplica a muchas fobias y ansiedades: enfrentar el miedo deliberadamente lo disuelve.

El futuro como fuente de sentido: Frankl describe el poder de tener algo que esperar — el final de la guerra, el reencuentro con familia, terminar un libro. Las personas que perdían toda esperanza futura morían rápidamente, no necesariamente de causas físicas inmediatas. La mente puede anticipar el final cuando el futuro se vacía de sentido.''',
      ),
      CapituloResumen(
        titulo: 'El Amor como Camino al Sentido',
        emoji: '❤️',
        contenido: '''En las páginas más conmovedoras del libro, Frankl describe cómo, durante las marchas forzadas al trabajo en el frío de la madrugada, su mente se refugiaba en la imagen de su esposa. Conversaciones imaginarias con ella. Su sonrisa. Su mirada.

Esa imagen interior era más real y más poderosa para su supervivencia que cualquier condición externa. Y describe una revelación que tuvo en ese momento: "El amor es el único camino hacia lo más profundo de la personalidad de otro ser humano... Entendí la verdad de que el amor es el último y más alto objetivo al que puede aspirar el ser humano."

El amor no requiere la presencia física del ser amado para ser real. Frankl mantenía una conversación continua con su esposa, sin saber si ella seguía viva (murió en otro campo). La realidad de ese amor era totalmente independiente de las circunstancias externas.

Esta observación tiene implicaciones profundas para entender el duelo: el amor no termina cuando la persona física se va. La relación continúa en un plano diferente. Frankl no lo dice en términos espirituales — lo dice en términos psicológicos: el amor que has dado y recibido es permanente e indestructible.

El amor como responsabilidad: amar genuinamente significa ser responsable de la otra persona — no en el sentido de controlarla o poseerla, sino de cargar con la preocupación activa por su crecimiento y bienestar. Esta responsabilidad puede ser una fuente de sentido extraordinariamente poderosa.''',
      ),
      CapituloResumen(
        titulo: 'El Sentido del Sufrimiento',
        emoji: '🌅',
        contenido: '''Frankl establece con claridad una distinción que muchas filosofías del éxito moderno ignoran: el sufrimiento es inevitable e inseparable de la condición humana. La búsqueda del placer como objetivo de la vida está condenada al fracaso no porque el placer sea malo sino porque es inevitablemente temporal e insuficiente.

La paradoja de la felicidad: cuanto más la buscas directamente, más se escapa. La felicidad es efecto secundario de vivir con sentido — no un objetivo que puedas perseguir directamente. Frankl observó personas profundamente felices en las condiciones más extremas y personas profundamente miserables en condiciones de gran comodidad material.

El sufrimiento ineludible: Frankl distingue entre sufrimiento que puede eliminarse (hay que eliminarlo) y sufrimiento que es parte inevitable de la condición humana (hay que encontrarle sentido). Cuando sufrimos algo que no puede cambiar, la única libertad que queda es la de nuestra actitud hacia ese sufrimiento.

Los tres tipos de sufrimiento que Frankl identifica: el sufrimiento de la culpa (que puede transformarse en aprendizaje y crecimiento), el sufrimiento de la muerte (que puede transformarse en motivación para vivir plenamente ahora), y el sufrimiento de la incertidumbre (que puede transformarse en apertura a lo posible).

Frankl termina con una advertencia sobre el exceso de bienestar: una sociedad que elimina todo sufrimiento potencial produce personas incapaces de tolerar la más mínima dificultad y sin recursos internos para los desafíos inevitables. El carácter se forja en la adversidad. La pregunta no es cómo evitar el sufrimiento sino cómo encontrarle sentido cuando llega inevitablemente.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué observó Frankl que determinaba la supervivencia psicológica en los campos de concentración?',
        opciones: [
          'La fortaleza física y la capacidad de resistir las condiciones extremas',
          'El nivel educativo y la inteligencia previos a la deportación',
          'La presencia de un propósito o razón para seguir viviendo — un sentido',
          'Las relaciones de amistad formadas dentro de los mismos campos',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! No era la fortaleza física ni el estatus previo. Era la presencia de un sentido — algo o alguien por quien vivir — lo que determinaba quién mantenía su humanidad y resistencia psicológica.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la "última libertad" que nadie puede quitarle a un ser humano según Frankl?',
        opciones: [
          'La libertad de pensamiento y la capacidad de imaginar',
          'La libertad de elegir la propia actitud ante cualquier circunstancia dada',
          'La libertad de mantener la fe religiosa en cualquier condición',
          'La libertad de amar y ser amado independientemente del entorno',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Esta frase es el corazón del libro. Los nazis podían controlar casi todo — excepto cómo Frankl interpretaba su sufrimiento y qué significado le atribuía. Esa pequeña zona de libertad era, sin embargo, todo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los tres caminos hacia el sentido que identifica la logoterapia?',
        opciones: [
          'Trabajo, familia y espiritualidad',
          'Crear una obra, experimentar algo/alguien (amor), y elegir la actitud ante el sufrimiento inevitable',
          'Placer, poder y propósito',
          'Conocimiento, servicio y contemplación',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Tres caminos: crear algo (obra o acto), experimentar algo valioso o amar a alguien, y la actitud elegida ante el sufrimiento que no puede cambiarse. El tercero es el más profundo y siempre está disponible.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "neurosis noogénica" que identifica Frankl?',
        opciones: [
          'Una neurosis causada por conflictos religiosos o espirituales no resueltos',
          'Enfermedades mentales originadas en la frustración existencial: la falta de sentido, no en conflictos del pasado',
          'La neurosis causada por el exceso de pensamiento racional que bloquea las emociones',
          'Un tipo de ansiedad específica de las sociedades industrializadas y tecnológicas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Frankl observó que muchas condiciones modernas tienen su raíz en el vacío existencial — la falta de sentido y propósito — no en conflictos del pasado como decía Freud. Tratar estas condiciones requiere encontrar sentido, no solo analizar el pasado.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "paradoja de la intención" en la logoterapia?',
        opciones: [
          'La idea de que querer el éxito demasiado intensamente lo aleja',
          'Que enfrentar deliberadamente el miedo lo disuelve — como pedir al insomne que INTENTE no dormirse para quitar la ansiedad',
          'La contradicción entre el deseo de ser libre y la necesidad de estructura y rutina',
          'Que las intenciones conscientes frecuentemente producen el resultado opuesto al deseado',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Al pedirle al insomne que intente no dormirse, se quita la amenaza al sueño. La ansiedad desaparece y el sueño llega. Aplicado a fobias: enfrentar el miedo deliberadamente (en lugar de evitarlo) lo disuelve.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué descubrió Frankl sobre el amor durante las marchas forzadas en el frío?',
        opciones: [
          'Que el amor romántico es un lujo que solo existe en condiciones de comodidad',
          'Que la imagen interior de su esposa era una fuente real de fortaleza, independientemente de la presencia física',
          'Que el amor es imposible de mantener en condiciones de sufrimiento extremo',
          'Que el amor por la humanidad abstracta supera al amor personal en poder transformador',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Frankl mantenía conversaciones internas con su esposa sin saber si seguía viva. Esa realidad interior era más poderosa que las condiciones externas. El amor no requiere presencia física para ser una fuente de sentido y fortaleza.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Frankl dice que la felicidad no puede buscarse directamente?',
        opciones: [
          'Porque la felicidad es subjetiva y no puede definirse con precisión',
          'Porque la sociedad moderna ha corrompido nuestra comprensión de qué produce felicidad real',
          'Porque es un efecto secundario de vivir con sentido — no un objetivo que puedas perseguir directamente',
          'Porque la búsqueda de felicidad personal es inherentemente egoísta',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! La paradoja de la felicidad: cuanto más la buscas directamente, más se escapa. Las personas más felices que Frankl observó no buscaban felicidad — vivían con sentido. La felicidad llegaba como consecuencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue la logoterapia de Frankl del psicoanálisis de Freud?',
        opciones: [
          'La logoterapia usa medicamentos; el psicoanálisis solo usa conversación',
          'Frankl cree en el libre albedrío; Freud creía que los instintos determinan el comportamiento',
          'La logoterapia se enfoca en encontrar sentido en el futuro; el psicoanálisis en resolver conflictos del pasado',
          'La logoterapia es más breve; el psicoanálisis puede durar décadas',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Freud veía al ser humano impulsado por el placer y determinado por conflictos del pasado. Frankl veía al ser humano buscando sentido y orientado hacia el futuro. Son orientaciones radicalmente diferentes sobre qué mueve a las personas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué observó Frankl que ocurría cuando los prisioneros perdían toda esperanza de futuro?',
        opciones: [
          'Desarrollaban comportamientos violentos y destructivos hacia otros prisioneros',
          'Se volvían más espirituales y contemplativos, encontrando paz interior',
          'Morían rápidamente — incluso sin causa física inmediata — cuando el futuro se vaciaba de sentido',
          'Buscaban formar alianzas más fuertes con otros prisioneros para sobrevivir',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Frankl observó prisioneros que morían días después de perder la esperanza — sin enfermedad nueva evidente. La mente puede anticipar el final cuando el futuro se vacía de sentido. Tener algo que esperar era literalmente cuestión de vida o muerte.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la advertencia de Frankl sobre las sociedades que eliminan todo sufrimiento potencial?',
        opciones: [
          'Que se vuelven menos creativas porque la comodidad elimina la motivación para innovar',
          'Que producen personas incapaces de tolerar la mínima dificultad y sin recursos para los desafíos inevitables',
          'Que pierden su identidad cultural al homogeneizar las condiciones de vida',
          'Que generan desigualdad porque no todos pueden acceder al bienestar prometido',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El carácter se forja en la adversidad. Una sociedad que elimina toda dificultad produce fragilidad. La pregunta no es cómo evitar el sufrimiento — es inevitable — sino cómo encontrarle sentido cuando llega.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 9 — La Magia de Pensar en Grande
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp09',
    titulo: 'La Magia de Pensar en Grande',
    autor: 'David J. Schwartz',
    anio: '1959',
    emoji: '🔮',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'El tamaño de tu pensamiento determina el tamaño de tu éxito. Schwartz demuestra que pensar en grande no es arrogancia — es la habilidad práctica que separa las vidas ordinarias de las extraordinarias.',
    gemasRecompensa: 55,
    capitulos: const [
      CapituloResumen(
        titulo: 'Creer que se Puede Tener Éxito',
        emoji: '✨',
        contenido: '''Schwartz comienza con una observación que parece obvia pero tiene profundas implicaciones: la diferencia entre la persona que alcanza grandes cosas y la que no las alcanza raramente es el talento, la inteligencia o el origen. Es el TAMAÑO DE SU PENSAMIENTO.

La creencia en el propio éxito es el primer requisito. No como autoengaño o negación de la realidad, sino como expectativa genuina de que los problemas tienen solución, que las oportunidades existen, y que tú eres capaz de aprovecharlas. Esta creencia no nace — se cultiva.

La enfermedad de la "excusitis": la principal diferencia entre los que logran y los que no logran no es la capacidad — es el hábito de inventar excusas. Schwartz identifica los cuatro tipos más comunes: excusas de salud ("si mi salud fuera mejor"), excusas de inteligencia ("no soy suficientemente inteligente"), excusas de edad ("soy demasiado joven/vieja"), y excusas de suerte ("no tuve las oportunidades correctas").

La cura para la excusitis es la acción deliberada: cada vez que notes que estás construyendo una excusa, sustitúyela por la pregunta "¿qué puedo hacer AHORA con lo que tengo?". Esta pregunta redirige la energía de la justificación a la acción.

La trampa del pensamiento pequeño: muchas personas subestiman sistemáticamente sus capacidades. Se autoimponen límites que no existen externamente. Schwartz propone un experimento: por un mes, actúa como si creyeras que eres capaz de lograr más de lo que crees actualmente. Los resultados te sorprenderán.''',
      ),
      CapituloResumen(
        titulo: 'Pensar en Grande en la Práctica',
        emoji: '🚀',
        contenido: '''Pensar en grande se manifiesta en pequeñas decisiones cotidianas que acumulan resultados extraordinarios. No es un estado mental abstracto — es un conjunto de hábitos concretos.

El vocabulario del éxito: las personas que piensan en grande usan un lenguaje diferente. Hablan de oportunidades donde otros ven problemas. Dicen "puedo" donde otros dicen "no puedo". Describen sus metas como cuando, no si. Schwartz propone un experimento: por una semana, elimina completamente del vocabulario las frases "no puedo", "es imposible", "no hay manera". Observa qué sucede en tu pensamiento.

La mentalidad del "tamaño de la visión": las personas que logran grandes cosas piensan en grande desde el principio. No comienzan preguntando "¿puedo hacerlo?" sino "¿cómo lo haré?". No preguntan "¿tendré éxito?" sino "¿cuánto éxito?". Esta diferencia en la formulación de las preguntas produce diferencias radicales en los resultados.

La actitud ante el fracaso: los pensadores en grande no ven el fracaso como la prueba de que no pueden lograr algo — lo ven como información sobre qué no funciona. Edison no falló 10,000 veces al desarrollar la bombilla — encontró 10,000 maneras que no funcionaban. Cada intento era información útil.

Las acciones grandes comienzan con pensamientos grandes: antes de hacer, imagina. Antes de emprender, ve el resultado final claramente. Schwartz no propone ensoñación pasiva — propone usar la imaginación como herramienta de planificación: ver el destino claramente para poder elegir el camino.''',
      ),
      CapituloResumen(
        titulo: 'Construir Confianza y Destruir el Miedo',
        emoji: '🦁',
        contenido: '''El miedo es el mayor obstáculo para pensar en grande. Schwartz distingue entre el miedo racional (ante peligros reales) y el miedo social e irracional (miedo a fallar, a ser juzgada, a quedar en ridículo). El segundo tipo es aprendido y puede desaprenderse.

La acción destruye el miedo: la mayoría espera sentirse valiente antes de actuar. La valentía no precede a la acción — la sigue. Actúa a pesar del miedo y el miedo disminuye con cada acción tomada. La inacción, por el contrario, alimenta el miedo: la mente que no actúa tiene tiempo de construir escenarios de desastre.

La técnica de la "acción rápida": cuando notes el miedo paralizando una decisión, obliga a dar un primer paso pequeño inmediatamente. No el paso completo — solo el primero. Este acto rompe el ciclo de paralización y genera impulso.

La mentalidad de "actúa como si": actúa como si ya tuvieras la confianza que buscas. Camina como alguien segura. Habla como alguien segura. Toma decisiones como alguien segura. El cuerpo y la mente tienen una relación bidireccional — cambiar el comportamiento físico cambia el estado mental.

La importancia de rodearse de pensadores grandes: el ambiente mental es contagioso. Las personas que piensan en pequeño te jalan hacia abajo. Las que piensan en grande te elevan. No es snobismo — es reconocer que los límites de las personas cercanas tienden a convertirse en los tuyos propios.''',
      ),
      CapituloResumen(
        titulo: 'Las Actitudes que Producen Éxito',
        emoji: '🌟',
        contenido: '''Schwartz dedica gran parte del libro a las actitudes específicas que observó en personas exitosas. No eran grandes talentos — eran grandes actitudes cultivadas conscientemente.

La actitud del servicio: los más exitosos en cualquier campo se preguntan constantemente "¿cómo puedo servir mejor a las personas que dependen de mí?". No "¿qué puedo obtener?" sino "¿qué puedo dar?". Esta orientación hacia el servicio produce resultados extraordinarios porque las personas que más dan generalmente reciben más.

La actitud ante los problemas: los pensadores en grande ven los problemas como oportunidades disfrazadas. Cada problema resuelto crea valor. El negocio más exitoso es el que resuelve el problema más grande del mayor número de personas.

La actitud ante las personas: tratar a cada persona con quien interactúas como si fuera la persona más importante que conocerás hoy. Esto no es manipulación — es el reconocimiento de que todos merecen respeto genuino y que las relaciones son el activo más valioso de cualquier vida exitosa.

La actitud ante el trabajo: hacer siempre más de lo que te pagan para hacer. No como devoción ciega a los empleadores, sino como inversión en tu propio crecimiento. Cada acción de calidad que excede las expectativas construye tu reputación, tus habilidades y eventualmente tu compensación.

Schwartz concluye: el pensamiento grande no es arrogancia — es la disposición a creer que eres capaz de más, a actuar desde esa creencia, y a invitar a otros a creer también en su propio potencial. El tamaño de tu éxito estará siempre determinado por el tamaño de tus pensamientos.''',
      ),
      CapituloResumen(
        titulo: 'Liderazgo y El Camino hacia Adelante',
        emoji: '🧭',
        contenido: '''Pensar en grande inevitablemente lleva al liderazgo — no necesariamente de organizaciones sino de tu propia vida y, tarde o temprano, de las personas que te rodean. Schwartz dedica los capítulos finales a los hábitos de los líderes que piensan en grande.

Los líderes grandes piensan en el bienestar de los demás primero. No porque sean altruistas perfectos sino porque entienden que su propio éxito es inseparable del éxito de su equipo, su familia y su comunidad.

La visión a largo plazo: los pensadores en grande no optimizan para el día de hoy — toman decisiones con décadas en mente. "¿Cómo estará mi vida en 10 años si continúo en esta dirección?" Esta pregunta revela la dirección correcta con una claridad imposible de obtener pensando solo en el presente inmediato.

La perseverancia como hábito mental: Schwartz observó que los pensadores grandes simplemente no se rinden. No porque tengan más resistencia natural — es porque han desarrollado el hábito de reencuadrar los obstáculos como temporales y solucionables. El fracaso es solo información; el abandono es el único fracaso real.

El plan de acción personal: al final del libro, Schwartz propone construir un plan de 30 días para comenzar a pensar en grande. Incluye: identificar una meta importante, eliminar excusas específicas, tomar una acción significativa cada día, y revisar los resultados semanalmente.

La promesa de Schwartz: si aplicas consistentemente los principios del libro, en 30 días notarás cambios tangibles. En 90 días, tu vida habrá cambiado de manera reconocible. En un año, ya no reconocerás los límites que hoy te parecen inevitables.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es la "excusitis" según Schwartz y cuáles son sus cuatro tipos más comunes?',
        opciones: [
          'La tendencia a inventar excusas: de salud, inteligencia, edad y suerte',
          'El miedo excesivo al fracaso que paraliza toda acción',
          'La costumbre de compararse negativamente con personas más exitosas',
          'La procrastinación crónica causada por la perfección imposible',
        ],
        respuestaCorrecta: 0,
        explicacion: '¡Exacto! La excusitis es el hábito de inventar justificaciones para no actuar. Los cuatro tipos: "si mi salud...", "no soy inteligente", "soy muy joven/vieja", "no tuve suerte". Schwartz dice que la cura es redirigir esa energía a "¿qué puedo hacer AHORA?"',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué experimento propone Schwartz con el vocabulario durante una semana?',
        opciones: [
          'Usar solo palabras positivas y eliminar adjetivos negativos del vocabulario',
          'Hablar en tercera persona para ganar perspectiva sobre los propios problemas',
          'Eliminar completamente "no puedo", "es imposible" y "no hay manera" del vocabulario',
          'Describir todos los problemas como oportunidades cambiando las palabras usadas',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Eliminar el vocabulario del fracaso fuerza a la mente a buscar alternativas. "No puedo" cierra la búsqueda de soluciones. "¿Cómo podría?" la abre. El lenguaje no solo describe la realidad — la crea.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la relación entre el miedo y la acción según Schwartz?',
        opciones: [
          'Hay que esperar a sentirse valiente antes de actuar para que la acción sea efectiva',
          'El miedo siempre desaparece completamente antes de que una acción sea posible',
          'La valentía no precede a la acción — la sigue: actuar a pesar del miedo lo disminuye',
          'El miedo nunca desaparece y solo puede ignorarse con disciplina extrema',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! La mayoría espera sentirse valiente primero. Schwartz invierte esto: la valentía se construye actuando. Cada acción tomada a pesar del miedo reduce el miedo. La inacción lo alimenta.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia clave observa Schwartz entre cómo piensan las personas exitosas y las que no lo son?',
        opciones: [
          'Las exitosas trabajan más horas y con mayor disciplina',
          'Las exitosas preguntan "¿cómo lo haré?" no "¿podré hacerlo?", y "¿cuánto éxito?" no "¿tendré éxito?"',
          'Las exitosas tienen mejores redes de contactos desde el inicio de sus carreras',
          'Las exitosas toman más riesgos financieros y toleran mayor incertidumbre',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La formulación de la pregunta inicial determina todo. "¿Podré?" asume que quizás no. "¿Cómo?" asume que sí y busca el camino. Ese pequeño cambio produce diferencias radicales en los resultados.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué observó Schwartz sobre la orientación de las personas más exitosas hacia el servicio?',
        opciones: [
          'Las exitosas trabajan para organismos de beneficencia o causas sociales',
          'Se preguntan constantemente "¿cómo puedo servir mejor?" — no "¿qué puedo obtener?"',
          'El servicio a otros es una estrategia de marketing para construir reputación',
          'Solo se puede dar cuando ya se tiene — primero se debe acumular, luego servir',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La orientación hacia el servicio no es altruismo naif — es reconocer que las personas que más valor crean para otros generalmente reciben el mayor valor a cambio. "¿Cómo sirvo mejor?" produce resultados extraordinarios.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa "actúa como si" en la técnica de Schwartz?',
        opciones: [
          'Fingir que ya tienes el dinero y los recursos que deseas para atraerlos',
          'Comportarte como si ya tuvieras la confianza que buscas — el cuerpo y la mente tienen relación bidireccional',
          'Imitar exactamente los comportamientos de personas exitosas que admiras',
          'Actuar en el trabajo como si fueras el jefe para conseguir el ascenso más rápido',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El cuerpo y la mente influyen mutuamente. Cambiar el comportamiento físico (postura, lenguaje, decisiones) cambia el estado mental. No esperes sentirte segura para actuar segura — actúa segura y la seguridad vendrá.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la actitud de los pensadores grandes ante los problemas según Schwartz?',
        opciones: [
          'Los evitan siempre que sea posible para mantener el estado mental positivo',
          'Los delegan a otros más calificados para resolverlos',
          'Los ven como oportunidades disfrazadas — cada problema resuelto crea valor',
          'Los toleran como parte inevitable de la vida sin que afecten su bienestar',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! Los problemas son oportunidades disfrazadas. El negocio más exitoso resuelve el problema más grande del mayor número de personas. Busca el problema que más le duele a tu mercado y tendrás una oportunidad extraordinaria.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Schwartz dice que rodearse de personas que piensan en grande no es snobismo?',
        opciones: [
          'Porque el éxito compartido multiplica los recursos disponibles para todos',
          'Porque los límites de las personas cercanas tienden a convertirse en los propios',
          'Porque la competencia entre personas ambiciosas produce mejores resultados para todos',
          'Porque las personas exitosas tienen más contactos útiles para ofrecer',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El ambiente mental es contagioso. Las personas que piensan en pequeño, inconscientemente, establecen los límites de lo posible a tu alrededor. Las que piensan en grande expanden tu noción de lo posible. Elige tu ambiente deliberadamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la pregunta de visión a largo plazo que propone Schwartz?',
        opciones: [
          '"¿Qué decisión me hará ganar más dinero en los próximos 12 meses?"',
          '"¿Cómo estará mi vida en 10 años si continúo en esta dirección?"',
          '"¿Qué haría si supiera que no voy a fallar?"',
          '"¿Cuál es la cosa más importante que puedo hacer hoy?"',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! "¿Cómo estará mi vida en 10 años si continúo así?" revela la dirección real de tu trayectoria. Si la respuesta no te entusiasma, es la señal más clara de que necesitas un cambio de dirección. El largo plazo clarifica el presente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo define Schwartz el único fracaso real?',
        opciones: [
          'No alcanzar las metas económicas que uno se propuso',
          'Desilusionar a las personas que dependen de nosotros',
          'El abandono — los obstáculos son temporales e informativos, solo rendirse es fracaso definitivo',
          'No haber intentado suficientes estrategias antes de detenerse',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Los pensadores grandes reencuadran los obstáculos como temporales y solucionables. El fracaso da información. Solo el abandono es definitivo. La perseverancia no es una cualidad innata — es un hábito mental que se desarrolla.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 10 — Los Cuatro Acuerdos
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp10',
    titulo: 'Los Cuatro Acuerdos',
    autor: 'Don Miguel Ruiz',
    anio: '1997',
    emoji: '🌀',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Basado en la sabiduría tolteca, Ruiz revela cómo los acuerdos que hiciste en la infancia con el mundo crean tu realidad — y cómo cuatro nuevos acuerdos pueden liberarte completamente.',
    gemasRecompensa: 57,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Domesticación Humana',
        emoji: '🔗',
        contenido: '''Ruiz comienza con una idea perturbadora: desde el nacimiento, los seres humanos somos "domesticados" por la familia y la sociedad de la misma manera que domesticamos a los animales. A través de recompensas y castigos, aprendemos qué es aceptable y qué no, qué somos "permitidos" ser y qué no.

El SUEÑO DEL PLANETA es el mundo de acuerdos colectivos que la humanidad ha creado: reglas de comportamiento, creencias sobre lo correcto e incorrecto, lo posible e imposible. Este sueño existe antes de que nazcas y lo heredas sin elegirlo conscientemente.

Los ACUERDOS son las creencias que adoptaste como verdad durante la infancia: "soy buena en matemáticas pero mala en arte", "las personas no son de fiar", "el mundo es peligroso", "el amor duele". Nadie te preguntó si querías esas creencias — las absorbiste del ambiente.

Lo más problemático es que estos acuerdos continúan gobernando tu vida en la adultez, mucho después de que la situación que los generó ha desaparecido. Actúas desde creencias que aprendiste a los 5 años, en situaciones completamente diferentes.

La buena noticia: los acuerdos no son parte de tu naturaleza — son contratos que puedes renegociar. Puedes romper los viejos acuerdos que te limitan y establecer nuevos que te liberen. Los Cuatro Acuerdos son exactamente esos nuevos contratos con la realidad.''',
      ),
      CapituloResumen(
        titulo: 'Primer Acuerdo: Sé Impecable con tus Palabras',
        emoji: '🗣️',
        contenido: '''El primer acuerdo es el más difícil y el más poderoso. "Impecable" viene del latín "sin pecado" — sin ir en contra de ti misma. Las palabras son magia: una sola palabra puede cambiar una vida, liberar a alguien o destruirlo.

Las palabras son la herramienta con que creas tu realidad interior. Lo que te dices a ti misma todos los días — ese monólogo interior constante — se convierte en tu realidad. "Soy torpe", repetido suficientes veces, se convierte en verdad vivida.

El chisme como veneno: cuando hablas mal de alguien a espaldas suyas, plantas semillas de duda y negatividad en la mente de quien te escucha. Y también en la tuya. El chisme es una forma de magia negra que envenena a todos los que toca, incluida quien lo genera.

La impecabilidad de las palabras hacia ti misma: la crítica interna más destructiva es la que te diriges a ti misma. "Soy tan estúpida", "nunca puedo hacer nada bien", "soy demasiado gorda/flaca/vieja". Cada vez que te dices esto, estás usando magia negra contra ti misma.

Ser impecable con tus palabras no significa ser perfecta — significa usar las palabras deliberadamente, en dirección de la verdad y el amor, sin usarlas como arma ni contra ti misma ni contra otros. Este solo acuerdo, practicado consistentemente, transforma la vida.''',
      ),
      CapituloResumen(
        titulo: 'Segundo y Tercer Acuerdo: No Tomar Nada Personal, No Hacer Suposiciones',
        emoji: '🛡️',
        contenido: '''SEGUNDO ACUERDO: No tomar nada personalmente. Cuando alguien te insulta, te critica o te trata mal, tiene mucho más que ver con su propia realidad interior que contigo. Sus palabras son una proyección de su sueño personal.

Si alguien me dice "eres horrible", esa afirmación refleja su sistema de creencias, su estado emocional, su historia personal. No es información objetiva sobre mí. Cuando lo tomo personal, acepto el acuerdo de que su sueño de mí es real.

Este acuerdo no significa indiferencia: puedes escuchar el feedback con atención sin que tu paz interior dependa de su aprobación. Cuando ya no tomas nada personal, eres inmune a una enorme fuente de sufrimiento.

TERCER ACUERDO: No hacer suposiciones. La fuente de la mayoría de los conflictos humanos es la suposición: asumes que sabes lo que el otro piensa, quiere o siente, actúas basada en esa suposición, y creas un drama que nunca existió en la realidad.

Cuando en una relación algo no está claro, pregunta directamente. Parece simple y es profundamente difícil porque la mayoría teme preguntar directamente (miedo al rechazo, al conflicto). La suposición parece más segura — y es mucho más destructiva.

La combinación de los acuerdos 2 y 3 elimina la fuente de la mayor parte del drama interpersonal: dejas de interpretar las acciones de otros como comentarios sobre ti, y dejas de inventar historias sobre sus motivaciones.''',
      ),
      CapituloResumen(
        titulo: 'Cuarto Acuerdo: Haz Siempre lo Máximo',
        emoji: '💪',
        contenido: '''El cuarto acuerdo tiene una trampa que muchas personas no notan inmediatamente: "lo máximo" cambia cada momento. Lo máximo que puedes dar cuando estás enferma es diferente de lo máximo cuando estás descansada y entusiasta. Bajo ningún estándar externo absoluto — bajo el de tu capacidad real en este momento.

Cuando haces siempre lo máximo de acuerdo a tu estado real, no hay espacio para la autocrítica destructiva. ¿Hiciste lo máximo que podías hacer en ese momento? Entonces no hay de qué arrepentirse. El arrepentimiento surge de compararte con un estándar imposible.

La diferencia entre hacer lo máximo y el perfeccionismo: el perfeccionismo busca un estándar externo e imposible. Hacer lo máximo busca solo dar todo lo que tienes ahora. El primero produce agotamiento y vergüenza; el segundo produce satisfacción genuina.

Este acuerdo también transforma la relación con el fracaso: cuando algo no salió bien, la pregunta no es "¿soy un fracaso?" sino "¿di lo máximo de lo que tenía?" Si la respuesta es sí, el resultado es información, no condena.

La energía que se libera cuando dejas de juzgarte por no cumplir estándares imposibles es enorme. Esa energía puede redirigirse a crecer realmente, a aprender del error, y a aplicar ese aprendizaje la próxima vez que te encuentres en la misma situación.''',
      ),
      CapituloResumen(
        titulo: 'Romper los Viejos Acuerdos',
        emoji: '🔓',
        contenido: '''El mayor obstáculo para adoptar los cuatro acuerdos no es la complejidad — son los acuerdos que ya tienes. Cada creencia limitante que absorbiste en la infancia es un acuerdo que tiene poder en tu vida porque lo defiendes inconscientemente.

El guardián del sueño: Ruiz habla de una fuerza interior que protege los viejos acuerdos, los justifica, encuentra pruebas de su validez y resiste el cambio. Esta fuerza no es maliciosa — es el sistema que construiste para sobrevivir en tu infancia, ahora funcionando en modo automático.

El proceso de liberación: primero, identifica los acuerdos que más te dañan. No todos al mismo tiempo — eso es abrumador. Comienza con el acuerdo más doloroso: la creencia más limitante, la voz más cruel de tu crítico interior.

Luego, aplica los cuatro nuevos acuerdos a ese viejo acuerdo: 1) Habla impecablemente sobre él (sin dramatizarlo ni negarlo). 2) No lo tomes personal (tu viejo acuerdo no define lo que eres). 3) No hagas suposiciones sobre cuánto tiempo tomará cambiarlo. 4) Haz lo máximo para practicar el nuevo acuerdo cada día.

Ruiz concluye con una imagen hermosa: eres el artista de tu propia vida. No heredaste una naturaleza fija — heredaste un conjunto de acuerdos que puedes renegociar. El sueño que vives ahora puede reemplazarse por el sueño que eliges conscientemente. Esa es la promesa de los cuatro acuerdos.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es el "Sueño del Planeta" según Don Miguel Ruiz?',
        opciones: [
          'El sueño colectivo de la humanidad de alcanzar la paz y la armonía global',
          'El mundo de acuerdos colectivos — reglas, creencias, normas — que heredamos sin elegirlos conscientemente',
          'El estado alterado de conciencia que se alcanza en la meditación profunda',
          'La visión espiritual tolteca de la creación del universo',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El Sueño del Planeta es la realidad colectiva creada por los acuerdos acumulados de generaciones. Naces dentro de ese sueño y lo absorbes como si fuera la realidad objetiva — sin cuestionarlo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué significa ser "impecable" con las palabras según Ruiz?',
        opciones: [
          'No mentir nunca, ni en situaciones donde la mentira parecería más amable',
          'Usar las palabras deliberadamente en dirección de la verdad y el amor, sin usarlas como arma contra ti ni contra otros',
          'Pensar bien de todas las personas y expresarlo siempre verbalmente',
          'Elegir con cuidado cada palabra para que nadie pueda malinterpretarla',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! "Impecable" viene del latín "sin pecado" — sin ir contra uno mismo. Incluye el lenguaje interno: cada vez que te dices "soy estúpida", estás usando magia negra contra ti misma.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué el segundo acuerdo dice "no tomes nada personal"?',
        opciones: [
          'Porque las emociones te hacen menos productiva y eficiente',
          'Porque la indiferencia emocional produce mayor estabilidad mental a largo plazo',
          'Porque las acciones y palabras de otros reflejan su realidad interior, no la tuya — tomar personal sus proyecciones te hace esclava de su sueño',
          'Porque el ego es un obstáculo y las críticas externas lo alimentan',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! Cuando alguien te critica, te está proyectando su sistema de creencias. Si lo tomas personal, aceptas que su sueño de ti es verdad. No tomar personal es ser libre de las proyecciones ajenas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la fuente de la mayoría de los conflictos interpersonales según el tercer acuerdo?',
        opciones: [
          'La diferencia de valores fundamentales entre personas que no pueden reconciliarse',
          'Las suposiciones: actuar sobre lo que creemos que el otro piensa o siente sin preguntar directamente',
          'La competencia por recursos limitados que crea dinámicas de ganador-perdedor',
          'La falta de empatía que impide entender genuinamente el punto de vista ajeno',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las suposiciones crean dramas que no existen en la realidad. Crees que sabes lo que el otro piensa, actúas basada en esa suposición, y creas un conflicto innecesario. La solución radical: cuando no sepas, pregunta directamente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la trampa en el cuarto acuerdo "haz siempre lo máximo"?',
        opciones: [
          'Que "lo máximo" puede llevar al agotamiento si no se descansa adecuadamente',
          'Que "lo máximo" cambia cada momento — lo máximo cuando estás enferma es diferente al de cuando estás descansada',
          'Que buscar lo máximo puede producir perfeccionismo paralizante',
          'Que "lo máximo" es subjetivo y cada persona lo define de manera diferente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El cuarto acuerdo no es perfeccionismo — es dar todo lo que tienes en tu estado real de este momento. Eso libera del arrepentimiento: si diste lo máximo de lo que tenías, el resultado es información, no condena.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Ruiz el proceso de la "domesticación" humana?',
        opciones: [
          'Como un proceso biológico natural de desarrollo cerebral durante la infancia',
          'A través de recompensas y castigos que enseñan qué es "aceptable" y crean acuerdos sobre quiénes somos',
          'Como el proceso educativo formal que instala conocimiento y valores en los niños',
          'A través de la imitación de modelos adultos que el niño observa en su entorno',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Como los animales que domesticamos, los humanos somos entrenados con recompensas (aprobación, amor) y castigos (crítica, rechazo). Este entrenamiento instala creencias que persisten en la adultez sin cuestionamiento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Ruiz considera el chisme una forma de "veneno"?',
        opciones: [
          'Porque revela información confidencial que daña la reputación de quien se habla',
          'Porque crea alianzas malsanas basadas en la crítica negativa de terceros',
          'Porque planta semillas de negatividad en la mente de quien escucha Y envenena también a quien lo genera',
          'Porque contradice el principio tolteca de la honradez en las relaciones',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! El chisme es magia negra: envenena al destinatario, a la víctima ausente, Y a quien lo genera. Nadie queda limpio. La impecabilidad de las palabras incluye no usar el lenguaje para destruir la imagen de otros.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "guardián del sueño" que describe Ruiz?',
        opciones: [
          'La conciencia espiritual que protege al ser humano durante el sueño nocturno',
          'Una fuerza interior que protege y justifica los viejos acuerdos limitantes — el sistema de supervivencia que resiste el cambio',
          'El ego, en el sentido psicoanalítico freudiano, que defiende la identidad ante las amenazas',
          'El subconsciente que almacena y reproduce los patrones de comportamiento aprendidos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El guardián no es malicioso — es el sistema que construiste para sobrevivir en la infancia, ahora en modo automático. Cuando intentas cambiar un acuerdo viejo, el guardián encuentra razones para mantenerlo. Reconocerlo es el primer paso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué diferencia hay entre hacer "lo máximo" y el perfeccionismo según Ruiz?',
        opciones: [
          'El perfeccionismo es productivo; hacer lo máximo puede llevar a la mediocridad',
          'Hacer lo máximo busca un estándar real e interno; el perfeccionismo busca un estándar externo e imposible que produce vergüenza y agotamiento',
          'No hay diferencia real — ambos buscan excelencia pero con diferente intensidad',
          'El perfeccionismo es individual; hacer lo máximo también considera el bienestar de los demás',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El perfeccionismo compara con un estándar imposible y produce agotamiento y vergüenza. Hacer lo máximo te compara solo con tu capacidad real en este momento — y cuando das eso, no hay espacio para la autocrítica destructiva.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la promesa central de los cuatro acuerdos según Ruiz?',
        opciones: [
          'Alcanzar la iluminación espiritual y trascender el plano material de la existencia',
          'Eliminar todo sufrimiento de la vida a través de la práctica correcta de los cuatro principios',
          'Poder renegociar los acuerdos limitantes heredados y crear el sueño que eliges conscientemente',
          'Desarrollar poderes mentales que permiten manifestar cualquier realidad deseada',
        ],
        respuestaCorrecta: 2,
        explicacion: 'Eres el artista de tu propia vida. Los acuerdos que heredaste no definen tu naturaleza esencial — son contratos que puedes renegociar. El sueño que vives puede reemplazarse por el sueño que eliges. Esa es la promesa.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 11 — Mindset: La Actitud del Éxito
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp11',
    titulo: 'Mindset: La Actitud del Éxito',
    autor: 'Carol S. Dweck',
    anio: '2006',
    emoji: '🧬',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Décadas de investigación revelan que la creencia más determinante del éxito no es el talento — es si crees que tus capacidades son fijas o pueden desarrollarse. Este libro puede cambiar esa creencia.',
    gemasRecompensa: 62,
    capitulos: const [
      CapituloResumen(
        titulo: 'Los Dos Mindsets',
        emoji: '🔀',
        contenido: '''Carol Dweck es profesora de psicología en Stanford y lleva décadas estudiando la motivación y el éxito. Identificó que las personas operan desde uno de dos mindsets fundamentales que determinan prácticamente todos los aspectos de su vida.

El MINDSET FIJO (fixed mindset) cree que la inteligencia, el talento y las capacidades son rasgos innatos e inmutables. "Naces buena en matemáticas o no". "Tienes talento o no lo tienes". Las personas con mindset fijo pasan la vida tratando de DEMOSTRAR que son inteligentes o talentosas, y evitando situaciones donde podrían parecer que no lo son.

El MINDSET DE CRECIMIENTO (growth mindset) cree que la inteligencia, el talento y las capacidades pueden desarrollarse con esfuerzo, buenas estrategias y mentores. No cree que todos pueden ser Einstein — cree que la dedicación y el aprendizaje mejoran significativamente cualquier capacidad.

La diferencia es enorme en la práctica: ante un desafío difícil, el mindset fijo lo evita (porque fallar demostraría que no tiene capacidad). El mindset de crecimiento lo abraza (porque es una oportunidad de desarrollar más capacidad). Ante el fracaso, el mindset fijo se rinde y se siente definido por el fracaso. El mindset de crecimiento lo analiza y aprende.

La ciencia respalda el mindset de crecimiento: la neuroplasticidad ha demostrado que el cerebro puede generar nuevas conexiones y cambiar su estructura a través del aprendizaje y la práctica, a cualquier edad. "No puedo hacer X aún" es literalmente más preciso que "no puedo hacer X".''',
      ),
      CapituloResumen(
        titulo: 'Cómo se Desarrollan los Mindsets',
        emoji: '👶',
        contenido: '''Los mindsets se desarrollan en la infancia principalmente a través de CÓMO los adultos importantes en nuestra vida nos elogiaron. Esta fue la investigación más sorprendente de Dweck: el tipo de elogio que recibes puede instalar el mindset fijo incluso con las mejores intenciones.

El experimento con niños: Dweck dividió niños en dos grupos. Ambos resolvieron un rompecabezas fácil. Al primer grupo le dijeron "¡Qué inteligente eres!" Al segundo, "¡Qué bien trabajaste en eso!". Luego se les ofreció un rompecabezas más difícil.

Los resultados fueron dramáticos: los niños elogiados por ser inteligentes RECHAZARON el rompecabezas difícil. ¿Para qué arriesgarse a no parecer inteligentes? Los niños elogiados por el esfuerzo eligieron el difícil con entusiasmo. Querían aprender.

El elogio por la inteligencia instala el mindset fijo: si mi inteligencia es la razón de mi éxito, cualquier fracaso amenaza mi identidad como "persona inteligente". El elogio por el proceso (esfuerzo, estrategias, perseverancia) instala el mindset de crecimiento: el éxito viene de trabajar bien.

Implicación práctica: cuando quieras elogiar a alguien (especialmente a niños o personas bajo tu liderazgo), elogia el proceso: "Trabajaste muy duro en esto", "Me encanta que intentaste diferentes estrategias", "Fallaste pero seguiste intentando — eso es lo que más importa".''',
      ),
      CapituloResumen(
        titulo: 'Mindset en los Deportes, el Arte y la Educación',
        emoji: '🏆',
        contenido: '''Dweck estudió el mindset en múltiples dominios y encontró el mismo patrón: las personas más exitosas en cualquier campo son las que adoptaron el mindset de crecimiento ante el fracaso.

Los "genios naturales" del deporte: muchos atletas son identificados tempranamente como "prodigios naturales" y eso instala el mindset fijo. Cuando llegan a niveles donde el puro talento no alcanza, se derrumban porque no han desarrollado la mentalidad de perseverar ante el desafío.

Michael Jordan fue cortado de su equipo de preparatoria. Thomas Edison fue considerado "inadecuado" por sus profesores. Einstein no habló hasta los 4 años. La narrativa del "genio que siempre fue genio" borra deliberadamente los años de fracasos y esfuerzos que precedieron al éxito visible.

En la educación: estudiantes con mindset fijo evitan los cursos difíciles por miedo a bajar su promedio. Estudiantes con mindset de crecimiento buscan los cursos difíciles porque quieren crecer. A largo plazo, los segundos aprenden significativamente más.

La crítica y el mindset: personas con mindset fijo interpretan la crítica como ataque personal — un cuestionamiento de su valor o inteligencia. Personas con mindset de crecimiento buscan activamente feedback porque es información para mejorar. Esta diferencia sola explica gran parte de la diferencia en el desarrollo de habilidades a lo largo del tiempo.

En artes: Dweck cita el caso de músicos de jazz que deliberadamente tocan en situaciones más difíciles que su nivel actual (sesiones con músicos más avanzados) para crecer. El mindset fijo evita esa exposición por miedo al fracaso visible.''',
      ),
      CapituloResumen(
        titulo: 'Mindset en las Relaciones y el Liderazgo',
        emoji: '👥',
        contenido: '''El mindset tiene implicaciones profundas en las relaciones. Las personas con mindset fijo sobre las relaciones creen que "el amor verdadero debe ser fácil" y que la necesidad de esfuerzo o comunicación indica que algo está fundamentalmente mal.

Las relaciones con mindset fijo: buscan la pareja perfecta (que no requiera trabajo), interpretan los conflictos como señales de incompatibilidad, y huyen en lugar de resolver. El resultado: una serie de relaciones que terminan justo cuando se vuelven complejas.

Las relaciones con mindset de crecimiento: entienden que las relaciones requieren trabajo y que los conflictos son oportunidades de conocerse mejor y comunicarse más profundamente. El amor no es un estado que se tiene — es una práctica que se desarrolla.

El mindset en el liderazgo: los líderes con mindset fijo necesitan demostrar constantemente su superioridad, temen contratar personas más brillantes, y responden a las críticas con defensividad. Los líderes con mindset de crecimiento buscan activamente personas más capaces que ellos en áreas específicas, crean culturas donde el error es aprendizaje, y modelan la vulnerabilidad ante el no-saber.

El CEO del mindset fijo crea organizaciones que dejan de aprender. El CEO del mindset de crecimiento crea organizaciones que se adaptan y mejoran continuamente. Dweck cita casos concretos de empresas famosas que colapsaron por la cultura de mindset fijo instalada por sus líderes.''',
      ),
      CapituloResumen(
        titulo: 'Cambiar tu Mindset',
        emoji: '🦋',
        contenido: '''El mensaje más esperanzador del libro es que el mindset puede cambiarse. No es un rasgo fijo (lo que sería irónico dado el tema del libro) — es un patrón de pensamiento que puede actualizarse con conciencia y práctica.

El primer paso es reconocer tu propia voz de mindset fijo: "¿soy suficientemente buena para esto?", "¿y si fallo y todos ven que no soy tan capaz?", "si tuviera que esforzarme tanto, quizás no soy naturalmente buena en esto". Estas son las frases del mindset fijo que te alejan de los desafíos que más podrían hacerte crecer.

La técnica del "todavía": cada vez que digas "no puedo hacer X", añade "todavía". "No puedo hablar en público todavía". "No entiendo bien las inversiones todavía". Este simple añadido cambia la frase de un estado fijo a un proceso en desarrollo.

Reencuadrar el fracaso: cuando algo no sale como esperabas, en lugar de preguntar "¿qué dice esto de mi capacidad?", pregunta "¿qué puedo aprender de esto?". El fracaso deja de ser información sobre quién eres y se convierte en información sobre qué puedes mejorar.

Buscar desafíos deliberadamente: el mindset de crecimiento se fortalece eligiendo regularmente situaciones donde no eres la más competente de la sala. Donde tendrás que esforzarte genuinamente. Donde habrá riesgo de error visible. Esta práctica deliberada re-entrena la respuesta al desafío de evitación a curiosidad.

Dweck termina con su descubrimiento más esperanzador: enseñar el concepto del mindset a niños produce cambios medibles en su motivación y rendimiento en semanas. El conocimiento de que el cerebro cambia con el esfuerzo es transformador por sí mismo.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la diferencia fundamental entre el mindset fijo y el de crecimiento?',
        opciones: [
          'El mindset fijo es pesimista; el de crecimiento es optimista sobre el futuro',
          'El mindset fijo cree que las capacidades son innatas e inmutables; el de crecimiento cree que pueden desarrollarse con esfuerzo',
          'El mindset fijo es más común en niños; el de crecimiento se desarrolla con la madurez',
          'El mindset fijo busca estabilidad; el de crecimiento busca cambio constante',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Esta distinción determina prácticamente todo: cómo enfrentas los desafíos, cómo interpretas el fracaso, si buscas o evitas las situaciones difíciles. No es pesimismo vs. optimismo — es una teoría sobre la naturaleza de las capacidades humanas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué tipo de elogio instala el mindset fijo según el experimento de Dweck?',
        opciones: [
          'El elogio excesivo que infla el ego del niño de manera irreal',
          'El elogio por la inteligencia ("¡qué inteligente!") que hace al niño evitar desafíos para proteger esa identidad',
          'El elogio dado frente a otros que crea competencia y comparación',
          'El elogio condicionado a resultados perfectos que instala el miedo al error',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! "¡Qué inteligente eres!" dice que el éxito viene de ser inteligente (rasgo fijo). Entonces cualquier fracaso amenaza esa identidad — y el niño empieza a evitar situaciones donde podría no parecer inteligente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué tipo de elogio instala el mindset de crecimiento?',
        opciones: [
          'El elogio frecuente e incondicional que construye autoestima sólida',
          'El elogio comparativo que muestra al niño que es mejor que sus compañeros',
          'El elogio por el proceso: esfuerzo, estrategias usadas y perseverancia ante la dificultad',
          'El elogio diferido que solo se da cuando se alcanzan metas importantes',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! "Trabajaste muy duro", "me encanta que intentaste diferentes estrategias", "fallaste pero seguiste" — este elogio enseña que el éxito viene del proceso, no de la capacidad innata. Eso libera al niño para enfrentar desafíos sin miedo al fracaso.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo interpretan el fracaso las personas con mindset fijo vs. mindset de crecimiento?',
        opciones: [
          'Fijo: oportunidad de aprendizaje; crecimiento: señal de falta de capacidad',
          'Fijo: se define por él y puede rendirse; crecimiento: lo analiza como información y aprende',
          'Ambos lo interpretan negativamente pero el de crecimiento se recupera más rápido',
          'No hay diferencia en la interpretación — la diferencia está en cómo responden emocionalmente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El mindset fijo interpreta el fracaso como evidencia de falta de capacidad ("no soy suficientemente inteligente"). El de crecimiento lo ve como información sobre qué mejorar. Esta diferencia determina si el fracaso paraliza o enseña.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué evidencia científica respalda el mindset de crecimiento?',
        opciones: [
          'Estudios de gemelos que demuestran que las capacidades no son completamente genéticas',
          'La neuroplasticidad: el cerebro genera nuevas conexiones y cambia con el aprendizaje y la práctica, a cualquier edad',
          'Estadísticas de rendimiento laboral que muestran correlación con la actitud ante el esfuerzo',
          'Experimentos de hipnosis que demuestran que las creencias sobre el talento son maleables',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La neuroplasticidad es la evidencia más poderosa: el cerebro literalmente cambia su estructura con el aprendizaje. "No puedo hacer X todavía" es más preciso que "no puedo hacer X" — tu cerebro puede aprender casi cualquier cosa con práctica suficiente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo afecta el mindset fijo a las relaciones románticas?',
        opciones: [
          'Hace que las personas con mindset fijo sean más leales y comprometidas',
          'Produce la creencia de que el amor verdadero debe ser fácil — el esfuerzo indica incompatibilidad, lo que lleva a huir en lugar de resolver',
          'Genera mayor dependencia emocional porque la persona teme no poder ser amada por otra persona',
          'No tiene impacto significativo en las relaciones — el mindset afecta principalmente el ámbito laboral',
        ],
        respuestaCorrecta: 1,
        explicacion: 'El mindset fijo en relaciones cree que "si es el amor verdadero, será fácil". Los conflictos se interpretan como incompatibilidad fundamental. El resultado: abandonar relaciones justo cuando se vuelven complejas, en lugar de crecer juntos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la técnica del "todavía" que propone Dweck?',
        opciones: [
          'Esperar un tiempo determinado antes de tomar decisiones importantes',
          'Añadir "todavía" a cualquier "no puedo": "no puedo hacer X todavía" — cambia un estado fijo a un proceso en desarrollo',
          'Practicar paciencia ante los resultados que tardan más de lo esperado',
          'Completar una tarea parcialmente y terminarlo en la siguiente sesión para mantener el impulso',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! "No puedo hacer X" declara un estado permanente. "No puedo hacer X TODAVÍA" declara un proceso. Ese pequeño cambio lingüístico cambia la relación con la capacidad de algo cerrado a algo abierto al desarrollo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué característica define a los líderes con mindset de crecimiento?',
        opciones: [
          'Toman decisiones más rápidamente porque confían en sus capacidades innatas',
          'Crean culturas donde el error es aprendizaje, buscan personas más capaces en áreas específicas, y modelan la vulnerabilidad ante el no-saber',
          'Establecen estándares muy altos y no toleran el fracaso para mantener la excelencia',
          'Se enfocan en fortalecer a las personas que ya son talentosas en lugar de desarrollar a las que no lo son',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El líder con mindset de crecimiento no necesita ser el más inteligente en la sala — necesita que el equipo aprenda y mejore. Por eso busca personas más capaces, celebra el aprendizaje del error, y admite cuando no sabe algo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Dweck recomienda buscar deliberadamente situaciones donde no eres la más competente?',
        opciones: [
          'Para desarrollar humildad y apreciar las capacidades de los demás',
          'Porque el esfuerzo máximo solo ocurre cuando estás por debajo del nivel requerido',
          'Para re-entrenar la respuesta al desafío de evitación a curiosidad, fortaleciendo el mindset de crecimiento',
          'Porque el cerebro aprende mejor en situaciones de ligera frustración',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! El mindset de crecimiento se fortalece practicándolo. Buscar deliberadamente la incomodidad del desafío — donde tendrás que esforzarte y podrías fallar — re-entrena la respuesta de la mente de huida a curiosidad.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál fue el descubrimiento más esperanzador de Dweck sobre enseñar el concepto de mindset?',
        opciones: [
          'Que los niños aprenden el concepto muy fácilmente antes de los 7 años',
          'Que enseñar el concepto a niños produce cambios medibles en motivación y rendimiento en semanas',
          'Que el mindset de crecimiento se transmite genéticamente de padres a hijos',
          'Que adultos mayores muestran los cambios de mindset más dramáticos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Solo aprender que el cerebro cambia con el esfuerzo — la neuroplasticidad — produce cambios medibles en motivación y rendimiento de niños en semanas. El conocimiento correcto sobre cómo funciona la mente transforma el comportamiento.',
      ),
    ],
  ),


  // ══════════════════════════════════════════════════════════
  //  LIBRO 15 — Despertando al Gigante Interior
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp15',
    titulo: 'Despertando al Gigante Interior',
    autor: 'Tony Robbins',
    anio: '1991',
    emoji: '🦁',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Tienes un gigante dormido dentro de ti. Robbins entrega las herramientas concretas para dominar tus emociones, tus creencias, tus decisiones y tu destino — sin excusas.',
    gemasRecompensa: 63,
    capitulos: const [
      CapituloResumen(
        titulo: 'Las Decisiones que Forman el Destino',
        emoji: '⚡',
        contenido: '''Robbins comienza con una premisa audaz: la calidad de tu vida está determinada por la calidad de tus decisiones. No por tu pasado, no por tu herencia, no por las circunstancias — por las decisiones que tomas momento a momento.

La mayoría de las personas cree que su vida es el resultado de lo que les pasa. Robbins propone la idea opuesta: tu vida es el resultado de las decisiones que tomas sobre lo que te pasa. Dos personas en la misma circunstancia difícil pueden tomar decisiones radicalmente diferentes y crear vidas radicalmente diferentes.

El poder de la decisión: cada vez que tomas una decisión clara y comprometida, cambias la dirección de tu vida. Las personas que se estancan generalmente no han tomado la decisión de cambiar — han tomado la decisión de "intentar cambiar", que es completamente diferente. "Intentaré" siempre tiene la puerta trasera del fracaso abierta.

Las tres decisiones que controlan tu vida: 1) En qué te enfocas. 2) Qué significado le das a lo que te enfocas. 3) Qué harás. Cambiar cualquiera de estas tres cambia el resultado. Dos personas en el mismo accidente de tráfico: una se enfoca en la tragedia y encuentra significado en la victimización. La otra se enfoca en la supervivencia y encuentra significado en la gratitud.

Robbins propone el concepto de DECISIÓN IRREVOCABLE: cuando no hay vuelta atrás, el cerebro deja de gastar energía en la vacilación y la redirecciona hacia encontrar cómo avanzar. Quemar los barcos no es locura — es la forma más efectiva de comprometer todos los recursos hacia el objetivo.''',
      ),
      CapituloResumen(
        titulo: 'Dominar las Emociones',
        emoji: '🌊',
        contenido: '''Robbins propone que las emociones no son algo que te sucede — son algo que produces. La mayoría actúa como si las emociones llegaran desde afuera: "me hizo enojar", "me deprimí", "me puse ansiosa". En realidad, TÚ produces esas emociones a través de tu fisiología y tu enfoque.

La fisiología y las emociones: la postura, la respiración, el movimiento del cuerpo determinan directamente el estado emocional. Prueba esto: pon tu cuerpo en la postura de alguien deprimido (hombros caídos, mirada al suelo, respiración lenta y superficial). ¿Cómo te sientes? Ahora pon tu cuerpo en la postura de alguien confiado y entusiasta. Las emociones siguen al cuerpo.

El "estado pico": Robbins habla del estado de máximo rendimiento — alta energía, enfoque total, entusiasmo genuino. No es algo que esperas sentir — es algo que aprendes a producir. A través de música, movimiento, recuerdos de momentos poderosos, o rituales específicos, puedes acceder a ese estado de forma deliberada.

Las creencias como filtro emocional: dos personas en la misma situación no sienten lo mismo porque sus creencias sobre lo que significa la situación son diferentes. El significado que das a los eventos — no los eventos mismos — determina tus emociones.

La técnica del cambio de patrón: cuando notes que estás en un estado emocional que no te sirve, interrumpe el patrón físicamente (da un salto, di algo absurdo en voz alta, mueve el cuerpo de una manera inesperada). Esta interrupción física quiebra el patrón emocional y crea el espacio para elegir un estado diferente.''',
      ),
      CapituloResumen(
        titulo: 'El Sistema de Creencias',
        emoji: '🏛️',
        contenido: '''Robbins dedica gran parte del libro a las creencias porque las considera el sistema operativo de la vida. Tus creencias determinan qué ves (filtras la realidad a través de ellas), qué intentas (no intentas lo que crees imposible), y qué persiste cuando hay dificultad.

Las creencias limitantes más comunes: "no soy suficientemente inteligente/bonita/joven/vieja para X", "el dinero es difícil de conseguir", "el éxito requiere sacrificar la familia", "las relaciones siempre terminan mal". Cada una de estas creencias produce comportamientos que la confirman.

Cómo se forman las creencias: a través de experiencias repetidas, la opinión de personas importantes en tu vida, y la emoción asociada a ciertas experiencias. Las creencias más arraigadas son las formadas en momentos de alta carga emocional.

El proceso de cambio de creencias requiere tres pasos: 1) Cuestionar la certeza de la creencia limitante ("¿es absolutamente cierto que no soy suficientemente inteligente? ¿Dónde está la evidencia?"). 2) Encontrar contraejemplos de la creencia. 3) Instalar una creencia alternativa que sea más útil Y razonablemente verdadera.

Las "creencias de referencia" son las más poderosas para el cambio: "Cada problema tiene una solución", "Mi pasado no dicta mi futuro", "Cada fracaso me acerca al éxito", "Soy capaz de aprender lo que necesito aprender". Estas meta-creencias cambian toda la estructura de cómo enfrentes los desafíos.''',
      ),
      CapituloResumen(
        titulo: 'Los Seis Necesidades Humanas',
        emoji: '🔮',
        contenido: '''Robbins presenta su modelo de las seis necesidades humanas fundamentales — una de sus contribuciones más originales. Todos los comportamientos humanos, por más extraños que parezcan, son intentos de satisfacer estas seis necesidades.

Las cuatro necesidades de la personalidad: 1) CERTEZA (necesitamos saber que podemos evitar el dolor y lograr placer — produce comodidad pero en exceso crea estancamiento). 2) VARIEDAD (necesitamos desafío e imprevisibilidad — en exceso produce caos). 3) IMPORTANCIA (necesitamos sentir que somos especiales y únicos). 4) AMOR/CONEXIÓN (necesitamos amor y conexión con otros).

Las dos necesidades del espíritu: 5) CRECIMIENTO (necesitamos estar en expansión continua). 6) CONTRIBUCIÓN (necesitamos dar más allá de nosotras mismas).

La clave del modelo: todos satisfacemos las mismas seis necesidades pero usamos medios muy diferentes — algunos útiles, otros destructivos. La adicción satisface certeza (siempre funciona), variedad (altera el estado), importancia (la adicción se convierte en identidad) y conexión (con la sustancia o la comunidad). Entender qué necesidad satisface un comportamiento es el primer paso para cambiarlo.

El orden de prioridad de las necesidades varía por persona y determina el carácter. La persona que prioriza certeza evitará riesgos. La que prioriza importancia buscará destacar. Conocer tus necesidades prioritarias te permite entender tus patrones más profundos.''',
      ),
      CapituloResumen(
        titulo: 'Las Preguntas que Cambian Vidas',
        emoji: '❓',
        contenido: '''Una de las ideas más prácticas del libro: las preguntas que te haces a ti misma determinan en qué te enfocas, y en qué te enfocas determina cómo te sientes y qué haces. Cambiar las preguntas cambia la vida.

Las preguntas disempowering (que te quitan poder): "¿Por qué siempre me pasa esto a mí?", "¿Por qué soy tan mala en esto?", "¿Qué pasa si fallo?". Estas preguntas dirigen el enfoque hacia problemas, limitaciones y catástrofes futuras. El cerebro buscará respuestas y las encontrará.

Las preguntas empowering (que te dan poder): "¿Qué hay de bueno en esta situación?", "¿Qué puedo aprender de esto?", "¿Cómo puedo usar esto a mi favor?", "¿Qué pequeña acción puedo tomar ahora mismo?". Estas dirigen el enfoque hacia recursos, aprendizaje y acciones posibles.

Las preguntas matutinas de Robbins: cada mañana, hazte estas preguntas (y respóndelas con emoción genuina): ¿Qué estoy feliz de tener en mi vida? ¿Qué estoy emocionada de tener? ¿Qué estoy orgullosa de haber hecho? ¿Qué estoy agradecida de tener? ¿Qué me comprometo a hacer hoy? Este ritual de 5 minutos establece un estado mental positivo que colorea todo el día.

El lenguaje como creador de realidad: las palabras que usas para describir tu experiencia la intensifican o la suavizan. No es lo mismo decir "estoy devastada" que "estoy un poco molesta". No es lo mismo "es un problema enorme" que "es un desafío interesante". Robbins propone un vocabulario transformacional: reemplazar palabras de intensidad emocional negativa por equivalentes más neutros o positivos.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál es la premisa central de Robbins sobre las decisiones y el destino?',
        opciones: [
          'El destino está determinado por las circunstancias y el origen de cada persona',
          'La calidad de la vida está determinada por la calidad de las decisiones — no por el pasado ni las circunstancias',
          'Las decisiones más importantes son las que tomamos en la infancia temprana',
          'El destino está escrito pero las decisiones determinan qué tan felices somos en él',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Tu vida es el resultado de las decisiones que tomas sobre lo que te pasa — no de lo que te pasa. Dos personas en la misma circunstancia difícil pueden crear vidas completamente diferentes con sus decisiones.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué "intentaré cambiar" es diferente a "decido cambiar" según Robbins?',
        opciones: [
          'No hay diferencia real — ambas expresan el mismo compromiso con el cambio',
          '"Intentaré" deja abierta la puerta del fracaso; "decido" es un compromiso irrevocable sin salida trasera',
          '"Intentaré" es más honesto y produce mejores resultados porque no promete lo imposible',
          '"Decido" activa la emoción mientras que "intentaré" solo activa el pensamiento',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! "Intentaré" siempre tiene la posibilidad implícita de "no logré" sin costo. "Decido" quema los barcos — no hay vuelta atrás. El cerebro deja de gastar energía en la vacilación y la redirige hacia cómo avanzar.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo afecta la fisiología a las emociones según Robbins?',
        opciones: [
          'Las emociones afectan la fisiología pero no al revés — el cuerpo solo refleja el estado mental',
          'La postura, respiración y movimiento del cuerpo determinan directamente el estado emocional — la relación es bidireccional',
          'La fisiología afecta las emociones solo en condiciones de estrés extremo',
          'La fisiología determina la energía pero no la calidad emocional específica',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Pon tu cuerpo en postura de depresión y te sentirás deprimida. Pon tu cuerpo en postura de confianza y te sentirás confiada. La relación es bidireccional — cambiar el cuerpo cambia la mente.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las seis necesidades humanas fundamentales según Robbins?',
        opciones: [
          'Dinero, salud, amor, propósito, seguridad y libertad',
          'Certeza, variedad, importancia, amor/conexión, crecimiento y contribución',
          'Supervivencia, seguridad, pertenencia, estima, autorrealización y trascendencia',
          'Placer, poder, afiliación, logro, curiosidad y significado',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Las cuatro de la personalidad: certeza, variedad, importancia, amor/conexión. Las dos del espíritu: crecimiento y contribución. Todos los comportamientos humanos son intentos de satisfacer estas seis necesidades.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo explica el modelo de las seis necesidades una conducta destructiva como la adicción?',
        opciones: [
          'La adicción es un error de juicio que no tiene relación con las necesidades fundamentales',
          'Satisface múltiples necesidades: certeza (siempre funciona), variedad (altera el estado), importancia (identidad) y conexión',
          'La adicción solo satisface la necesidad de variedad y escape de la realidad cotidiana',
          'Es una enfermedad cerebral sin relación con las necesidades psicológicas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Entender qué necesidades satisface un comportamiento destructivo es el primer paso para cambiarlo. Si la adicción satisface certeza, variedad, importancia y conexión, hay que encontrar fuentes alternativas que satisfagan esas mismas necesidades de manera constructiva.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre preguntas "disempowering" y "empowering"?',
        opciones: [
          'Las empowering son más largas y detalladas; las disempowering son preguntas cortas y simples',
          'Las disempowering dirigen el enfoque a problemas y limitaciones; las empowering hacia recursos, aprendizaje y acciones posibles',
          'Las empowering siempre tienen respuestas positivas; las disempowering no tienen respuestas útiles',
          'Las disempowering son preguntas sobre el pasado; las empowering son siempre sobre el futuro',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! "¿Por qué siempre me pasa esto?" enfoca en el problema y el victimismo. "¿Qué puedo aprender de esto?" enfoca en recursos y acción. El cerebro busca respuestas a las preguntas que le haces — elige las preguntas que te dan poder.',
      ),
      const PreguntaLibro(
        enunciado: '¿En qué consiste el ritual de las preguntas matutinas de Robbins?',
        opciones: [
          'Meditar 20 minutos y luego escribir en un diario de gratitud',
          'Hacerse cada mañana preguntas de gratitud, orgullo y emoción para establecer un estado mental positivo',
          'Revisar las metas del año y confirmar las acciones del día antes de levantarse',
          'Leer afirmaciones positivas en voz alta frente al espejo cada mañana',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Preguntas como "¿qué estoy feliz de tener?", "¿de qué estoy orgullosa?" y "¿qué me comprometo a hacer hoy?" — respondidas con emoción genuina — establecen el tono mental del día en 5 minutos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué efecto tienen las palabras que usamos para describir experiencias según Robbins?',
        opciones: [
          'Las palabras son solo etiquetas y no cambian la experiencia subyacente',
          'Intensifican o suavizan la experiencia emocional — "devastada" vs. "algo molesta" es una experiencia diferente',
          'Las palabras afectan la comunicación con otros pero no el estado interno propio',
          'Solo importan las palabras que usamos con otros — el monólogo interno no tiene efecto real',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! El vocabulario crea realidad. "Estoy devastada" activa una respuesta emocional mucho más intensa que "estoy algo molesta". Robbins propone transformar deliberadamente el vocabulario emocional negativo para reducir el sufrimiento innecesario.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son las tres decisiones que controlan la vida según Robbins?',
        opciones: [
          'Dónde vivir, con quién relacionarse y qué trabajo tener',
          'En qué te enfocas, qué significado le das a ese enfoque, y qué harás al respecto',
          'Qué creer, qué valorar y qué metas perseguir',
          'Cómo reaccionar al pasado, al presente y al futuro',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Estas tres decisiones determinan todo. El enfoque filtra la realidad. El significado determina la emoción. La acción determina el resultado. Cambia cualquiera de las tres y cambias el resultado de cualquier situación.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Robbins dice que quemar los barcos no es locura sino estrategia?',
        opciones: [
          'Porque los riesgos extremos producen las mayores recompensas posibles',
          'Porque la decisión irrevocable elimina la vacilación y redirige toda la energía hacia cómo avanzar',
          'Porque demostrar compromiso total inspira a otros a apoyarte más intensamente',
          'Porque el miedo extremo activa recursos mentales que normalmente están dormidos',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Cuando no hay vuelta atrás, el cerebro deja de dividir su energía entre "¿seguir o no seguir?" y la redirige completamente hacia "¿cómo avanzo?". La decisión irrevocable es la forma más efectiva de comprometer todos tus recursos hacia un objetivo.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 17 — El Don de la Imperfección
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp17',
    titulo: 'El Don de la Imperfección',
    autor: 'Brené Brown',
    anio: '2010',
    emoji: '💫',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'Basado en años de investigación sobre la vulnerabilidad, Brené Brown revela que la vida plena no viene de la perfección sino de tener el coraje de ser auténticamente imperfecta.',
    gemasRecompensa: 60,
    capitulos: const [
      CapituloResumen(
        titulo: 'La Vergüenza y la Autenticidad',
        emoji: '🌱',
        contenido: '''Brené Brown es investigadora de la Universidad de Houston que pasó años estudiando la vergüenza, la vulnerabilidad y la autenticidad. Lo que descubrió fue contraintuitivo y transformador: las personas que describían vivir una vida plena y significativa tenían una cosa en común — estaban dispuestas a ser vulnerables.

La VERGÜENZA es el sentimiento de que no somos suficientemente buenos para la conexión y el amor. No la culpa ("hice algo malo") sino la vergüenza ("soy algo malo"). La vergüenza opera en el silencio y el secreto — crece cuando no la nombramos y se debilita cuando la compartimos con alguien de confianza.

La AUTENTICIDAD no es un estado que tienes o no tienes — es una práctica. Es la elección diaria de mostrar quién realmente eres en lugar de la versión que crees que los demás esperan. Esta elección requiere coraje porque implica el riesgo de no ser aceptada tal como eres.

Brown define el coraje con su raíz latina: cor (corazón). El coraje original era "contar la historia de quién eres con todo tu corazón". No el coraje de los superhéroes — el coraje ordinario y cotidiano de ser honesta sobre quién eres.

La paradoja de la perfección: las personas que buscan la perfección como escudo contra el juicio ajeno acaban más expuestas a él. La perfección nunca se alcanza y el proceso de perseguirla constantemente demuestra el miedo que se intenta ocultar. La imperfección genuinamente abrazada es más fuerte que la perfección anhelada.''',
      ),
      CapituloResumen(
        titulo: 'La Resiliencia ante la Vergüenza',
        emoji: '🛡️',
        contenido: '''Brown identifica los comportamientos que las personas "wholehearted" (de corazón entero) practican para desarrollar resiliencia ante la vergüenza. Son prácticas activas, no rasgos de carácter fijos.

Reconocer la vergüenza y entender sus detonadores: la vergüenza tiene detonadores específicos — áreas donde somos más vulnerables a la crítica. Para las mujeres, Brown encontró que los detonadores más comunes son la apariencia, el cuerpo, la maternidad, el trabajo, la familia y la salud mental. Conocer los propios detonadores reduce su poder.

Practicar la conciencia crítica: entender qué mensajes culturales alimentan la vergüenza. "Debes ser la madre perfecta", "debes tener un cuerpo perfecto", "debes tener éxito económico". Estos mensajes son imposibles e incompatibles. La conciencia crítica permite cuestionarlos en lugar de internalizarlos automáticamente.

Salir de la vergüenza: Brown descubrió que la vergüenza necesita tres cosas para crecer: secreto, silencio y juicio. Cuando nombras la vergüenza a alguien de confianza, pierde su poder. No cualquier persona — alguien que haya ganado el derecho de escuchar tu historia.

La empatía como antídoto a la vergüenza: la empatía genuina es "yo también he estado ahí". No "sé exactamente cómo te sientes" ni "pero al menos..." — esas frases aíslan. La empatía conecta. La vergüenza no puede sobrevivir cuando es recibida con empatía.''',
      ),
      CapituloResumen(
        titulo: 'Las Guías de la Vida Plena',
        emoji: '🗺️',
        contenido: '''Brown identifica diez "guías" que las personas de corazón entero practican. No son logros o metas — son prácticas cotidianas de un modo de vida diferente.

La primera guía: cultivar la autenticidad y soltar la necesidad de que otros te aprueben. La autenticidad no significa compartir todo con todos — significa que lo que eliges compartir refleja genuinamente quién eres.

La segunda guía: cultivar la autocompasión y soltar el perfeccionismo. La autocompasión no es autocomplacencia — es tratarte con la misma amabilidad que tratarías a una amiga querida que está pasando por algo difícil. El perfeccionismo, en contraste, es un escudo que cargamos esperando que nos proteja del juicio ajeno — y no funciona.

La tercera guía: cultivar una mente resiliente y soltar el entumecimiento y la impotencia. Muchas personas "entumecen" las emociones difíciles con alcohol, comida, trabajo excesivo, redes sociales. El problema: no puedes entorpecer selectivamente las emociones. Cuando entumeces el dolor, también entumeces la alegría.

La quinta guía: cultivar la gratitud y la alegría y soltar la escasez y el miedo. Brown descubrió algo sorprendente: las personas más alegres practican activamente la gratitud. No son alegres porque tengan más — practican la gratitud y por eso sienten alegría. La alegría no es un estado pasivo que se recibe — es una práctica activa.

La séptima guía: cultivar el descanso y el juego y soltar el agotamiento como símbolo de estatus. "Estoy tan ocupada" se ha convertido en señal de importancia. El agotamiento es visto como signo de dedicación. Brown dice que esto es autodestructivo: el descanso y el juego no son lujos — son necesidades fundamentales para la creatividad, la salud y la conexión.''',
      ),
      CapituloResumen(
        titulo: 'La Vulnerabilidad como Fortaleza',
        emoji: '💎',
        contenido: '''La contribución más contraintuitiva de Brown: la vulnerabilidad no es debilidad — es la fuente de la conexión, la creatividad y el amor. Las personas que se cierran a la vulnerabilidad para protegerse del dolor también se cierran a la alegría, al amor y a la conexión.

Definición de vulnerabilidad: la incertidumbre, el riesgo y la exposición emocional. Es decir "te quiero" sin saber si será correspondido. Iniciar un proyecto creativo sin garantía de que será bueno. Pedir ayuda cuando la necesitas. Mostrar tus errores antes de que otros los descubran.

La vulnerabilidad y el amor: es imposible amar genuinamente sin ser vulnerable. El amor requiere la disposición a ser herida. Las personas que se protegen completamente del dolor de la relación también se protegen del amor genuino — solo obtienen simulacros.

La vulnerabilidad y la creatividad: toda la creación genuina requiere mostrarse antes de saber si el resultado será bien recibido. El artista que nunca muestra su trabajo por miedo al juicio no crea. La empresaria que nunca lanza porque el producto no es "perfecto todavía" nunca emprende.

Brown acuña el término "foyer armor" — la armadura del vestíbulo. Antes de entrar a situaciones sociales que nos asustan, muchos nos armamos: sarcasmo, perfección, cinismo, humor agresivo. Estas armaduras nos protegen del dolor y también de la conexión. La vulnerabilidad auténtica es deponer esa armadura deliberadamente.''',
      ),
      CapituloResumen(
        titulo: 'La Suficiencia como Fundamento',
        emoji: '🌸',
        contenido: '''El problema más profundo que Brown identifica es la "escasez": la sensación de nunca ser suficiente. Nunca suficientemente rica, suficientemente bonita, suficientemente exitosa, suficientemente buena madre. Esta sensación permea la cultura y produce un ciclo de búsqueda sin fin de suficiencia que nunca llega.

La antítesis de la escasez no es la abundancia — es la SUFICIENCIA. No "tengo todo lo que podría desear" sino "soy suficiente como soy ahora". Esta distinción es enorme: la abundancia como meta produce la misma insatisfacción que la escasez porque siempre puede haber más. La suficiencia es un reconocimiento del valor inherente que ya existe.

El mensaje de "no eres suficiente" es cultural y ubiquo: la industria publicitaria, las redes sociales, el sistema educativo — todos transmiten implícita o explícitamente que necesitas ser diferente a como eres para merecer amor, éxito y aprobación.

La práctica de la suficiencia: cada mañana, antes de revisar el teléfono o las noticias, establecer la intención: "Hoy soy suficiente como soy. No tengo que ganar el derecho a ser amada o valorada. Puedo crecer y mejorar desde un lugar de amor, no de miedo". Esta práctica transforma la motivación para el crecimiento de ansiedad defensiva a curiosidad generosa.

Brown termina con una imagen poderosa: imagina tu vida como una casa. Si construyes los cimientos en la suficiencia — en la creencia de que ya eres suficiente para la conexión y el amor — puedes construir sobre eso con estabilidad. Si construyes en la escasez — en el miedo constante de no ser suficiente — cada logro solo retrasa la próxima crisis de insuficiencia.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Cuál fue el hallazgo más contraintuitivo de la investigación de Brené Brown?',
        opciones: [
          'Que la felicidad depende más de las relaciones que del éxito económico',
          'Que las personas que viven más plenamente estaban dispuestas a ser vulnerables — no a protegerse de la vulnerabilidad',
          'Que la autoestima se desarrolla principalmente en la infancia y es difícil de cambiar',
          'Que las personas más exitosas tienen mayor tolerancia al fracaso que las menos exitosas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Brown esperaba descubrir que las personas plenas evitaban la vulnerabilidad. Descubrió lo opuesto: la abrazaban. La vulnerabilidad es la fuente de la conexión, la creatividad y el amor — no su obstáculo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre culpa y vergüenza según Brown?',
        opciones: [
          'La culpa es más intensa que la vergüenza y más difícil de superar',
          'Culpa: "hice algo malo"; vergüenza: "soy algo malo" — la vergüenza ataca la identidad, no el comportamiento',
          'La vergüenza es una emoción pública; la culpa es privada e individual',
          'No hay diferencia psicológica real — son dos palabras para el mismo sentimiento',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! La distinción es crucial: la culpa ("hice algo malo") es útil porque puede motivar el cambio sin atacar la identidad. La vergüenza ("soy algo malo") ataca el valor fundamental de la persona y produce destrucción, no cambio.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué tres condiciones necesita la vergüenza para crecer según Brown?',
        opciones: [
          'Soledad, rechazo y fracaso repetido',
          'Secreto, silencio y juicio — cuando se nombra la vergüenza a alguien de confianza, pierde su poder',
          'Perfeccionismo, autoexigencia excesiva y comparación con otros',
          'Trauma del pasado, críticas durante la infancia y entorno social hostil',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La vergüenza vive en el secreto y el silencio. Cuando la nombras — cuando dices "siento vergüenza de X" a alguien que ha ganado el derecho de escuchar tu historia — pierde su poder. La luz mata la vergüenza.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué no podemos entorpecer selectivamente las emociones difíciles según Brown?',
        opciones: [
          'Porque las emociones están interconectadas neurológicamente y afectan el sistema como un todo',
          'Cuando entumecemos el dolor con alcohol, comida o distracciones, también entumecemos la alegría y la conexión',
          'Porque el entorpecimiento solo funciona a corto plazo y produce rebote emocional peor',
          'Porque las emociones difíciles son necesarias para el aprendizaje y el crecimiento',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! No puedes entorpecer selectivamente. Cuando amortiguas el dolor con cualquier mecanismo de escape, también amortiguas la alegría. Las personas que más sienten la tristeza también son las que más sienten la gratitud y el amor.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la diferencia entre la suficiencia y la abundancia según Brown?',
        opciones: [
          'La abundancia es material; la suficiencia es espiritual',
          'La abundancia es la meta; la suficiencia es el camino para llegar a ella',
          'La suficiencia es el reconocimiento de valor inherente ya existente; la abundancia como meta produce la misma insatisfacción que la escasez',
          'No hay diferencia — son dos formas de describir el mismo estado de bienestar',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! "Soy suficiente como soy" es radicalmente diferente a "tengo todo lo que podría desear". La abundancia como meta siempre puede crecer — nunca satisface. La suficiencia es un reconocimiento de valor que no depende de logros.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué descubrió Brown sobre la relación entre gratitud y alegría?',
        opciones: [
          'Las personas alegres se sienten naturalmente agradecidas — la alegría produce gratitud',
          'Las personas que practican activamente la gratitud son las más alegres — la práctica produce la emoción',
          'La gratitud y la alegría son emociones independientes sin relación causal demostrable',
          'La alegría es efímera; solo la gratitud produce bienestar duradero',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Las personas más alegres no nacen alegres — practican la gratitud. La alegría no es un estado pasivo que se recibe cuando la vida va bien — es una práctica activa. La gratitud deliberada produce alegría real.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es el "foyer armor" (armadura del vestíbulo) según Brown?',
        opciones: [
          'La imagen pública cuidadosamente construida que presentamos en redes sociales',
          'Las armaduras de sarcasmo, perfección o cinismo que adoptamos antes de situaciones sociales amenazantes para protegernos del juicio',
          'Las creencias que nos protegen de repetir errores del pasado en nuevas relaciones',
          'El distanciamiento emocional que usamos con personas que nos han lastimado',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Antes de entrar a una fiesta, una reunión de trabajo o cualquier situación que nos amenaza, muchos nos armamos. El sarcasmo nos protege del ridículo. La perfección del juicio. Pero la armadura que nos protege del dolor también nos protege de la conexión.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué caracteriza la empatía genuina según Brown, distinguiéndola de respuestas que aíslan?',
        opciones: [
          'La empatía real da soluciones concretas; las falsas solo ofrecen escucha',
          'La empatía real es "yo también he estado ahí" que conecta; frases como "pero al menos..." minimizan y aíslan',
          'La empatía genuina siempre resulta en acción de ayuda; la superficial solo en palabras',
          'La verdadera empatía solo es posible cuando has tenido exactamente la misma experiencia',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! "Pero al menos tienes X" o "sé exactamente cómo te sientes" aíslan porque minimizan o pretenden una conexión que no existe. "Yo también he estado en un lugar así de oscuro" conecta genuinamente sin resolver ni competir.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Brown dice que el perfeccionismo no funciona como escudo contra el juicio?',
        opciones: [
          'Porque la perfección es subjetiva y no tiene un estándar universal que satisfaga a todos',
          'Porque las personas que buscan perfección para protegerse acaban más expuestas — el proceso de perseguirla muestra el miedo que intenta ocultarse',
          'Porque el esfuerzo de ser perfecta agota la energía necesaria para el rendimiento real',
          'Porque los demás perciben el perfeccionismo como arrogancia y lo juzgan negativamente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La perfección que se busca para escudar contra el juicio delata el miedo que intenta ocultar. La imperfección genuinamente abrazada proyecta más seguridad que la perfección anhelada con ansiedad visible.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la práctica de suficiencia matutina que propone Brown?',
        opciones: [
          'Escribir tres logros del día anterior antes de revisar el teléfono',
          'Establecer la intención: "Hoy soy suficiente como soy — no tengo que ganar el derecho a ser amada" antes de revisar el teléfono o las noticias',
          'Meditar 10 minutos en silencio para establecer ecuanimidad antes del día',
          'Leer afirmaciones de abundancia que refuercen la mentalidad de prosperidad',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Establecer esta intención ANTES de recibir mensajes del mundo (redes, noticias, emails) que te recordarán que "no eres suficiente" cambia el fundamento emocional del día. No tienes que ganar el derecho a ser amada — ya lo eres.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 19 — Grit: El Poder de la Pasión y la Perseverancia
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp19',
    titulo: 'Grit: El Poder de la Pasión y la Perseverancia',
    autor: 'Angela Duckworth',
    anio: '2016',
    emoji: '🏋️',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'La psicóloga de UPenn que asesoró a West Point y la NFL demuestra que el predictor más confiable del éxito no es el talento — es el grit: la combinación de pasión sostenida y perseverancia extraordinaria.',
    gemasRecompensa: 63,
    capitulos: const [
      CapituloResumen(
        titulo: 'El Talento No es Suficiente',
        emoji: '🔍',
        contenido: '''Angela Duckworth comenzó su carrera como maestra de matemáticas en una escuela pública de Nueva York y observó algo que la intrigó: los estudiantes más brillantes no eran necesariamente los que más aprendían. Algunos estudiantes promedio los superaban con esfuerzo y determinación.

Dejó la enseñanza para estudiar psicología en Penn y pasó años investigando la pregunta: ¿qué predice el éxito más allá del talento? Estudió cadetes de West Point, vendedores de seguros, finalistas de concursos de ortografía, y maestros de escuelas difíciles. En todos los contextos encontró el mismo predictor: GRIT.

GRIT es la combinación de pasión sostenida por metas a largo plazo y perseverancia ante los obstáculos y fracasos. No es talento, no es suerte, no es inteligencia. Es la capacidad de mantenerse comprometida con algo importante durante años, a pesar de las dificultades.

El talento y el esfuerzo: Duckworth propone dos ecuaciones simples. Talento × Esfuerzo = Habilidad. Habilidad × Esfuerzo = Logro. El esfuerzo aparece dos veces. El talento sin esfuerzo produce habilidad no desarrollada. La habilidad sin esfuerzo produce potencial desperdiciado.

La "trampa del talento": culturalmente sobrevaloramos el talento y subestimamos el esfuerzo. Decimos "qué natural" cuando vemos a alguien excelente en algo. Esa narrativa borra los años de práctica que produjeron esa excelencia y desalienta el esfuerzo en quienes no son "naturales".''',
      ),
      CapituloResumen(
        titulo: 'Cómo se Desarrolla el Grit',
        emoji: '🌱',
        contenido: '''Duckworth identifica cuatro componentes psicológicos del grit que se desarrollan a lo largo del tiempo.

El primero es el INTERÉS: las personas con alto grit no solo trabajan duro en algo — genuinamente lo encuentran fascinante. El interés no aparece de repente — se desarrolla a través de la exploración, el tiempo y la profundización. No puedes forzar el interés, pero puedes crear condiciones para descubrirlo.

El segundo es la PRÁCTICA: específicamente "práctica deliberada" — no simplemente hacer lo mismo de siempre, sino trabajar en los puntos de debilidad con concentración máxima y feedback inmediato. Una hora de práctica deliberada vale más que diez horas de práctica automática.

El tercero es el PROPÓSITO: las personas con alto grit conectan su trabajo con algo más grande que ellas mismas. No trabajan solo para su propio placer sino porque creen que su trabajo importa para otros. El propósito transforma el trabajo difícil de sufrimiento en sacrificio significativo.

El cuarto es la ESPERANZA: no el optimismo ingenuo de "todo saldrá bien" sino la esperanza activa de quien cree que sus esfuerzos producirán resultados. "Puedo mejorar si sigo trabajando". Esta esperanza es especialmente crucial en los momentos de mayor dificultad.

Duckworth es clara: el grit puede desarrollarse. No eres una cantidad fija de grit. Puedes cultivar el interés, desarrollar la práctica deliberada, conectar con el propósito más profundo de tu trabajo, y fortalecer la esperanza activa.''',
      ),
      CapituloResumen(
        titulo: 'La Práctica Deliberada',
        emoji: '🎯',
        contenido: '''El concepto de práctica deliberada viene del trabajo del investigador Anders Ericsson, con quien Duckworth colaboró. Sus estudios de músicos, atletas y ajedrecistas revelaron que la excelencia no viene de la práctica genérica — viene de un tipo muy específico de práctica.

La práctica deliberada tiene cuatro características: 1) Se enfoca en una habilidad específica que está en el límite de la capacidad actual (justo difícil — no demasiado fácil ni imposible). 2) Tiene feedback inmediato sobre el desempeño. 3) Requiere concentración total — no es posible hacerla en piloto automático. 4) Es incómoda porque siempre trabaja en los puntos de debilidad.

Los estudios de violinistas de la Academia de Música de Berlín mostraron que lo que diferenciaba a los mejores no era el número total de horas practicadas, sino el número de horas de práctica DELIBERADA (sola, en máxima concentración, en los puntos difíciles). Los mejores habían practicado deliberadamente más del doble que los buenos.

La "regla de las 10,000 horas" (popularizada por Malcolm Gladwell) es una simplificación: no son 10,000 horas de práctica cualquiera. Son aproximadamente 10,000 horas de práctica deliberada. La diferencia es enorme.

Aplicación práctica: identifica tu habilidad más importante en tu trabajo o disciplina principal. Ahora identifica el punto débil más específico que te impide avanzar. Diseña una práctica de 30-45 minutos diarios que se enfoque exclusivamente en ese punto débil, con toda tu atención. Esto es práctica deliberada.''',
      ),
      CapituloResumen(
        titulo: 'El Propósito y la Esperanza',
        emoji: '🌟',
        contenido: '''La investigación de Duckworth sobre personas que abandonan sus carreras a pesar de tener talento revela un patrón consistente: no es que les faltara habilidad o incluso esfuerzo — les faltaba el sentido de que lo que hacían importaba para algo más allá de ellas mismas.

El propósito como motivación más poderosa: el interés personal sostiene el trabajo en los niveles iniciales. El propósito — la conexión con el beneficio de otros — sostiene el trabajo a través de las dificultades más profundas. Las personas con más grit generalmente pueden articular cómo su trabajo beneficia a otros.

Duckworth estudió personas de alto grit en campos muy diferentes y encontró que prácticamente todas describían su trabajo como una VOCACIÓN — no un trabajo ni una carrera sino algo que hacen porque importa más allá del beneficio personal. Esta percepción no depende del campo — puede aplicarse a prácticamente cualquier trabajo cuando se conecta con el impacto en otros.

La esperanza que sustenta el grit no es pasiva — es activa. Es la creencia de que el esfuerzo continuado producirá mejora. Duckworth la llama "crecimiento optimista": la combinación del mindset de crecimiento de Dweck con la teoría de atribución de Seligman. Cuando algo sale mal, la persona con esta esperanza activa piensa: "puedo hacer algo diferente la próxima vez" en lugar de "esto confirma que no puedo".

La práctica de la esperanza activa: cuando enfrentes un fracaso, practica este proceso: 1) ¿Qué pasó exactamente? 2) ¿Qué puedo aprender de esto? 3) ¿Qué haré diferente la próxima vez? Esta secuencia convierte el fracaso en información accionable.''',
      ),
      CapituloResumen(
        titulo: 'Cultivar el Grit desde Afuera',
        emoji: '🤝',
        contenido: '''Duckworth dedica los capítulos finales a cómo los padres, maestros, entrenadores y organizaciones pueden cultivar el grit en otros. Sus hallazgos desafían tanto el enfoque de "crianza helicóptero" (sobreproteger) como el de "crianza dura" (presionar sin apoyo).

El ambiente ideal para desarrollar grit combina dos cualidades aparentemente contradictorias: altos estándares Y calor emocional genuino. Los mejores maestros, entrenadores y padres exigen mucho Y ofrecen apoyo incondicional. El mensaje es: "Te quiero y te exijo porque creo que puedes más".

Las actividades extracurriculares duras: Duckworth estudió adolescentes y encontró que los que habían practicado una actividad extracurricular difícil (arte, deporte, instrumento) durante al menos dos años tenían significativamente más grit en la adultez. La práctica de comprometerse con algo difícil durante tiempo largo entrena la perseverancia.

La "regla del años duro" que Duckworth aplica con sus propias hijas: deben practicar una actividad difícil durante al menos un año, y durante ese año no pueden abandonar aunque quieran. Pasado el año, si quieren dejarlo, pueden. Pero durante ese período, el compromiso es completo. Aprenden que el impulso de abandonar cuando es difícil no es señal de error — es parte del proceso.

Las organizaciones con cultura de grit: Duckworth estudió el Programa de Entrenamiento Básico de West Point y encontró que los cadetes con más grit tenían mayor probabilidad de completar el programa. Las organizaciones pueden cultivar esta cultura siendo explícitas sobre el valor de la perseverancia, celebrando el esfuerzo tanto como los resultados, y creando ambientes donde el error es parte del aprendizaje.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Qué es el "grit" según Angela Duckworth?',
        opciones: [
          'La inteligencia emocional aplicada al trabajo y las relaciones',
          'La combinación de pasión sostenida por metas a largo plazo y perseverancia ante los obstáculos',
          'La capacidad de trabajar más horas que los competidores sin agotarse',
          'La resiliencia ante el fracaso y la capacidad de recuperarse rápidamente',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Grit = pasión sostenida + perseverancia extraordinaria. No es energía a corto plazo ni recuperación del fracaso — es el compromiso mantenido durante años con algo que importa, a través de todas las dificultades.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué el esfuerzo aparece dos veces en las ecuaciones de Duckworth?',
        opciones: [
          'Porque el esfuerzo es la única variable que podemos controlar completamente',
          'Talento × Esfuerzo = Habilidad Y Habilidad × Esfuerzo = Logro — el esfuerzo convierte el talento en habilidad Y la habilidad en logro',
          'Para enfatizar que se necesita el doble de esfuerzo que talento para tener éxito',
          'Porque el esfuerzo mental y el físico son igualmente necesarios y se multiplican entre sí',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El talento sin esfuerzo produce habilidad no desarrollada. La habilidad sin esfuerzo produce potencial desperdiciado. El esfuerzo es lo que convierte el potencial en realidad — dos veces.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los cuatro componentes del grit según Duckworth?',
        opciones: [
          'Disciplina, motivación, resistencia y enfoque',
          'Interés, práctica, propósito y esperanza',
          'Talento, esfuerzo, tiempo y ambiente',
          'Pasión, perseverancia, aprendizaje y servicio',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Interés (genuina fascinación), práctica (deliberada y en los puntos débiles), propósito (conexión con algo más grande) y esperanza activa (creer que el esfuerzo produce mejora). Todos pueden desarrollarse.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué distingue la "práctica deliberada" de la práctica ordinaria?',
        opciones: [
          'La práctica deliberada es más larga e intensa; la ordinaria es más corta y relajada',
          'Se enfoca en puntos de debilidad específicos, requiere concentración total, tiene feedback inmediato, y es incómoda por definición',
          'La práctica deliberada es guiada por un coach; la ordinaria es individual',
          'Se hace con métricas y registros; la ordinaria se hace de memoria',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Una hora de práctica deliberada (enfocada en el punto débil, con atención total) vale más que diez horas de práctica automática. Los mejores músicos de Berlín tenían el doble de horas de práctica deliberada que los buenos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo conecta Duckworth el propósito con la sostenibilidad del grit?',
        opciones: [
          'El propósito solo importa en los primeros años — luego el hábito sostiene el esfuerzo',
          'El interés personal sostiene el trabajo inicial; el propósito (conexión con el beneficio de otros) sostiene a través de las dificultades más profundas',
          'El propósito y el interés personal son equivalentes en poder motivador',
          'El propósito externo (impacto social) es más importante que la satisfacción personal en todos los casos',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! El interés por el trabajo propio alcanza para los niveles iniciales. Cuando las dificultades se profundizan y el agotamiento llega, lo que sostiene es el sentido de que el trabajo importa para otros. El propósito transforma el sacrificio en significativo.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "esperanza activa" que distingue a las personas de alto grit?',
        opciones: [
          'El optimismo de que todo saldrá bien independientemente de los esfuerzos',
          'La creencia de que el esfuerzo continuado producirá mejora — "puedo hacer algo diferente la próxima vez"',
          'La fe religiosa que da fortaleza ante las adversidades de la vida',
          'La esperanza basada en el historial de éxitos previos que confirman la capacidad',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! La esperanza activa no es "todo saldrá bien". Es "si cambio X en mi enfoque, el próximo intento producirá un resultado diferente". Convierte el fracaso en información accionable en lugar de evidencia de incapacidad.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la "regla del año duro" de Duckworth?',
        opciones: [
          'Trabajar al menos un año en un empleo antes de evaluar si es el trabajo correcto',
          'Practicar una actividad difícil durante al menos un año sin abandonarla aunque quieran — aprenden que el impulso de abandonar cuando es difícil no es señal de error',
          'Comprometerse con un año completo de práctica deliberada para evaluar el progreso real',
          'Esperar un año antes de tomar decisiones importantes bajo estrés emocional',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! La regla enseña que el impulso de abandonar cuando algo se pone difícil es parte del proceso — no señal de que el camino es equivocado. Completar el año difícil desarrolla el músculo del compromiso sostenido.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué combinación de crianza produce el mayor desarrollo de grit según Duckworth?',
        opciones: [
          'Alta exigencia sin mucho apoyo emocional — el desafío puro desarrolla la perseverancia',
          'Bajo nivel de exigencia con mucho apoyo — la seguridad emocional libera el potencial',
          'Altos estándares combinados con calor emocional genuino — "te quiero y te exijo porque creo que puedes más"',
          'Libertad total para elegir las actividades — el interés intrínseco desarrolla el grit más auténtico',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! Ni sobreprotección ni presión fría. Los mejores maestros y padres que desarrollan grit en otros combinan alta exigencia CON apoyo genuino. El mensaje es: "creo tanto en tu capacidad que te exijo más — y estoy aquí cuando sea difícil".',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué "trampa" identifica Duckworth en cómo la cultura valora el talento?',
        opciones: [
          'El talento produce arrogancia que impide el aprendizaje continuo',
          'Sobrevaloramos el talento y subestimamos el esfuerzo — la narrativa de "el natural" borra los años de práctica y desalienta el esfuerzo',
          'El talento crea expectativas imposibles que producen ansiedad de rendimiento',
          'Identificar el talento temprano limita la exploración de otros campos potencialmente mejores',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Decir "qué natural" ante la excelencia borra los años de práctica deliberada. Esta narrativa perjudica a dos grupos: a quienes no son "naturales" (desalienta el esfuerzo) y a los "naturales" mismos (no desarrollan el hábito del esfuerzo cuando el talento no alcanza).',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué demostraron los estudios de violinistas de la Academia de Música de Berlín?',
        opciones: [
          'Que los mejores habían empezado a estudiar más temprano que los buenos',
          'Que los mejores tenían mayor capacidad auditiva innata que los buenos',
          'Que lo que diferenciaba a los mejores era el número de horas de práctica DELIBERADA — los mejores habían practicado deliberadamente más del doble que los buenos',
          'Que los mejores practicaban más horas en total, independientemente del tipo de práctica',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! No eran las horas totales de práctica lo que distinguía — era las horas de práctica DELIBERADA (sola, en máxima concentración, en los puntos difíciles). Los mejores habían invertido el doble de tiempo en ese tipo específico de práctica.',
      ),
    ],
  ),

  // ══════════════════════════════════════════════════════════
  //  LIBRO 20 — El Arte de la Guerra del Dinero
  // ══════════════════════════════════════════════════════════
  Libro(
    id: 'dp20',
    titulo: 'La Psicología del Dinero',
    autor: 'Morgan Housel',
    anio: '2020',
    emoji: '🧩',
    categoria: CategoriaLibro.desarrolloPersonal,
    resumenCorto: 'El dinero no es una ciencia — es un comportamiento. Housel explora 19 rasgos sorprendentes de cómo personas inteligentes toman decisiones financieras irracionales, y cómo cambiar eso.',
    gemasRecompensa: 65,
    capitulos: const [
      CapituloResumen(
        titulo: 'Nadie está Loco con el Dinero',
        emoji: '🧠',
        contenido: '''Morgan Housel comienza con una premisa liberadora: cuando ves a alguien tomando una decisión financiera que parece obviamente incorrecta, raramente es estupidez. Es que esa persona ha vivido experiencias de dinero diferentes a las tuyas y esas experiencias le enseñaron lecciones diferentes.

Alguien que creció durante una recesión severa desarrolla una relación con el riesgo completamente diferente a quien creció en un período de prosperidad. Ambos son racionales dados sus propios contextos. Ambas perspectivas son comprensibles. El problema surge cuando se asume que la visión propia del dinero es universalmente "correcta".

El caso de las loterías: la crítica fácil es "los pobres son irracionales porque compran lotería cuando no deberían". Pero si entiendes que para alguien con muy pocos recursos la lotería es literalmente la única vía disponible para un cambio radical de vida, tiene una lógica interna perfectamente coherente — aunque matemáticamente sea una mala inversión.

Las historias de dinero que construimos en la infancia son extraordinariamente persistentes. Si creciste viendo que el dinero producía estrés y conflicto en tu familia, tu relación adulta con el dinero estará coloreada por esa historia aunque intelectualmente conozcas las finanzas personales perfectamente.

El primer paso hacia mejores decisiones financieras no es más educación financiera — es la consciencia de tu propia historia con el dinero. ¿Qué creencias sobre el dinero aprendiste de tu familia? ¿Qué te enseñó tu primer empleo? ¿Qué experiencias de abundancia o escasez marcaron tu infancia? Esas historias operan en piloto automático cuando tomas decisiones de dinero.''',
      ),
      CapituloResumen(
        titulo: 'La Suerte, el Riesgo y el Poder del Tiempo',
        emoji: '⏳',
        contenido: '''Housel dedica un capítulo importante a un tema que la mayoría de los libros de finanzas personales ignoran: el papel de la suerte y el riesgo. Las historias de éxito que celebramos tienden a atribuir todo al genio individual. Las historias de fracaso, a errores individuales. La realidad es más matizada.

Bill Gates fue a una de las pocas preparatorias del mundo que tenía una computadora en 1968. Su compañero de cuarto en Harvard se convirtió en uno de sus primeros empleados. Ambas cosas son suerte extraordinaria. Eso no disminuye su talento o su trabajo — pero sí señala que los factores más allá del control de cualquiera juegan un papel enorme que rara vez reconocemos.

El riesgo tiene la misma estructura: emprendedoras con las mismas habilidades e igual trabajo duro pueden tener resultados radicalmente diferentes por factores que están completamente fuera de su control — el momento del ciclo económico, la suerte de los competidores, la respuesta del mercado.

La implicación práctica: sé gentil con quienes no lo lograron — pueden haber hecho casi todo bien y haber sido víctimas del riesgo. Y sé humilde con quienes sí lo lograron — pueden haber tenido suerte que no está disponible para todos.

El poder del tiempo es la fuerza más contraintuitiva en las finanzas. Warren Buffett tiene el 99.8% de su riqueza acumulada después de los 50 años — no porque sea mucho mejor inversor en la vejez sino porque el interés compuesto necesita tiempo para mostrar su magia. La mayoría subestima radicalmente lo que el tiempo hace al dinero.''',
      ),
      CapituloResumen(
        titulo: 'La Riqueza Invisible',
        emoji: '🔮',
        contenido: '''Una de las ideas más contraintuitivas del libro: la riqueza es lo que NO se ve. El coche costoso, la mansión y los relojes caros son señales de DINERO GASTADO — lo opuesto de riqueza. La riqueza real son los activos no convertidos en consumo.

Housel propone una definición de riqueza que la mayoría ignora: riqueza es la libertad de no tener que hacer cosas que no quieres hacer. No el lujo — la libertad. Hay personas con ingresos modestos que tienen enorme riqueza porque han construido opciones. Y hay personas con ingresos altos que tienen cero riqueza porque gastan exactamente lo que ganan.

La paradoja del consumo visible: para construir riqueza necesitas guardar algo. Pero la sociedad recompensa el consumo visible (el coche caro impresiona) y no recompensa visiblemente el ahorro (nadie sabe que tienes \$200,000 en inversiones). Esta asimetría de incentivos empuja naturalmente hacia el gasto.

Housel introduce el concepto del "hombre razonablemente rico": no el que tiene más sino el que ha optimizado para la satisfacción. Sabe cuánto es "suficiente" para su vida específica y no cae en la trampa de la comparación interminable con quienes tienen más.

La "cinta de correr hedónica": los estudios demuestran consistentemente que los aumentos de ingreso y los objetos que compramos producen satisfacción que se desvanece rápidamente — volviendo al nivel base de bienestar. La persona que espera que el próximo aumento de ingreso o la próxima compra la hará fundamentalmente más feliz está persiguiendo una zanahoria que siempre se mueve.''',
      ),
      CapituloResumen(
        titulo: 'El Interés Compuesto y la Paciencia',
        emoji: '📈',
        contenido: '''Housel dedica varios capítulos al fenómeno más subestimado en finanzas: el interés compuesto. No porque sea secreto — todos lo conocen intelectualmente — sino porque la mente humana no está equipada para intuir su poder real.

El ejemplo de Buffett: comenzó a invertir a los 10 años y mantuvo la estrategia durante 80 años. Si hubiera comenzado a los 30 y se hubiera retirado a los 60 (como la mayoría de las personas), su riqueza sería una fracción minúscula de la actual. No es que sea el mejor inversor del mundo — es que tiene más tiempo que todos los demás.

El problema con el "cortoplacismo": la mayoría de los inversores individuales compran cuando el mercado está subiendo (miedo de perderse las ganancias) y venden cuando está bajando (miedo de las pérdidas). Este comportamiento, documentado repetidamente, produce rendimientos promedio significativamente menores que simplemente mantener las inversiones y no hacer nada.

La volatilidad como "precio de admisión": los mercados financieros producen rendimientos extraordinarios a largo plazo. El precio por esos rendimientos es tolerar la volatilidad — años malos, correcciones, incertidumbre. La mayoría trata la volatilidad como un error que debe evitarse. Housel la ve como el costo necesario del rendimiento a largo plazo.

La estrategia de la "holgura": Housel propone mantener siempre más efectivo del que crees necesitar y asumir siempre menos riesgo del que crees poder tolerar. Las personas que planifican sin holgura se encuentran forzadas a vender en el peor momento cuando los imprevistos llegan — y siempre llegan.''',
      ),
      CapituloResumen(
        titulo: 'Razona con Tu Propia Historia',
        emoji: '🗺️',
        contenido: '''El capítulo final más poderoso de Housel: el mayor riesgo en las finanzas personales no es elegir el fondo equivocado — es llevar el juego de alguien más. Compararte con las decisiones financieras de personas cuyas metas, tolerancia al riesgo, horizonte temporal y circunstancias son radicalmente diferentes a las tuyas.

La comparación como trampa: los tablones de inversión online y las redes sociales crean una distorsión masiva. El inversor que ganó 100% en un año crypto domina la conversación. El 90% que perdió todo está en silencio. Esta selección sesgada crea comparaciones imposibles que llevan a tomar riesgos inappropiados para tu situación específica.

La pregunta de Housel: antes de cualquier decisión financiera, pregunta "¿qué estoy tratando de lograr con mi dinero?" Las respuestas varían enormemente según la persona: libertad para no trabajar a los 45, pagar la universidad de los hijos, nunca preocuparse por el dinero, construir un negocio. Cada meta requiere una estrategia diferente.

La "trinidad de la suficiencia": Housel propone que las finanzas personales saludables tienen tres elementos no financieros: 1) Gratitud por lo que ya tienes (para no necesitar más para ser feliz). 2) Humildad ante el futuro desconocido (para mantener holgura). 3) Identidad independiente del dinero (para no necesitar el lujo visible para sentir valor).

Housel cierra con una observación: las mejores decisiones financieras no son las que maximizan el rendimiento — son las que te permiten dormir bien por las noches y mantener la estrategia cuando sea difícil. La inversión que te mantiene invertida durante 30 años siempre superará la inversión "óptima" que abandones en el primer año difícil.''',
      ),
    ],
    preguntas: const [
      PreguntaLibro(
        enunciado: '¿Por qué Housel dice que "nadie está loco con el dinero"?',
        opciones: [
          'Porque todas las decisiones financieras tienen una lógica racional si se analiza correctamente',
          'Porque cada persona toma decisiones razonables dadas sus propias experiencias de vida con el dinero — experiencias que pueden ser muy diferentes a las tuyas',
          'Porque el dinero es un recurso neutro que no genera conductas irracionales reales',
          'Porque la educación financiera siempre produce decisiones correctas cuando se aplica bien',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! Lo que parece obviamente irracional desde tu perspectiva puede ser completamente razonable desde la historia de vida de otra persona. Las experiencias de dinero en la infancia crean patrones que operan en piloto automático.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo define Housel la "riqueza real"?',
        opciones: [
          'El valor total de los activos menos las deudas de una persona',
          'La libertad de no tener que hacer cosas que no quieres hacer — no el lujo visible sino las opciones acumuladas',
          'La capacidad de satisfacer cualquier deseo material sin restricciones económicas',
          'El nivel de ingreso que excede las necesidades básicas en al menos un 50%',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Riqueza = libertad = opciones. El coche caro es dinero gastado — lo opuesto de riqueza. La riqueza invisible son los activos que crean opciones para tu vida. Hay personas con ingresos modestos con enorme riqueza y personas con ingresos altos con cero.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la lección clave del caso de Warren Buffett sobre el tiempo y la riqueza?',
        opciones: [
          'Que comenzar a invertir desde joven es ventajoso porque se aprenden más habilidades',
          'Que el 99.8% de su riqueza se acumuló después de los 50 — el tiempo es la variable más importante en el interés compuesto',
          'Que la selección de acciones de calidad supera cualquier otra estrategia a largo plazo',
          'Que la perseverancia a través de ciclos de mercado difíciles determina los resultados finales',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Correcto! Si Buffett hubiera comenzado a los 30 y parado a los 60 (como la mayoría), sería una fracción de su riqueza actual. La magia no es su talento — es el tiempo. El interés compuesto necesita décadas para mostrar su poder exponencial.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué la mayoría de los inversores individuales obtienen rendimientos menores que el mercado?',
        opciones: [
          'Porque no tienen acceso a la información privilegiada que manejan los inversores institucionales',
          'Porque compran cuando el mercado sube (por miedo a perderse ganancias) y venden cuando baja (por miedo a pérdidas) — exactamente al revés',
          'Porque pagan comisiones excesivas a intermediarios financieros que reducen los rendimientos',
          'Porque diversifican demasiado y no aprovechan las mejores oportunidades específicas',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Exacto! El comportamiento documentado repetidamente: comprar en los máximos del mercado (cuando todos hablan de ganancias) y vender en los mínimos (cuando todos tienen miedo). Este patrón de comprar caro y vender barato destruye el rendimiento.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cómo describe Housel la volatilidad del mercado financiero?',
        opciones: [
          'Un error del sistema que los reguladores deberían corregir',
          'Una señal de que el mercado no es un lugar seguro para el ahorro personal',
          'El precio de admisión por los rendimientos extraordinarios a largo plazo — debe aceptarse, no evitarse',
          'Un fenómeno temporal que desaparece con el tiempo suficiente en el mercado',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Brillante! Los mercados producen rendimientos extraordinarios a largo plazo. El costo es tolerar la volatilidad — años malos, correcciones, incertidumbre. Tratar la volatilidad como un error produce el peor comportamiento: vender en los mínimos.',
      ),
      const PreguntaLibro(
        enunciado: '¿Qué es la "cinta de correr hedónica" que describe Housel?',
        opciones: [
          'El ciclo de ahorro y gasto que impide acumular riqueza real',
          'La trampa de trabajar más para ganar más para gastar más sin aumentar la felicidad real',
          'La satisfacción de compras y aumentos de ingreso se desvanece rápidamente, volviendo al nivel base — siempre se necesita "más"',
          'El patrón de comparación social que lleva a gastar para mantener el estatus',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Correcto! El aumento de ingreso o la compra produce satisfacción... que desaparece en semanas o meses. El nivel base de bienestar regresa. Si crees que el próximo logro material te hará fundamentalmente más feliz, estás en la cinta de correr.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la "estrategia de holgura" que recomienda Housel?',
        opciones: [
          'Tener siempre más efectivo del que crees necesitar y asumir menos riesgo del que crees poder tolerar',
          'Mantener el 10% del portafolio en efectivo para aprovechar caídas del mercado',
          'Diversificar en múltiples clases de activos para reducir el riesgo general',
          'Establecer un fondo de emergencia de exactamente 6 meses de gastos',
        ],
        respuestaCorrecta: 0,
        explicacion: '¡Exacto! La holgura protege contra imprevistos que siempre llegan. Las personas que planifican sin holgura se ven forzadas a vender en el peor momento cuando el imprevisto las obliga. Más efectivo y menos riesgo de lo que crees necesario es la estrategia de supervivencia.',
      ),
      const PreguntaLibro(
        enunciado: '¿Por qué Housel advierte contra "llevar el juego de alguien más"?',
        opciones: [
          'Porque copiar estrategias de otros produce resultados mediocres en lugar de excelentes',
          'Porque compararse con inversores que muestran sus ganancias online crea comparaciones imposibles que llevan a riesgos inapropiados para tu situación',
          'Porque las estrategias financieras son personales y no pueden transferirse de una persona a otra',
          'Porque seguir el consejo de otros elimina la responsabilidad personal sobre los resultados',
        ],
        respuestaCorrecta: 1,
        explicacion: 'Las redes muestran el 10% que ganó 100% en crypto en silencio sobre el 90% que perdió todo. Compararte con esa selección sesgada lleva a tomar riesgos inapropiados para tus metas, horizonte temporal y circunstancias específicas.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuáles son los tres elementos no financieros de la "trinidad de la suficiencia" de Housel?',
        opciones: [
          'Ahorro, inversión y generosidad',
          'Gratitud por lo que tienes, humildad ante el futuro desconocido, e identidad independiente del dinero',
          'Metas claras, plan de acción y revisión periódica',
          'Disciplina en el gasto, diversificación en la inversión y protección con seguros',
        ],
        respuestaCorrecta: 1,
        explicacion: '¡Brillante! Gratitud (no necesitas más para ser feliz), humildad ante el futuro (mantén holgura), e identidad independiente del dinero (no necesitas el lujo visible para sentir valor). Estos tres elementos no financieros sostienen todas las buenas decisiones financieras.',
      ),
      const PreguntaLibro(
        enunciado: '¿Cuál es la conclusión de Housel sobre las "mejores" decisiones financieras?',
        opciones: [
          'Las que maximizan el rendimiento ajustado al riesgo en todos los escenarios posibles',
          'Las que siguen el consejo de los mejores inversores del mundo en cada categoría',
          'Las que te permiten dormir bien y mantener la estrategia cuando es difícil — la inversión mantenida 30 años supera la "óptima" que se abandona al primer año difícil',
          'Las que producen el mayor rendimiento histórico documentado independientemente de la volatilidad',
        ],
        respuestaCorrecta: 2,
        explicacion: '¡Exacto! La mejor estrategia financiera es la que puedes mantener. Una estrategia subóptima mantenida durante décadas supera ampliamente la estrategia "perfecta" que abandones en el primer período difícil. El comportamiento importa más que la estrategia.',
      ),
    ],
  ),

];
