import 'package:flutter/material.dart';
import 'package:ola_mundo/appWidget_controller.dart';
import 'package:ola_mundo/desafio.dart';
//mport 'package:ola_mundo/home_page_aula_25e26.dart';
//import 'loginPage_aula24.dart';

//StatelessWidget: é um estado para Widget imutavel, ou seja, não muda o status, não te animação e denrte outros...
class AppWidgetAula19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
            //theme: ThemeData.light(),
            theme: ThemeData(
                primarySwatch: Colors.green,
                brightness: AppController.instance.switchforDarfk
                    /*Uso de ternário para condições, 
              if (?) AppController.instance.switchforDarfk for V é Brightness.dark
              senão é Brightness.light
              */
                    ? Brightness.dark
                    : Brightness.light),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginDesafio(),
              //'/': (context) => LoginPageAula24(),
              //'/home': (context) => HomePageAula25e26()
            });
      },
    );
  }
}
