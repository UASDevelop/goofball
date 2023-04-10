import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

class CommedyVide extends StatefulWidget {
  CommedyVide({this.videopath});
  final String? videopath;

  @override
  _VideoPlayerFileState createState() => _VideoPlayerFileState();
}

class _VideoPlayerFileState extends State<CommedyVide> {
  VideoPlayerController? _controller;
  Future<void>? _video;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videopath.toString());
    _video = _controller!.initialize();
    // _controller!.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _video,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return InkWell(
              onTap: () {
                if (_controller!.value.isPlaying) {
                  setState(() {
                    _controller!.pause();
                  });
                } else {
                  setState(() {
                    _controller!.play();
                  });
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
