import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/model/sport.dart';
import 'package:sportive/model/sports.dart';
import 'package:sportive/module/club/club_cubit/club_state.dart';

//
class ClubCubit extends Cubit<ClubState> {
  ClubCubit() : super(ClubInitialState());

  static ClubCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [];
  int currentIndex = 0;
  List<Sport> sports = [
    Sport(title: 'football'),
    Sport(title: 'bascketball'),
    Sport(title: 'central forword'),
    Sport(title: 'central forword'),
    Sport(title: 'left wing'),
    Sport(title: 'left wing back'),
    Sport(title: 'football'),
    Sport(title: 'bascketball'),
    Sport(title: 'central forword'),
    Sport(title: 'football'),
    Sport(title: 'bascketball'),
    Sport(title: 'central forword'),
    Sport(title: 'central forword'),
    Sport(title: 'left wing'),
    Sport(title: 'left wing back'),
    Sport(title: 'central forword'),
    Sport(title: 'central forword'),
    Sport(title: 'left wing'),
    Sport(title: 'left wing back'),
    Sport(title: 'central forword'),
    Sport(title: 'left wing'),
    Sport(title: 'left wing back'),
  ];
  changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

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

  List<String> services = [
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

  List<String> social = [
    "twitter",
    "facebook",
    "instagram",
  ];
  String socialVal = 'twitter';
  void onChangedSocial(val) {
    direction = val;
    emit(ChangeSocial());
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

  String servicesVal = 'player';
  void onChangedservices(val) {
    servicesVal = val;
    emit(Changetype());
  }

  Widget? profileWiget;
  int index = 0;
  void changeProfile(index) {
    index = index;
    emit(Changetype());
  }
  // ClubModel? ClubModel;
  // void getClub() {
  //    emit(GetClubLoading());

  //   DioHelper.getData(
  //     token: uid,
  //     path: kClub,
  //   ).then((value) {
  //     ClubModel = ClubModel.fromJson(value.data);
  //           emit(GetClubSuccess());

  //   }).catchError((er) {
  //     emit(GetClubError());
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

  int sportIndex = 0;
  void getIndex(index) {
    sportIndex = index;
    emit(GetSport());
  }

  List<Sports> sportsList = [
    Sports(image: 'images/Path 239.png', title: 'Football'),
    Sports(image: 'images/Path 237.png', title: 'Table tennis'),
    Sports(image: 'images/surface1 (4).png', title: 'basketball'),
    Sports(image: 'images/surface1 (5).png', title: 'volleyball'),
    Sports(image: 'images/tennis.png', title: 'tennis'),
  ];
  int indexPage = 1;
  void changePage(int index) {
    indexPage = index;
    emit(ChangeIndexPage());
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
