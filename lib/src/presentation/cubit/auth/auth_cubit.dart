

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:la_veranera/src/core/util/message_util.dart';
import 'package:la_veranera/src/core/util/secure_storage_util.dart';
import 'package:la_veranera/src/domain/dto/auth_dto.dart';
import 'package:la_veranera/src/domain/repository/auth_repo.dart';
import 'package:la_veranera/src/presentation/pages/home_page/home_page.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  ///Repositorio
  final AuthRepo authRepo;
  final _storage = SecureStorageUtil();

  ///Constructor

  AuthCubit({required BuildContext context, required this.authRepo})
    : super(AuthState(context: context)) {
    _check();
  }

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
  void login() async {
    final r = await authRepo.auth(
      dto: AuthDto(correo: userCtrl.text, contrasenia: passCtrl.text),
    );

    r.fold(
      (l) {
        MessageUtil.showSnackbar(
          state.context,
          "Error desconocido, intente de nuevo.",
        );
      },
      (r) {
        if (!r.success) {
          MessageUtil.showSnackbar(state.context, r.msg);
          return;
        }
        _storage.write("token", r.data.token);
        _goToHome();
      },
    );
  }

  ///Navegación

  void _goToHome() => Navigator.pushAndRemoveUntil(
    state.context,
    MaterialPageRoute(builder: (_) => HomePage()),
    (_) => false,
  );

  ///Otros
  ///

  _check() async {
    String token = await _storage.read("token") ?? "";
    if (token.isNotEmpty && !JwtDecoder.isExpired(token))  {
      _goToHome();
    }
  }
}
