import 'package:flutter/material.dart';
import 'package:ola_mundo/appWidget_controller.dart';

class HomePageAula15 extends StatefulWidget {
  @override
  State<HomePageAula15> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePageAula15> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
        actions: [MudarTemaSwich()],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $contador'),
            Container(
              height: 10,
            ), //pode usar para dar o escaço e modelar o layout
            MudarTemaSwich(),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, //este metodo cria um espaço entre os containers
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              contador++;
            });
          }),
    );
  }
}

class MudarTemaSwich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.switchforDarfk,
      onChanged: (value) {
        AppController.instance.mudarTema();
      },
    );
  }
}
