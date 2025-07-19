class PlatoDto {
  final String nombre;
  final int precio;
  final String descripcion;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final bool disponible;

  PlatoDto({
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.disponible,
  });

  

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'precio': precio,
      'descripcion': descripcion,
      'fechaCreacion': fechaCreacion.toIso8601String(),
      'fechaActualizacion': fechaActualizacion.toIso8601String(),
      'disponible': disponible,
    };
  }
}
