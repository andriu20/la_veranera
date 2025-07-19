import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:la_veranera/src/core/util/message_util.dart';
import 'package:la_veranera/src/domain/dto/plate_dto.dart';
import 'package:la_veranera/src/domain/repository/plate_repo.dart';
import 'package:la_veranera/src/presentation/pages/home_page/home_page.dart';

part 'add_plate_state.dart';

class AddPlateCubit extends Cubit<AddPlateState> {
  //Repositorio
  final PlateRepo plateRepo;
  //Constructor
  AddPlateCubit({required BuildContext context, required this.plateRepo})
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
  //Peticiones
  void agregarPlato() async {
    emit(state.copwyWith(loading: true));
    final r = await plateRepo.crearPlato(
      dto: PlatoDto(
        nombre: nameCtrl.text,
        precio: int.parse(priceCtrl.text),
        descripcion: descriptionCtrl.text,
        fechaCreacion: DateTime.now(),
        fechaActualizacion: DateTime.now(),
        disponible: true,
      ),
    );
    emit(state.copwyWith(loading: false));
    r.fold((l) {}, (r) {
      MessageUtil.showSnackbar(state.context, "Plato creado con éxito");
      goToHome();
    });
  }

  //Navegacion
  goToHome() => Navigator.pushAndRemoveUntil(
    state.context,
    MaterialPageRoute(builder: (_) => HomePage()),
    (_) => false,
  );
  //Otros
}
