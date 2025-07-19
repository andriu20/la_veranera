// To parse this JSON data, do
//
//     final mesa = mesaFromJson(jsonString);

// ignore_for_file: must_be_immutable

import 'package:la_veranera/src/domain/entity/mesa_entity.dart';

class MesaModel extends MesaEntity {
  MesaModel({
    required super.success,
    required super.msg,
    required super.statusCode,
    required super.data,
  });

  factory MesaModel.fromJson(Map<String, dynamic> json) => MesaModel(
    success: json["success"],
    msg: json["msg"],
    statusCode: json["statusCode"],
    data:
        json["data"] == null
            ? []
            : List<DatumMModel>.from(
              json["data"].map((x) => DatumMModel.fromJson(x)),
            ),
  );
}

class DatumMModel extends DatumMEntity {
  DatumMModel({
    required super.id,
    required super.mesa,
    required super.estado,
    required super.v,
  });

  factory DatumMModel.fromJson(Map<String, dynamic> json) => DatumMModel(
    id: json["_id"],
    mesa: json["mesa"],
    estado: json["estado"],
    v: json["__v"],
  );
}
