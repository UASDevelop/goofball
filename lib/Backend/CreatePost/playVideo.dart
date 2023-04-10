import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
class PlayVideo extends StatefulWidget {
  String? imageFilePath;
  PlayVideo({this.imageFilePath});
  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    File video;
    File? imageFile;

    final picker = ImagePicker();

// This funcion will helps you to pick a Video File
    pickVideo() async {
      PickedFile? pickedFile =
          await picker.getVideo(source: ImageSource.gallery);
      setState(() {
        imageFile = File(pickedFile!.path);
      });
      print("imagefile${imageFile}");
      _controller = VideoPlayerController.file(imageFile!)
        ..initialize().then((_) {
          setState(() {});
          _controller.play();
        });
    }

    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (imageFile != null)
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container()
          else
            Text(
              "Click on Pick Video to select video",
              style: TextStyle(fontSize: 18.0),
            ),
          InkWell(
            onTap: () {
              pickVideo();
              print("usama${imageFile}");
            },
            child: Text("Pick Video From Gallery"),
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
