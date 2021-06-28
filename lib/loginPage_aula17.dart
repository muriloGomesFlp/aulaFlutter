import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String email = '';
String senha = '';

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //SingleChildScrollView: coloca todos os filhos para usar o scroll
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputEmail(email),
                InputSenha(senha),
                BtnLogin(email, senha),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  InputEmail(String email);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        scrollPadding: EdgeInsets.only(bottom: 100),
        onChanged: (emailInput) {
          email = emailInput;
        },
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
      ),
    );
  }
}

class InputSenha extends StatelessWidget {
  InputSenha(String senha);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        scrollPadding:
            EdgeInsets.only(bottom: 100), //ao aparecer o teclado sobe o widget
        onChanged: (senhaInput) {
          senha = senhaInput;
        },
        obscureText: true,
        decoration:
            InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
      ),
    );
  }
}

class BtnLogin extends StatelessWidget {
  BtnLogin(String email, String senha);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              email.length > 0 && senha.length > 6
                  ? Navigator.of(context).pushReplacementNamed('/home')
                  : showAlertaLogin(context);
            },
            icon: Icon(Icons.login),
            label: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}

showAlertaLogin(BuildContext context) {
  // configura o button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Atenção!"),
    content: Text("Usuário ou Senha inválidos."),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
