import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(VideoApp());
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    try {
      _controller = VideoPlayerController.network(
          'http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/trailer/gulabo/Gulabo.m3u8')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      _controller.setVolume(0.0);
      // _controller.videoPlayerOptions(

    }catch(e)
    {
      print(e);

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body:  Center(
          child: _controller.value.isInitialized
              ? Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  AspectRatio(
            aspectRatio: _controller.value.aspectRatio, child:VideoPlayer(_controller)),
                  // _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              )
              
          //     AspectRatio(
          //   aspectRatio: _controller.value.aspectRatio,
          //   child: VideoPlayer(_controller,),
          // )
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}