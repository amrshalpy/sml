import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/componant/constants/constants.dart';
import 'package:sportive/cubit/home_state.dart';
import 'package:sportive/model/sport.dart';

//
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

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
    "doctor",
    "company",
    "users"
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

  int sportIndex = 0;
  void getIndex(index) {
    sportIndex = index;
    emit(GetSport());
  }
}
