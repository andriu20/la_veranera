import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/get_it.dart';
import 'package:la_veranera/src/presentation/cubit/home/home_cubit.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/menu_view.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/mesa_view.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/not_info.dart';
import 'package:la_veranera/src/presentation/pages/venta_page/venta_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<MesaDto> mesa = [
    MesaDto(estado: "Ocupada", valor: 120000, mesa: "1"),
    MesaDto(estado: "Ocupada", valor: 10000, mesa: "2"),
    MesaDto(estado: "Libre", valor: 0, mesa: "3"),
    MesaDto(estado: "Libre", valor: 0, mesa: "4"),
    MesaDto(estado: "Libre", valor: 0, mesa: "5"),
    MesaDto(estado: "Libre", valor: 0, mesa: "6"),
    MesaDto(estado: "Libre", valor: 0, mesa: "7"),
    MesaDto(estado: "Libre", valor: 0, mesa: "8"),
    MesaDto(estado: "Libre", valor: 0, mesa: "9"),
    MesaDto(estado: "Libre", valor: 0, mesa: "10"),
    MesaDto(estado: "Libre", valor: 0, mesa: "11"),
    MesaDto(estado: "Libre", valor: 0, mesa: "12"),
  ];

  late Size _size;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    log("aaaaa");
    return BlocProvider(
      create: (context) => HomeCubit(context: context, cajaRepo: sl()),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(child: MenuView()),
        appBar: AppBar(
          title: _txt(),

          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final c = context.read<HomeCubit>();
              return FutureBuilder<bool>(
                future: c.cajaAbierta(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  return snapshot.data! ? _body() : NotInfo.body(size: _size);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _body() => Column(children: [SizedBox(height: 20), _mesas()]);

  Widget _txt() => Center(
    child: Text(
      "Mesas",
      style: TextStyle(
        fontSize: _size.height * .04,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _mesas() => Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: mesa.length,
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
                        ocupada: mesa[index].estado == "Ocupada",
                        mesa: mesa[index],
                      ),
                ),
              );
            },
            child: MesaView(mesa: mesa[index]),
          );
        },
      ),
    ),
  );
}
