import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

class VideoWidget extends StatefulWidget {
  final bool? play;
  final String? url;

  const VideoWidget({Key? key, @required this.url, @required this.play})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController? videoPlayerController;
  Future<void>? _initializeVideoPlayerFuture;
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.url!);

    _initializeVideoPlayerFuture =
        videoPlayerController!.initialize().then((_) {
      //       Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  } // This closing tag was missing

  @override
  void dispose() {
    videoPlayerController!.dispose();
    //    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: EdgeInsets.only(top: 0.h),
            child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Stack(key: PageStorageKey(widget.url),
                        // elevation: 5.0,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 270.h),
                                child: Image.asset(
                                  'images/redeem2.png',
                                  height: 50.h,
                                  width: 50.h,
                                ),
                              ),
                              Image.asset(
                                'images/Path 384.png',
                                height: 380,
                                width: 390,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 24.w, right: 24.w, top: 8.h),
                                child: Row(
                                  children: [
                                    defaultText(
                                      txt: 'video name',
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.favorite,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                            defaultText(
                                                txt: '100',
                                                fontSize: 10.sp,
                                                color: Colors.white)
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.visibility_outlined,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                            defaultText(
                                                txt: '100',
                                                fontSize: 10.sp,
                                                color: Colors.white)
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.share,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                            defaultText(
                                                txt: '100',
                                                fontSize: 10.sp,
                                                color: Colors.white)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.w,
                                      left: 20.w,
                                      top: 0.h,
                                      bottom: 1.h),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 400.h,
                                        width: double.infinity,
                                        child: Card(
                                          color: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Chewie(
                                            key: PageStorageKey(widget.url),
                                            controller: ChewieController(
                                              videoPlayerController:
                                                  videoPlayerController!,
                                              aspectRatio: 2 / 3,
                                              // Prepare the video to be played and display the first frame
                                              // autoInitialize: false,
                                              // allowPlaybackSpeedChanging: false,
                                              // fullScreenByDefault: true,
                                              allowFullScreen: true,
                                              allowMuting: false,
                                              looping: false,
                                              autoPlay: false,
                                              // Errors can occur for example when trying to play a video
                                              // from a non-existent URL
                                              errorBuilder:
                                                  (context, errorMessage) {
                                                return Center(
                                                  child: Text(
                                                    errorMessage,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Stack(
                                      //     children: [
                                      //       Image.asset(
                                      //         'images/gold5.png',
                                      //         height: 80.h,
                                      //         width: 60.w,
                                      //       ),
                                      //       Padding(
                                      //         padding: EdgeInsets.only(
                                      //             left: 6.w, top: 8.h),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Column(
                                      //                   children: [
                                      //                     Icon(
                                      //                       Icons.favorite,
                                      //                       color: Colors.black,
                                      //                       size: 8,
                                      //                     ),
                                      //                     defaultText(
                                      //                         txt: '100',
                                      //                         fontSize: 7,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .bold,
                                      //                         color:
                                      //                             Colors.black),
                                      //                     Icon(
                                      //                       Icons.share,
                                      //                       color: Colors.black,
                                      //                       size: 8,
                                      //                     ),
                                      //                     defaultText(
                                      //                         txt: '100',
                                      //                         fontSize: 7,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .bold,
                                      //                         color:
                                      //                             Colors.black),
                                      //                     Icon(
                                      //                       Icons.favorite,
                                      //                       color: Colors.black,
                                      //                       size: 8,
                                      //                     ),
                                      //                     defaultText(
                                      //                         txt: '100',
                                      //                         fontSize: 7,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .bold,
                                      //                         color:
                                      //                             Colors.black)
                                      //                   ],
                                      //                 ),
                                      //                 Image.asset(
                                      //                   'images/13 (1).png',
                                      //                   height: 40.h,
                                      //                   width: 40.w,
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //             defaultText(
                                      //                 txt: 'Ali ahmed',
                                      //                 fontSize: 10,
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: Colors.black),
                                      //             defaultText(
                                      //                 txt: 'Kick Boxing',
                                      //                 fontSize: 7,
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: Colors.black)
                                      //           ],
                                      //         ),
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 27.w, bottom: 12.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _onShare();
                                      },
                                      child: Image.asset(
                                        'images/icons8-share-48 (2).png',
                                        height: 20,
                                        width: 20,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 270.h),
                    child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Image.asset('images/redeem1.png')),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Opacity(
                    opacity: .2,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.grey.shade200,
                      enabled: _enabled,
                      child: ListView.builder(
                        itemBuilder: (_, __) => Padding(
                          padding: EdgeInsets.only(bottom: 8.0.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 48.0.w,
                                height: 48.0.h,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0.w),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 8.0.h,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0.h),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 8.0.h,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0.h),
                                    ),
                                    Container(
                                      width: 40.0.w,
                                      height: 8.0.h,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        itemCount: 6,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _enabled = !_enabled;
                        });
                      },
                      child: Opacity(
                        opacity: .2,
                        child: Text(
                          _enabled ? 'Stop' : 'Play',
                          style: Theme.of(context).textTheme.button!.copyWith(
                              fontSize: 18.0,
                              color: _enabled ? Colors.white : Colors.grey),
                        ),
                      )),
                )
              ],
            ),
          );
        }
      },
    );
  }

  void _onShare() async {
    final box = context.findRenderObject() as RenderBox?;

    Share.shareWithResult('${widget.url}',

        // subject: subject,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    // await Share.share(,
    // subject: 'video',
    // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
