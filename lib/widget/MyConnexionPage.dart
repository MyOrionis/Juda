import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssh/ssh.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'EtapeConnexionPage.dart';

class MyConnexionPage extends StatefulWidget {
  @override
  _MyConnexionPage createState() => _MyConnexionPage();
}

class _MyConnexionPage extends State<MyConnexionPage> {
  String _result = '';

  Future<void> onClickCmd() async {
    var client = new SSHClient(
      host: "192.168.1.39",
      port: 22,
      username: "pi",
      passwordOrKey: "fabien58",
    );

    String result;
    try {
      result = await client.connect();
      if (result == "session_connected")
        result = await client.execute("sudo iw dev wlan0 scan | grep SSID:");
      client.disconnect();
    } on PlatformException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.message}');
    }

    setState(() {
      _result = result;
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Connexion'),
        centerTitle: true,
      ),
      body: new Center(
        child: FlatButton(
          child: Text(
            'Connexion Juda',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            onClickCmd();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EtapeConnexionPage(nomReseau: _result),
                ));
          },
          color: Colors.blue,
        ),
      ),
    );
  }
}
