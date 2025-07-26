import 'package:flutter/material.dart';
import 'package:la_veranera/src/core/util/formato_moneda_util.dart';
import 'package:la_veranera/src/domain/entity/mesa_entity.dart';
import 'package:la_veranera/src/presentation/pages/venta_page/venta_page.dart';

class MesaView extends StatelessWidget {
  final DatumMEntity mesa;
  const MesaView({super.key, required this.mesa});

  @override
  Widget build(BuildContext context) {
    final isOcupada = mesa.estado == "Ocupada";
    final size = MediaQuery.sizeOf(context);

    return Card(
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 1),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                height: size.height * .15,
                width: size.width * .4,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Image.asset("assets/png/mesa-redonda.png"),
                    ),
                    Positioned(
                      left: .5,
                      right: .5,
                      child: Center(
                        child: Text(
                          mesa.mesa.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * .05,
                            color: isOcupada ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Detalle",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Estado: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: mesa.estado.toLowerCase()),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Total: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: FormatoMonedaUtil.formatear(0)),
                        ],
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => VentaPage(
                                    ocupada: mesa.estado == "Ocupada",
                                    mesa: mesa,
                                  ),
                            ),
                          );
                        },
                        child: Text("Ver detalle"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
