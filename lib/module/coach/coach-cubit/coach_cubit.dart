import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/componant/constants/constants.dart';
import 'package:sportive/model/position_model.dart';
import 'package:sportive/model/sport_model.dart';
import 'package:sportive/model/register_model.dart';
import 'package:sportive/model/sports.dart';
import 'package:sportive/model/sub_sport_model.dart';
import 'package:sportive/module/coach/coach-cubit/coach_state.dart';
import 'package:sportive/share/dio_helper.dart';

//
class CoachCubit extends Cubit<CoachState> {
  CoachCubit() : super(HomeInitialState());

  static CoachCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [];
  int currentIndex = 0;

  bool isVerify = false;
  void showVerify() {
    isVerify = !isVerify;
    emit(ChangeVerify());
  }

  String countryValue = "";

  void changeCountry(val) {
    countryValue = val;
    emit(ChangeCountry());
  }

  List<String> gender = [
    "female",
    "male",
  ];
  String ganderVal = 'female';
  void onChangedGender(val) {
    ganderVal = val;
    emit(ChangeGander());
  }

  List<String> direction = [
    "Right",
    "Left",
  ];
  String right = 'Right';
  void onChangedDirection(val) {
    direction = val;
    emit(ChangeGander());
  }

  bool isTab = false;

  int indexTab = 0;
  void changeTabBar(index) {
    indexTab == index ? isTab = true : false;

    emit(ChangeTabBar());
  }

  void changeIsTab() {
    isTab = !isTab;
    emit(ChangeTabBar());
  }

  List<String> roles = [
    "player",
    "club",
    "coach",
    "company",
    "Sports academy",
    'gym',
    'agent',
    'Nutritionist',
    'physical therapist',
    'Psychologist  doctor',
    'normal user',
    'Online coach',
  ];

  String rolesVal = 'player';
  void onChangedservices(val) {
    rolesVal = val;
    emit(Changetype());
  }

  Widget? profileWiget;
  int index = 0;
  void changeProfile(index) {
    index = index;
    emit(Changetype());
  }
  // HomeModel? homeModel;
  // void getHome() {
  //    emit(GetHomeLoading());

  //   DioHelper.getData(
  //     token: uid,
  //     path: kHome,
  //   ).then((value) {
  //     homeModel = HomeModel.fromJson(value.data);
  //           emit(GetHomeSuccess());

  //   }).catchError((er) {
  //     emit(GetHomeError());
  //     print(er.toString());
  //   });
  // }

  //   GetCategory? getCategoryModel;
  // void getCategory() {
  //   emit(GetCategoryLoading());
  //   DioHelper.getData(
  //     path: kGetCategory,
  //     token: uid,
  //   ).then((value) {
  //     getCategoryModel = GetCategory.fromJson(value.data);
  //     emit(GetCategorySuccess());
  //   }).catchError((er) {
  //     emit(GetCategoryError());

  //     print(er.toString());
  //   });
  // }

  var sportIndex = 0;
  void getIndex(index) {
    sportIndex = index;
    emit(GetSportModel());
  }

  var categoryIndex = 0;
  void getCategoryIndex(index) {
    categoryIndex = index;
    emit(GetSubSportModel());
  }

  List<Sportss> sportsList = [
    Sportss(image: 'images/Path 239.png', title: 'Football'),
    Sportss(image: 'images/Path 237.png', title: 'Table tennis'),
    Sportss(image: 'images/surface1 (4).png', title: 'basketball'),
    Sportss(image: 'images/surface1 (5).png', title: 'volleyball'),
    Sportss(image: 'images/tennis.png', title: 'tennis'),
  ];
  int indexPage = 1;
  void changePage(int index) {
    indexPage = index;
    emit(ChangeIndexPage());
  }


  SportModel? sportModel;
  void getSports() {
    emit(GetSportsLoading());
    DioHelper.getData(
      path: kSports,
    ).then((value) {
      sportModel = SportModel.fromJson(value.data);

      emit(GetSportsSuccess());
    }).catchError((er) {
      print(er.toString());
      emit(GetSportsError());
    });
  }

  // int id = 1;
  // void getId( pid) {
  //   id = pid;
  //       print(id);

  //   emit(GetSportId());
  // }

  SubSportModel? subSportModel;
  void getSubSports({int? id}) {
    id = 1;
    emit(GetSubSportsLoading());
    print("pi :$id");

    DioHelper.getData(
      path: kSubSports + id.toString(),
    ).then((value) {
      subSportModel = SubSportModel.fromJson(value.data);
      print("pi :$id");
      emit(GetSubSportsSuccess());
      print('pid = $id');
    }).catchError((er) {
      print(er.toString());
      emit(GetSubSportsError(er.toString()));
    });
  }

  RegisterModel? registerModel;
  void register({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
    String? countryCode,
    String? roleTypeId,
    String? code,
  }) {
    emit(RegisterLoading());
    DioHelper.postData(path: 'http://3.13.247.140/api/register',
        // token: null,
        data: {
          "name": name,
          "phone": phone,
          "country_phone_code": countryCode,
          "password_confirmation": confirmPassword,
          "password": password,
          "country_code": code,
          "account_type_id": roleTypeId,
        }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccess());
    }).catchError((er) {
      print(er.toString());
      emit(RegisterError());
    });
  }
PositionModel? positionModel;
  void getPosition() {
    emit(GetPositionsLoading());
    DioHelper.getData(
      path: kPositions,
    ).then((value) {
      positionModel = PositionModel.fromJson(value.data);
          emit(GetPositionsSuccess());

    }).catchError((er) {
          emit(GetPositionsError());

      print(er.toString());
    });
  }

  SubSportModel? category;
  void getSportCategory({String? id}) {
    DioHelper.getData(path: 'http://3.13.247.140/api/sub-sports/$id')
        .then((value) {
      category = SubSportModel.fromJson(value.data);
    }).catchError((er) {
      print(er.toString());
    });
  }

  ////// video_trimmer: ^1.1.3////////
