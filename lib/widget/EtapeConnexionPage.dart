import 'package:flutter/material.dart';

class EtapeConnexionPage extends StatefulWidget {
  String nomReseau;
  EtapeConnexionPage({Key key,@required this.nomReseau}): super(key : key);

  @override
  _EtapeConnexionPage createState() => _EtapeConnexionPage(nomReseau);
}

class _EtapeConnexionPage extends State<EtapeConnexionPage> {
  String nomReseau;



  _EtapeConnexionPage(this.nomReseau);

  @override
  Widget build(BuildContext context) {
    //final String title = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Étape de connexion'),
        centerTitle: true,
      ),
      body: new Center(
        child: Text(nomReseau),
      ),
    );
  }
}
