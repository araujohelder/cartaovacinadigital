import 'dart:io';

import 'package:carteira_vacina_digital/page/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _nameController  = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  void _resetFields() {
    _nameController.text = "";
    _emailController.text = "";
    _passwordController.text = "";
    _confirmPasswordController.text = "";
  }

  void register(BuildContext context) async {
    try {
      FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text );
        if (user != null) {
          Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Usuário cadastrado com sucesso"),
                                    backgroundColor: Colors.greenAccent,
                                    ));
        }
       
    } catch(e) {
      print(e);
       Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Falha ao cadastrar usuário"),
          backgroundColor: Colors.redAccent,
        ));
    }
  }

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
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red[200], 
                                   Colors.red[900]]
                      ),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(90))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Icon(Icons.person, size: 80, color: Colors.white),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/person.png"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 10, right: 25, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Novo usuário",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width, // informo para pegar toda largura da tela
                  child: Form(
                    key: _formKey,
                    child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildInputTextNome("Nome",  Icons.person, _nameController),
                        buildInputTextEmail("Email", Icons.email, _emailController),
                        buildInputPassword("Senha", Icons.vpn_key, _passwordController),
                        buildInputConfirmPassword("Confirmar Senha", Icons.vpn_key, _confirmPasswordController, _passwordController),

                        Container (
                          height: 50,
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.red[400], Colors.red[900]],
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: SizedBox.expand(
                            child: Builder(
                                builder: (context) => FlatButton.icon(
                                label: Text("Salvar", style: TextStyle(color: Colors.white)),
                                icon: Icon(Icons.save, color: Colors.white), 
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    try {
                                      FirebaseUser user = await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text );
                                      if (user != null) {
                                          Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text("Usuário cadastrado com sucesso"), backgroundColor: Colors.greenAccent,
                                          ));
                                          _resetFields();
                                      }   
                                    } catch(e) {
                                      print(e.message);
                                      String errorMessage = '';
                                      if (Platform.isAndroid) {
                                          switch (e.message) {
                                            case 'The email address is already in use by another account.':
                                              errorMessage = 'Já existe usuário com o email informado';
                                              break;
                                            case 'The given password is invalid. [ Password should be at least 6 characters ]':
                                              errorMessage = 'A senha deve ter no mínimo 6 caracteres. ';
                                              break;
                                            default:
                                              errorMessage = 'Falha ao cadastrar usuário!';
                                          }
                                        } else if (Platform.isIOS) {
                                          switch (e.code) {
                                            
                                            default:
                                              errorMessage = "Falha ao cadastrar usuário!";
                                          }
                                        }
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                            content: Text(errorMessage),
                                            backgroundColor: Colors.redAccent,
                                        ));
                                      }
                                  } 
                                }
                              ),
                            ),
                          ),
                        ),

                        Container (
                          height: 50,
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.red[400], Colors.red[900]],
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: SizedBox.expand(
                            child: FlatButton.icon(
                              label: Text("voltar", style: TextStyle(color: Colors.white)),
                              icon: Icon(Icons.arrow_back, color: Colors.white), 
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => (LoginApp())
                                  )
                                );
                              }, 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputTextNome(String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
        child: TextFormField(
          keyboardType: TextInputType.text,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
              hintText: label,
              icon: Icon(
                icon,
                color: Colors.grey,
              )),
          controller: controller,
          validator: (value) {
              if (value.isEmpty) {
                    return "Informe o nome!";
              }
          },
        ),
      ),
    );
  }


  Widget buildInputTextEmail(String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
        child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  hintText: label,
                  icon: Icon(
                    icon,
                    color: Colors.grey,
                  )),
              controller: controller,
              validator: (value) {
                if (value.isEmpty) {
                      return "Informe o email!";
                }
              },
        ),
      ),
    );
  }

  Widget buildInputPassword(String label, IconData icon, TextEditingController controller) {
    return  Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
        child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  hintText: label,
                  icon: Icon(
                    icon,
                    color: Colors.grey,
                  )),
              controller: controller,
              validator: (value) {
                  if (value.isEmpty) {
                        return "Informe a senha!";
                  }
              },
        ),
      ),
    );
  }

  Widget buildInputConfirmPassword(String label, IconData icon, TextEditingController controller, TextEditingController controllerPassword) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
        child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  hintText: label,
                  icon: Icon(
                    icon,
                    color: Colors.grey,
                  )),
              controller: controller,
              validator: (value) {
                  if (value.isEmpty) {
                        return "Informe a confirmação de senha!";
                  } else {
                    if (value!=controllerPassword.text) {
                      _confirmPasswordController.clear();
                      return "A confirmação de senha é diferente!";
                    }
                  }
              },
            ),
      ),
    );      
  }
}