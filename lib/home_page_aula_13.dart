import 'package:flutter/material.dart';
import 'package:ola_mundo/appWidget_controller.dart';

//StatefulWidget: é um estado para Widget dinamico, ou seja, quando precisar
//alterar algo na tela ele reconstroi o buil com os novos valores.
//Precisa de uma classe de apoio para retornar  e funcionar o estado

class HomePageAula13 extends StatefulWidget {
  @override
  State<HomePageAula13> createState() {
    //pode trocar o valor gerado <valorGerado> pelo nome da classe por exemplo
    return HomePageState();
  }
}

class HomePageState extends State<HomePageAula13> {
  //GestureDetector: Metodoq que detecta quando ha um click em cima do texto
  //onTap: posso coocar um metodo dentro, que quado eu clicar ele vai aparecer o que estiver dentro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
        actions: [MudarTemaSwich()],
      ),
      body: Center(child: MudarTemaSwich()),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //ação
          }),
    );
  }
}

// atalho stl: cria a estrutura da classe StatelessWidget
class MudarTemaSwich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.switchforDarfk,
      onChanged: (value) {
        /*por ser um swicth, este trabalho com V/F, onchange seria este 
            valor. Dentro do {} entra a função sobre quando sofrer a 
            alteração, neste caso o "setState" que muda o estado do 
            widget Local;*/
        AppController.instance.mudarTema();
      },
    );
  }
}
