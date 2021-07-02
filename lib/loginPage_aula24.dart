import 'package:flutter/material.dart';

class LoginPageAula24 extends StatefulWidget {
/* Aula 24- Usando o card para deixar campos do login visiveis. */

  @override
  _LoginPageState createState() => _LoginPageState();
}

String email = '';
String senha = '';

Widget _body(BuildContext context) {
  return Column(children: [
    SingleChildScrollView(
      //SingleChildScrollView: coloca todos os filhos para usar o scroll
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoImagemLocal(),
              Card(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                    child: Text(
                      'Entrar no Gerenciador \n de Colheita Fácil \n GCF',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: InputEmail(email),
                  ),
                  InputSenha(senha),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BtnLogin(email, senha),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    ),
  ]);
}

class _LoginPageState extends State<LoginPageAula24> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:
                Image.asset('assets/img/background2.jpg', fit: BoxFit.cover)),
        Container(color: Colors.black.withOpacity(0.1)),
        SingleChildScrollView(child: _body(context))
      ]),
    );
  }
}

class LogoImagemLocal extends StatelessWidget {
  /* Aula 22 - Para usar de fonts, imagens ou outros, deve ser definido dentro 
  do nível do flutter o path da imagem ou outros que for usar no arquivo 
  pubspec.yaml(o yaml trabalha com identação, por isso no nível do flutte)
  */
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Image.asset('assets/img/gcf_icon.png'),
        ));
  }
}

class LogoImagemURL extends StatelessWidget {
  //Aula 21
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
            'https://img2.gratispng.com/20180529/vxe/kisspng-logo-anytime-parody-san-francisco-art-burger-logo-5b0cd97f5c2857.6788880515275687673775.jpg'),
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  InputEmail(String email);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
      padding: const EdgeInsets.all(12.0),
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
