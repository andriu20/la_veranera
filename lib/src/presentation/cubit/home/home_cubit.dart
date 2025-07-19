import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:la_veranera/src/core/util/date_format.dart';
import 'package:la_veranera/src/domain/repository/caja_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  //Repositorios
  final CajaRepo cajaRepo;
  //Constructor

  HomeCubit({required BuildContext context, required this.cajaRepo})
    : super(HomeState(context: context)){

      log("KLS");
      debugPrint("ssss");
    }
  //Variables
  //Eventos
  //validaciones
  //Peticiones
  Future<bool> cajaAbierta()async{
    log(".a.a.a");
    final fecha = DateTime.now();    
 await cajaRepo.cajaAbierta(fecha: DateFormatter.formatDate(fecha));
return false;
  }
  //Navegacion
  //Otros
}
