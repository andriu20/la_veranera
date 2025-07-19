import 'package:get_it/get_it.dart';
import 'package:la_veranera/src/data/data/auth_data.dart';
import 'package:la_veranera/src/data/data/caja_data.dart';
import 'package:la_veranera/src/data/data/mesa_data.dart';
import 'package:la_veranera/src/data/data/plate_data.dart';
import 'package:la_veranera/src/data/repo/auth_repo_impl.dart';
import 'package:la_veranera/src/data/repo/caja_repo_impl.dart';
import 'package:la_veranera/src/data/repo/mesa_repo_impl.dart';
import 'package:la_veranera/src/data/repo/plate_repo_impl.dart';
import 'package:la_veranera/src/domain/repository/auth_repo.dart';
import 'package:la_veranera/src/domain/repository/caja_repo.dart';
import 'package:la_veranera/src/domain/repository/mesa_repo.dart';
import 'package:la_veranera/src/domain/repository/plate_repo.dart';

final sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authData: sl()));
  sl.registerLazySingleton<CajaRepo>(() => CajaRepoImpl(cajaData: sl()));
  sl.registerLazySingleton<PlateRepo>(() => PlateRepoImpl(plateData: sl()));
  sl.registerLazySingleton<MesaRepo>(() => MesaRepoImpl(mesaData: sl()));

  sl.registerLazySingleton<AuthData>(() => AuthDataImpl());
  sl.registerLazySingleton<CajaData>(() => CajaDataImpl());
  sl.registerLazySingleton<PlateData>(() => PlateDataImpl());
  sl.registerLazySingleton<MesaData>(() => MesaDataImpl());
}
