// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/player/details/widgets/experience.dart';
import 'package:sportive/module/player/details/widgets/get_city.dart';
import 'package:sportive/module/player/details/widgets/get_contact.dart';
import 'package:sportive/module/player/details/widgets/get_country.dart';
import 'package:sportive/module/player/details/widgets/social.dart';
import 'package:sportive/module/player/player_login/widgets/get_country_code.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/module/player/explore/explore.dart';
import 'package:sportive/player-cubit/player_state.dart';

class PlayerDetails extends StatefulWidget {
  PlayerDetails({Key? key}) : super(key: key);

  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  var pageController = PageController();
  var wieghtController = TextEditingController();
  var hieghtController = TextEditingController();
  var runningController = TextEditingController();
  var verticalJumpController = TextEditingController();
  var longJumpingController = TextEditingController();
  var leftingWeightsController = TextEditingController();
  var legWeightsController = TextEditingController();
  var clubNameController = TextEditingController();
  var clubNameController1 = TextEditingController();
  var startingDataController = TextEditingController();
  var endingDataController = TextEditingController();
  var leagueController = TextEditingController();
  var leagueController1 = TextEditingController();
  var positionController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var socialController = TextEditingController();
  String countryValue = '';
  String? dropdownvalue;
  bool isCountry = false;
  // bool isSocial = false;
  bool isCity = false;
  bool isCityVal = false;
  bool isNationality = false;
  String stateValue = "";
  String cityValue = "";
  String address = "";
  String dateFormat = '';
  DateTime? dateTime;
  DateTime? startingDate;
  DateTime? endingDate;
  DateTime? startingDate1;
  DateTime? endingDate1;
  DateTime? startingDate2;
  DateTime? endingDate2;

