import 'package:flutter/material.dart';

class LoginPageAula23 extends StatefulWidget {
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
              InputEmail(email),
              InputSenha(senha),
              BtnLogin(email, senha),
            ],
          ),
        ),
      ),
    ),
  ]);
}

class _LoginPageState extends State<LoginPageAula23> {
  /** Aula 23 - Uso do widget stack, coloca os widget em pilhas, podendo-se
   * criar um container e atribuir um cor a ele, dando o efeito de color-background;
   * Usado o media query para usar todo o tamanho de tela e utilizado do atributo
   * fit: BoxFit.cover para esticar+zoom na imagem para colocar na tela toda;
   * foi também add um container para deixar a imagem pouco mais escura usando do 
   * withOpacity
    */
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
        _body(context)
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
