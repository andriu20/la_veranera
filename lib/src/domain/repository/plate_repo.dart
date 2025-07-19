import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/domain/dto/plate_dto.dart';
import 'package:la_veranera/src/domain/entity/platos_entity.dart';

abstract class PlateRepo {

  Future<Either<Failure, bool>> crearPlato({required PlatoDto dto});
  Future<Either<Failure, PlatosEntity>> listar();
}