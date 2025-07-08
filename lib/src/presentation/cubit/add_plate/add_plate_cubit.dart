import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'add_plate_state.dart';

class AddPlateCubit extends Cubit<AddPlateState> {
  //Repositorio

  //Constructor
  AddPlateCubit({required BuildContext context})
    : super(AddPlateState(context: context));

  //Variables
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  //Eventos

  void formValid() {
    bool e = false;
    if (nameCtrl.text.isNotEmpty &&
        priceCtrl.text.isNotEmpty &&
        descriptionCtrl.text.isNotEmpty) {
      e = true;
    }

    emit(state.copwyWith(formValid: e));
  }

  //Validaciones
  //Validaciones
  //Navegacion
  //Otros
}
