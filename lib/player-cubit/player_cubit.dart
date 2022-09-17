import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/componant/constants/constants.dart';
import 'package:sportive/model/acount_type.dart';
import 'package:sportive/model/add_contact_info.dart';
import 'package:sportive/model/add_exprience_model.dart';
import 'package:sportive/model/add_skills.dart';
import 'package:sportive/model/all_sports_model.dart';
import 'package:sportive/model/city_model.dart';
import 'package:sportive/model/country_model.dart';
import 'package:sportive/model/delete_skills.dart';
import 'package:sportive/model/edit_skills.dart';
import 'package:sportive/model/get_player_data.dart';
import 'package:sportive/model/player_data.dart';
import 'package:sportive/model/position_model.dart';
import 'package:sportive/model/qr_model.dart';
import 'package:sportive/model/search_model.dart';
import 'package:sportive/model/register_model.dart';
import 'package:sportive/model/sport_model.dart';
import 'package:sportive/model/sports.dart';
import 'package:sportive/model/sub_sport_model.dart';
import 'package:sportive/player-cubit/player_state.dart';
import 'package:sportive/share/cache_helper.dart';
import 'package:sportive/share/dio_helper.dart';
import 'package:video_player/video_player.dart';

//
class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(HomeInitialState());

  static PlayerCubit get(context) => BlocProvider.of(context);

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
    right = val;
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
    "Sports Academy",
    "Gym",
    "Agent",
    'Nutritionist',
    'physical therapist',
    'Psychologist  doctor',
    'Coach',
    'Online Coach',
    'Company',
    'Normal User',
  ];
  int roleId = 1;
  String rolesVal = 'player';
  void onChangedservices(val) {
    rolesVal = val;
    if (val == 'player') {
      roleId = 1;
    } else if (val == 'Sports Academy') {
      roleId = 2;
    } else if (val == 'Gym') {
      roleId = 3;
    } else if (val == 'Agent') {
      roleId = 4;
    } else if (val == 'Nutritionist') {
      roleId = 5;
    } else if (val == 'Physical Therapist') {
      roleId = 6;
    } else if (val == 'Psychologist  doctor') {
      roleId = 7;
    } else if (val == 'Coach') {
      roleId = 8;
    } else if (val == 'Online Coach') {
      roleId = 9;
    } else if (val == 'Company') {
      roleId = 10;
    } else if (val == 'Normal User') {
      roleId = 11;
    }
    print(roleId);
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

  String nation = '';
  bool isNationality = false;
  String countryCode = '';
  void changeNation({String? value, String? code}) {
    nation = value!;
    countryCode = code!;
    print(nation);
    print(countryCode);

    emit(ChangeNationality());
  }

  void changeIsNAtionality() {
    isNationality = !isNationality;

    emit(ChangeNationality());
  }

  String city = '';
  bool isCity = false;
  void changecity(value) {
    city = value;

    emit(ChangeCity());
  }

  void changeIsCity() {
    isCity = !isCity;

    emit(ChangeCity());
  }

  CountryModel? countryModel;
  void getCountry() {
    emit(GetCountryLoading());
    DioHelper.getData(
      path: 'http://3.13.247.140/api/list-countries',
    ).then((value) {
      countryModel = CountryModel.fromJson(value.data);

      emit(GetCountrySuccess());
    }).catchError((er) {
      emit(GetCountryError());
    });
  }

  CityModel? cityModel;
  void getCity() {
    emit(GetCityLoading());
    DioHelper.getData(
      path: 'http://3.13.247.140/api/list-cities?country_code=$nation',
    ).then((value) {
      cityModel = CityModel.fromJson(value.data);

      emit(GetCitySuccess());
    }).catchError((er) {
      emit(GetCityError());
    });
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

  MainSportsModel? sportModel;
  void getSports() {
    emit(GetSportsLoading());
    DioHelper.getData(
      path: kSports,
    ).then((value) {
      sportModel = MainSportsModel.fromJson(value.data);

      emit(GetSportsSuccess());
    }).catchError((er) {
      print(er.toString());
      emit(GetSportsError());
    });
  }

  String id = '1';
  void getId(String pid, index) {
    id = pid;
    print(id);

    emit(GetSportId());
  }

  bool isQrCode = false;

  void changeQrCode() {
    isQrCode = !isQrCode;
    emit(ChangeQrCode());
  }

  QrCodeModel? qrCodeModel;

  void genrateQr() {
    emit(GenrateQrLoading());
    DioHelper.postData(
        path: 'http://3.13.247.140/api/player/generate-qr-code',
        token: uid,
        data: {}).then((value) {
      qrCodeModel = QrCodeModel.fromJson(value.data);
      emit(GenrateQrSuccess(isQrCode));
    }).catchError((er) {
      emit(GenrateQrError());
      print(er.toString());
    });
  }

  SubSports? subSportModel;
  void getSubSports({int? sId}) {
    sId = 1;
    emit(GetSubSportsLoading());
    print("pi :$sId");

    DioHelper.getData(
      path: 'http://3.13.247.140/api/sub-sports?sport_id=$sId',
    ).then((value) {
      subSportModel = SubSports.fromJson(value.data);
      print("pi :$id");
      emit(GetSubSportsSuccess());
      print('pid = $id');
    }).catchError((er) {
      print(er.toString());
      emit(GetSubSportsError(er.toString()));
    });
  }

  ScrollController controller = ScrollController(
      // initialScrollOffset: 15,
      );
  int pages = 15;
  int page = 1;
  List? dataOfPages;

  bool isPage = false;

  void fetchData() {
    dataOfPages = List.generate(15, (index) => index);

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        isPage = true;
        getSportsData();
        ;

        emit(FetchData());
      }
    });
  }

  GetAllSports? getAllSports;
  void getSportsData() {
    emit(GetAllSportsLoading());
    DioHelper.getData(path: "http://3.13.247.140/api/all-sports", query: {
      "per_page": pages,
      "page": page,
    }).then((value) {
      getAllSports = GetAllSports.fromJson(value.data);
      // items.add(getAllSports.data.length+1.toString());
      emit(GetAllSportsSuccess());
    }).catchError((er) {
      emit(GetAllSportsError());
      print(er.toString());
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
      emit(RegisterSuccess(registerModel!.data!.token!.accessToken));

      //  getPlayerData();
    }).whenComplete(() {
      getPlayerData();
    }).catchError((er) {
      print(er.toString());
      emit(RegisterError());
    });
  }

  SearchModel? searchModel;
  void getSearch({String? txt}) {
    emit(GetSearchLoading());
    DioHelper.getData(
      path: "http://3.13.247.140/api/sports?term=${txt}",
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(GetSearchSuccess());
    }).catchError((er) {
      emit(GetSearchError());

      print(er.toString());
    });
  }

  PositionModel? positionModel;
  void getPosition() {
    try {
      emit(GetPositionsLoading());
      DioHelper.getData(path: kPositions, token: uid).then((value) {
        positionModel = PositionModel.fromJson(value.data);
        emit(GetPositionsSuccess());
        print(positionModel!.data[1]);
      }).catchError((er) {
        emit(GetPositionsError());

        print(er.toString());
      });
    } on DioError catch (er) {
      print(er.toString());
    }
  }

  AccountTypeModel? accountTypeModel;

  void getAcounts() {
    emit(GetAcountTypeLoading());
    DioHelper.getData(
      path: kCounts,
    ).then((value) {
      accountTypeModel = AccountTypeModel.fromJson(value.data);
      emit(GetAcountTypeSuccess());
    }).catchError((er) {
      emit(GetAcountTypeError(er.toString()));

      print(er.toString());
    });
  }

  void removeImageProfil() {
    imageProfile = null;
    emit(RemoveImageProfile());
  }

  File? imageProfile;
  var picker = ImagePicker();
  Future upladImage() async {
    emit(UploadImagePlayerLoading());
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageProfile = File(image.path);
      emit(UploadImagePlayerSuccess());
    } else {
      print('no image');
      emit(UploadImagePlayerError());
    }
  }

  bool isSportId = false;
  int? sportId;
  int? sportsId = 1;
  void sportedId(int? value) {
    sportsId = value;
    emit(GetSporttId());
  }

  void changeIsSportId() {
    isSportId = !isSportId;
    emit(GetSportsId());
  }

  void getSportId(index) {
    sportId = index;
    print("sportId = $sportId");

    emit(GetSportsId());
  }

  int positionId = 1;
  void getPositionId(int? id) {
    positionId = id!;
    emit(GetPositionId());
    print("positionId = $positionId");
  }

  bool isfreeStyle = false;
  void changeIsStyling() {
    isfreeStyle = !isfreeStyle;
    emit(ChangeIsFreeStyling());
  }

  PlayerData? playerData;
  void storageImageInApi({
    dynamic sportId,
    dynamic positionId,
    dynamic dateOfBirth,
    dynamic clubId,
    dynamic height,
    dynamic weight,
    dynamic liftingLegWieghts,
    String? state,
    dynamic runningTime,
    dynamic verticalJumpingDistance,
    dynamic longJumpingDistance,
    dynamic liftingArmsWeights,
    dynamic nationality,
    String? livingCountry,
    String? gender,
    String? limbsDirection,
  }) async {
    FormData formData = FormData.fromMap({
      "living_country": livingCountry,
      "sport_id": sportId,
      "gender": gender,
      "limbs_direction": limbsDirection,
      "running_time": runningTime,
      "vertical_jumping_distance": verticalJumpingDistance,
      "long_jumping_distance": longJumpingDistance,
      "lifting_arms_weights": liftingArmsWeights,
      "nationality": nationality,
      "position_id": positionId,
      "date_of_birth": dateOfBirth,
      "club_id": clubId,
      "height": height,
      "weight": weight,
      "lifting_leg_weights": liftingLegWieghts,
      "state": state,
      "profile_picture": await MultipartFile.fromFile(imageProfile!.path,
          filename: imageProfile!.path, contentType: MediaType('image', 'jpg')),
    });
    emit(StorageImagePlayerLoading());
    try {
      DioHelper.postData(
        path: kPostPlayerData,
        data: formData,
        token: uid,
      ).then((value) {
        playerData = PlayerData.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(StorageImagePlayerError());
      });
    } on DioError catch (er) {
      emit(StorageImagePlayerError());
    }
  }

  PlayerData? editData;
  void editProfileData({
    dynamic sportId,
    dynamic positionId,
    dynamic dateOfBirth,
    dynamic clubId,
    dynamic height,
    dynamic weight,
    dynamic liftingLegWieghts,
    String? state,
    dynamic runningTime,
    dynamic verticalJumpingDistance,
    dynamic longJumpingDistance,
    dynamic liftingArmsWeights,
    dynamic nationality,
    String? livingCountry,
    String? gender,
    String? limbsDirection,
  }) async {
    FormData formData = FormData.fromMap({
      "living_country": livingCountry,
      "sport_id": sportId,
      "gender": gender,
      "limbs_direction": limbsDirection,
      "running_time": runningTime,
      "vertical_jumping_distance": verticalJumpingDistance,
      "long_jumping_distance": longJumpingDistance,
      "lifting_arms_weights": liftingArmsWeights,
      "nationality": nationality,
      "position_id": positionId,
      "date_of_birth": dateOfBirth,
      "club_id": clubId,
      "height": height,
      "weight": weight,
      "lifting_leg_weights": liftingLegWieghts,
      "state": state,
    });
    emit(EditDataLoading());
    try {
      DioHelper.postData(
        path: kPostPlayerData,
        data: formData,
        token: uid,
      ).then((value) {
        editData = PlayerData.fromJson(value.data);
        emit(EditDataSuccess());
      }).catchError((er) {
        print(er.toString());
        emit(EditDataError());
      });
    } on DioError catch (er) {
      emit(StorageImagePlayerError());

      print(er.toString());
    }
  }

  GetPlayerProfileData? getPlayerProfileData;
  void getPlayerData() {
    try {
      emit(GetSportsDataLoading());

      DioHelper.getData(
              path: 'http://3.13.247.140/api/player/profile', token: uid)
          .then((value) {
        getPlayerProfileData = GetPlayerProfileData.fromJson(value.data);
        emit(GetSportsDataSuccess());
      }).catchError((er) {
        emit(GetSportsDataError());

        print(er.toString());
      });
    } on DioError catch (er) {
      emit(GetSportsDataError());

      print(er.toString());

      emit(GetSportsDataError());
    }
  }

  AddExprienceModel? addExprienceModel;
  void addExprience({
    String? clubName,
    String? startingDate,
    String? endingDate,
    String? leagueType,
  }) {
    emit(AddExprienceLoading());

    DioHelper.postData(path: kAddExprience, token: uid, data: {
      "club_name": clubName,
      "starting_date": startingDate,
      "ending_date": endingDate,
      "league_type": leagueType,
    }).then((value) {
      addExprienceModel = AddExprienceModel.fromJson(value.data);
            getPlayerData();

    }).catchError((er) {
      emit(AddExprienceError());

      print(er.toString());
    });
  }

  AddContactModel? addContactModel;
  void contactInfo({
    String? contentType,
    String? contentvalue,
    String? privacy,
  }) {
    emit(AddContactLoading());

    DioHelper.postData(
      path: kAddContact,
      token: uid,
      data: {
        "contact_type": contentType,
        "contact_value": contentvalue,
        "privacy": privacy,
      },
    ).then((value) {
      addContactModel = AddContactModel.fromJson(value.data);
      getPlayerData();
    }).catchError((er) {
      emit(AddContactError());

      print(er.toString());
    });
  }

  File? skillsVideo;

  VideoPlayerController? videoController;
  int maxSeconds = 30;
  Future<void> uploadVideo(context) async {
    try {
      // final picker = ImagePicker();
      emit(UploadVideoPlayerLoading());
      var pickedFile = await picker.pickVideo(
          source: ImageSource.gallery,
          maxDuration: Duration(seconds: maxSeconds));
      if (pickedFile == null) {
        return;
      }
      videoController =
          VideoPlayerController.file(File(pickedFile.path)); //Your file here
      await videoController!.initialize();
      if (videoController!.value.duration.inSeconds >= 30) {
        pickedFile = null;
        throw ('we only allow videos that are shorter than 30 secand!');
      } else {
        skillsVideo = File(pickedFile.path);
        //  startVideoPlayer();
        emit(UploadVideoPlayerSuccess());
      }
    } catch (e) {
      emit(UploadVideoPlayerError());

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text(e.toString()),
              ),
            );
          });
      return;
    }

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

  DeleteSkills? deleteSkills;
  void deleteSkill({int? id}) {
    emit(DeleteSkillsLoading());
    try {
      DioHelper.deleteData(
              token: uid,
              path: 'http://3.13.247.140/api/player/delete-skill/$id')
          .then((value) {
        deleteSkills = DeleteSkills.fromJson(value.data);
              getPlayerData();

      }).catchError((er) {
        emit(DeleteSkillsError());
        getPlayerData();

        print(er.toString());
      });
    } on DioError catch (er) {
      emit(DeleteSkillsError());

      print(er.toString());
    }
  }

  EditSkills? editSkills;
  void updateSkills({
    int? id,
    String? freeStyling = '0',
    String? title,
  }) {
    emit(EditSkillsLoading());
    DioHelper.postData(
            token: uid,
            data: {
              'title': title,
              'is_freestyle': freeStyling,
            },
            path: 'http://3.13.247.140/api/player/edit-skill/$id')
        .then((value) {
      editSkills = EditSkills.fromJson(value.data);
      emit(EditSkillsSuccess());
      getPlayerData();
    }).catchError((er) {
      emit(EditSkillsError());

      print(er.toString());
    });
  }

  bool isVideo = false;
  void changeIsVideo() {
    isVideo = !isVideo;
    isVideo ? videoController!.play() : videoController!.pause();
    emit(ChangeIsVideo());
  }

  AddSkillsModel? addSkillsModel;
  void storageVideoSkills({
    String? title,
    String isFreeStyling = '0',
  }) async {
    FormData formData = FormData.fromMap({
      "title": title,
      "video": await MultipartFile.fromFile(skillsVideo!.path,
          filename: skillsVideo!.path, contentType: MediaType('video', 'mp4')),
      "is_freestyle": isFreeStyling,
    });
    emit(StorageVideoSkillsPlayerLoading());
    DioHelper.postData(path: kAddSkills, data: formData, token: uid)
        .then((value) {
      addSkillsModel = AddSkillsModel.fromJson(value.data);
      getPlayerData();
    }).catchError((er) {
      emit(StorageVideoSkillsPlayerError());

      print(er.toString());
    });
  }

  ////// video_trimmer: ^1.1.3////////
// How to make like that system ?

// User pick video

// User trim video with maximum time limit

// Upload video

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
}
