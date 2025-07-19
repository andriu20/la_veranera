import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/get_it.dart';
import 'package:la_veranera/src/presentation/cubit/add_plate/add_plate_cubit.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';
import 'package:la_veranera/src/presentation/widgets/input_widget.dart';
import 'package:la_veranera/src/presentation/widgets/loading_widget.dart';

class AddPlatePage extends StatelessWidget {
  const AddPlatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPlateCubit(context: context, plateRepo: sl()),
      child: Scaffold(
        appBar: AppBar(title: Text("Agregar plato")),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<AddPlateCubit, AddPlateState>(
      builder: (context, state) {
        final c = context.read<AddPlateCubit>();
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CustomInput(
                    onChanged: (e) {
                      c.formValid();
                    },
                    controller: c.nameCtrl,
                    label: "Nombre del plato",
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    onChanged: (e) {
                      c.formValid();
                    },
                    controller: c.priceCtrl,
                    label: "Precio",
                  ),
                  SizedBox(height: 10),
                  CustomInput(
                    onChanged: (e) {
                      c.formValid();
                    },
                    controller: c.descriptionCtrl,
                    label: "Descripción",
                    lines: 4,
                  ),

                  SizedBox(height: 20),
                  CustomButton(
                    text: "Agregar",
                    onPressed:
                        state.formValid
                            ? () {
                              c.agregarPlato();
                            }
                            : null,
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
