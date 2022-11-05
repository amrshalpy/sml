// import 'package:flutter/material.dart';
// import 'package:sportive/componant/const/const.dart';
// import 'package:sportive/module/club/home/home.dart';
// import 'package:sportive/module/coach/home/about_me.dart';
// import 'package:sportive/module/doctors/home/about_me.dart';
// import 'package:sportive/module/player/home/about_me.dart';
// import 'package:sportive/module/player/player_login/player_login.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// import 'package:video_player/video_player.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   Widget? page;

//   VideoPlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         VideoPlayerController.asset('assets/splash screen.mp4')
//           ..initialize().then((_) {
//             setState(() {
//               // _controller!.value.isPlaying
//               // _controller!.play();
//               //  : _controller!.pause();
//             });
//           });

//     Future.delayed(
//         Duration(seconds: 1),
//         () => {
//               _controller!.play(),
//             });
    

//     if (PlayerCubit.get(context).roleId == 1) {
//       setState(() {
//         page = Home();
//       });
//     } else if (PlayerCubit.get(context).roleId == 2 ||
//         PlayerCubit.get(context).roleId == 3 ||
//         PlayerCubit.get(context).roleId == 4) {
//       setState(() {
//         page = ClubHome();
//       });
//     } else if (PlayerCubit.get(context).roleId == 5 ||
//         PlayerCubit.get(context).roleId == 6 ||
//         PlayerCubit.get(context).roleId == 7) {
//       setState(() {
//         page = DoctorHome();
//       });
//     } else if (PlayerCubit.get(context).roleId == 8 ||
//         PlayerCubit.get(context).roleId == 9) {
//       setState(() {
//         page = CoachHome();
//       });
//     // } else if (PlayerCubit.get(context).roleId == 10) {
//       // nextPageUntil(context: context, page: ());
//       //  setState(() {
//       //   page = CompanyHome();
//       // });
//     // } else if (PlayerCubit.get(context).roleId == 11) {
//       // nextPageUntil(context: context, page: ());
//       //  setState(() {
//       //   page = UserHome();
//       // });
//     }
//     new Future.delayed(
//         const Duration(seconds: 11),
//         () => Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => uid == null ? PlayerLogin() : page!),
//             ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.white,
//       body: _controller!.value.isInitialized
//           ? Container(
//               child: Expanded(child: VideoPlayer(_controller!)),
//             )
//           : Container(),
//     );
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/module/player/player_login/player_login.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

/////////=> splash Screen Video <=///////////////
// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sportive/componant/const/const.dart';
// import 'package:sportive/module/player/home/about_me.dart';
// import 'package:sportive/module/player/player_login/player_login.dart';
// import 'package:video_player/video_player.dart';


// class SplashScreen extends StatefulWidget {
//   SplashScreen({Key ?key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   VideoPlayerController? _controller;
//   bool _visible = false;

//   @override
//   void initState() {
//     super.initState();

//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]);

//     _controller = VideoPlayerController.network("http://3.13.247.140/splash_screen.mp4");
//     _controller?.initialize().then((_) {
//       _controller?.setLooping(true);
//       Timer(Duration(milliseconds: 100), () {
//         setState(() {
//           _controller?.play();
//           _visible = true;
//         });
//       });
//     });

//     Future.delayed(Duration(seconds: 11), () {
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//               builder: (context) => uid== null?PlayerLogin():Home()),
//           (e) => false);
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//           _controller!.dispose();

//     // if (_controller != null) {
//     //   _controller!.dispose();
//     //   _controller = null;
//     // }
//   }

//   _getVideoBackground() {
//     return AnimatedOpacity(
//       opacity: _visible ? 1.0 : 0.0,
//       duration: Duration(milliseconds: 1000),
//       child: VideoPlayer(_controller!),
//     );
//   }

//   _getBackgroundColor() {
//     return Container(color: Colors.transparent //.withAlpha(120),
//         );
//   }

//   _getContent() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.start,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: <Widget>[
//             _getVideoBackground(),
//           ],
//         ),
//       ),
//     );
//   }
// }
 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>appPages!=null? uid==null? PlayerLogin():appPages!:PlayerLogin())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network('https://media.springernature.com/w580h326/nature-cms/uploads/collections/Hero_image_1200x675_pixels_2-5273134ecbb5c94f78bbc87366502385.jpg'),
      ),
    );
  }
}
