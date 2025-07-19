import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:la_veranera/src/core/config/environment.dart';
import 'package:la_veranera/src/core/util/secure_storage_util.dart';
import 'package:la_veranera/src/domain/dto/caja_dto.dart';

abstract class CajaData {
  Future<bool> cajaAbierta({required String fecha});
  Future<bool> abrirCaja({required CajaDto dto});
}

class CajaDataImpl implements CajaData {
  final _storage = SecureStorageUtil();
  @override
  Future<bool> cajaAbierta({required String fecha}) async {
    try {
      final url = "${Environment.host}caja/buscar/$fecha";
      final dio = Dio();
      final request = await dio.get(
        url,
        options: Options(
          headers: {"AUTHORIZATION": "Bearer ${await _storage.read("token")}"},
        ),
      );

      return request.data["statusCode"] == HttpStatus.ok;
    } catch (e) {
      log("$e", name: "Error al realizar ingreso");
      rethrow;
    }
  }

  @override
  Future<bool> abrirCaja({required CajaDto dto}) async {
    try {
      final url = "${Environment.host}caja/abrir";
      final dio = Dio();
      final request = await dio.post(
        url,
        data: dto.toJson(),
        options: Options(
          headers: {"AUTHORIZATION": "Bearer ${await _storage.read("token")}"},
        ),
      );

      return request.data["statusCode"] == HttpStatus.created;
    } catch (e) {
      log("$e", name: "Error al realizar ingreso");
      rethrow;
    }
  }
}
