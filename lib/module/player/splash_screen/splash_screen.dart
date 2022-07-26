import 'package:flutter/material.dart';
import 'package:sportive/module/player/player_login/player_login.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {
          // _controller!.value.isPlaying
          //     ? _controller!.play()
          //     : _controller!.pause();
        });
      });

    Future.delayed(Duration(seconds: 1), () => {
      _controller!.play(),
      });
    new Future.delayed(
        const Duration(seconds: 11),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PlayerLogin()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: _controller!.value.isInitialized
          ? Container(
              child: VideoPlayer(_controller!),
            )
          : Container(),
    );
  }
}
