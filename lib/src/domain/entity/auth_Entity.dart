// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
 final  bool success;
 final  String msg;
 final  int statusCode;
 final  Data data;

  const AuthEntity({
    required this.success,
    required this.msg,
    required this.statusCode,
    required this.data,
  });

  @override
  List<Object?> get props => [success, msg, statusCode, data];
}

class Data extends Equatable {
  String token;
  Usuario usuario;

  Data({required this.token, required this.usuario});

  @override
  List<Object?> get props => [token, usuario];
}

class Usuario extends Equatable {
  String id;
  String nombre;
  String direccion;
  String celular;
  String correo;
  DateTime fechaCreacion;
  DateTime fechaActualizacion;
  String estado;
  int v;

  Usuario({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.celular,
    required this.correo,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.estado,
    required this.v,
  });

  @override
  List<Object?> get props => [
    id,
    nombre,
    direccion,
    celular,
    correo,
    fechaCreacion,
    fechaActualizacion,
    estado,
    v,
  ];
}
