import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:async';

import 'package:platform_device_id/platform_device_id.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/componant/constants/constants.dart';
import 'package:sportive/model/acount_type.dart';
import 'package:sportive/model/add_category_model.dart';
import 'package:sportive/model/add_certificate.dart';
import 'package:sportive/model/add_coupon.dart';
import 'package:sportive/model/add_p_test.dart';
import 'package:sportive/model/add_position.dart';
import 'package:sportive/model/add_products.dart';
import 'package:sportive/model/add_skills.dart';
import 'package:sportive/model/city_model.dart';
import 'package:sportive/model/contact_model.dart';
import 'package:sportive/model/country_model.dart';
import 'package:sportive/model/delete_p_test.dart';
import 'package:sportive/model/delete_skills.dart';
import 'package:sportive/model/edit_coupon.dart';
import 'package:sportive/model/edit_pt.dart';
import 'package:sportive/model/edit_skills.dart';
import 'package:sportive/model/experience_model.dart';
import 'package:sportive/model/genral_model.dart';
import 'package:sportive/model/get_category_model.dart';
import 'package:sportive/model/get_company-products.dart';
import 'package:sportive/model/get_coupon.dart';
import 'package:sportive/model/get_performance_test.dart';
import 'package:sportive/model/get_player_data.dart';
import 'package:sportive/model/get_position.dart';
import 'package:sportive/model/get_sport_model.dart';
import 'package:sportive/model/get_user_data.dart';
import 'package:sportive/model/performance_data.dart';
import 'package:sportive/model/profile_model.dart';
import 'package:sportive/model/search_model.dart';
import 'package:sportive/model/register_model.dart';
import 'package:sportive/model/sport_model.dart';
import 'package:sportive/model/sports.dart';
import 'package:sportive/model/sub_sport_model.dart';
import 'package:sportive/model/tites_model.dart';
import 'package:sportive/model/update_products.dart';
import 'package:sportive/model/verify_model.dart';
import 'package:sportive/module/club/home/home.dart';
import 'package:sportive/module/coach/home/about_me.dart';
import 'package:sportive/module/company/home/about_me.dart';
import 'package:sportive/module/doctors/home/about_me.dart';
import 'package:sportive/module/player/details/widgets/social.dart';
import 'package:sportive/module/player/home/about_me.dart';
import 'package:sportive/player-cubit/player_state.dart';
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

  int genderVal = 1;
  List<String> gender = [
    "female",
    "male",
  ];
  String ganderValue = 'female';
  void onChangedGender(val) {
    ganderValue = val;
    if (val == 'female') {
      genderVal = 2;
    } else {
      genderVal = 1;
    }
    emit(ChangeGander());
  }

  bool isCountry = false;
  bool isSocial = false;
  void changeIsCountry() {
    isCountry = !isCountry;
    emit(ChangeCountry());
  }

  void changeIsSocial() {
    isSocial = !isSocial;
    emit(ChangeIsSocial());
  }

  int? directionVal = 1;
  List<String> direction = [
    "Right",
    "Left",
  ];
  String right = 'Right';
  void onChangedDirection(val) {
    right = val;
    if (val == 'Right') {
      directionVal = 1;
    } else {
      directionVal = 2;
    }
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

  String devicesId = '';
  initPlatformState() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      devicesId = '${iosDeviceInfo.identifierForVendor}'; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      devicesId = '${androidDeviceInfo.id}'; // unique ID on Android
    }

    return devicesId;
  }

  String? deviceId;
  int fmcToken = 1;
  Future getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor!;
      fmcToken = 2;
      print(fmcToken);
      print(deviceId);
      emit(GetDeviceId());
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.androidId;
      fmcToken = 1;
      emit(GetDeviceId());
    } else {
      deviceId = 'null';
    }
    return deviceId;
  }

  GetComapanyProductModel? getCompanyProductModel;
  void getProducts() {
    emit(GetProductsLoading());
    DioHelper.getData(path: kBaseUrl + '/companyProducts', token: uid)
        .then((value) {
      getCompanyProductModel = GetComapanyProductModel.fromJson(value.data);
      emit(GetProductsSuccess());
    }).catchError((er) {
      emit(GetProductsError());
    });
  }

  GetCategoryModel? getCategoryModel;
  void getCategory() {
    emit(GetCategoryModelLoading());
    DioHelper.getData(path: kBaseUrl + '/categories', token: uid).then((value) {
      getCategoryModel = GetCategoryModel.fromJson(value.data);
      print(value.data);
      emit(GetCategoryModelSuccess());
    }).catchError((er) {
      emit(GetCategoryModelError());
    });
  }

  GetCouponeModel? getCouponModel;
  void getCoupons() {
    emit(GetCouponModelLoading());
    DioHelper.getData(path: kBaseUrl + '/coupons', token: uid).then((value) {
      getCouponModel = GetCouponeModel.fromJson(value.data);
      print(value.data);
      emit(GetCouponModelSuccess());
    }).catchError((er) {
      emit(GetCouponModelError());
    });
  }

  AddCategoryModel? addCategoryModel;
  void addCategory({
    String? name,
    String? parentId,
    String? type,
  }) {
    emit(UpdateCategoryLoading());
    DioHelper.postData(path: kBaseUrl + '/categories', token: uid, data: {
      'parent_id': parentId,
      'name': name,
      'type': type,
    }).then((value) {
      addCategoryModel = AddCategoryModel.fromJson(value.data);
      emit(UpdateCategorySuccess());
    }).catchError((er) {
      emit(UpdateCategoryError());
    });
  }

  UpdateProductModel? updateProductModel;
  void updateProducts(int? id, String? name) {
    emit(UpdateProductsLoading());

    DioHelper.patchData(
        token: uid,
        path: kBaseUrl + '/companyProducts+$id',
        data: {
          'name': name,
        }).then((value) {
      updateProductModel = UpdateProductModel.fromJson(value.data);
      getProducts();
    }).catchError((er) {
      emit(UpdateProductsError());

      print(er.toString());
    });
  }

  List<String> roles = [
    "player",
    "club",
    "coach",
    "Doctor",
    'Company',
    'Agent',
    'normal',
  ];
  int roleId = 1;
  String rolesVal = 'player';
  void onChangedservices(val) {
    rolesVal = val;
    if (val == 'player') {
      roleId = 1;
    } else if (val == 'club') {
      roleId = 2;
    } else if (val == 'doctor') {
      roleId = 3;
    } else if (val == 'coach') {
      roleId = 4;
    } else if (val == 'company') {
      roleId = 5;
    } else if (val == 'Agent') {
      roleId = 6;
    } else if (val == 'normal') {
      roleId = 7;
    }
    print(roleId);
    emit(Changetype());
  }

  // void getPages() {
  //   if (accountType == 1) {
  //     appPages = Home();
  //   } else if (accountType == 2 || accountType == 3 || accountType == 4) {
  //     appPages = ClubHome();
  //   } else if (accountType == 5 || accountType == 6 || accountType == 7) {
  //     appPages = DoctorHome();
  //   } else if (accountType == 8 || accountType == 9) {
  //     appPages = CoachHome();
  //   } else if (accountType == 10) {
  //     appPages = CompanyHome();
  //   } else if (accountType == 11) {
  //     // nextPageUntil(context: context, page: ());
  //     //  setState(() {
  //     //   pages = UserHome();
  //     // });
  //     //   }
  //     // });
  //   }
  // }

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

  String? nationVal;
  int? nation;
  void changeNation(value, val) {
    nation = value;
    nationVal = val;

    emit(ChangeNationality());
  }

  String? cityVal;
  int? city;
  void changecity(value, val) {
    city = value;
    cityVal = val;

    emit(ChangeCity());
  }

  int? country;
  String? countryVal;
  void changeCountr(value, val) {
    country = value;
    countryVal = val;

    emit(ChangeCity());
  }

  CountryModel? countryModel;
  void getCountry() {
    emit(GetCountryLoading());
    DioHelper.getData(
      path: kBaseUrl + '/locations',
    ).then((value) {
      countryModel = CountryModel.fromJson(value.data);

      emit(GetCountrySuccess());
    }).catchError((er) {
      emit(GetCountryError());
    });
  }

  CityModel? cityModel;
  void getCity({int? id}) {
    emit(GetCityLoading());
    DioHelper.getData(
        path: kBaseUrl + '/cities',
        token: uid,
        query: {'country_id': 70}).then((value) {
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

  final _picker = ImagePicker();
  File? playVideo;
  bool isCaptured = false;
  uploadCamera() async {
    final file = await _picker.pickVideo(
        source: ImageSource.camera, maxDuration: const Duration(seconds: 30));
    isCaptured = true;

    playVideo = File(file!.path);
    print("Video Path ${file.path}");
    emit(ChangeQrCode());
  }

  GetSportModel? sportModel;

  void getSports() {
    emit(GetSportsLoading());
    DioHelper.getData(
      path: kBaseUrl + '/sports',
      token: uid,
    ).then((value) {
      sportModel = GetSportModel.fromJson(value.data);
      print(value.data);
      emit(GetSportsSuccess());
    }).catchError((er) {
      print(er.toString());
      emit(GetSportsError());
    });
  }

  AddPositionModel? addPositionModel;
  void addPositions({
    String? shortCut,
    String? sportId,
    String? typeId,
    String? name,
  }) {
    emit(AddPositionsLoading());
    DioHelper.postData(path: kBaseUrl + '/positions', token: uid, data: {
      'shortcut': shortCut,
      'sport_id': sportId,
      'type_id': typeId,
      'categories[0][name]': name,
    }).then((value) {
      addPositionModel = AddPositionModel.fromJson(value.data);
      emit(AddPositionsSuccess());
    }).catchError((er) {
      emit(AddPositionsError());
      print(er.toString());
    });
  }

  void addSports({
    String? categoryName,
    String? sportId,
    String? typeId,
    String? name,
  }) async {
    emit(AddPositionsLoading());
    FormData formData = FormData.fromMap({
      'name': name,
      'categories[0][name]': categoryName,
      "image": await MultipartFile.fromFile(imageCoupon!.path,
          filename: imageCoupon!.path, contentType: MediaType('image', 'jpg')),
    });
    DioHelper.postData(
      path: kBaseUrl + '/sports',
      token: uid,
      data: formData,
    ).then((value) {
      addPositionModel = AddPositionModel.fromJson(value.data);
      emit(AddPositionsSuccess());
    }).catchError((er) {
      emit(AddPositionsError());
      print(er.toString());
    });
  }

  int? sportIndex;
  void getSportIndex(index) {
    sportIndex = index;
    emit(GetSportsIndex());
  }

  int? spId;
  void getSportId(sId) {
    spId = sId;
    emit(GetSportsIndex());
  }

  int? positionIndex;
  void getPositionIndex(index) {
    positionIndex = index;
    emit(GetSportsIndex());
  }

  GetPositionModel? getPositionModel;
  void getPositions({int? id}) {
    emit(GetPositionsLoading());
    DioHelper.getData(
        path: kBaseUrl + '/positions',
        token: uid,
        query: {"sport_id": 1}).then((value) {
      getPositionModel = GetPositionModel.fromJson(value.data);

      emit(GetPositionsSuccess());
    }).catchError((er) {
      print(er.toString());
      emit(GetPositionsSuccess());
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

  GetSportModel? searchSports;
  void getSearchSports({txt}) {
    emit(GetPositionsLoading());
    DioHelper.getData(
        path: kBaseUrl + '/sports',
        token: uid,
        query: {"name": txt}).then((value) {
      searchSports = GetSportModel.fromJson(value.data);

      emit(GetPositionsSuccess());
    }).catchError((er) {
      print(er.toString());
      emit(GetPositionsSuccess());
    });
  }

  GetSportModel? subSportModel;
  void getSubSports({int? sId}) {
    emit(GetSubSportsLoading());

    DioHelper.getData(
        path: kBaseUrl + '/sports',
        token: uid,
        query: {'category_id': sId}).then((value) {
      subSportModel = GetSportModel.fromJson(value.data);
      print("pi :$id");
      emit(GetSubSportsSuccess());
      print('pid = $id');
    }).catchError((er) {
      print(er.toString());
      emit(GetSubSportsError(er.toString()));
    });
  }

  GetSportModel? mainSportModel;
  void getMainSports() {
    emit(GetSubSportsLoading());

    DioHelper.getData(
      path: kBaseUrl + '/sports',
      token: uid,
    ).then((value) {
      mainSportModel = GetSportModel.fromJson(value.data);
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
        // getSportsData();
        ;

        emit(FetchData());
      }
    });
  }

  // GetAllSports? getAllSports;
  // void getSportsData() {
  //   emit(GetAllSportsLoading());
  //   DioHelper.getData(path: "http://3.13.247.140/all-sports", query: {
  //     "per_page": pages,
  //     "page": page,
  //   }).then((value) {
  //     getAllSports = GetAllSports.fromJson(value.data);
  //     // items.add(getAllSports.data.length+1.toString());
  //     emit(GetAllSportsSuccess());
  //   }).catchError((er) {
  //     emit(GetAllSportsError());
  //     print(er.toString());
  //   });
  // }

  RegisterModel? registerModel;
  void register({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
    int? countryCode,
    int? phoneType,
    int? roleTypeId,
    String? fcmToken,
  }) {
    emit(RegisterLoading());
    try {
      DioHelper.postData(
          path: kBaseUrl + '/register',
          // token: null,
          data: {
            "name": name,
            "phone": phone,
            "country_id": countryCode,
            "password_confirmation": confirmPassword,
            "password": password,
            "fcm_token": fcmToken,
            "type_id": roleTypeId,
            "phone_type": phoneType,
          }).then((value) {
        registerModel = RegisterModel.fromJson(value.data);
        emit(RegisterSuccess());
      }).catchError((er) {
        print(er.toString());
        emit(RegisterError(message: registerModel!.message));
      });
    } catch (er) {
      emit(RegisterError());
      print(er.toString);
    }
  }

  // PositionModel? positionModel;
  // void getPosition() {
  //   try {
  //     emit(GetPositionsLoading());
  //     DioHelper.getData(path: kPositions, token: uid).then((value) {
  //       positionModel = PositionModel.fromJson(value.data);
  //       emit(GetPositionsSuccess());
  //       print(positionModel!.data[1]);
  //     }).catchError((er) {
  //       emit(GetPositionsError());

  //       print(er.toString());
  //     });
  //   } on DioError catch (er) {
  //     print(er.toString());
  //   }
  // }

  AcountTypesModel? accountTypeModel;

  void getAcounts() {
    emit(GetAcountTypeLoading());
    DioHelper.getData(
      path: kBaseUrl + '/types',
    ).then((value) {
      accountTypeModel = AcountTypesModel.fromJson(value.data);
      emit(GetAcountTypeSuccess());
    }).catchError((er) {
      emit(GetAcountTypeError(er.toString()));

      print(er.toString());
    });
  }

  Widget? appPage;
  String? acountType;
  String? type;
  int? accountType;
  void changeAccountType(
    int id,
    String acount,
  ) {
    accountType = id;
    acountType = acount;

    emit(ChangeType());
  }

  void changeType({String? acount}) {
    type = acount;

    emit(ChangeAcountType(type));
  }

  int? countrCode;
  String? codeCountry;
  void changeCountryCode(
    int count,
    String code,
  ) {
    countrCode = count;
    codeCountry = code;
    emit(ChangeCountry());
  }

  String? countrCodes;
  int? countrycodeVal;
  void changeCountryCodes(
    int id,
    String count,
  ) {
    countrCodes = count;
    countrycodeVal = id;
    emit(ChangeCountry());
  }

  void removeImageProfil() {
    imageProfile = null;
    emit(RemoveImageProfile());
  }

  VerifyModel? verifyModel;
  void verifyPhone({
    String? phone,
    String? code,
  }) {
    emit(VerifyPhoneLoading());
    DioHelper.postData(path: kBaseUrl + '/verifyPhone', data: {
      "phone": phone,
      'code': code,
    }).then((value) {
      verifyModel = VerifyModel.fromJson(value.data);
      print('value=${value.data}');
      emit(VerifyPhoneSuccess(verifyModel!.data!.token));
    }).catchError((er) {
      print(er.toString());
      emit(VerifyPhoneError());
    });
  }

  File? imageProduct;
  File? imageCertificate;
  File? imageProfile;
  File? clubLogo;
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

  Future upladImageProducts() async {
    emit(UploadImagePlayerLoading());
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageProduct = File(image.path);
      emit(UploadImagePlayerSuccess());
    } else {
      print('no image');
      emit(UploadImagePlayerError());
    }
  }

  Future upladImageCertifictae() async {
    emit(UploadImagePlayerLoading());
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageCertificate = File(image.path);
      emit(UploadImagePlayerSuccess());
    } else {
      print('no image');
      emit(UploadImagePlayerError());
    }
  }

  Future upladLogo() async {
    emit(UploadImagePlayerLoading());
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      clubLogo = File(image.path);
      emit(UploadLogoSuccess());
    } else {
      print('no image');
      emit(UploadLogoError());
    }
  }

  File? imageCoupon;
  Future upladImageCoupon() async {
    emit(UploadImagePlayerLoading());
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageCoupon = File(image.path);
      emit(UploadLogoSuccess());
    } else {
      print('no image');
      emit(UploadLogoError());
    }
  }

  bool isSportId = false;
  int? sportId;

  void changeIsSportId() {
    isSportId = !isSportId;
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

  AddCouponModel? addCouponModel;
  void storageImageCoupon({
    String? name,
    String? address,
    int? sportId,
    int? discount,
  }) async {
    FormData formData = FormData.fromMap({
      'name': name,
      'discount': discount,
      'sport_id': sportId,
      "image": await MultipartFile.fromFile(imageCoupon!.path,
          filename: imageCoupon!.path, contentType: MediaType('image', 'jpg')),
    });

    emit(AddCouponLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/coupons',
        data: formData,
        token: uid,
      ).then((value) {
        addCouponModel = AddCouponModel.fromJson(value.data);
        getCoupons();
      }).catchError((er) {
        print(er.toString());
        emit(AddCouponError());
      });
    } on DioError catch (er) {
      emit(AddCouponError());
    }
  }

  EditCouponModel? editCouponModel;
  void EditCoupon({
    int? id,
    String? name,
    String? address,
    int? sportId,
    int? discount,
  }) async {
    FormData formData = FormData.fromMap({
      'name': name,
      'discount': discount,
      'sport_id': sportId,
      "image": await MultipartFile.fromFile(imageCoupon!.path,
          filename: imageCoupon!.path, contentType: MediaType('image', 'jpg')),
    });

    emit(AddCouponLoading());
    try {
      DioHelper.patchData(
        path: kBaseUrl + '/coupons',
        data: formData,
        token: uid,
      ).then((value) {
        addCouponModel = AddCouponModel.fromJson(value.data);
        getCoupons();
      }).catchError((er) {
        print(er.toString());
        emit(AddCouponError());
      });
    } on DioError catch (er) {
    } on DioError catch (er) {
      emit(AddCouponError());
    }
  }

  ProfileModel? playerData;
  void storageImageInApi({
    dynamic sportId,
    dynamic positionId,
    dynamic clubName,
    dynamic country,
    dynamic city,
  }) async {
    FormData formData = FormData.fromMap({
      "city_id": city,
      "countr_id": country,
      "club_name": clubName,
      "sport_id": sportId,
      'position_id': positionId,
      "club_logo": await MultipartFile.fromFile(clubLogo!.path,
          filename: clubLogo!.path, contentType: MediaType('image', 'jpg')),
      "image": await MultipartFile.fromFile(imageProfile!.path,
          filename: imageProfile!.path, contentType: MediaType('image', 'jpg')),
    });
    emit(StorageImagePlayerLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/updateProfileData',
        data: formData,
        token: uid,
      ).then((value) {
        playerData = ProfileModel.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(StorageImagePlayerError());
      });
    } on DioError catch (er) {
      emit(StorageImagePlayerError());
    }
  }

  PerformancDataModel? performancData;
  void uploadPerformanceData({
    dynamic Left,
    dynamic runTime,
    dynamic longJumpdistance,
    dynamic liftingweighthand,
    dynamic verticalJumpdistance,
    dynamic liftingweightleg,
  }) async {
    FormData formData = FormData.fromMap({
      "right_left": city,
      "runTime": runTime,
      "verticalJump_distance": verticalJumpdistance,
      "longJump_distance": longJumpdistance,
      "lifting_weight_hand": liftingweighthand,
      "lifting_weight_leg": liftingweightleg,
    });
    emit(PerformanceDataLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/updatePerformanceData',
        data: formData,
        token: uid,
      ).then((value) {
        playerData = ProfileModel.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(PerformanceDataError());
      });
    } on DioError catch (er) {
      emit(StorageImagePlayerError());
    }
  }

  GenralDataModel? genralDataModel;
  void uploadGenralData({
    dynamic countryId,
    dynamic nationality,
    dynamic cityId,
    dynamic gender,
    dynamic birthDate,
    dynamic weight,
    dynamic hieght,
    dynamic founded,
    dynamic founder,
    dynamic website,
    dynamic manager,
    dynamic stadium,
    dynamic companyLocation,
    dynamic companyType,
  }) async {
    FormData formData = FormData.fromMap({
      "nationality_id": nationality,
      "country_id": countryId,
      "city_id": cityId,
      "gender": gender,
      "birth_date": birthDate,
      "weight": weight,
      "manager": manager,
      "stadium": stadium,
      "founder": founder,
      "founded": founded,
      "company_location": companyLocation,
      "website": website,
      "company_type": companyType,
      "height": hieght,
    });
    emit(GenralDataLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/updateGeneralData',
        data: formData,
        token: uid,
      ).then((value) {
        genralDataModel = GenralDataModel.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(StorageImagePlayerError());
      });
    } on DioError catch (er) {
      emit(StorageImagePlayerError());
    }
  }

  AddCertificateModel? addCertificateModel;
  void uploadCertificate({
    dynamic name1,
    dynamic date1,
    dynamic id1,
  }) async {
    FormData formData = FormData.fromMap({
      "certificates[0][name]": name1,
      "certificates[0][date]": date1,
      "certificates[0][id]": id1,
      "image": await MultipartFile.fromFile(imageCertificate!.path,
          filename: imageCertificate!.path,
          contentType: MediaType('image', 'jpg')),
    });
    emit(UploadCertificateLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/updateCertificates',
        data: formData,
        token: uid,
      ).then((value) {
        addCertificateModel = AddCertificateModel.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(UploadCertificateSuccess());
      });
    } on DioError catch (er) {
      emit(UploadCertificateError());
    }
  }

  TitesModel? titlesModel;
  void uploadTiltes({
    dynamic sportId1,
    dynamic legueType1,
    dynamic number1,
  }) async {
    FormData formData = FormData.fromMap({
      "titles[0][sport_id]": sportId1,
      "titles[0][league_type]": legueType1,
      "titles[0][number]": number1,
    });
    emit(UploadTitlesLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/updateTitles',
        data: formData,
        token: uid,
      ).then((value) {
        titlesModel = TitesModel.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(UploadTitlesError());
      });
    } on DioError catch (er) {
      emit(StorageImagePlayerError());
    }
  }

  ExperienceModel? experiencesModel;
  void uploadExprience({
    dynamic sportId,
    dynamic positionId,
    dynamic leagueType,
    dynamic clubName,
    dynamic startDate,
    dynamic endDate,
    dynamic type,
    dynamic teamOne,
    dynamic teamTwo,
    dynamic teamOneScore,
    dynamic teamTwoScore,
  }) async {
    FormData formData = FormData.fromMap({
      "experiences[0][sport_id]": sportId,
      "experiences[0][position_id]": positionId,
      "experiences[0][league_type]": leagueType,
      "experiences[0][club_name]": clubName,
      "experiences[0][start_date]": startDate,
      "experiences[0][type]": type,
      "experiences[0][end_date]": endDate,
      "experiences[0][team_one]": teamOne,
      "experiences[0][team_two]": teamTwo,
      "experiences[0][team_one_score]": teamOneScore,
      "experiences[0][team_two_score]": teamTwoScore,
    });
    emit(ExpericeDataLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/updateExperiences',
        data: formData,
        token: uid,
      ).then((value) {
        experiencesModel = ExperienceModel.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(ExpericeDataSuccess());
      });
    } on DioError catch (er) {
      emit(ExpericeDataError());
    }
  }

  int? socialId;
  String? socialval;
  void getSocial(id, String value) {
    socialId = id;
    socialval = value;
    emit(GetSocialId());
  }

  List<Social> social = [
    Social(id: 1, text: 'faceBook'),
    Social(id: 2, text: 'twitter'),
    Social(id: 3, text: 'instagram'),
    Social(id: 4, text: 'tiktok'),
    Social(id: 5, text: 'youtube'),
    Social(id: 6, text: 'gmail'),
    Social(id: 6, text: 'telegram'),
  ];

  ContactModel? contactModel;
  void uploadContact({
    dynamic type,
    dynamic code,
    dynamic social,
    dynamic privacy,
    String? text,
    dynamic id,
  }) async {
    FormData formData = FormData.fromMap({
      'contacts[0][type]': type,
      'contacts[0][social_media_type]': social,
      'contacts[0][country_code]': code,
      'contacts[0][privacy]': privacy,
      'contacts[0][text]': text,
      'contacts[0][id]': id,
    });
    emit(ContactsLoading());
    try {
      DioHelper.postData(
        path: kBaseUrl + '/updateContacts',
        data: formData,
        token: uid,
      ).then((value) {
        contactModel = ContactModel.fromJson(value.data);
        getPlayerData();
      }).catchError((er) {
        print(er.toString());
        emit(ContactsError());
      });
    } on DioError catch (er) {
      emit(ExpericeDataError());
    }
  }

  // PlayerData? editData;
  // void editProfileData({
  //   dynamic sportId,
  //   dynamic positionId,
  //   dynamic dateOfBirth,
  //   dynamic clubId,
  //   dynamic height,
  //   dynamic weight,
  //   dynamic liftingLegWieghts,
  //   String? state,
  //   dynamic runningTime,
  //   dynamic verticalJumpingDistance,
  //   dynamic longJumpingDistance,
  //   dynamic liftingArmsWeights,
  //   dynamic nationality,
  //   String? livingCountry,
  //   String? gender,
  //   String? limbsDirection,
  // }) async {
  //   FormData formData = FormData.fromMap({
  //     "living_country": livingCountry,
  //     "sport_id": sportId,
  //     "gender": gender,
  //     "limbs_direction": limbsDirection,
  //     "running_time": runningTime,
  //     "vertical_jumping_distance": verticalJumpingDistance,
  //     "long_jumping_distance": longJumpingDistance,
  //     "lifting_arms_weights": liftingArmsWeights,
  //     "nationality": nationality,
  //     "position_id": positionId,
  //     "date_of_birth": dateOfBirth,
  //     "club_id": clubId,
  //     "height": height,
  //     "weight": weight,
  //     "lifting_leg_weights": liftingLegWieghts,
  //     "state": state,
  //   });
  //   emit(EditDataLoading());
  //   try {
  //     DioHelper.postData(
  //       path: kPostPlayerData,
  //       data: formData,
  //       token: uid,
  //     ).then((value) {
  //       editData = PlayerData.fromJson(value.data);
  //       emit(EditDataSuccess());
  //     }).catchError((er) {
  //       print(er.toString());
  //       emit(EditDataError());
  //     });
  //   } on DioError catch (er) {
  //     emit(StorageImagePlayerError());

  //     print(er.toString());
  //   }
  // }

  int? taps;
  void changeTaps(id) {
    taps = id;
    emit(ChangeTaps());
  }

  GetUserDataModel? getProfileData;
  void getPlayerData() {
    try {
      emit(GetSportsDataLoading());

      DioHelper.getData(path: kBaseUrl + '/me', token: uid).then((value) {
        getProfileData = GetUserDataModel.fromJson(value.data);
        print(getProfileData!.data!.user!.phone);
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

  var clubNameController = TextEditingController();
  var leagueController = TextEditingController();
  var positionController = TextEditingController();
  var certificateController = TextEditingController();
  var titlesController = TextEditingController();

  DateTime? startingDate;
  DateTime? endingDate;

  // AddExprienceModel? addExprienceModel;

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
              token: uid, path: 'http://3.13.247.140/player/delete-skill/$id')
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
            path: 'http://3.13.247.140/player/edit-skill/$id')
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

  bool changed = false;
  bool changed1 = false;
  bool changed2 = false;
  void isChanged(change) {
    changed = change;
    emit(Changed());
  }

  void isChanged1(change) {
    changed1 = change;
    emit(Changed());
  }

  void isChanged2(change) {
    changed2 = change;
    emit(Changed());
  }

  bool changedS = false;
  bool changedS1 = false;
  bool changedS2 = false;
  void isChangedS(change) {
    changedS = change;
    emit(Changed());
  }

  void isChangedS1(change) {
    changedS1 = change;
    emit(Changed());
  }

  void isChangedS2(change) {
    changedS2 = change;
    emit(Changed());
  }

  int sideIndex = 0;
  var sidebarcontroller = SidebarXController(selectedIndex: 0, extended: false);

  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;

  void changeSelectedIndex1() {
    select1 = true;
    select2 = false;
    select3 = false;
    select4 = false;

    emit(ChangeSelectedIndex());
  }

  void changeSelectedIndex2() {
    select1 = false;
    select2 = true;
    select3 = false;
    select4 = false;

    emit(ChangeSelectedIndex());
  }

  void changeSelectedIndex3() {
    select1 = false;
    select2 = false;
    select3 = true;
    select4 = false;

    emit(ChangeSelectedIndex());
  }

  void changeSelectedIndex4() {
    select1 = false;
    select2 = false;
    select3 = false;
    select4 = true;

    emit(ChangeSelectedIndex());
  }

  bool isCancel = false;
  void changeIsCancel() {
    isCancel = !isCancel;
    emit(ChangeSelectedIndex());
  }

  bool isStartingRecord = false;
  void ChangeRecord() {
    isStartingRecord = !isStartingRecord;
    emit(ChangeSelectedIndex());
  }

////////////=> PTEST <=//////////
  GetPerformanceTest? getPT;
  void getPtest({
    int? active,
    int? sportId,
    int? positionId,
    int? typeId,
  }) {
    emit(GetPTLoading());
    DioHelper.getData(path: kBaseUrl + '/performanceTests', token: uid, query: {
      'active': active,
      'sport_id': sportId,
      'position_id': positionId,
      'type_id': typeId,
    }).then((value) {
      getPT = GetPerformanceTest.fromJson(value.data);
      emit(GetPTSuccess());
    }).catchError((er) {
      emit(GetPTError());
    });
  }

  AddPTest? addPTest;
  void addPtest({
    int? positionId,
    int? sportId,
    int? typeId,
    String? startAt,
    String? dateFrom,
    String? dateTo,
    int? ageTo,
    int? ageFrom,
    int? maxUser,
  }) {
    emit(AddPTLoading());
    DioHelper.postData(path: kBaseUrl + '/performanceTests', token: uid, data: {
      'position_id': positionId,
      'start_at': startAt,
      'sport_id': sportId,
      'type_id': typeId,
      'date_to': dateTo,
      'date_from': dateFrom,
      'age_from': ageFrom,
      'age_to': ageTo,
      'max_user': maxUser,
    }).then((value) {
      addPTest = AddPTest.fromJson(value.data);
      getPtest();
      emit(AddPTSuccess());
    }).catchError((er) {
      emit(AddPTError());
    });
  }

  EditPTest? editPTest;
  void editPT({
    int? positionId,
    int? id,
    int? sportId,
    int? typeId,
    int? maxUser,
  }) {
    emit(EditPTLoading());
    DioHelper.patchData(
        path: kBaseUrl + '/performanceTests/$id',
        token: uid,
        data: {
          'position_id': positionId,
          'sport_id': sportId,
          'type_id': typeId,
          'max_user': maxUser,
        }).then((value) {
      editPTest = EditPTest.fromJson(value.data);
      getPtest();
      emit(EditPTSuccess());
    }).catchError((er) {
      emit(EditPTError());
    });
  }

  DeletePt? deletePt;
  void deletePTest({
    int? id,
  }) {
    emit(DeletePTLoading());
    DioHelper.deleteData(
        path: kBaseUrl + '/performanceTests/$id',
        token: uid,
        ).then((value) {
      deletePt = DeletePt.fromJson(value.data);
      getPtest();
      emit(DeletePTSuccess());
    }).catchError((er) {
      emit(DeletePTError());
    });
  }


  

  ////// video_trimmer: ^1.1.3////////

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
