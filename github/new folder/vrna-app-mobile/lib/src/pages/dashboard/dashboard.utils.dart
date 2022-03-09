import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void videoPlayerDialog(context, controller, movie) {
  controller = VideoPlayerController.network(movie.trailerurl);
  controller
    ..initialize().then((val) {
      // controller = val;
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
                          height: MediaQuery.of(context).size.width < 600 ?  MediaQuery.of(context).size.height * 1  : MediaQuery.of(context).size.height,
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
