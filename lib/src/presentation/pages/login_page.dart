import 'package:flutter/material.dart';
import 'package:la_veranera/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';
import 'package:la_veranera/src/presentation/widgets/input_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => AuthCubit(context: context),
      child: Scaffold(body: _body()),
    );
  }

  Widget _body() => Column(children: [_image(), _txt(), _form()]);

  Widget _image() => Container(
    height: _size.height * .2,
    margin: EdgeInsets.only(top: _size.height * .1),
    child: Center(child: Image.asset("assets/png/food-and-restaurant.png")),
  );

  Widget _txt() => Container(
    margin: EdgeInsets.only(top: _size.height * .04),
    child: Text(
      "Iniciar sesión",
      style: TextStyle(
        fontSize: _size.height * .02,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _form() => BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      final c = context.read<AuthCubit>();
      return Container(
        margin: EdgeInsets.symmetric(horizontal: _size.width * .1),
        child: Column(
          children: [
            SizedBox(height: 20),

            CustomInput(
              onChanged: (e) {
                c.formValid();
              },
              controller: c.userCtrl,
              label: "Usuario",
              prefixIcon: Icon(Icons.person_2_outlined),
            ),
            SizedBox(height: 20),
            CustomInput(
              onChanged: (e) {
                c.formValid();
              },
              controller: c.passCtrl,
              label: "Contraseña",
              sufixIcon: IconButton(
                onPressed: () {
                  c.eventObscureText();
                },
                icon: Icon(
                  !state.obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              obscureText: state.obscureText,
              prefixIcon: Icon(Icons.lock_person),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Ingresar",
              onPressed: state.formValid ? () {
                c.goToHome();
              } : null,
            ),
          ],
        ),
      );
    },
  );
}
