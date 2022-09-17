import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/app.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/module/club/club_cubit/club_cubit.dart';
import 'package:sportive/module/club/home/home.dart';
import 'package:sportive/module/coach/coach-cubit/coach_cubit.dart';
import 'package:sportive/module/coach/home/about_me.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_cubit.dart';
import 'package:sportive/module/doctors/home/about_me.dart';
import 'package:sportive/module/player/home/about_me.dart';
import 'package:sportive/module/player/player_login/player_login.dart';
import 'package:sportive/module/player/splash_screen/splash_screen.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/share/cache_helper.dart';
import 'package:sportive/share/dio_helper.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  HttpOverrides.global = MyHttpOverrides();

  await CacheHelper.init();
  // isQrCode = CacheHelper.getShared(key: 'qr') != false
  //     ? CacheHelper.getShared(key: 'qr')
  //     : false;
  uid = CacheHelper.getShared(key: kUid) != null
      ? CacheHelper.getShared(key: kUid)
      : null;

  print('uid : $uid');
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

//
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayerCubit>(
            create: (context) => PlayerCubit()
              // ..getSportsData()
              //  ..getPosition()
              // ..getPlayerData()
              // ..getCountry()
              // ..getSearch()
              // ..getCity()
              // ..fetchData()
              // ..getSports()
              // ..getSubSports()
              ),
        BlocProvider(create: (context) => ClubCubit()),
        BlocProvider(
            create: (context) => CoachCubit()
              // ..getSports()
              // ..getSubSports()
              ),
        BlocProvider(
            create: (context) => DoctorCubit()
              // ..getSports()
              //  ..getPosition()
              // ..getSubSports()
              // ..getSportsData()
              // ..fetchData()
              ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Sportive',
          home: PlayerLogin(),
        ),
        designSize: Size(360, 640),
      ),
    );
  }
}
// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image/image.dart' as img;

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   runApp(MyApp());
// }

// List<CameraDescription>? cameras;

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   CameraController? cameraController;
//   CameraImage ?cameraImage;
//   List? recognitionsList;

//   initCamera() {
//     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     cameraController!.initialize().then((value) {
//       setState(() {
//         cameraController!.startImageStream((image) => {
//               cameraImage = image,
//               runModel(),
//             });
//       });
//     });
//   }

//   runModel() async {
//     recognitionsList = await Tflite.detectObjectOnFrame(
//       bytesList: cameraImage!.planes.map((plane) {
//         return plane.bytes;
//       }).toList(),
//       imageHeight: cameraImage!.height,
//       imageWidth: cameraImage!.width,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       numResultsPerClass: 1,
//       threshold: 0.4,
//     );

//     setState(() {
//       cameraImage;
//     });
//   }

//   Future loadModel() async {
//     Tflite.close();
//     await Tflite.loadModel(
//         model: "assets/ssd_mobilenet.tflite",
//         labels: "assets/ssd_mobilenet.txt");
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     cameraController!.stopImageStream();
//     Tflite.close();
//   }

//   @override
//   void initState() {
//     super.initState();

//     loadModel();
//     initCamera();
//   }

//   List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
//     if (recognitionsList == null) return [];

//     double factorX = screen.width;
//     double factorY = screen.height;

//     Color colorPick = Colors.pink;

//     return recognitionsList!.map((result) {
//       return Positioned(
//         left: result["rect"]["x"] * factorX,
//         top: result["rect"]["y"] * factorY,
//         width: result["rect"]["w"] * factorX,
//         height: result["rect"]["h"] * factorY,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             border: Border.all(color: Colors.pink, width: 2.0),
//           ),
//           child: Text(
//             "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
//             style: TextStyle(
//               background: Paint()..color = colorPick,
//               color: Colors.black,
//               fontSize: 18.0,
//             ),
//           ),
//         ),
//       );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     List<Widget> list = [];

//     list.add(
//       Positioned(
//         top: 0.0,
//         left: 0.0,
//         width: size.width,
//         height: size.height - 100,
//         child: Container(
//           height: size.height - 100,
//           child: (!cameraController!.value.isInitialized)
//               ? new Container()
//               : AspectRatio(
//                   aspectRatio: cameraController!.value.aspectRatio,
//                   child: CameraPreview(cameraController!),
//                 ),
//         ),
//       ),
//     );

//     if (cameraImage != null) {
//       list.addAll(displayBoxesAroundRecognizedObjects(size));
//     }

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//           margin: EdgeInsets.only(top: 50),
//           color: Colors.black,
//           child: Stack(
//             children: list,
//           ),
//         ),
//       ),
//     );
//   }
// }

