import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/src/presentation/cubit/home/home_cubit.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/dialogos.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/mesa_view.dart';
import 'package:la_veranera/src/presentation/pages/venta_page/venta_page.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';

class ListadoMesad extends StatelessWidget {
  const ListadoMesad({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final c = context.read<HomeCubit>();
        if (state.mesas==null || state.mesas!.isEmpty) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .9,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * .2,
                  ),
                  child: Text(
                    "Ups, Aun no haz creado mesas.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * .02,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: "Crear Mesas",
                  onPressed: () {
                    crearMesa(context, c);
                  },
                ),
              ],
            ),
          );
        }
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: state.mesas==null? 0:state.mesas!.length,
            itemBuilder: (_,__){
            return MesaView(mesa: state.mesas![__]);
          }),
        );
      },
    );
  }
}
