// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MesaEntity extends Equatable {
  bool success;
  String msg;
  int statusCode;
  List<DatumMEntity> data;

  MesaEntity({
    required this.success,
    required this.msg,
    required this.statusCode,
    required this.data,
  });

  @override
  List<Object?> get props => [success, msg, statusCode, data];
}

class DatumMEntity extends Equatable {
  String id;
  int mesa;
  String estado;
  int v;

  DatumMEntity({
    required this.id,
    required this.mesa,
    required this.estado,
    required this.v,
  });

  @override
  List<Object?> get props => [id, mesa, estado, v];
}
