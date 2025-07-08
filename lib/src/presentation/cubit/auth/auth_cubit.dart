import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:la_veranera/src/presentation/pages/home_page/home_page.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  ///Repositorio
  ///Constructor

  AuthCubit({required BuildContext context})
    : super(AuthState(context: context));

  ///Variables

  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  ///Eventos
  void eventObscureText() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  ///Validaciones
  void formValid() {
    bool e = false;
    if (passCtrl.text.isNotEmpty && userCtrl.text.isNotEmpty) {
      e = true;
    }
    emit(state.copyWith(formValid: e));
  }

  ///Peticiones
  ///Navegación

  void goToHome() => Navigator.pushAndRemoveUntil(
    state.context,
    MaterialPageRoute(builder: (_) => HomePage()),
    (_) => false,
  );

  ///Otros
}
