import 'package:flutter/material.dart';
import 'package:la_veranera/src/presentation/pages/plates/plates_page.dart';

// ignore: must_be_immutable
class MenuView extends StatelessWidget {
  MenuView({super.key});

  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        _image(),
        Divider(),
        _option(
          txt: "Perfil",
          action: () {},
          leading: Icon(Icons.person_2_outlined),
        ),
        _option(
          txt: "Platos",
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PlatePage()),
            );
          },
          leading: Icon(Icons.dinner_dining),
        ),
        _option(
          txt: "Reportes",
          action: () {},
          leading: Icon(Icons.history_edu),
        ),
      
        _option(
          txt: "Cerrar sesión",
          action: () {},
          leading: Icon(Icons.exit_to_app),
        ),
      ],
    );
  }

  Widget _image() => Container(
    height: _size.height * .2,
    margin: EdgeInsets.only(top: _size.height * .1),
    child: Center(child: Image.asset("assets/png/food-and-restaurant.png")),
  );

  Widget _option({
    required String txt,
    required Function() action,
    required Widget leading,
  }) {
    return ListTile(leading: leading, onTap: action, title: Text(txt));
  }
}
