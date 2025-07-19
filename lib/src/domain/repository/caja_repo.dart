

import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/domain/dto/caja_dto.dart';

abstract class CajaRepo {

  Future<Either<Failure, bool>> cajaAbierta({required String fecha});
  Future<Either<Failure, bool>> abrirCaja({required CajaDto dto});
}