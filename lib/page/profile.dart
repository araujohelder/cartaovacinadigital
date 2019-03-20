import 'package:flutter/material.dart';
import 'package:carteira_vacina_digital/page/login.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfilePage();
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                          colors: [Color(0xFFf45d27), Color(0xFFf5851f)]),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(90))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Icon(Icons.person, size: 80, color: Colors.white),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/logo_mettricx.JPG"))),
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
                  width: MediaQuery.of(context)
                      .size
                      .width, // informo para pegar toda largura da tela

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildInputText("Nome", Icons.person),
                      buildInputText("Email", Icons.email),
                      buildInputText("Senha", Icons.vpn_key),
                      buildInputText("Confirmar Senha", Icons.vpn_key),
                      Container(
                        height: 40,
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                            child: Text(
                          "Registrar".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (LoginApp())));
                        },
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Center(
                              child: Text(
                            "Voltar".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
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

  Widget buildInputText(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)]),
        child: TextField(
          decoration: InputDecoration(
              hintText: label,
              icon: Icon(
                icon,
                color: Colors.grey,
              )),
        ),
      ),
    );
  }
}
