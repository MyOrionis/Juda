import 'package:flutter/material.dart';
import 'package:juda/widget/VideoPlayerPage.dart';

class MyVideoPage extends StatefulWidget {
  @override
  _MyVideoPage createState() => _MyVideoPage();
}

class _MyVideoPage extends State<MyVideoPage> {
  final titles = [
    '03-07-2020-16-28-04',
    '03-07-2020-16-49-57',
    '03-07-2020-16-52-30'
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Vidéo'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.movie),
              title: Text(titles[index]),
              trailing: Icon(Icons.keyboard_arrow_right),
              //onTap: ()  => print('Lance la vidéo '+ titles[index]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoPlayerPage(title: titles[index]),
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
