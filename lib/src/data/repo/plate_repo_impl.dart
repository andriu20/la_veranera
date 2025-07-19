import 'package:dartz/dartz.dart';
import 'package:la_veranera/src/core/config/error/failures.dart';
import 'package:la_veranera/src/data/data/plate_data.dart';
import 'package:la_veranera/src/domain/dto/plate_dto.dart';
import 'package:la_veranera/src/domain/entity/platos_entity.dart';
import 'package:la_veranera/src/domain/repository/plate_repo.dart';

class PlateRepoImpl implements PlateRepo {
  final PlateData plateData;

  PlateRepoImpl({required this.plateData});

  @override
  Future<Either<Failure, bool>> crearPlato({required PlatoDto dto}) async {
    try {
      final res = await plateData.crearPlato(dto: dto);

      return Right(res);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, PlatosEntity>> listar() async {
    try {
      final res = await plateData.listar();

      return Right(res);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
