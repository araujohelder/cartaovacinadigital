import 'dart:io';

import 'package:carteira_vacina_digital/src/home/home_page.dart';
import 'package:carteira_vacina_digital/src/user/create_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              Form(
                key: _formKey,
                child: Container(
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
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              icon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Informe o Email';
                            }
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 32, bottom: 5),
                        height: 50,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Senha',
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.grey,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Informe a senha!";
                            }
                          },
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
                                        builder: (context) => CreatePage()));
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: SizedBox.expand(
                          child: Builder(
                            builder: (context) => FlatButton(
                              child: Text(
                                "Entrar".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  FirebaseUser user;
                                  try {
                                    user =
                                        await _auth.signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text);
                                  } catch (e) {
                                    print(e.toString());
                                    print(e.message);
                                    String errorMessage = '';
                                    if (Platform.isAndroid) {
                                      switch (e.message) {
                                        case 'The password is invalid or the user does not have a password.':
                                          errorMessage =
                                              'Usuário e senha inválidos';
                                          break;
                                        case 'The email address is badly formatted.':
                                          errorMessage =
                                              'Formato de email inválido.';
                                          break;
                                        default:
                                          errorMessage =
                                              'Um problema ocorreu com a sua conexão';
                                      }
                                    } else if (Platform.isIOS) {
                                      switch (e.code) {
                                        default:
                                          errorMessage =
                                              "Falha ao cadastrar usuário!";
                                      }
                                    }
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(errorMessage),
                                      backgroundColor: Colors.redAccent,
                                    ));
                                  } finally {
                                    if (user != null) {
                                      // sign in successful!
                                      _pushPage(context, HomePage());
                                    } else {
                                      // sign in unsuccessful
                                      print('sign in Not');
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
