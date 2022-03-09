import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

void videoPlayerDialog(context, controller, movie) {
  controller = VideoPlayerController.network(movie.trailerurl);
  controller
    ..initialize().then((val) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: () {
                  Future.delayed(Duration(seconds: 3))
                      .then((value) => {controller?.dispose()});
                  return Future.value(true);
                },
                child: AlertDialog(
                  backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
                  contentPadding: EdgeInsets.all(20.0),
                  content: Stack(
                    overflow: Overflow.visible,
                    // clipBehavior: ClipBeh,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Future.delayed(Duration(seconds: 3))
                                .then((value) => {controller?.dispose()});
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Color.fromRGBO(23, 99, 124, 1.0),
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
                              child: Icon(Icons.close,
                                  size: 14.0,
                                  color: Color.fromRGBO(
                                    34,
                                    184,
                                    233,
                                    1.0,
                                  )),
                              radius: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.height * 1
                              : MediaQuery.of(context).size.height,
                          child: Container(
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height,
                              child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              SizedBox.expand(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: SizedBox(
                                    width: controller.value.size?.width ?? 0,
                                    height: controller.value.size?.height ?? 0,
                                    child: VideoPlayer(controller),
                                  ),
                                ),
                              ),
                              // AspectRatio(
                              //     aspectRatio: controller.value.aspectRatio,
                              //     child: VideoPlayer(controller)),
                              // VideoControlsOverlay(controller: controller),
                              VideoProgressIndicator(controller,
                                  allowScrubbing: true),
                            ],
                          ))),
                    ],
                  ),
                ));
          });
      controller.play();
    });
}

void flickPlayerDialog(context, controller, videoUrl, {signatureHeader = ''}) {
  print('MovieUrl @Player-- $videoUrl');
  Duration currentPlayTime = Duration.zero;
  Map<String, String> urls = {
    '480':
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    '720':
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'
  };
  // videoUrl = urls['480'];
  // videoUrl =
  //     'https://bitmovin-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd';
  print('MovieUrl @Player-- $videoUrl');
  FlickManager flickManager = FlickManager(
    videoPlayerController:
        VideoPlayerController.network(videoUrl, httpHeaders: {
      'Cookie': signatureHeader,
    }),
    autoPlay: true,
    autoInitialize: true,
  );
  var prevUrl = '';
  flickManager.flickVideoManager.addListener(() {
    // disabling by default false condition
    if (1 == 2 &&
        prevUrl !=
            flickManager.flickVideoManager.videoPlayerController.dataSource) {
      if (flickManager.flickVideoManager.isVideoInitialized) {
        flickManager.flickVideoManager.videoPlayerController
            .seekTo(currentPlayTime);
        prevUrl =
            flickManager.flickVideoManager.videoPlayerController.dataSource;
      }
    }
  });
  flickManager.flickControlManager.enterFullscreen();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () {
              Future.delayed(Duration(seconds: 3)).then((value) => {
                    if (flickManager != null)
                      {
                        flickManager.dispose(),
                      },
                  });
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
              return Future.value(true);
            },
            child: AlertDialog(
              backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
              contentPadding: EdgeInsets.all(20.0),
              content: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    right: -40.0,
                    top: -40.0,
                    child: InkResponse(
                      onTap: () {
                        Future.delayed(Duration(seconds: 1)).then((value) => {
                              if (flickManager != null)
                                {
                                  flickManager.dispose(),
                                },
                            });
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Color.fromRGBO(23, 99, 124, 1.0),
                        child: CircleAvatar(
                          backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
                          child: Icon(Icons.close,
                              size: 14.0,
                              color: Color.fromRGBO(
                                34,
                                184,
                                233,
                                1.0,
                              )),
                          radius: 14,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width < 600
                          ? MediaQuery.of(context).size.height * 1
                          : MediaQuery.of(context).size.height,
                      child: Container(
                          child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SizedBox(
                                width: 600,
                                height: 400,
                                child: FlickVideoPlayer(
                                  flickManager: flickManager,
                                  flickVideoWithControls:
                                      FlickVideoWithControls(
                                    controls: FlickPortraitControls(),
                                  ),
                                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                                      controls:
                                          // Row(children: [
                                          //   InkWell(
                                          //       onTap: () {
                                          //         currentPlayTime = flickManager
                                          //             .flickVideoManager
                                          //             .videoPlayerValue
                                          //             .position;
                                          //         print(
                                          //             'Current Playing Time $currentPlayTime');
                                          //         flickManager.handleChangeVideo(
                                          //             VideoPlayerController.network(
                                          //                 urls['720']));
                                          //         if (flickManager.flickVideoManager
                                          //             .isVideoInitialized)
                                          //           flickManager.flickVideoManager
                                          //               .videoPlayerController
                                          //               .seekTo(currentPlayTime);
                                          //       },
                                          //       child: Text('Change Video')),
                                          FlickLandscapeControls()
                                      // ]),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))),
                ],
              ),
            ));
      });
}
