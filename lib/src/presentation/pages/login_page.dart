// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/get_it.dart';
import 'package:la_veranera/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';
import 'package:la_veranera/src/presentation/widgets/input_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => AuthCubit(context: context, authRepo: sl()),
      child: Scaffold(
        backgroundColor: const Color(0xFFFDF9F9),
        body: SafeArea(child: _body()),
      ),
    );
  }

  Widget _body() {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            _image(),
            const SizedBox(height: 32),
            _title(),
            const SizedBox(height: 16),
            _form(),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return BackInDown(
      child: Hero(
        tag: 'logo',
        child: Image.asset(
          "assets/png/food-and-restaurant.png",
          height: _size.height * 0.25,
        ),
      ),
    );
  }

  Widget _title() {
    return BackInLeft(
      child: Column(
        children: const [
          Text(
            "Bienvenido de nuevo",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Inicia sesión para continuar",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final c = context.read<AuthCubit>();
        return BackInUp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInput(
                onChanged: (e) => c.formValid(),
                controller: c.userCtrl,
                label: "Usuario",
                prefixIcon: const Icon(Icons.person_outline),
              ),
              const SizedBox(height: 20),
              CustomInput(
                onChanged: (e) => c.formValid(),
                controller: c.passCtrl,
                label: "Contraseña",
                obscureText: state.obscureText,
                prefixIcon: const Icon(Icons.lock_outline),
                sufixIcon: IconButton(
                  icon: Icon(
                    state.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () => c.eventObscureText(),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Ingresar",
                onPressed: state.formValid ? () => c.login() : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
