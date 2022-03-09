import 'package:video_player/video_player.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';
import 'package:flutter/material.dart';

class MovieVideo extends StatefulWidget {
  final String movieUrl;
  const MovieVideo({Key key, this.movieUrl});
  @override
  _MovieVideoState createState() => _MovieVideoState();
}

class _MovieVideoState extends State<MovieVideo> {
  VideoPlayerController _controller;
  // final String videoUrl =
  //     "https://vrna-movie-image-content.s3.ap-south-1.amazonaws.com/" +
  //         widget.movieUrl;

  @override
  void initState() {
    super.initState();
    final String videoUrl = 
        "http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089/" +
            widget.movieUrl;
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Loading(
          message: "Loading ...",
          child: Scaffold(
            body: Center(
              child: _controller.value.isInitialized
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
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
