import 'package:flutter/material.dart';

//StatefulWidget: é um estado para Widget dinamico, ou seja, quando precisar
//alterar algo na tela ele reconstroi o buil com os novos valores.
//Precisa de uma classe de apoio para retornar  e funcionar o estado

class HomePageAula9 extends StatefulWidget {
  @override
  State<HomePageAula9> createState() {
    //pode trocar o valor gerado <valorGerado> pelo nome da classe por exemplo
    return HomePageState();
  }
}

class HomePageState extends State<HomePageAula9> {
  //GestureDetector: Metodoq que detecta quando ha um click em cima do texto
  //onTap: posso coocar um metodo dentro, que quado eu clicar ele vai aparecer o que estiver dentro

  int contador = 0;

/*Classe Center, Aligment são tipos de sigleRender que impacta ao criar elementos
na tela. Este elemento pode não mudar, pois esta utilizando o mesmo render,
deste modo, ao usar de Classes singleRende junto com os child irá renderizar 
independente. Ver aula #11
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teste')),
      body: Center(
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
