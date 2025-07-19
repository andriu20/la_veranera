import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/execptions.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/data/data/auth_data.dart';
import 'package:la_veranera/src/domain/dto/auth_dto.dart';
import 'package:la_veranera/src/domain/entity/auth_Entity.dart';
import 'package:la_veranera/src/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {

  final AuthData authData;

  AuthRepoImpl({required this.authData});
  @override
  Future<Either<Failure, AuthEntity>> auth({required AuthDto dto}) async{
    try {
      final r = await authData.auth(dto: dto);
      return Right(r);
      
    }  on ServerExceptions catch (e) {

      log("$e");
    return Left(ServerFailure(message: e.message));
  }
  }
}