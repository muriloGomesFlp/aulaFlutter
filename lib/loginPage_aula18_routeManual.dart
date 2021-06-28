import 'package:flutter/material.dart';
import 'package:ola_mundo/home_page_aula_16.dart';

class LoginPageAula18 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String email = '';
String senha = '';

class _LoginPageState extends State<LoginPageAula18> {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              /** Verificando o tamnho de email e senha, para depois "manualmente" definir uma rota 
               * assim irá para outra tela. usando o metodo '.push' ele redireciona para outra tela e add
               * um btn de voltar na barra superior. Ao usar do '.pushReplecement', ele destroi a 
               * pagina anterior e passa para a determinida, sendo que o btn voltar não existe.*/
              email.length > 0 && senha.length >= 6
                  ? Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePageAula16()))
                  : print('Email INcorreto');
            },
            child: Text('Entrar'),
          )
        ],
      ),
    );
  }
}
