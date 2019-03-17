import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Cartão de Vacinação Digital",
     home: LoginPage(),
     theme: ThemeData(
       primarySwatch: Colors.orange
     ),

   );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       child: Column(
         children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width, // informo para pegar toda largura da tela
             height: MediaQuery.of(context).size.height / 3,
             decoration: BoxDecoration(
               gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                 colors: [
                   Color(0xFFf45d27),
                   Color(0xFFf5851f)
                 ]
               )
             ),
           )
         ],
       ),
     ),
    );
  }
}