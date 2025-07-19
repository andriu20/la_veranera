import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:la_veranera/src/core/config/environment.dart';
import 'package:la_veranera/src/data/model/auth_model.dart';
import 'package:la_veranera/src/domain/dto/auth_dto.dart';

abstract class AuthData{

  Future<AuthModel> auth({required AuthDto dto});
}

class AuthDataImpl implements AuthData{
  @override
  Future<AuthModel> auth({required AuthDto dto}) async{
    try {
      final url = "${Environment.host}user/ingresar";
      final dio = Dio();
      final request = await dio.post(url, data: dto.toJson());

      return AuthModel.fromJson(request.data);
    } catch (e) {
      log("$e", name: "Error al realizar ingreso");
      rethrow;
    }
  }
}