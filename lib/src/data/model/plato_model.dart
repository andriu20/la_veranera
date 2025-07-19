// ignore_for_file: must_be_immutable

import 'package:la_veranera/src/domain/entity/platos_entity.dart';

class PlatosModel extends PlatosEntity {
  PlatosModel({
    required super.success,
    required super.msg,
    required super.statusCode,
    required super.data,
  });

  factory PlatosModel.fromJson(Map<String, dynamic> json) => PlatosModel(
    success: json["success"],
    msg: json["msg"],
    statusCode: json["statusCode"],
    data:
        json["data"] == null
            ? []
            : List<DatumModel>.from(
              json["data"].map((x) => DatumModel.fromJson(x)),
            ),
  );
}

class DatumModel extends DatumEntity {
  DatumModel({
    required super.id,
    required super.nombre,
    required super.precio,
    required super.descripcion,
    required super.fechaCreacion,
    required super.fechaActualizacion,
    required super.disponible,
    required super.v,
  });

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
    id: json["_id"],
    nombre: json["nombre"],
    precio: json["precio"],
    descripcion: json["descripcion"],
    fechaCreacion: DateTime.parse(json["fechaCreacion"]),
    fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
    disponible: json["disponible"],
    v: json["__v"],
  );
}
