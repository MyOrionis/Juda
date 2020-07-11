import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoPlayerPage extends StatefulWidget {
  String title;

  VideoPlayerPage({Key key, @required this.title}) : super(key: key);

  @override
  _VideoPlayerPage createState() => _VideoPlayerPage(title);
}

class _VideoPlayerPage extends State<VideoPlayerPage> {
  VideoPlayerController _controller;
  String title;

  _VideoPlayerPage(this.title);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://192.168.1.39/juda-video/' + this.title + '.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    //final String title = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
        appBar: new AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: new Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }

  //arrête la video quand la page est quitté
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
