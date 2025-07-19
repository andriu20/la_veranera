
class CajaDto {
  DateTime fecha;
  Apertura apertura;

  CajaDto({required this.fecha, required this.apertura});

  Map<String, dynamic> toJson() => {
    "fecha":
        "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
    "apertura": apertura.toJson(),
  };
}

class Apertura {
  String hora;
  int montoInicial;

  Apertura({required this.hora, required this.montoInicial});

  Map<String, dynamic> toJson() => {"hora": hora, "montoInicial": montoInicial};
}
