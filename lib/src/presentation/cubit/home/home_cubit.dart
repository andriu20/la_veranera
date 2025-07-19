import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:la_veranera/src/core/util/date_format.dart';
import 'package:la_veranera/src/core/util/message_util.dart';
import 'package:la_veranera/src/domain/dto/caja_dto.dart';
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
  //Eventos
  //validaciones
  //Peticiones

  /**
   * 
   */
  Future<bool> cajaAbierta() async {
    bool e = false;
    final fecha = DateTime.now();
    final r = await cajaRepo.cajaAbierta(
      fecha: DateFormatter.formatDate(fecha),
    );

    r.fold((l) {}, (r) {
      e = r;
      if (e) {
        listarMesas();
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
    r.fold((l) {}, (r) {
      if (r) {
        cajaAbierta();
        MessageUtil.showSnackbar(state.context, "Operación exitosa");
      }
    });
  }

  void listarMesas() async {
    emit(state.copyWith(loading: true));
    final r = await mesaRepo.listarMesas();
    emit(state.copyWith(loading: false));

    r.fold((l) {}, (r) {
      emit(state.copyWith(mesas: r.data));
    });
  }

  //Navegacion
  //Otros
}
