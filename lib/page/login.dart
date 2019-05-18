import 'package:carteira_vacina_digital/page/home.dart';
import 'package:flutter/material.dart';
import 'package:carteira_vacina_digital/page/profile.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cartão de Vacinação Digital",
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.orange),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // informo para pegar toda largura da tela
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.red[200], Colors.red[900]]),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(90))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Icon(Icons.person, size: 80, color: Colors.white),
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/logo_mettricx.JPG"))),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 0, right: 25, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // informo para pegar toda largura da tela
                height: MediaQuery.of(context).size.height / 2,
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 5)
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.only(top: 32, bottom: 5),
                      height: 50,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 5)
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Senha',
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, right: 32),
                          child: InkWell(
                            child: Text(
                              "Clique aqui e faça seu cadastro.",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileApp()));
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red[600], Colors.red[900]],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: FlatButton(
                        child: Text( "Entrar".toUpperCase(),
                                      style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                        onPressed: () {
                          Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> StartPage()));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
