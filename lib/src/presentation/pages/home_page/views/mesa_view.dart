import 'package:flutter/material.dart';

class MesaDto {
  final String mesa;
  final String estado;
  final int valor;

  MesaDto({required this.estado, required this.valor, required this.mesa});
}

class MesaView extends StatelessWidget {
  final MesaDto mesa;
  const MesaView({super.key, required this.mesa});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color:
            mesa.estado == "Ocupada"
                ? Colors
                    .red
                    .shade100 // 👉 rojo muy suave
                : const Color.fromARGB(
                  61,
                  200,
                  230,
                  201,
                ), // 👉 verde muy suave (no seleccionada)
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
        boxShadow:
            mesa.estado == "Ocupada"
                ? [BoxShadow(color: Colors.grey, offset: Offset(1, 2))]
                : [],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mesa.mesa,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * .05,
            ),
          ),

          _rowText(txt1: "Estado: ", txt2: mesa.estado),
          SizedBox(height: 5),

          _rowText(txt1: "Cuenta: ", txt2: "\$ ${mesa.valor}"),
          SizedBox(height: 5),
          Text("Ver detalle", style: TextStyle(color: Colors.red)),
        ],
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
