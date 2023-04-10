import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goofbal/Backend/CreatePost/PostView.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../Utilities/constant/images.dart';
import 'package:path/path.dart' as path;

class PickFile extends StatefulWidget {
  @override
  _PickFileState createState() => _PickFileState();
}

class _PickFileState extends State<PickFile> {
  PostView postView = Get.put(PostView());
  PickedFile? _pickedFile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            postView.pickedImage = await picker.pickVideo(
              source: ImageSource.gallery,
              // maxDuration: const Duration(seconds: 60),
            );
            final String fileName = path.basename(postView.pickedImage!.path);
            postView.imageFile = File(postView.pickedImage!.path);
            print('Usama${postView.imageFile}');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => VideoPlayerFileCustum(
                          videopath: postView.imageFile!.path,
                        )));
            FirebaseStorage storage = FirebaseStorage.instance;
            // Uploading the selected image with some custom meta data
            await storage.ref(fileName).putFile(
                postView.imageFile!,
                SettableMetadata(customMetadata: {
                  'uploaded_by': 'A bad guy',
                  'description': 'Some description...'
                }));
            postView.videourl = await storage.ref(fileName).getDownloadURL();
            print(postView.videourl);
          },
          child: Image.asset(Images.gallery),
        ),
      ),
    );
  }
}

class VideoPlayerFileCustum extends StatefulWidget {
  VideoPlayerFileCustum({this.videopath});
  final String? videopath;

  @override
  _VideoPlayerFileState createState() => _VideoPlayerFileState();
}

class _VideoPlayerFileState extends State<VideoPlayerFileCustum> {
  VideoPlayerController? _controller;
  Future<void>? _video;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videopath.toString()));
    _video = _controller!.initialize();
    _controller!.play();
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
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.white,
        elevation: 20,
        onPressed: () {
          Get.back();
        },
        child: Icon(
          Icons.check,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
