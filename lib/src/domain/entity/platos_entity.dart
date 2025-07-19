import 'package:equatable/equatable.dart';

class PlatosEntity extends Equatable {
  bool success;
  String msg;
  int statusCode;
  List<DatumEntity> data;

  PlatosEntity({
    required this.success,
    required this.msg,
    required this.statusCode,
    required this.data,
  });

  @override
  List<Object?> get props => [success, msg, statusCode, data];
}

class DatumEntity extends Equatable {
  String id;
  String nombre;
  int precio;
  String descripcion;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  bool disponible;
  int v;

  DatumEntity({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.disponible,
    required this.v,
  });

  @override
  List<Object?> get props => [
    id,
    nombre,
    precio,
    descripcion,
    fechaCreacion,
    fechaActualizacion,
    disponible,
    v,
  ];
}
