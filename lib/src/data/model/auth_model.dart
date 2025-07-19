// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);


// ignore_for_file: must_be_immutable

import 'package:la_veranera/src/domain/entity/auth_Entity.dart';


class AuthModel extends AuthEntity {
    // bool success;
    // String msg;
    // int statusCode;
    // Data data;

    AuthModel({
        required super.success,
        required super.msg,
        required super.statusCode,
        required super.data,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        success: json["success"]?? false,
        msg: json["msg"]??"",
        statusCode: json["statusCode"] ?? 0,
        data: json["data"]==null?DataModel.fromJson({}):DataModel.fromJson(json["data"]),
    );

}

class DataModel extends Data{

    DataModel({
        required super.token,
        required super.usuario,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        token: json["token"] ??"",
        usuario:json["usuario"] ==null ?UsuarioModel.fromJson({}): UsuarioModel.fromJson(json["usuario"]),
    );

   
}

class UsuarioModel extends Usuario {
  

    UsuarioModel({
        required super.id,
        required super.nombre,
        required super.direccion,
        required super.celular,
        required super.correo,
        required super.fechaCreacion,
        required super.fechaActualizacion,
        required super.estado,
        required super.v,
    });

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["_id"] ??"",
        nombre: json["nombre"] ??"",
        direccion: json["direccion"] ??"",
        celular: json["celular"] ??"",
        correo: json["correo"]??"",
        fechaCreacion: json["fechaCreacion"]==null?DateTime.now():DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion:json["fechaActualizacion"]==null?DateTime.now(): DateTime.parse(json["fechaActualizacion"]),
        estado: json["estado"] ??"",
        v: json["__v"] ??0,
    );

   
}
