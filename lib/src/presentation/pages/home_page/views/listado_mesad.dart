import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/src/presentation/cubit/home/home_cubit.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/mesa_view.dart';
import 'package:la_veranera/src/presentation/pages/venta_page/venta_page.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';

class ListadoMesad {
  static Widget listado() {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final c = context.read<HomeCubit>();
          if (state.mesas.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * .2,
                  ),
                  child:  Text(
                      "Ups, Aun no haz creado mesas.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * .02,
                      ),
                  ),
                ),
                SizedBox(height: 10),
               CustomButton(text: "Crear Mesas", onPressed: () {}),
              ],
            );
          }
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              itemCount: state.mesas.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columnas
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => VentaPage(
                              ocupada: state.mesas[index].estado == "Ocupada",
                              mesa: MesaDto(
                                estado: state.mesas[index].estado,
                                valor: 0,
                                mesa: "1",
                              ),
                            ),
                      ),
                    );
                  },
                  child: MesaView(
                    mesa: MesaDto(
                      estado: state.mesas[index].estado,
                      valor: 0,
                      mesa: "1",
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
