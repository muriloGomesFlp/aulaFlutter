import 'package:flutter/material.dart';
import 'package:ola_mundo/appWidget_controller.dart';

class HomePageAula25e26 extends StatefulWidget {
  @override
  State<HomePageAula25e26> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePageAula25e26> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        //Menu Lateral
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                //Header de account
                currentAccountPicture: ClipOval(
                  //ClipOval deixa redondo, só setar ele
                  //ClipRRect - corta os filhos como quiser(deixar a img redonda por exemplo)
                  //se usar o ClipRRect, definir: borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI3vvVZ-pOGsyhaNEm9s-tm96lh7OGxJrpPQ&usqp=CAU'),
                ),
                accountName: Text('Murilo Gomes'),
                accountEmail: Text('lilo.flp@gmail.com')),
            ListTile(
              //criar lista de opções
              leading: Icon(Icons.home),
              title: Text('Home'),
              subtitle: Text('subTitle'),
              onTap: () {
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Finalizar Sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ), //Menu lateral
      appBar: AppBar(
        title: Text('Teste'),
        actions: [MudarTemaSwich()],
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          //ListView é a Column so que com o scroll, usar quando os elementos ultrapassam a tela.
          //mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ),
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
