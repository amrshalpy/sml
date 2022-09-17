import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/club/free_styling/widget/video_widget.dart';
import 'package:sportive/module/club/upload_video/upload_video.dart';
import 'package:video_player/video_player.dart';

class ClubFreeStyling extends StatefulWidget {
  ClubFreeStyling({Key? key, this.position}) : super(key: key);
  String? position;
  @override
  _ClubFreeStylingState createState() => _ClubFreeStylingState();
}

class _ClubFreeStylingState extends State<ClubFreeStyling> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

   List<String> itemList = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                cacheExtent: 1000,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                key: PageStorageKey(widget.position),
                addAutomaticKeepAlives: true,
                itemCount: itemList.isEmpty ? 0 : itemList.length,
                itemBuilder: (BuildContext context, int index) =>
                    //      StickyHeader(
                    // header: Container(
                    //   height: 50.0,
                    //   color: Colors.transparent,
                    //   // padding: EdgeInsets.symmetric(horizontal: 2.0),
                    //   alignment: Alignment.center,
                    //   child: Image.asset('images/sportıve ıcon (1).png'),

                    // ),
                    // content:
                    Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 290.0.h,
                      alignment: Alignment.center,
                      child: Container(
                          key: PageStorageKey(
                            "keydata$index",
                          ),
                          child: VideoWidget(
                            play: true,
                            url: itemList.elementAt(index),
                          )),
                    ),
                    // Container(
                    //   width: 74.w,
                    //   child: Image.asset('images/sportıve ıcon (1).png'))
                  ],
                ),
              ),
            ],
          ),
        )),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Padding(
            padding: EdgeInsets.only(right: 15.w, bottom: 210.h),
            child: FloatingActionButton(
              onPressed: () {
                nextPage(context: context, page: UploadVideo());
              },
              backgroundColor: Colors.orangeAccent,
              child: Icon(Icons.video_camera_back),
            ),
          ),
        )
      ],
    );
  }
}
