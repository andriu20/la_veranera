import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/domain/entity/mesa_entity.dart';

abstract class MesaRepo {
  Future<Either<Failure, MesaEntity>> listarMesas();
}
