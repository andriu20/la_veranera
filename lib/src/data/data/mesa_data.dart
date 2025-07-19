import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:la_veranera/src/core/config/environment.dart';
import 'package:la_veranera/src/core/util/secure_storage_util.dart';
import 'package:la_veranera/src/data/model/mesa_model.dart';

abstract class MesaData {
  Future<MesaModel> listarMesas();
}

class MesaDataImpl implements MesaData {
  final _storage = SecureStorageUtil();

  @override
  Future<MesaModel> listarMesas() async {
    try {
      final url = "${Environment.host}config/listar";
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
}
