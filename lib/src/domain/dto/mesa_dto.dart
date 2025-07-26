class MesaDto {
  final int cantidadMesas;

  MesaDto({required this.cantidadMesas});

  Map<String, dynamic> toJson() {
    return {"cantidadMesas": cantidadMesas};
  }
}
