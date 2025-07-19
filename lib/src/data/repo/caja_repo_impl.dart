import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/execptions.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/data/data/caja_data.dart';
import 'package:la_veranera/src/domain/repository/caja_repo.dart';

class CajaRepoImpl implements CajaRepo {
  final CajaData cajaData;

  CajaRepoImpl({required this.cajaData});
  @override
  Future<Either<Failure, bool>> cajaAbierta({required String fecha})async {
    try {
      final r = await cajaData.cajaAbierta(fecha: fecha);

      return Right(r);
    } on ServerExceptions catch (e) {

      log("$e");
      return Left(ServerFailure(message:  e.message));
    }
  }
}