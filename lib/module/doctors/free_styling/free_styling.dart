import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/club/upload_video/upload_video.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/module/player/following/widget/video_widget.dart';
import 'package:sportive/module/player/pt/widgets/get_sports_list.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:video_player/video_player.dart';

class FreeStyling extends StatefulWidget {
  FreeStyling({Key? key, this.position}) : super(key: key);
  String? position;
  @override
  _FreeStylingState createState() => _FreeStylingState();
}

class _FreeStylingState extends State<FreeStyling> {
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
          // cubit.getPlayerProfileData != null
          //     ? Container(
          //         child: SingleChildScrollView(
          //         physics: BouncingScrollPhysics(),
          //         scrollDirection: Axis.vertical,
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: <Widget>[
          //             cubit.getPlayerProfileData!.data!.player!.skills
          //                   !  .isNotEmpty
          //                 ? ListView.builder(
          //                     shrinkWrap: true,
          //                     cacheExtent: 1000,
          //                     physics: NeverScrollableScrollPhysics(),
          //                     scrollDirection: Axis.vertical,
          //                     key: PageStorageKey(widget.position),
          //                     addAutomaticKeepAlives: true,
          //                     itemCount: cubit.getPlayerProfileData!.data!
          //                             .player!.skills!.isEmpty
          //                         ? 0
          //                         : cubit.getPlayerProfileData!.data!.player!
          //                             .skills!.length,
          //                     itemBuilder: (BuildContext context, int index) =>
          //                         //      StickyHeader(
          //                         // header: Container(
          //                         //   height: 50.0,
          //                         //   color: Colors.transparent,
          //                         //   // padding: EdgeInsets.symmetric(horizontal: 2.0),
          //                         //   alignment: Alignment.center,
          //                         //   child: Image.asset('images/sportıve ıcon (1).png'),

          //                         // ),
          //                         // content:
          //                         Stack(
          //                       alignment: AlignmentDirectional.bottomCenter,
          //                       children: [
          //                         Container(
          //                           width: double.infinity,
          //                           height: 290.0.h,
          //                           alignment: Alignment.center,
          //                           child: Container(
          //                               key: PageStorageKey(
          //                                 "keydata$index",
          //                               ),
          //                               child: VideoWidget(
          //                                 title: cubit
          //                                     .getPlayerProfileData!
          //                                     .data!
          //                                     .player!
          //                                     .skills![index]
          //                                     .title,
          //                                 play: true,
          //                                 id: cubit.getPlayerProfileData!.data!
          //                                     .player!.skills![index].id,
          //                                 url: cubit.getPlayerProfileData!.data!
          //                                     .player!.skills![index].videoName,
          //                               )),
          //                         ),
          //                         // Container(
          //                         //   width: 74.w,
          //                         //   child: Image.asset('images/sportıve ıcon (1).png'))
          //                       ],
          //                     ),
          //                   )
          //                 : Stack(
          //                     alignment: AlignmentDirectional.center,
          //                     children: [
          //                       LottieBuilder.asset(
          //                         'assets/53731-video-camera.json',
          //                         // height: 150.h,
          //                         fit: BoxFit.cover,
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.only(top: 130.h),
          //                         child: defaultText(
          //                             txt: 'you haven\'t any videos ',
          //                             fontSize: 20.sp,
          //                             color: Colors.grey,
          //                             fontWeight: FontWeight.bold),
          //                       )
          //                     ],
          //                   ),
          //           ],
          //         ),
          //       ))
          //     : Center(
          //         child: CircularProgressIndicator(
          //         color: Colors.white,
          //         strokeWidth: 2,
          //       )),
          // Align(
          //   alignment: AlignmentDirectional.bottomEnd,
          //   child: Padding(
          //     padding: EdgeInsets.only(right: 15.w, bottom: 210.h),
          //     child: FloatingActionButton(
          //       onPressed: () {
          //         nextPage(context: context, page: UploadVideo());
          //       },
          //       backgroundColor: Colors.orangeAccent,
          //       child: Icon(Icons.video_camera_back),
          //     ),
          //   ),
          // )
       
        ],
      );
  }
}

