import 'package:flutter/material.dart';

import 'home_page.dart';

//StatelessWidget: é um estado para Widget imutavel, ou seja, não muda o status, não te animação e denrte outros...
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.light(),
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}
