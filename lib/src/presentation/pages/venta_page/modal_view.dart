import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/src/core/util/formato_moneda_util.dart';
import 'package:la_veranera/src/presentation/cubit/venta/venta_cubit.dart';
import 'package:la_veranera/src/presentation/pages/venta_page/modal_agregar.dart';

void modalVenta(BuildContext context, VentaCubit cubit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return BlocProvider.value(
        value: cubit,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .6,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ajusta altura al contenido
              children: [
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Platos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                BlocBuilder<VentaCubit, VentaState>(
                  builder: (context, state) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            state.platos == null ? 0 : state.platos!.length,
                        itemBuilder: (_, __) {
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              modalAgregar(context, state.platos![__]);
                            },
                            leading: Icon(Icons.radio_button_off),
                            title: Text(state.platos![__].nombre),
                            subtitle: Text(
                              "\$ ${FormatoMonedaUtil.formatear(state.platos![__].precio)}",
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
