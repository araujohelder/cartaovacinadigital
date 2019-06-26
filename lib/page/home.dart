import 'package:carteira_vacina_digital/page/login.dart';
import 'package:flutter/material.dart';


class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prontuário Único Digital', style: TextStyle(color:  Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        iconTheme: new IconThemeData(color: Colors.white),  
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
               decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red[200], Colors.red[900]]),
                     ),
              accountName: Text('Helder da Silva Araujo', style: TextStyle(color: Colors.white),),
              accountEmail: Text('heldersilvaaraujo@gmail.com', style: TextStyle(color: Colors.white)),
              currentAccountPicture: GestureDetector(
                onTap: (){},
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/person.png"),
                ),
              ),
            ),
            ListTile (
              title: Text('Agendar Consulta'),
              trailing: Icon(Icons.date_range),
              onTap: (){
                /*
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> BotoesPage()));
                */
              },
            ),
            Divider(),
            ListTile (
              title: Text('Histórico de consultas'),
              trailing: Icon(Icons.content_paste),
              onTap: (){
                /*
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> ListasPage()));
                */
              },
            ),
            Divider(),
            ListTile (
              title: Text('Exames'),
              trailing: Icon(Icons.loupe),
              onTap: (){
               /* 
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> CardsPage()));
                */
              },
            ),
            Divider(),
            ListTile (
              title: Text('Sair'),
              trailing: Icon(Icons.close),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> LoginPage()));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}