  String result = '';
  DateTime currentDate = DateTime.now();
  String difference = "";
  bool exprience = false;
  bool isExprience = false;
  List<Widget> experienceList = [
    GetExperience(),
  ];
  List<Widget> contactList = [
    GetContacts(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(listener: (context, state) {
      if (state is GetSportsDataLoading) {
        CircularProgressIndicator(
          color: Colors.grey,
          strokeWidth: 1,
          value: .7,
        );
      }
    }, builder: (context, state) {
      PlayerCubit cubit = PlayerCubit.get(context);

      return cubit.getProfileData != null
          ? Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  height: 500.h,
                  width: double.infinity.w,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    onPageChanged: (index) {},
                    children: [
                      Explore(pageController: pageController),
                      ListView(
                        children: [
                          Container(
                            child: Container(
                              padding: EdgeInsets.only(right: 10.w, left: 10.w),
                              child: Stack(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        defaultText(
                                            txt: 'Personal Data :',
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        defaultText(
                                            txt:
                                                'This data will make the profile more powerful',
                                            color: Colors.grey,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isCountry = true;
                                              isCityVal = true;
                                            });
                                          },
                                          child: Container(
                                            height: 40.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: contactColor,
                                            ),
                                            child: cubit.getProfileData!.data!
                                                        .user!.country!.name ==
                                                    ''
                                                ? Center(
                                                    child: defaultText(
                                                        txt: cubit.countryVal ==
                                                                null
                                                            ? 'country'
                                                            : cubit.countryVal
                                                                .toString(),
                                                        color: hintColor,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.normal))
                                                : Center(
                                                    child: defaultText(
                                                        txt: cubit.countryVal ==
                                                                null
                                                            ? '${cubit.getProfileData!.data!.user!.country!.name}'
                                                            : cubit.countryVal
                                                                .toString(),
                                                        color: hintColor,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                          ),
                                        ),
                                        if (isCityVal == true)
                                          Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isCity = true;
                                                  });
                                                },
                                                child: Container(
                                                  height: 40.h,
                                                  // width: 70.w,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black45),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: contactColor,
                                                  ),
                                                  child: cubit
                                                              .getProfileData!
                                                              .data!
                                                              .user!
                                                              .city!
                                                              .name ==
                                                          ''
                                                      ? Center(
                                                          child: defaultText(
                                                              txt: cubit.cityVal ==
                                                                      null
                                                                  ? 'City'
                                                                  : cubit
                                                                      .cityVal
                                                                      .toString(),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal))
                                                      : Center(
                                                          child: defaultText(
                                                              txt: cubit.cityVal ==
                                                                      null
                                                                  ? '${cubit.getProfileData!.data!.user!.city!.name}'
                                                                  : cubit
                                                                      .cityVal
                                                                      .toString(),
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                ),
                                              )),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isNationality = true;
                                            });
                                          },
                                          child: Container(
                                            height: 40.h,
                                            // width: 70.w,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: contactColor,
                                            ),
                                            child: cubit
                                                        .getProfileData!
                                                        .data!
                                                        .user!
                                                        .nationality!
                                                        .name ==
                                                    ""
                                                ? Center(
                                                    child: defaultText(
                                                        txt: cubit.nationVal == null
                                                            ? 'Nationality'
                                                            : cubit.nationVal
                                                                .toString(),
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.normal))
                                                : Center(
                                                    child: defaultText(
                                                        txt: cubit.nationVal ==
                                                                null
                                                            ? '${cubit.getProfileData!.data!.user!.nationality!.name}'
                                                            : cubit.nationVal
                                                                .toString(),
                                                        color: hintColor,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            DatePicker.showDatePicker(context,
                                                theme: DatePickerTheme(
                                                    backgroundColor: greyColor),
                                                showTitleActions: true,
                                                currentTime: currentDate,
                                                minTime: DateTime(1950, 1, 1),
                                                onConfirm: (date) {
                                              setState(() {
                                                dateTime = date;

                                                difference =
                                                    "${DateTime.now().year - dateTime!.year}";
                                              });
                                              print(difference);
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 40.h,
                                                  width: double.infinity.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    color: Color(0xff40768C),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15.h,
                                                        right: 8.w,
                                                        left: 8.w,
                                                        top: 5.h),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          cubit
                                                                      .getProfileData!
                                                                      .data!
                                                                      .user!
                                                                      .birthDate ==
                                                                  ''
                                                              ? defaultText(
                                                                  txt:
                                                                      "Birth day",
                                                                  color:
                                                                      hintColor,
                                                                  fontSize:
                                                                      16.sp,
                                                                  // fontWeight: FontWeight.bold,
                                                                )
                                                              : defaultText(
                                                                  txt:
                                                                      "${cubit.getProfileData!.data!.user!.birthDate}",
                                                                  color:
                                                                      hintColor,
                                                                  fontSize:
                                                                      16.sp,
                                                                  // fontWeight: FontWeight.bold,
                                                                ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: Colors.white,
                                                            size: 25.h,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              if (difference != '')
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 35.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      defaultText(
                                                          txt: 'Your age ',
                                                          color: Colors
                                                              .orangeAccent,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      defaultText(
                                                          txt: difference +
                                                              ' years',
                                                          color: Colors.white,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.bold)
                                                    ],
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        defaultText(
                                            txt: 'Physical Properties :',
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/gender.png',
                                              height: 30.h,
                                              width: 30.w,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 55.h,
                                                decoration: BoxDecoration(
                                                  color: contactColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  // border: Border.all(),
                                                ),
                                                child: Center(
                                                  child: cubit
                                                              .getProfileData!
                                                              .data!
                                                              .user!
                                                              .gender ==
                                                          ''
                                                      ? DropdownButtonFormField(
                                                          dropdownColor:
                                                              contactColor,
                                                          // itemHeight: 40,
                                                          style: TextStyle(
                                                              color: hintColor,
                                                              // backgroundColor: Colors.white,
                                                              fontSize: 17.sp,
                                                              fontWeight: FontWeight
                                                                  .normal),
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(10
                                                                          .r))),
                                                          items: PlayerCubit.get(
                                                                  context)
                                                              .gender
                                                              .map<DropdownMenuItem<String>>(
                                                                  (String val) =>
                                                                      DropdownMenuItem(
                                                                        child: Text(
                                                                            val),
                                                                        value:
                                                                            val,
                                                                      ))
                                                              .toList(),
                                                          value:
                                                              PlayerCubit.get(context)
                                                                  .ganderValue,
                                                          onChanged: (val) {
                                                            PlayerCubit.get(
                                                                    context)
                                                                .onChangedGender(
                                                                    val);
                                                          })
                                                      : defaultText(
                                                          txt:
                                                              '${cubit.getProfileData!.data!.user!.gender}',
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: hintColor,
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        defaultText(
                                            txt: 'height',
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/CompositeLayer2.png',
                                              height: 40.h,
                                              width: 35.w,
                                            ),
                                            SizedBox(width: 10.w),
                                            Expanded(
                                              child: buildTextFormField(
                                                  controller: hieghtController,
                                                  // hint: 'height',
                                                  color: contactColor,
                                                  hint: cubit
                                                              .getProfileData!
                                                              .data!
                                                              .user!
                                                              .height ==
                                                          null
                                                      ? 'height'
                                                      : '${cubit.getProfileData!.data!.user!.birthDate}',
                                                  type: TextInputType.number),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            defaultText(
                                                txt: 'meter',
                                                color: Colors.red,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        defaultText(
                                            txt: 'Weight',
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/surface1.png',
                                              height: 35.h,
                                              width: 30.w,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              child: buildTextFormField(
                                                  color: contactColor,
                                                  controller: wieghtController,
                                                  // hint: 'weight',
                                                  hint: cubit
                                                              .getProfileData!
                                                              .data!
                                                              .user!
                                                              .weight ==
                                                          null
                                                      ? 'weight'
                                                      : '${cubit.getProfileData!.data!.user!.weight}',
                                                  type: TextInputType.number),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            defaultText(
                                                txt: 'Kg',
                                                color: Colors.red,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Align(
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            child: greenButton(
                                                txt: 'Save',
                                                onPress: () {
                                                  cubit.uploadGenralData(
                                                    // dateTime
                                                    //         .toString()
                                                    //         .replaceAll(
                                                    //             '00:00:00.000', ' '),
                                                    birthDate: dateTime
                                                        .toString()
                                                        .replaceAll(
                                                            '00:00:00.000',
                                                            ' '),
                                                    cityId: cubit.city,
                                                    countryId: cubit.country,
                                                    hieght:
                                                        hieghtController.text,
                                                    nationality: cubit.nation,
                                                    gender: cubit.genderVal,
                                                    weight:
                                                        wieghtController.text,
                                                  );
                                                  pageController.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.easeInOut);
                                                }))
                                      ]),
                                  if (isCountry == true)
                                    cubit.countryModel!.data != null
                                        ? InkWell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20.w, top: 80.h),
                                                child: Container(
                                                  height: 300.h,
                                                  width: 300.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: ListView.separated(
                                                    itemBuilder: (context,
                                                            index) =>
                                                        InkWell(
                                                            onTap: () {
                                                              cubit.changeCountr(
                                                                  cubit
                                                                      .countryModel!
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  cubit
                                                                      .countryModel!
                                                                      .data![
                                                                          index]
                                                                      .name);
                                                              print(cubit
                                                                  .country);
                                                              cubit.getCity(
                                                                  id: cubit
                                                                      .countryModel!
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                              print(cubit.city);
                                                              // print('country');
                                                              setState(() {
                                                                isCountry =
                                                                    false;
                                                              });
                                                              // setState(() {
                                                              //   cubit.countryModel!.data![index]
                                                              //       .countryCode = countryCode;
                                                              //   print(countryCode);
                                                              // });
                                                            },
                                                            child: getCountry(cubit
                                                                .countryModel!
                                                                .data![index])),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            SizedBox(
                                                      height: 10,
                                                      child: Divider(
                                                        color: Colors.black,
                                                        thickness: .1,
                                                      ),
                                                    ),
                                                    itemCount:
                                                        PlayerCubit.get(context)
                                                            .countryModel!
                                                            .data!
                                                            .length,
                                                  ),
                                                )),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator()),
                                  if (isCity == true)
                                    cubit.cityModel!.data != null
                                        ? InkWell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20.w, top: 80.h),
                                                child: Container(
                                                  height: 300.h,
                                                  width: 300.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: ListView.separated(
                                                    itemBuilder: (context,
                                                            index) =>
                                                        InkWell(
                                                            onTap: () {
                                                              cubit.changecity(
                                                                  cubit
                                                                      .cityModel!
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  cubit
                                                                      .cityModel!
                                                                      .data![
                                                                          index]
                                                                      .name);
                                                              print(cubit.city);
                                                              // print('country');
                                                              setState(() {
                                                                isCity = false;
                                                              });
                                                              // setState(() {
                                                              //   cubit.countryModel!.data![index]
                                                              //       .countryCode = countryCode;
                                                              //   print(countryCode);
                                                              // });
                                                            },
                                                            child: getCity(cubit
                                                                .cityModel!
                                                                .data![index])),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            SizedBox(
                                                      height: 10,
                                                      child: Divider(
                                                        color: Colors.black,
                                                        thickness: .1,
                                                      ),
                                                    ),
                                                    itemCount: cubit.cityModel!
                                                        .data!.length,
                                                  ),
                                                )),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator()),
                                  if (isNationality == true)
                                    cubit.countryModel!.data != null
                                        ? InkWell(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20.w, top: 80.h),
                                                child: Container(
                                                  height: 300.h,
                                                  width: 300.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: ListView.separated(
                                                    itemBuilder: (context,
                                                            index) =>
                                                        InkWell(
                                                            onTap: () {
                                                              cubit.changeNation(
                                                                  cubit
                                                                      .countryModel!
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  cubit
                                                                      .countryModel!
                                                                      .data![
                                                                          index]
                                                                      .name);
                                                              print(
                                                                  cubit.nation);
                                                              // print('country');
                                                              setState(() {
                                                                isNationality =
                                                                    false;
                                                              });
                                                              // setState(() {
                                                              //   cubit.countryModel!.data![index]
                                                              //       .countryCode = countryCode;
                                                              //   print(countryCode);
                                                              // });
                                                            },
                                                            child: getCountry(cubit
                                                                .countryModel!
                                                                .data![index])),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            SizedBox(
                                                      height: 10,
                                                      child: Divider(
                                                        color: Colors.black,
                                                        thickness: .1,
                                                      ),
                                                    ),
                                                    itemCount:
                                                        PlayerCubit.get(context)
                                                            .countryModel!
                                                            .data!
                                                            .length,
                                                  ),
                                                )),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      cubit.getProfileData!.data!.user!.performance!=null?
                      ListView(
                        children: [
                          Container(
                              child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.h, right: 15.w, left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(
                                    txt: 'Right or left',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/roght or left p.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 58.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xff40768C),
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: cubit.getProfileData!.data!.user!
                                                    .performance!.right ==
                                                ''
                                            ? DropdownButtonFormField(
                                                dropdownColor: contactColor,
                                                style: TextStyle(
                                                    color: hintColor,
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                                items: PlayerCubit.get(context)
                                                    .direction
                                                    .map<DropdownMenuItem<String>>(
                                                        (String val) =>
                                                            DropdownMenuItem(
                                                              child: Text(val),
                                                              value: val,
                                                            ))
                                                    .toList(),
                                                value: PlayerCubit.get(context)
                                                    .right,
                                                onChanged: (val) {
                                                  PlayerCubit.get(context)
                                                      .onChangedDirection(val);
                                                })
                                            : Center(child: defaultText(
                                                txt:
                                                    '${cubit.getProfileData!.data!.user!.performance!.right}',
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                                color: hintColor,
                                              ),)
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Performance :',
                                    color: Colors.yellowAccent,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 6.h,
                                ),
                                defaultText(
                                    txt: 'Running time',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/Group 23.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        hint: cubit.getProfileData!.data!.user!
                                                    .performance!.runTime ==
                                                null
                                            ? 'Running time'
                                            : '${cubit.getProfileData!.data!.user!.performance!.runTime}',
                                        color: contactColor,

                                        // label: 'Running time',
                                        controller: runningController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'sec/100 m',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                defaultText(
                                    txt: 'Vertical Jumping distance',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/verical jumb.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint: cubit.getProfileData!.data!.user!.performance!.verticalJumpDistance==null?'Vertical Jumping distance':'${cubit.getProfileData!.data!.user!.performance!.verticalJumpDistance}'
                                        // ignore: dead_code
                                        ,
                                        // label: 'Vertical Jumping distance',
                                        controller: verticalJumpController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'meter',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Long Jumping',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/long jumping di.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint:cubit.getProfileData!.data!.user!.performance!.longJumpDistance==null? 'Long Jumping':"${cubit.getProfileData!.data!.user!.performance!.longJumpDistance}",
                                        // label: 'Long Jumping',
                                        controller: longJumpingController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'meter',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Lefting Weights',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/leftting weight.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint:cubit.getProfileData!.data!.user!.performance!.liftingWeight==null? 'Lefting Weights':"${cubit.getProfileData!.data!.user!.performance!.liftingWeight}",
                                        // label: 'Lefting Weights',
                                        controller: leftingWeightsController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.h,
                                    ),
                                    defaultText(
                                        txt: 'Kg',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Leg Weights ',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/leg weight.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint: cubit.getProfileData!.data!.user!.performance!.liftingWeightLeg==null? 'Leg weights':"${cubit.getProfileData!.data!.user!.performance!.liftingWeightLeg}",
                                        // label: 'Leg weights',
                                        controller: legWeightsController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'Kg',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: state is StorageImagePlayerLoading
                                        ? CupertinoActivityIndicator()
                                        : greenButton(
                                            txt: 'Save',
                                            onPress: () {
                                              cubit.uploadPerformanceData(
                                                Left: cubit.directionVal,
                                                liftingweighthand:
                                                    wieghtController.text,
                                                liftingweightleg:
                                                    legWeightsController.text,
                                                longJumpdistance:
                                                    longJumpingController.text,
                                                runTime: runningController.text,
                                                verticalJumpdistance:
                                                    verticalJumpController.text,
                                              );
                                              print(dateTime.toString());
                                            }))
                              ],
                            ),
                          )),
                        ],
                      ):    ListView(
                        children: [
                          Container(
                              child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.h, right: 15.w, left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(
                                    txt: 'Right or left',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/roght or left p.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 58.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xff40768C),
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: DropdownButtonFormField(
                                                dropdownColor: contactColor,
                                                style: TextStyle(
                                                    color: hintColor,
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                                items: PlayerCubit.get(context)
                                                    .direction
                                                    .map<DropdownMenuItem<String>>(
                                                        (String val) =>
                                                            DropdownMenuItem(
                                                              child: Text(val),
                                                              value: val,
                                                            ))
                                                    .toList(),
                                                value: PlayerCubit.get(context)
                                                    .right,
                                                onChanged: (val) {
                                                  PlayerCubit.get(context)
                                                      .onChangedDirection(val);
                                                })
                                            
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Performance :',
                                    color: Colors.yellowAccent,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 6.h,
                                ),
                                defaultText(
                                    txt: 'Running time',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/Group 23.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        hint:  'Running time'
                                           ,
                                        color: contactColor,

                                        // label: 'Running time',
                                        controller: runningController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'sec/100 m',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                defaultText(
                                    txt: 'Vertical Jumping distance',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/verical jumb.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint:'Vertical Jumping distance'
                                        // ignore: dead_code
                                        ,
                                        // label: 'Vertical Jumping distance',
                                        controller: verticalJumpController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'meter',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Long Jumping',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/long jumping di.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint:'Long Jumping',
                                        // label: 'Long Jumping',
                                        controller: longJumpingController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'meter',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Lefting Weights',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/leftting weight.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint: 'Lefting Weights',
                                        // label: 'Lefting Weights',
                                        controller: leftingWeightsController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.h,
                                    ),
                                    defaultText(
                                        txt: 'Kg',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                defaultText(
                                    txt: 'Leg Weights ',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/leg weight.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: buildTextFormField(
                                        color: contactColor,

                                        hint: 'Leg weights',
                                        // label: 'Leg weights',
                                        controller: legWeightsController,
                                        type: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                        txt: 'Kg',
                                        color: Colors.red,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: state is StorageImagePlayerLoading
                                        ? CupertinoActivityIndicator()
                                        : greenButton(
                                            txt: 'Save',
                                            onPress: () {
                                              cubit.uploadPerformanceData(
                                                Left: cubit.directionVal,
                                                liftingweighthand:
                                                    wieghtController.text,
                                                liftingweightleg:
                                                    legWeightsController.text,
                                                longJumpdistance:
                                                    longJumpingController.text,
                                                runTime: runningController.text,
                                                verticalJumpdistance:
                                                    verticalJumpController.text,
                                              );
                                              print(dateTime.toString());
                                            }))
                              ],
                            ),
                          )),
                        ],
                      ),
                  
                  
                      ListView(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.w, left: 10.w),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    defaultText(
                                      txt: 'Expriance ',
                                      color: Colors.yellowAccent,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // SizedBox(
                                    //   height: 7.h,
                                    // ),
                                    Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        Column(
                                          children: [
                                            ListView.separated(
                                              physics: BouncingScrollPhysics(),
                                              itemBuilder: (context, index) =>
                                                  GetExperience(clubNameController: clubNameController,),
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                height: 10,
                                              ),
                                              itemCount: experienceList.length,
                                              shrinkWrap: true,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            defaultText(
                                              txt:
                                                  'if you want write another exprience ',
                                              color: greyColor,
                                              fontSize: 16.sp,
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  // isExprience = true;
                                                  experienceList
                                                      .add(GetExperience());
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      topLeft:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  height: 30.h,
                                                  width: 219.w,
                                                  child: Center(
                                                      child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          color: Colors.green,
                                                          size: 30.h,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        defaultText(
                                                            txt:
                                                                'add exprience card',
                                                            color: Colors.white,
                                                            fontSize: 17.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ],
                                                    ),
                                                  ))),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Align(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      child: state is AddExprienceLoading
                                          ? CupertinoActivityIndicator()
                                          : InkWell(
                                              onTap: () {
                                                cubit.uploadExprience(
                                                  startDate: cubit.startingDate
                                                      .toString().replaceAll('00:00:00.000', ''),
                                                      
                                                  endDate: cubit.endingDate.
                                                      toString().replaceAll('00:00:00.000', ''),
                                                      
                                                  clubName: 
                                                      clubNameController.text,
                                                  positionId: 2,
                                                  sportId: 1,
                                                  leagueType: 1,
                                                  teamOne: '2',
                                                  teamTwo: 'w',
                                                  teamOneScore: 2,
                                                  teamTwoScore: 3,
                                                  type: 1,
                                                );
                                              },
                                              child: Container(
                                                  height: 30.h,
                                                  width: 80.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.green,
                                                  ),
                                                  child: Center(
                                                    child: defaultText(
                                                      txt: 'Save',
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // cubit.isCountry = false;
                          // cubit.isSocial = false;
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, right: 10.w),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        defaultText(
                                            txt: 'Contacts',
                                            color: Colors.yellowAccent,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  230,
                                              child: ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemBuilder: (context, index) =>
                                                    InkWell(
                                                        onTap: () {
                                                          PlayerCubit.get(
                                                                  context)
                                                              .changeIsCountry();
                                                        },
                                                        child: GetContacts()),
                                                itemCount: contactList.length,
                                                shrinkWrap: true,
                                              ),
                                            ),
                                             SizedBox(
                                              height: 10.h,
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              child: InkWell(
                                                onTap: () {
                                                  contactList
                                                      .add(GetContacts());
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    height: 30.h,
                                                    width: 140.w,
                                                    child: Center(
                                                        child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color: Colors.green,
                                                            // size: 30,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          defaultText(
                                                              txt: 'add Card',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ],
                                                      ),
                                                    ))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.bottomEnd,
                                          child: greenButton(
                                              txt: 'Save', onPress: () {}),
                                        )
                                      ]),
                                ),
                              ),
                              if (cubit.isCountry == true)
                                InkWell(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.w, top: 80.h),
                                      child: Container(
                                        height: 300.h,
                                        width: 300.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: ListView.separated(
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                  onTap: () {
                                                    cubit.changeCountryCodes(
                                                        cubit.countryModel!
                                                            .data![index].id!,
                                                        cubit
                                                            .countryModel!
                                                            .data![index]
                                                            .countryCode
                                                            .toString());
                                                    print(cubit
                                                        .countryModel!
                                                        .data![index]
                                                        .countryCode);
                                                    cubit.changeIsCountry();
                                                  },
                                                  child: getCountryCode(
                                                      PlayerCubit.get(context)
                                                          .countryModel!
                                                          .data![index])),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                            height: 10,
                                            child: Divider(
                                              color: Colors.black,
                                              thickness: .1,
                                            ),
                                          ),
                                          itemCount: PlayerCubit.get(context)
                                              .countryModel!
                                              .data!
                                              .length,
                                        ),
                                      )),
                                ),
                              if (cubit.isSocial == true)
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 230.h, left: 20.w),
                                  child: Container(
                                    height: 140.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black38, width: .7),
                                        color: Colors.white),
                                    child: Column(children: [
                                      Expanded(
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                  onTap: () {
                                                    cubit.getSocial(
                                                        cubit.social[index].id,
                                                        '${cubit.social[index].text}');
                                                    // setState(() {
                                                    //   isSocial = false;
                                                    // });
                                                    cubit.changeIsSocial();
                                                  },
                                                  child: getSocial(
                                                      cubit.social[index])),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(height: 5),
                                          itemCount: cubit.social.length,
                                          physics: BouncingScrollPhysics(),
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 5,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotWidth: 16,
                        dotHeight: 5,
                        activeDotColor: Color.fromARGB(255, 204, 153, 12),
                      ),
                    ),
                  ),
                )
              ],
            )
          : Center(child: CircularProgressIndicator());
    });
  }
}
