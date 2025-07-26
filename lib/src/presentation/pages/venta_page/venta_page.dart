import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_veranera/get_it.dart';
import 'package:la_veranera/src/domain/entity/mesa_entity.dart';
import 'package:la_veranera/src/presentation/cubit/venta/venta_cubit.dart';
import 'package:la_veranera/src/presentation/pages/venta_page/modal_view.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';

// ignore: must_be_immutable
class VentaPage extends StatefulWidget {
  final bool ocupada;
  final DatumMEntity mesa;
  VentaPage({super.key, required this.ocupada, required this.mesa});

  @override
  State<VentaPage> createState() => _VentaPageState();
}

class _VentaPageState extends State<VentaPage> {
  late Size _size;

  late VentaCubit ventaCubit;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    ventaCubit = VentaCubit(context: context, plateRepo: sl());
    ventaCubit.getPlatos();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => ventaCubit,
      child: Scaffold(appBar: AppBar(title: Text("Venta")), body: _body()),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _card(),
        SizedBox(height: 20),
        _optiosn(),
        SizedBox(height: 20),

        _plates(),
      ],
    );
  }

  Widget _card() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: SizedBox(
        width: _size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rowText(txt1: "Platos: ", txt2: 0 == 0 ? "0" : "4"),
              _rowText(txt1: "Cuenta: ", txt2: 0.toString()),
              _rowText(txt1: "Estado: ", txt2: widget.mesa.estado),
            ],
          ),
        ),
      ),
    );
  }

  Widget _optiosn() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Visibility(
        visible: widget.mesa.estado == "Ocupada",
        child: CustomButton(text: "Cobrar", onPressed: () {}),
      ),
      SizedBox(width: 40),
      CustomButton(
        text: "Agregar plato",
        onPressed: () {
          modalVenta(context,ventaCubit);
        },
      ),
    ],
  );

  Widget _plates() {
    return Visibility(
      visible: widget.mesa.estado == "Ocupada",
      child: Expanded(
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (_, __) {
            return ListTile(
              title: Text("Plato $__"),
              subtitle: Text("\$ 12.000"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _rowText({required String txt1, required String txt2}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(text: txt1, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: txt2),
          ],
        ),
      ),
    );
  }
}