// How to make like that system ?

// User pick video

// User trim video with maximum time limit

// Upload video
// Future<void> pickVideo() async {

// try {
//   final picker = ImagePicker();
//   var pickedFile = await picker.pickVideo(source: ImageSource.gallery, maxDuration: Duration(seconds: maxSeconds));
//   if (pickedFile == null) {
//     return;
//   }
//   VideoPlayerController testLengthController = new VideoPlayerController.file(File(pickedFile.path));//Your file here
//   await testLengthController.initialize();
//   if (testLengthController.value.duration.inSeconds > 60) {
//     pickedFile = null;
//     throw('we only allow videos that are shorter than 1 minute!');

//   } else {
//     setState(() {
//       videoFile = XFile(pickedFile.path);
//       _startVideoPlayer();
//     });
//   }
//   testLengthController.dispose();
// } catch (e) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Container(
//             child: Text(e.toString()),
//           ),
//         );
//       });
//   return;
// }

// // Future getVideo() async {

// //    await MultiMediaPicker.pickVideo(source: ImageSource.gallery).then((video){

// //      File _video = video;
// //      VideoPlayerController fileVideocontroller = new VideoPlayerController.file(_video)
// //      ..initialize().then((_) {

// //        debugPrint("========"+fileVideocontroller.value.duration.toString());
// //      });
// //    });
// // }

//   // void uploadFile(filePath) async{
//   //   String fileName = _video.path;
//   //   print(fileName);

//   //   file  = await MultipartFile.fromFile(_video.path, filename: basename(_video.path));
//   //   print(test);
//   //   try{
//   //     FormData formData = new FormData.fromMap({
//   //       "video_link": "test.com",
//   //       "video": file,
//   //       "email_id": "test@gmail.com",
//   //       "mobile": "9199199191",
//   //       "image_or_video": "1",
//   //     });

//   //     Response response = await Dio().post(ServiceUrls.baseUrl + ServiceUrls.serviceEndpoint + ServiceUrls.uploadVideo, data: formData);
//   //     print(response);
//   //     print(response.data["message"]);
//   //   }catch(e){

//   //   }
//    }

}
// class VideoPlayerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Player Demo',
//       home: VideoPlayerScreen(),
//     );
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   VideoPlayerScreen({Key key}) : super(key: key);

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;

//   File videoFile;

//   @override
//   void initState() {
//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Butterfly Video'),
//       ),
//       // Use a FutureBuilder to display a loading spinner while waiting for the
//       // VideoPlayerController to finish initializing.
//       body: Column(
//         children: <Widget>[
//           Visibility(
//         visible: _controller != null,
//         child: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               // If the VideoPlayerController has finished initialization, use
//               // the data it provides to limit the aspect ratio of the video.
//               return AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 // Use the VideoPlayer widget to display the video.
//                 child: VideoPlayer(_controller),
//               );
//             } else {
//               // If the VideoPlayerController is still initializing, show a
//               // loading spinner.
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//       RaisedButton(
//         child: Text("Video"),
//         onPressed: () {
//           getVideo();
//         },
//       ),
//     ],
//   ),
//   floatingActionButton: _controller == null
//       ? null
//       : FloatingActionButton(
//           onPressed: () {
//             // Wrap the play or pause in a call to `setState`. This ensures the
//             // correct icon is shown.
//             setState(() {
//               // If the video is playing, pause it.
//               if (_controller.value.isPlaying) {
//                 _controller.pause();
//               } else {
//                 // If the video is paused, play it.
//                 _controller.play();
//               }
//             });
//           },
//           // Display the correct icon depending on the state of the player.
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   Future getVideo() async {
//     Future<File> _videoFile =
//     ImagePicker.pickVideo(source: ImageSource.gallery);
// _videoFile.then((file) async {
//   setState(() {
//     videoFile = file;
//     _controller = VideoPlayerController.file(videoFile);

//     // Initialize the controller and store the Future for later use.
//     _initializeVideoPlayerFuture = _controller.initialize();

//     // Use the controller to loop the video.
//     _controller.setLooping(true);
//   });
//     });
//   }
// }


/////////////////////// detect video time
///const _currentVideoPositionWidth = 38.0;
// const _minTwoDigitValue = 10;

// class _CurrentVideoPosition extends StatefulWidget {
//   const _CurrentVideoPosition({
//     Key? key,
//     required this.videoPlayerController,
//   }) : super(key: key);
//   final VideoPlayerController videoPlayerController;

//   @override
//   _CurrentVideoPositionState createState() => _CurrentVideoPositionState();
// }

// class _CurrentVideoPositionState extends State<_CurrentVideoPosition> {
//   int currentDurationInSecond = 0;

//   @override
//   void initState() {
//     widget.videoPlayerController.addListener(
//       () => setState(() => currentDurationInSecond = widget.videoPlayerController.value.position.inSeconds),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => Container(
//         width: _currentVideoPositionWidth,
//         alignment: Alignment.centerRight,
//         child: Text(
//           _formatCurrentPosition(),
//           style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                 color: Colors.white,
//               ),
//           maxLines: 1,
//         ),
//       );

//   String _formatCurrentPosition() =>
//       currentDurationInSecond < _minTwoDigitValue ? "0 : 0$currentDurationInSecond" : "0 : $currentDurationInSecond";
// }
