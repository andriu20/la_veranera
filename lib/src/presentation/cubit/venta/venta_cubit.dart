import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:la_veranera/src/domain/entity/platos_entity.dart';
import 'package:la_veranera/src/domain/repository/plate_repo.dart';

part 'venta_state.dart';

class VentaCubit extends Cubit<VentaState> {
  ///Repositorios
  final PlateRepo plateRepo;

  ///constructor
  VentaCubit({required BuildContext context, required this.plateRepo})
    : super(VentaState(context: context));

  ///Variables
  ///Eventos
  ///Validaciones
  ///Peticiones

  void getPlatos() async {
    if (state.platos == null) {
      final r = await plateRepo.listar();
      r.fold((l) {}, (r) {
        emit(state.copyWith(platos: r.data));
      });
    }
  }

  void addPlato(DatumEntity p){
    final ps= state.platosSeleccionados ??[];
    ps.add(p);
    emit(state.copyWith(platosSeleccionados: ps));
  }

  ///Navegacion
  ///Otros
}
