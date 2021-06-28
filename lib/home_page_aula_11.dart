import 'package:flutter/material.dart';

//StatefulWidget: é um estado para Widget dinamico, ou seja, quando precisar
//alterar algo na tela ele reconstroi o buil com os novos valores.
//Precisa de uma classe de apoio para retornar  e funcionar o estado

class HomePageAula10 extends StatefulWidget {
  @override
  State<HomePageAula10> createState() {
    //pode trocar o valor gerado <valorGerado> pelo nome da classe por exemplo
    return HomePageState();
  }
}

class HomePageState extends State<HomePageAula10> {
  //GestureDetector: Metodoq que detecta quando ha um click em cima do texto
  //onTap: posso coocar um metodo dentro, que quado eu clicar ele vai aparecer o que estiver dentro

/*Classe Center, Aligment são tipos de sigleRender que impacta ao criar elementos
na tela. Este elemento pode não mudar, pois esta utilizando o mesmo render,
deste modo, ao usar de Classes singleRende junto com os child irá renderizar 
independente. Ver aula #11
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teste')),
      body: Container(
        height: 200,
        width: 200,
        color: Colors.green[900],
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            color: Colors.yellow[200],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //ação para botão
          }),
    );
  }
}
