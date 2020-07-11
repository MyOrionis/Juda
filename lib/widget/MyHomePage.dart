import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String _streamUrl;
  VlcPlayerController _videoViewController;
  bool isPlaying = true;
  final int playerWidth = 640;
  final int playerHeight = 360;

  @override
  void initState() {
    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });
    _videoViewController.addListener(() {
      setState(() {});
    });

    _streamUrl = "http://192.168.1.39:8080/";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Accueil'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _streamUrl == null
                ? Container(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Stream fermer',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : new VlcPlayer(
                    aspectRatio: 4 / 3,
                    url: _streamUrl,
                    controller: _videoViewController,
                    placeholder: Container(),
                  ),
            new Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.grey, // button color
                      child: InkWell(
                        splashColor: Colors.green, // inkwell color
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.mic), // icon
                              Text("Parler"), // text
                            ],
                          ),
                        ),
                        onTap: () => print('Parler'),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.grey, // button color
                      child: InkWell(
                        splashColor: Colors.green, // inkwell color
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.save), // icon
                              Text("Enregistrer"), // text
                            ],
                          ),
                        ),
                        onTap: () => print('Screenshot'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.grey, // button color
                child: InkWell(
                  splashColor: Colors.green, // inkwell color
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.lock_open), // icon
                        Text("Ouvrir"), // text
                      ],
                    ),
                  ),
                  onTap: () => print('Ouvrir'),
                ),
              ),
            ),
          ],
        )));
  }
}
