import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:video_player/video_player.dart';

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
            padding:  EdgeInsets.only(top: 4.h),
            child: Container(
              child: Stack(
                key: PageStorageKey(widget.url),
                // elevation: 5.0,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.only(bottom: 290),
                        child: Image.asset('images/sportıve ıcon (1).png',
                        height: 40,
                        width: 40,
                        ),
                      ),
                      Image.asset('images/Path 384.png',
                      height: 380,
                      width: 390,
                      ),
                    ],
                  ),
                  Column(

                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(left: 17.w,right: 15.w,top: 4.h),
                      child: Row(children: [
                        defaultText(txt: 'video name',color: Colors.white,fontSize: 18,),
      Spacer(),
       Row(
         children: [
             Column(
               children: [
                 Icon(Icons.favorite,color: Colors.white,),
                 defaultText(txt: '100',
                 color: Colors.white)
               ],
             ),
                      SizedBox(width: 10.w,),

              Column(
         children: [
             Icon(Icons.visibility_outlined,color: Colors.white,),
             defaultText(txt: '100',
             color: Colors.white)
         ],
       ),
       SizedBox(width: 10.w,),
       Column(
         children: [
             Icon(Icons.share,
             color: Colors.white,
             ),
             defaultText(txt: '100',
             color: Colors.white)
         ],
       ),
         ],
       ),
      
                      ],),
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(right: 10.w,left: 10.w,top: 4.h,bottom: 4.h),
                        child: Chewie(
                          key: PageStorageKey(widget.url),
                          controller: ChewieController(
                            videoPlayerController: videoPlayerController!,
                            aspectRatio: 3 / 2,
                            // Prepare the video to be played and display the first frame
                            autoInitialize: true,
                            
                            allowFullScreen: false,
                            allowMuting: false,
                            looping: false,
                            autoPlay: false,
                            // Errors can occur for example when trying to play a video
                            // from a non-existent URL
                            errorBuilder: (context, errorMessage) {
                              return Center(
                                child: Text(
                                  errorMessage,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ]),
            ),
          );
        } else {
          return Container(
        width: double.infinity,
        padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 48.0,
                            height: 48.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 8.0,
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
}
