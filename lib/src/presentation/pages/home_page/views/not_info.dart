import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/src/presentation/cubit/home/home_cubit.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/dialogo_caja.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';
import 'package:la_veranera/src/presentation/widgets/loading_widget.dart';

class NotInfo {
  static Widget body({required Size size}) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final c = context.read<HomeCubit>();
        return Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * .2),
                    child: BackInDown(
                      child: Text(
                        "Ups, para el día de hoy no haz realizado apertura de caja.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: size.height * .02),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BackInUp(
                    child: CustomButton(
                      text: "Abrir caja",
                      onPressed: () {
                        dialog(state.context, () {}, c);
                      },
                    ),
                  ),
                ],
              ),
            ),

            Visibility(child: LoadingWidget.loading(), visible: state.loading),
          ],
        );
      },
    );
  }
}
