import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(AppWidget(
    title: 'Gomes',
  ));
}

//StatelessWidget: é um estado para Widget imutavel, ou seja, não muda o status, não te animação e denrte outros...
class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

//StatefulWidget: é um estado para Widget dinamico, ou seja, quando precisar
//alterar algo na tela ele reconstroi o buil com os novos valores.
//Precisa de uma classe de apoio para retornar  e funcionar o estado
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    //pode trocar o valor gerado <valorGerado> pelo nome da classe por exemplo
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //GestureDetector: Metodoq que detecta quando ha um click em cima do texto
  //onTap: posso coocar um metodo dentro, que quado eu clicar ele vai aparecer o que estiver dentro

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          child: Text(
              'Murilo, esta contando: $contador'), //ao add $contador, esta mostrando a vriável. Ver que deve esta entre ''
          onTap: () {
            setState(() {
              //Usado para modificar o estado. Assim ele chama o build e reconstrou o Widget
              contador++;
            });
          },
        ),
      ),
    );
  }
}
