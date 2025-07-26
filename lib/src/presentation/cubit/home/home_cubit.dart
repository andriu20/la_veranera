// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:la_veranera/src/core/util/date_format.dart';
import 'package:la_veranera/src/core/util/message_util.dart';
import 'package:la_veranera/src/domain/dto/caja_dto.dart';
import 'package:la_veranera/src/domain/dto/mesa_dto.dart';
import 'package:la_veranera/src/domain/entity/mesa_entity.dart';
import 'package:la_veranera/src/domain/repository/caja_repo.dart';
import 'package:la_veranera/src/domain/repository/mesa_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  //Repositorios
  final CajaRepo cajaRepo;
  final MesaRepo mesaRepo;
  //Constructor

  HomeCubit({
    required BuildContext context,
    required this.cajaRepo,
    required this.mesaRepo,
  }) : super(HomeState(context: context));
  //Variables
  final precioInicial = TextEditingController();
  final cantidadMesas = TextEditingController();
  //Eventos
  //validaciones
  //Peticiones

  /**
   * 
   */
  Future<bool> cajaAbierta() async {
    bool e = false;
    emit(state.copyWith(loading: true));
    final fecha = DateTime.now();
    final r = await cajaRepo.cajaAbierta(
      fecha: DateFormatter.formatDate(fecha),
    );
    emit(state.copyWith(loading: false));

    r.fold((l) {}, (r) async{
      e = r;
      if (e) {
       await listarMesas();
      }
    });
    return e;
  }

  /**
 * 
 */
  void abrirCaja() async {
    emit(state.copyWith(loading: true));

    final r = await cajaRepo.abrirCaja(
      dto: CajaDto(
        fecha: DateTime.now(),
        apertura: Apertura(
          hora: "${TimeOfDay.hoursPerDay}:${TimeOfDay.minutesPerHour} ",
          montoInicial: int.parse(precioInicial.text),
        ),
      ),
    );
    emit(state.copyWith(loading: false)); 
    r.fold((l) {}, (r) async{
      if (r) {
       await cajaAbierta();
        MessageUtil.showSnackbar(state.context, "Operación exitosa");
      }
    });
  }

  Future<void> listarMesas() async {
    emit(state.copyWith(loading: true));
    final r = await mesaRepo.listarMesas(fecha: DateFormatter.formatDate(DateTime.now()));
    emit(state.copyWith(loading: false));

    r.fold((l) {}, (r) {

      for(var i in r.data){
        log(i.mesa.toString());
      }
      List<DatumMEntity> mesas =[];
      mesas.addAll(r.data);
      emit(state.copyWith(mesas: mesas));
  log("${state.mesas!.length}",name: "Número de mesas");

    });
  }

  void crearMesas() async {
    emit(state.copyWith(loading: true));

    final r = await mesaRepo.crearMesas(
      dto: MesaDto(cantidadMesas: int.parse(cantidadMesas.text)),
    );
    emit(state.copyWith(loading: false));
    r.fold((l) {}, (r) {
      if (r) {
        listarMesas();
        MessageUtil.showSnackbar(state.context, "Operación exitosa");
      }
    });
  }

  //Navegacion
  //Otros
}
