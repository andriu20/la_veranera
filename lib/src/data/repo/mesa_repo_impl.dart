import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/execptions.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/data/data/mesa_data.dart';
import 'package:la_veranera/src/domain/dto/mesa_dto.dart';
import 'package:la_veranera/src/domain/entity/mesa_entity.dart';
import 'package:la_veranera/src/domain/repository/mesa_repo.dart';

class MesaRepoImpl implements MesaRepo {
  final MesaData mesaData;

  MesaRepoImpl({required this.mesaData});
  @override
  Future<Either<Failure, MesaEntity>> listarMesas({required String fecha}) async {
    try {
      final r = await mesaData.listarMesas(fecha:fecha);

      return Right(r);
    } on ServerExceptions catch (e) {
      log("$e");
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> crearMesas({required MesaDto dto}) async {
    try {
      final r = await mesaData.crearMesa(dto: dto);

      return Right(r);
    } on ServerExceptions catch (e) {
      log("$e");
      return Left(ServerFailure(message: e.message));
    }
  }
}
