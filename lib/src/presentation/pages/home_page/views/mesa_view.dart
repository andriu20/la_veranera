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
    final isOcupada = mesa.estado == "Ocupada";
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        color: isOcupada ? Colors.red.shade50 : Colors.green.shade50,
        border: Border.all(
          color: isOcupada ? Colors.redAccent : Colors.green,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Mesa ${mesa.mesa}",
            style: TextStyle(
              fontSize: size.height * 0.035,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          _infoText("Estado", mesa.estado, isOcupada),
          _infoText("Cuenta", "\$ ${mesa.valor}", isOcupada),
          SizedBox(height: 10),
          Text(
            "Ver detalle",
            style: TextStyle(
              color: isOcupada ? Colors.redAccent : Colors.green.shade800,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }

  Widget _infoText(String label, String value, bool isOcupada) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        children: [
          TextSpan(
            text: "$label: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: isOcupada ? Colors.redAccent : Colors.green.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
