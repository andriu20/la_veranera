import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:la_veranera/src/core/util/message_util.dart';
import 'package:la_veranera/src/domain/entity/platos_entity.dart';
import 'package:la_veranera/src/domain/repository/plate_repo.dart';

part 'plates_state.dart';

class PlatesCubit extends Cubit<PlatesState> {
  //Repositorios
  final PlateRepo plateRepo;
  //Constructor

  PlatesCubit({required BuildContext context, required this.plateRepo})
    : super(PlatesState(context: context));

  //Variables
  //Eventos
  //Validaciones
  //Peticiones
  Future<PlatosEntity> obtenerPlatos() async {
    final r = await plateRepo.listar();
    PlatosEntity? platos;
    r.fold((l) {}, (r) {
      if (!r.success) {
        MessageUtil.showSnackbar(state.context, r.msg);
        return;
      }
      platos = r;
    });

    return platos!;
  }

  //Navegacion
  //Otros
}
