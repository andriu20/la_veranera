class AuthDto {
  final String correo;
  final String contrasenia;

  AuthDto({required this.correo, required this.contrasenia});

  Map<String, dynamic> toJson() => {
    "correo": correo,
    "contrasenia": contrasenia,
  };
}
