import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/get_it.dart';
import 'package:la_veranera/src/presentation/cubit/home/home_cubit.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/listado_mesad.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/menu_view.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/not_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size _size;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<bool> _future;
  late HomeCubit _cubit;
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _cubit = HomeCubit(context: context, cajaRepo: sl(), mesaRepo: sl());
    _future = _cubit.cajaAbierta();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => _cubit,
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
              return FutureBuilder<bool>(
                future: _future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  return snapshot.data!
                      ? ListadoMesad()
                      : NotInfo();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _txt() => Center(
    child: Text(
      "Mesas",
      style: TextStyle(
        fontSize: _size.height * .04,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
