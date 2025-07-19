import 'package:flutter/material.dart';

class MessageUtil {

static  void showSnackbar(BuildContext context, String mensaje) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating, // flota sobre el contenido
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

}