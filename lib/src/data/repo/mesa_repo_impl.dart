import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/execptions.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/data/data/mesa_data.dart';
import 'package:la_veranera/src/domain/entity/mesa_entity.dart';
import 'package:la_veranera/src/domain/repository/mesa_repo.dart';

class MesaRepoImpl implements MesaRepo {
  final MesaData mesaData;

  MesaRepoImpl({required this.mesaData});
  @override
  Future<Either<Failure, MesaEntity>> listarMesas() async {
    try {
      final r = await mesaData.listarMesas();

      return Right(r);
    } on ServerExceptions catch (e) {
      log("$e");
      return Left(ServerFailure(message: e.message));
    }
  }
}
