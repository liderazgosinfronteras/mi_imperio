// lib/models/libro_model.dart

enum CategoriaLibro {
  educacionFinanciera,
  desarrolloPersonal,
  mlm,
  autoestima,
  disciplina,
  empoderamiento,
  emprendedor,
  liderazgo,
  motivacion,
}

extension CategoriaLibroExt on CategoriaLibro {
  String get nombre {
    switch (this) {
      case CategoriaLibro.educacionFinanciera: return 'Educación Financiera';
      case CategoriaLibro.desarrolloPersonal:  return 'Desarrollo Personal';
      case CategoriaLibro.mlm:                 return 'Network Marketing';
      case CategoriaLibro.autoestima:          return 'Autoestima';
      case CategoriaLibro.disciplina:          return 'Disciplina';
      case CategoriaLibro.empoderamiento:      return 'Empoderamiento';
      case CategoriaLibro.emprendedor:         return 'Emprendedor';
      case CategoriaLibro.liderazgo:           return 'Liderazgo';
      case CategoriaLibro.motivacion:          return 'Motivación';
    }
  }

  String get icono {
    switch (this) {
      case CategoriaLibro.educacionFinanciera: return '💰';
      case CategoriaLibro.desarrolloPersonal:  return '🌱';
      case CategoriaLibro.mlm:                 return '🌐';
      case CategoriaLibro.autoestima:          return '💜';
      case CategoriaLibro.disciplina:          return '⚡';
      case CategoriaLibro.empoderamiento:      return '🦋';
      case CategoriaLibro.emprendedor:         return '🚀';
      case CategoriaLibro.liderazgo:           return '👑';
      case CategoriaLibro.motivacion:          return '🔥';
    }
  }
}

enum EstadoLibro { disponible, enProgreso, completado }

class Libro {
  final String id;
  final String titulo;
  final String autor;
  final String anio;
  final String emoji;
  final CategoriaLibro categoria;
  final String resumenCorto;
  final List<CapituloResumen> capitulos;
  final List<PreguntaLibro> preguntas;
  final int gemasRecompensa;
  EstadoLibro estado;

  Libro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anio,
    required this.emoji,
    required this.categoria,
    required this.resumenCorto,
    required this.capitulos,
    required this.preguntas,
    this.gemasRecompensa = 50,
    this.estado = EstadoLibro.disponible,
  });
}

class CapituloResumen {
  final String titulo;
  final String emoji;
  final String contenido;

  const CapituloResumen({
    required this.titulo,
    required this.emoji,
    required this.contenido,
  });
}

class PreguntaLibro {
  final String enunciado;
  final List<String> opciones;
  final int respuestaCorrecta;
  final String explicacion;

  const PreguntaLibro({
    required this.enunciado,
    required this.opciones,
    required this.respuestaCorrecta,
    required this.explicacion,
  });
}
