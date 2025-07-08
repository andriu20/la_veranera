import 'package:flutter/material.dart';
import 'package:la_veranera/src/presentation/pages/add_plate/add_plate.dart';
import 'package:la_veranera/src/presentation/widgets/btn_widget.dart';

class PlatePage extends StatelessWidget {
  PlatePage({super.key});

  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: Text("Platos")),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: _size.width,
            alignment: Alignment.centerRight,
            child: CustomButton(
              text: "Agregar Plato",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddPlatePage()),
                );
              },
            ),
          ),
          SizedBox(height: 20,),
          _plates()
        ],
      ),
    );
  }

  Widget _plates() {
    return Expanded(
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
    );
  }
}
