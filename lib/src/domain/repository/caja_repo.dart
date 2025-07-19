

import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';

abstract class CajaRepo {

  Future<Either<Failure, bool>> cajaAbierta({required String fecha});
}