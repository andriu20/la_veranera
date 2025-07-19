import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:la_veranera/src/core/config/environment.dart';
import 'package:la_veranera/src/core/util/secure_storage_util.dart';
import 'package:la_veranera/src/data/model/plato_model.dart';
import 'package:la_veranera/src/domain/dto/plate_dto.dart';

abstract class PlateData {
  Future<bool> crearPlato({required PlatoDto dto});
  Future<PlatosModel> listar();
}

class PlateDataImpl implements PlateData {
  final _storage = SecureStorageUtil();

  @override
  Future<bool> crearPlato({required PlatoDto dto}) async {
    try {
      final url = "${Environment.host}plate/crear";
      final dio = Dio();
      final request = await dio.post(
        url,
        data: dto.toJson(),
        options: Options(
          headers: {"AUTHORIZATION": "Bearer ${await _storage.read("token")}"},
        ),
      );

      return request.data["statusCode"] == HttpStatus.ok;
    } catch (e) {
      log("$e --- ", name: "error al crear plato");
      rethrow;
    }
  }

  @override
  Future<PlatosModel> listar() async {
    try {
      final url = "${Environment.host}plate/listar";
      final dio = Dio();
      final request = await dio.get(
        url,
        options: Options(
          headers: {"AUTHORIZATION": "Bearer ${await _storage.read("token")}"},
        ),
      );

      return PlatosModel.fromJson(request.data);
    } catch (e) {
      rethrow;
    }
  }
}
