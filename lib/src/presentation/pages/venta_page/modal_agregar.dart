import 'package:flutter/material.dart';
import 'package:la_veranera/src/core/util/formato_moneda_util.dart';
import 'package:la_veranera/src/domain/entity/platos_entity.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';
import 'package:la_veranera/src/presentation/widgets/input_widget.dart';

modalAgregar(BuildContext context, DatumEntity plato) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog.adaptive(
        title: Text("Cantidad"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Plato: ${plato.nombre}"),
            Text("Precio: \$ ${FormatoMonedaUtil.formatear(plato.precio)}"),
            SizedBox(height: 5),
            CustomInput(
              onChanged: (e) {},
              controller: TextEditingController(),
              label: "Cantidad de platos",
            ),
            SizedBox(height: 5),
            CustomButton(text: "Agregar", onPressed: () {}),
          ],
        ),
      );
    },
  );
}
