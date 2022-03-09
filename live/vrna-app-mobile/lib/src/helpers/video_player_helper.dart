// import 'package:better_player/better_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vrna_app_mobile/src/pages/moviedetails/movie.details.page.dart';

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

// void betterPlayerDialog(context, controller, videoUrl, {signatureHeader = ''}) {
//   BetterPlayerConfiguration betterPlayerConfiguration =
//       BetterPlayerConfiguration(
//     aspectRatio: 1,
//     autoDispose: true,
//     fullScreenByDefault: true,
//     fit: BoxFit.contain,
//     autoPlay: true,
//     looping: false,
//   );
//   BetterPlayerDataSource _betterPlayerDataSource = BetterPlayerDataSource(
//     BetterPlayerDataSourceType.network,
//     videoUrl,
//   );
//   BetterPlayerController _betterPlayerController =
//       BetterPlayerController(betterPlayerConfiguration);
//   _betterPlayerController.setupDataSource(_betterPlayerDataSource);
//   print('MovieUrl @Player-- $videoUrl');
//   Map<String, String> headers = kIsWeb
//       ? {}
//       : {
//           'Cookie': signatureHeader,
//         };

//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return WillPopScope(
//             onWillPop: () {
//               SystemChrome.setPreferredOrientations(
//                   [DeviceOrientation.portraitUp]);
//               return Future.value(true);
//             },
//             child: AlertDialog(
//               backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
//               contentPadding: EdgeInsets.all(20.0),
//               content: Stack(
//                 overflow: Overflow.visible,
//                 children: <Widget>[
//                   Positioned(
//                     right: -40.0,
//                     top: -40.0,
//                     child: InkResponse(
//                       onTap: () {
//                         SystemChrome.setPreferredOrientations(
//                             [DeviceOrientation.portraitUp]);
//                         Navigator.of(context).pop();
//                       },
//                       child: CircleAvatar(
//                         radius: 16,
//                         backgroundColor: Color.fromRGBO(23, 99, 124, 1.0),
//                         child: CircleAvatar(
//                           backgroundColor: Color.fromRGBO(13, 13, 13, 1.0),
//                           child: Icon(Icons.close,
//                               size: 14.0,
//                               color: Color.fromRGBO(
//                                 34,
//                                 184,
//                                 233,
//                                 1.0,
//                               )),
//                           radius: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.width < 600
//                           ? MediaQuery.of(context).size.height * 1
//                           : MediaQuery.of(context).size.height,
//                       child: Container(
//                           child: Stack(
//                         alignment: Alignment.bottomCenter,
//                         children: <Widget>[
//                           SizedBox.expand(
//                             child: FittedBox(
//                               fit: BoxFit.scaleDown,
//                               child: SizedBox(
//                                 width: 600,
//                                 height: 400,
//                                 child: BetterPlayer(
//                                     controller: _betterPlayerController),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ))),
//                 ],
//               ),
//             ));
//       });
// }

void flickPlayerDialog(context, controller, videoUrl, {signatureHeader = ''}) {
  // print('MovieUrl @Player-- $videoUrl');
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

  Map<String, String> headers = kIsWeb
      ? {}
      : {
          'Cookie': signatureHeader,
        };
  FlickManager flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(videoUrl, httpHeaders: headers),
      autoPlay: true,
      autoInitialize: true,
      onVideoEnd: () {
      });
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
      builder: (BuildContext innerContext) {
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
                        Navigator.of(innerContext).pop();
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
                      width: MediaQuery.of(innerContext).size.width,
                      height: MediaQuery.of(innerContext).size.width < 600
                          ? MediaQuery.of(innerContext).size.height * 1
                          : MediaQuery.of(innerContext).size.height,
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
                                  wakelockEnabled: true,
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

Widget flickPlayerWidget(context, controller, videoUrl, movieDetails,
    {signatureHeader = ''}) {
  print('MovieUrl @Player-- $videoUrl Cookie: $signatureHeader --');
  var cookie = signatureHeader.replaceAll('Path=/','');
  double iconSize = 25;
  double fontSize = 12;
  Duration currentPlayTime = Duration.zero;
  Map<String, String> urls = {
    '480':
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    '720':
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'
  };
  Map<String, String> headers = kIsWeb
      ? {}
      : {
          'Cookie': cookie,
        };
  FlickManager flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(videoUrl, httpHeaders: headers),
      autoPlay: true,
      autoInitialize: true,
      onVideoEnd: () {
        
      });
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
  return Stack(alignment: Alignment.topRight, children: [
    InkWell(
        child: Container(
            margin: EdgeInsets.only(right: 10.0, top: 10.0),
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(225, 185, 36, 1.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Icon(Icons.close, size: 30.0, color: Colors.black),
                Container(
                    child:Icon(Icons.close, size: 30.0, color: Colors.black)
                    
                     /*Text(
                  "Close",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),*/
                
                
                )
              ],
            )),
        onTap: () {}),
    FlickVideoPlayer(
        flickManager: flickManager,
        // wakelockEnabled: true,
        // flickVideoWithControls: FlickVideoWithControls(
        //   controls: FlickPortraitControls(),
        // ),
        flickVideoWithControlsFullscreen: FlickVideoWithControls(
            controls: Stack(
          children: <Widget>[
            Positioned.fill(
              child: FlickShowControlsAction(
                child: FlickSeekVideoAction(
                  child: Center(
                    child: FlickVideoBuffer(
                      child: FlickAutoHideChild(
                        showIfVideoNotInitialized: false,
                        child: FlickPlayToggle(
                          size: 30,
                          color: Colors.black,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: FlickAutoHideChild(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlickVideoProgressBar(
                        flickProgressBarSettings: null,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // FlickPlayToggle(
                          //   size: iconSize,
                          // ),
                          // SizedBox(
                          //   width: iconSize / 2,
                          // ),
                          FlickSoundToggle(
                            size: iconSize,
                          ),
                          SizedBox(
                            width: iconSize / 2,
                          ),
                          Row(
                            children: <Widget>[
                              FlickCurrentPosition(
                                fontSize: fontSize,
                              ),
                              FlickAutoHideChild(
                                child: Text(
                                  ' / ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: fontSize),
                                ),
                              ),
                              FlickTotalDuration(
                                fontSize: fontSize,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          // FlickFullScreenToggle(
                          //   size: iconSize,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                  child: Container(
                      margin: EdgeInsets.only(right: 10.0, top: 10.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 185, 36, 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Icon(Icons.close, size: 30.0, color: Colors.black),
                          Container(
                              child: Icon(Icons.close, size: 30.0, color: Colors.black)
                              
                              /*Text(
                            "Close",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),*/
                          
                          )
                        ],
                      )),
                  onTap: () {
                    if (flickManager?.flickControlManager != null) {
                      flickManager?.flickControlManager?.exitFullscreen();
                    }
                    Future.delayed(Duration(seconds: 3), () {
                      flickManager?.dispose();
                    });
                    Route route = MaterialPageRoute(
                        builder: (innerContext) => MovieDetailsPage(
                              details: movieDetails,
                            ));
                    Navigator.pushReplacement(context, route);
                  }),
            )
          ],
        ))

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
        // FlickLandscapeControls()
        // ]),
        ),
  ]);
}
