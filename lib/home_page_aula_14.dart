import 'package:flutter/material.dart';
import 'package:ola_mundo/appWidget_controller.dart';

//StatefulWidget: é um estado para Widget dinamico, ou seja, quando precisar
//alterar algo na tela ele reconstroi o buil com os novos valores.
//Precisa de uma classe de apoio para retornar  e funcionar o estado

class HomePageAula14 extends StatefulWidget {
  @override
  State<HomePageAula14> createState() {
    //pode trocar o valor gerado <valorGerado> pelo nome da classe por exemplo
    return HomePageState();
  }
}

class HomePageState extends State<HomePageAula14> {
  //GestureDetector: Metodoq que detecta quando ha um click em cima do texto
  //onTap: posso coocar um metodo dentro, que quado eu clicar ele vai aparecer o que estiver dentro
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
        actions: [MudarTemaSwich()],
      ),
      /* -->Metodo Colum precisa do children (filhos "plural"), vai add um abaixo do outro;
      -->Quando necessitar de alterar o width ou height de uma coluna, esta deve
      estra dentro de um container ou SizedBox. Desta forma o Column "herda" os 
      valores de tamanho do seu PAI(Sizedbox ou Container).
      --> no widht, esta sendo usado o double.infinity para ir ate o final da tela a largura
      da coluna;
      --> para alinha a coluna pode-se usar o mainAxisAlignment ou o CrossAxisAlignment 
      que server para alilinha no final ou no inicio por exemplo.*/
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center se refere o centro da tela
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Contador: $contador'),
            MudarTemaSwich(),
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
/* IMPORTANTE: ctrl+alt+p => Flutter:Toggle Debug Painting - mostra as linhas guia
para a construção do layout do app;*/

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
