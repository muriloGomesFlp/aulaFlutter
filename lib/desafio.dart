import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:hexcolor/hexcolor.dart';
//import 'package:flutter/services.dart';

class LoginDesafio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: HexColor('ff6b6b')),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: SizedBox(
                width: 200,
                child: Center(
                  child: Image.asset('assets/img/tinder.png'),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                    child: Text(
                  'Location Changer',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ComicNeue',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 50),
                child: Center(
                    child: Text(
                  'Plugin app for Tinder',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ComicNeue',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white))),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Login with Facebook',
                    style: TextStyle(
                        color: HexColor('ff6b6b'),
                        fontFamily: 'ComicNeue',
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                  ),
                ))
          ],
        ),
      ],
    ));
  }
}
