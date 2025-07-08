import 'package:flutter/material.dart';
import 'package:la_veranera/src/presentation/pages/home_page/views/mesa_view.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';

// ignore: must_be_immutable
class VentaPage extends StatelessWidget {
  final bool ocupada;
  final MesaDto mesa;
  VentaPage({super.key, required this.ocupada, required this.mesa});
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return Scaffold(appBar: AppBar(title: Text("Venta")), body: _body());
  }

  Widget _body() {
    return Column(
      children: [
        _card(),
        SizedBox(height: 20),
        _optiosn(),
        SizedBox(height: 20),

        _plates()
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
              _rowText(txt1: "Platos: ", txt2: mesa.valor == 0 ? "0" : "4"),
              _rowText(txt1: "Cuenta: ", txt2: mesa.valor.toString()),
              _rowText(txt1: "Estado: ", txt2: mesa.estado),
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
        visible: mesa.estado=="Ocupada",
        child: CustomButton(text: "Cobrar", onPressed: () {})),
      SizedBox(width: 40),
      CustomButton(text: "Agregar plato", onPressed: () {}),
    ],
  );

    Widget _plates() {
    return Visibility(
        visible: mesa.estado=="Ocupada",
      child: Expanded(
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (_, __) {
            return ListTile(
              title: Text("Plato $__"),
              subtitle: Text("\$ 12.000"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
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
