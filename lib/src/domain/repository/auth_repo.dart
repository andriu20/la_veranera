import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/domain/dto/auth_dto.dart';
import 'package:la_veranera/src/domain/entity/auth_Entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> auth({required AuthDto dto});
  
}
