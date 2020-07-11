import 'package:flutter/material.dart';
import 'package:juda/widget/MyHomePage.dart';
import 'package:juda/widget/MyConnexionPage.dart';
import 'package:juda/widget/MyVideoPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Juda',
      theme: new ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: new MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBar createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    MyConnexionPage(),
    MyHomePage(),
    MyVideoPage()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.wifi), title: new Text("Connexion")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("Accueil")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.folder), title: new Text("Vidéo")),
        ],
      ),
    );
  }
}
