import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:la_veranera/src/core/config/environment.dart';
import 'package:la_veranera/src/core/util/secure_storage_util.dart';
import 'package:la_veranera/src/data/model/mesa_model.dart';
import 'package:la_veranera/src/domain/dto/mesa_dto.dart';

abstract class MesaData {
  Future<MesaModel> listarMesas({required String fecha});
  Future<bool> crearMesa({required MesaDto dto});
}

class MesaDataImpl implements MesaData {
  final _storage = SecureStorageUtil();

  @override
  Future<MesaModel> listarMesas({required String fecha}) async {
    try {
      final url = "${Environment.host}config/listar/$fecha";
      final dio = Dio();
      final request = await dio.get(
        url,
        options: Options(
          headers: {"AUTHORIZATION": "Bearer ${await _storage.read("token")}"},
        ),
      );
      return MesaModel.fromJson(request.data);
    } catch (e) {
      log("$e", name: "Error al listar mesas");
      rethrow;
    }
  }

  @override
  Future<bool> crearMesa({required MesaDto dto}) async {
    try {
      final url = "${Environment.host}config/crear";
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
      log("$e", name: "Error al crear mesas");
      rethrow;
    }
  }
}
