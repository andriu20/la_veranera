// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/get_it.dart';
import 'package:la_veranera/src/core/util/formato_moneda_util.dart';
import 'package:la_veranera/src/domain/entity/platos_entity.dart';
import 'package:la_veranera/src/presentation/cubit/plates/plates_cubit.dart';
import 'package:la_veranera/src/presentation/pages/add_plate/add_plate.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';

class PlatePage extends StatelessWidget {
  PlatePage({super.key});

  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => PlatesCubit(context: context, plateRepo: sl()),
      child: Scaffold(
        appBar: AppBar(title: Text("Platos")),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: _size.width,
            alignment: Alignment.centerRight,
            child: CustomButton(
              text: "Agregar Plato",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddPlatePage()),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          _plates(),
        ],
      ),
    );
  }

  Widget _plates() {
    return BlocBuilder<PlatesCubit, PlatesState>(
      builder: (context, state) {
        final c = context.read<PlatesCubit>();
        return FutureBuilder<PlatosEntity>(
          future: c.obtenerPlatos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            final platos = snapshot.data!.data ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: platos.length,
                itemBuilder: (_, __) {
                  return ListTile(
                    title: Text(platos[__].nombre),
                    subtitle: Text("\$ ${FormatoMonedaUtil.formatear(platos[__].precio)}"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
