import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SamplePage extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<SamplePage> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    // try {
    //   _controller = VideoPlayerController.network(
    //       'http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/trailer/gulabo/Gulabo.m3u8')
    //     ..initialize().then((_) {
    //       setState(() {});
    //     });
    //   _controller.setVolume(0.0);
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
        child:Container()
        // YoYoPlayer(
        //   aspectRatio: 16 / 9,
        //    url:  "http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/trailer/gulabo/Gulabo.m3u8",
        //   videoStyle: VideoStyle(),
        //   videoLoadingStyle: VideoLoadingStyle(
        //     loading: Center(
        //       child: Text("Loading video"),
        //     ),
        //   ),
        // )
        ,)
        
        
        // Center(
        //   child: _controller.value.initialized
        //       ? AspectRatio(
        //           aspectRatio: _controller.value.aspectRatio,
        //           child: VideoPlayer(_controller),
        //         )
        //       : Container(),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       _controller.value.isPlaying
        //           ? _controller.pause()
        //           : _controller.play();
        //     });
        //   },
        //   child: Icon(
        //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
