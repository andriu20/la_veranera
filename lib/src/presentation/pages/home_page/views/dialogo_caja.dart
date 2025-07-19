import 'package:flutter/material.dart';
import 'package:la_veranera/src/presentation/cubit/home/home_cubit.dart';
import 'package:la_veranera/src/presentation/widgets/input_widget.dart';

dialog(BuildContext context, Function() action, HomeCubit cubit) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog.adaptive(
        title: Text(
          "Abrir Caja",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
        content: Text(
          "Estas a punto de realizar la apertura de caja, ¿Deseas continuar?",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancelar", style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              aperturaDialogo(context, cubit);
            },
            child: Text("Continuar", style: TextStyle(color: Colors.green)),
          ),
        ],
      );
    },
  );
}

aperturaDialogo(BuildContext context, HomeCubit cubit) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog.adaptive(
        title: Text(
          "Monto de apertura",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomInput(
              onChanged: (e) {},
              controller: cubit.precioInicial,

              prefixIcon: Icon(Icons.attach_money_sharp),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancelar", style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              cubit.abrirCaja();
            },
            child: Text("Abrir", style: TextStyle(color: Colors.green)),
          ),
        ],
      );
    },
  );
}
