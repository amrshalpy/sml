// ignore_for_file: dead_code
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/player/details/widgets/city.dart';
import 'package:sportive/module/player/player_login/widgets/country.dart';
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
  var startingDataController = TextEditingController();
  var endingDataController = TextEditingController();
  var leagueController = TextEditingController();
  var positionController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var socialController = TextEditingController();
  String countryValue = '';
  String? dropdownvalue;

  String stateValue = "";
  String cityValue = "";
  String address = "";
  String dateFormat = '';
  DateTime? dateTime;
  DateTime? startingDate;
  DateTime? endingDate;
  String result = '';
  DateTime currentDate = DateTime.now();
  String difference = "";
  bool exprience = false;
  bool isExprience = false;
  bool isNationality = false;
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
      // wieghtController.text =
      //     cubit.getPlayerProfileData!.data!.player!.weight.toString();
      // hieghtController.text =
      //     cubit.getPlayerProfileData!.data!.player!.height.toString();
      // runningController.text =
      //     cubit.getPlayerProfileData!.data!.player!.runningTime.toString();
      // verticalJumpController.text = cubit
      //     .getPlayerProfileData!.data!.player!.verticalJumpingDistance
      //     .toString();
      // longJumpingController.text = cubit
      //     .getPlayerProfileData!.data!.player!.longJumpingDistance
      //     .toString();
      // leftingWeightsController.text = cubit
      //     .getPlayerProfileData!.data!.player!.liftingArmsWeights
      //     .toString();
      // legWeightsController.text = cubit
      //     .getPlayerProfileData!.data!.player!.liftingLegWeights
      //     .toString();
      // clubNameController.text =
      //     cubit.getPlayerProfileData!.data!.player!.club.toString();
      return  Stack(
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
                                        SelectState(
                                          dropdownColor: Colors.grey.shade700,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                          ),
                                          onCountryChanged: (value) {
                                            setState(() {
                                              countryValue = value;
                                            });
                                          },
                                          onStateChanged: (value) {
                                            setState(() {
                                              stateValue = value;
                                            });
                                          },
                                          onCityChanged: (value) {
                                            setState(() {
                                              cityValue = value;
                                            });
                                          },
                                        ),

                                        InkWell(
                                          onTap: () {
                                            // cubit.changeIsNAtionality();
                                          },
                                          child: Container(
                                              height: 40.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0xff40768C),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 12.h, left: 10.w),
                                                child: defaultText(
                                                  txt: 'Nationality',
                                                  color: hintColor,
                                                  fontSize: 15.sp,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),

                                        // InkWell(
                                        //   onTap: () {
                                        //     cubit.changeIsCity();
                                        //   },
                                        //   child: Container(
                                        //       height: 40.h,
                                        //       width: double.infinity,
                                        //       decoration: BoxDecoration(
                                        //         color: Color(0xff40768C),
                                        //         borderRadius:
                                        //             BorderRadius.circular(10.r),
                                        //       ),
                                        //       child: Padding(
                                        //         padding: EdgeInsets.only(
                                        //             top: 12.h, left: 10.w),
                                        //         child: defaultText(
                                        //           txt: 'City',
                                        //           color: hintColor,
                                        //           fontSize: 15.sp,
                                        //         ),
                                        //       )),
                                        // ),
                                        // SizedBox(
                                        //   height: 4.h,
                                        // ),

                                        // InkWell(
                                        //   onTap: () {
                                        //     cubit.changeIsCity();
                                        //   },
                                        //   child: Container(
                                        //       height: 40.h,
                                        //       width: double.infinity,
                                        //       decoration: BoxDecoration(
                                        //         color: Color(0xff40768C),
                                        //         borderRadius:
                                        //             BorderRadius.circular(
                                        //                 10.r),
                                        //       ),
                                        //       child: Padding(
                                        //         padding: EdgeInsets.only(
                                        //             top: 12.h, left: 10.w),
                                        //         child: defaultText(
                                        //           txt: 'State',
                                        //           color: hintColor,
                                        //           fontSize: 15.sp,
                                        //         ),
                                        //       )),
                                        // ),

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
                                                          defaultText(
                                                            txt: 
                                                                 "Birth day"
                                                               ,
                                                            color: hintColor,
                                                            fontSize: 16.sp,
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
                                                  child:
                                                      DropdownButtonFormField(
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
                                                                  borderRadius: BorderRadius
                                                                      .circular(10
                                                                          .r))),
                                                          items: PlayerCubit
                                                                  .get(context)
                                                              .gender
                                                              .map<
                                                                      DropdownMenuItem<
                                                                          String>>(
                                                                  (String val) =>
                                                                      DropdownMenuItem(
                                                                        child: Text(
                                                                            val),
                                                                        value:
                                                                            val,
                                                                      ))
                                                              .toList(),
                                                          value:
                                                              PlayerCubit.get(
                                                                      context)
                                                                  .ganderVal,
                                                          onChanged: (val) {
                                                            PlayerCubit.get(
                                                                    context)
                                                                .onChangedGender(
                                                                    val);
                                                          }),
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
                                                  hint: 
                                                       'height'
                                                      
                                                         ,
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
                                                  hint: 
                                                       'weight'
                                                     
                                                       ,
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
                                                  pageController.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.easeInOut);
                                                }))
                                      ]),
                                  if (cubit.isNationality == true)
                                    country(context),
                                  if (cubit.isCity == true) city(context),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                        child: DropdownButtonFormField(
                                            dropdownColor: contactColor,
                                            style: TextStyle(
                                                color: hintColor,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.normal),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            items: PlayerCubit.get(context)
                                                .direction
                                                .map<DropdownMenuItem<String>>(
                                                    (String val) =>
                                                        DropdownMenuItem(
                                                          child: Text(val),
                                                          value: val,
                                                        ))
                                                .toList(),
                                            value:
                                                PlayerCubit.get(context).right,
                                            onChanged: (val) {
                                              PlayerCubit.get(context)
                                                  .onChangedDirection(val);
                                            }),
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
                                        hint: 'Running time'
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

                                        hint: 
                                             'Vertical Jumping distance'
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

                                        hint: 
                                             'Long Jumping'
                                          ,
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

                                        hint: 
                                             'Lefting Weights'
                                            ,
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

                                        hint: 
                                             'Leg weights'
                                           ,
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
                                              print(dateTime.toString());
                                              // if (cubit.imageProfile != null) {
                                              //   cubit.storageImageInApi(
                                              //     dateOfBirth: dateTime
                                              //         .toString()
                                              //         .replaceAll(
                                              //             '00:00:00.000', ' '),
                                              //     gender: cubit.ganderVal,
                                              //     limbsDirection: cubit.right,
                                              //     height: int.parse(
                                              //         hieghtController.text),
                                              //     positionId: cubit.positionId,
                                              //     sportId: cubit.sportsId,
                                              //     nationality: cubit.nation,
                                              //     liftingArmsWeights: int.parse(
                                              //         leftingWeightsController
                                              //             .text),
                                              //     liftingLegWieghts: int.parse(
                                              //         leftingWeightsController
                                              //             .text),
                                              //     // livingCountry: countryValue,
                                              //     runningTime: int.parse(
                                              //         runningController.text),
                                              //     longJumpingDistance:
                                              //         int.parse(
                                              //             longJumpingController
                                              //                 .text),
                                              //     weight: int.parse(
                                              //         wieghtController.text),
                                              //     verticalJumpingDistance:
                                              //         int.parse(
                                              //             verticalJumpController
                                              //                 .text),
                                              //   );
                                              // } else {
                                              //   cubit.editProfileData(
                                              //     dateOfBirth: dateTime
                                              //         .toString()
                                              //         .replaceAll(
                                              //             '00:00:00.000', ' '),
                                              //     gender: cubit.ganderVal,
                                              //     limbsDirection: cubit.right,
                                              //     height: int.parse(
                                              //         hieghtController.text),
                                              //     positionId: cubit.positionId,
                                              //     sportId: cubit.sportsId,
                                              //     nationality: cubit.nation,
                                              //     liftingArmsWeights: int.parse(
                                              //         leftingWeightsController
                                              //             .text),
                                              //     liftingLegWieghts: int.parse(
                                              //         leftingWeightsController
                                              //             .text),
                                              //     // livingCountry: countryValue,
                                              //     runningTime: int.parse(
                                              //         runningController.text),
                                              //     longJumpingDistance:
                                              //         int.parse(
                                              //             longJumpingController
                                              //                 .text),
                                              //     weight: int.parse(
                                              //         wieghtController.text),
                                              //     verticalJumpingDistance:
                                              //         int.parse(
                                              //             verticalJumpController
                                              //                 .text),
                                              //   );
                                              // }
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
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            expriance(),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 15.w, left: 13.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .topEnd,
                                                    child: defaultText(
                                                        txt: 'Total time',
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .yellowAccent),
                                                  ),
                                                  SizedBox(
                                                    height: 6.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'images/club.png',
                                                        height: 30.h,
                                                        width: 30.w,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Expanded(
                                                        child: buildTextFormField(
                                                            color:
                                                                Color
                                                                    .fromARGB(
                                                                        255,
                                                                        199,
                                                                        198,
                                                                        198),
                                                            hint: 'Club name',
                                                            controller:
                                                                clubNameController,
                                                            type: TextInputType
                                                                .name),
                                                      ),
                                                    ],
                                                  ),
                                                  // defaultText(
                                                  //     txt: 'Starting date',
                                                  //     fontSize: 20,
                                                  //     fontWeight: FontWeight.bold,
                                                  //     color: Colors.white),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'images/surface1 (1).png',
                                                        height: 30.h,
                                                        width: 30.w,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () {
                                                            DatePicker.showDatePicker(
                                                                context,
                                                                theme: DatePickerTheme(
                                                                    backgroundColor:
                                                                        greyColor),
                                                                showTitleActions:
                                                                    true,
                                                                currentTime:
                                                                    currentDate,
                                                                minTime:
                                                                    DateTime(
                                                                        1950,
                                                                        1,
                                                                        1),
                                                                onConfirm:
                                                                    (date) {
                                                              setState(() {
                                                                startingDate =
                                                                    date;
                                                              });
                                                              print(difference);
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                  height: 40.h,
                                                                  width: double
                                                                      .infinity
                                                                      .w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.r),
                                                                    color:
                                                                        greyColor,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom: 15
                                                                            .h,
                                                                        right:
                                                                            8.w,
                                                                        left:
                                                                            8.w,
                                                                        top: 5
                                                                            .h),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 6.h, left: 35.w),
                                                                            child:
                                                                                defaultText(
                                                                              txt: startingDate == null ? "Starting date" : startingDate.toString().toString().substring(0, 10),
                                                                              color: Color.fromARGB(255, 99, 98, 98),

                                                                              fontSize: 14.sp,
                                                                              // fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.keyboard_arrow_down,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                25.h,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )),
                                                              // if (difference != '')
                                                              //   Padding(
                                                              //     padding: EdgeInsets.only(
                                                              //         left: 35.w),
                                                              //     child: Row(
                                                              //       mainAxisAlignment:
                                                              //           MainAxisAlignment
                                                              //               .center,
                                                              //       children: [
                                                              //         defaultText(
                                                              //             txt: 'Starting date ',
                                                              //             color: Colors
                                                              //                 .orangeAccent,
                                                              //             fontSize: 20,
                                                              //             fontWeight:
                                                              //                 FontWeight.bold),
                                                              //         SizedBox(
                                                              //           width: 10.w,
                                                              //         ),
                                                              //         // defaultText(
                                                              //         //     txt: difference +
                                                              //         //         ' years',
                                                              //         //     color: Colors.white,
                                                              //         //     fontSize: 20.sp,
                                                              //         //     fontWeight:
                                                              //         //         FontWeight.bold)

                                                              //       ],
                                                              //     ),

                                                              // )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // defaultText(
                                                  //     txt: 'Ending date',
                                                  //     fontSize: 20,
                                                  //     fontWeight: FontWeight.bold,
                                                  //     color: Colors.white),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'images/surface1 (1).png',
                                                        height: 30.h,
                                                        width: 30.w,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () {
                                                            DatePicker.showDatePicker(
                                                                context,
                                                                theme: DatePickerTheme(
                                                                    backgroundColor:
                                                                        greyColor),
                                                                showTitleActions:
                                                                    true,
                                                                currentTime:
                                                                    currentDate,
                                                                minTime:
                                                                    DateTime(
                                                                        1950,
                                                                        1,
                                                                        1),
                                                                onConfirm:
                                                                    (date) {
                                                              setState(() {
                                                                endingDate =
                                                                    date;

                                                                // difference =
                                                                //     "${DateTime.now().year - dateTime!.year}";
                                                              });
                                                              print(difference);
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                  height: 40.h,
                                                                  width: double
                                                                      .infinity
                                                                      .w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.r),
                                                                    color:
                                                                        greyColor,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom: 15
                                                                            .h,
                                                                        right:
                                                                            8.w,
                                                                        left:
                                                                            8.w,
                                                                        top: 5
                                                                            .h),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 6.h, left: 35.w),
                                                                            child:
                                                                                defaultText(
                                                                              txt: endingDate == null ? "Ending date" : endingDate.toString().substring(0, 10),
                                                                              color: Color.fromARGB(255, 99, 98, 98),

                                                                              fontSize: 14.sp,
                                                                              // fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.keyboard_arrow_down,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                25.h,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // defaultText(
                                                  //     txt: 'League type',
                                                  //     fontSize: 20,
                                                  //     fontWeight: FontWeight.bold,
                                                  //     color: Colors.white),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'images/surface1 (3).png',
                                                        height: 30.h,
                                                        width: 30.w,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Expanded(
                                                        child: buildTextFormField(
                                                            hint: 'League type',
                                                            color:
                                                                Color
                                                                    .fromARGB(
                                                                        255,
                                                                        199,
                                                                        198,
                                                                        198),
                                                            controller:
                                                                leagueController,
                                                            type: TextInputType
                                                                .text),
                                                      ),
                                                    ],
                                                  ),
                                                  // defaultText(
                                                  //     txt: 'Position',
                                                  //     fontSize: 20,
                                                  //     fontWeight: FontWeight.bold,
                                                  //     color: Colors.white),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'images/position.png',
                                                        height: 30.h,
                                                        width: 30.w,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Expanded(
                                                        child: buildTextFormField(
                                                            hint: 'Position',
                                                            color:
                                                                Color
                                                                    .fromARGB(
                                                                        255,
                                                                        199,
                                                                        198,
                                                                        198),
                                                            controller:
                                                                positionController,
                                                            type: TextInputType
                                                                .name),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        if (isExprience == false)
                                          Positioned(
                                            bottom: 10.h,
                                            child: Column(
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
                                                      isExprience = true;
                                                    });
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      height: 30.h,
                                                      width: 199.w,
                                                      child: Center(
                                                          child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.green,
                                                              size: 30.h,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            defaultText(
                                                                txt:
                                                                    'add exprience card',
                                                                color: Colors
                                                                    .white,
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
                                          ),
                                      ],
                                    ),
                                    if (isExprience == true)
                                      Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              expriance(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.w, left: 15.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topEnd,
                                                      child: defaultText(
                                                          txt: 'Total time',
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellowAccent),
                                                    ),
                                                    SizedBox(
                                                      height: 6.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/club.png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: buildTextFormField(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      199,
                                                                      198,
                                                                      198),
                                                              hint: 'Club name',
                                                              controller:
                                                                  clubNameController,
                                                              type:
                                                                  TextInputType
                                                                      .name),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'Starting date',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/surface1 (1).png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  theme: DatePickerTheme(
                                                                      backgroundColor:
                                                                          greyColor),
                                                                  showTitleActions:
                                                                      true,
                                                                  currentTime:
                                                                      currentDate,
                                                                  minTime:
                                                                      DateTime(
                                                                          1950,
                                                                          1,
                                                                          1),
                                                                  onConfirm:
                                                                      (date) {
                                                                setState(() {
                                                                  // startingDataController.text.
                                                                  startingDate =
                                                                      date;

                                                                  // difference =
                                                                  //     "${DateTime.now().year - dateTime!.year}";
                                                                });
                                                                print(
                                                                    difference);
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        40.h,
                                                                    width: double
                                                                        .infinity
                                                                        .w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.r),
                                                                      color:
                                                                          greyColor,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom: 15
                                                                              .h,
                                                                          right: 8
                                                                              .w,
                                                                          left: 8
                                                                              .w,
                                                                          top: 5
                                                                              .h),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: 6.h, left: 35.w),
                                                                              child: defaultText(
                                                                                txt: startingDate == "" ? "Starting date" : startingDate.toString(),
                                                                                color: Color.fromARGB(255, 99, 98, 98),

                                                                                fontSize: 14.sp,
                                                                                // fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: Colors.white,
                                                                              size: 25.h,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )),
                                                                // if (difference != '')
                                                                //   Padding(
                                                                //     padding: EdgeInsets.only(
                                                                //         left: 35.w),
                                                                //     child: Row(
                                                                //       mainAxisAlignment:
                                                                //           MainAxisAlignment
                                                                //               .center,
                                                                //       children: [
                                                                //         defaultText(
                                                                //             txt: 'Starting date ',
                                                                //             color: Colors
                                                                //                 .orangeAccent,
                                                                //             fontSize: 20,
                                                                //             fontWeight:
                                                                //                 FontWeight.bold),
                                                                //         SizedBox(
                                                                //           width: 10.w,
                                                                //         ),
                                                                //         // defaultText(
                                                                //         //     txt: difference +
                                                                //         //         ' years',
                                                                //         //     color: Colors.white,
                                                                //         //     fontSize: 20.sp,
                                                                //         //     fontWeight:
                                                                //         //         FontWeight.bold)

                                                                //       ],
                                                                //     ),

                                                                // )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'Ending date',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/surface1 (1).png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  theme: DatePickerTheme(
                                                                      backgroundColor:
                                                                          greyColor),
                                                                  showTitleActions:
                                                                      true,
                                                                  currentTime:
                                                                      currentDate,
                                                                  minTime:
                                                                      DateTime(
                                                                          1950,
                                                                          1,
                                                                          1),
                                                                  onConfirm:
                                                                      (date) {
                                                                setState(() {
                                                                  endingDate =
                                                                      date;

                                                                  // difference =
                                                                  //     "${DateTime.now().year - dateTime!.year}";
                                                                });
                                                                print(
                                                                    difference);
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        40.h,
                                                                    width: double
                                                                        .infinity
                                                                        .w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.r),
                                                                      color:
                                                                          greyColor,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom: 15
                                                                              .h,
                                                                          right: 8
                                                                              .w,
                                                                          left: 8
                                                                              .w,
                                                                          top: 5
                                                                              .h),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: 6.h, left: 35.w),
                                                                              child: defaultText(
                                                                                txt: endingDate == "" ? "Ending date" : endingDate.toString(),
                                                                                color: Color.fromARGB(255, 99, 98, 98),

                                                                                fontSize: 14.sp,
                                                                                // fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: Colors.white,
                                                                              size: 25.h,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'League type',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/surface1 (3).png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: buildTextFormField(
                                                              hint:
                                                                  'League type',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      199,
                                                                      198,
                                                                      198),
                                                              controller:
                                                                  leagueController,
                                                              type:
                                                                  TextInputType
                                                                      .text),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'Position',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/position.png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: buildTextFormField(
                                                              hint: 'Position',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      199,
                                                                      198,
                                                                      198),
                                                              controller:
                                                                  positionController,
                                                              type:
                                                                  TextInputType
                                                                      .name),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          if (exprience == false &&
                                              isExprience == true)
                                            Positioned(
                                              bottom: 10.h,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  defaultText(
                                                    txt:
                                                        'if you want put another exprience ',
                                                    color: greyColor,
                                                    fontSize: 16.sp,
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        exprience = true;
                                                      });
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                        height: 30.h,
                                                        width: 199.w,
                                                        child: Center(
                                                            child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .green,
                                                                size: 30.h,
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              defaultText(
                                                                  txt:
                                                                      'add exprience card',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ],
                                                          ),
                                                        ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    if (exprience == true)
                                      Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              expriance(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.w, left: 15.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topEnd,
                                                      child: defaultText(
                                                          txt: 'Total time',
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellowAccent),
                                                    ),
                                                    SizedBox(
                                                      height: 6.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/club.png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: buildTextFormField(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      199,
                                                                      198,
                                                                      198),
                                                              hint: 'Club name',
                                                              controller:
                                                                  clubNameController,
                                                              type:
                                                                  TextInputType
                                                                      .name),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'Starting date',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/surface1 (1).png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  theme: DatePickerTheme(
                                                                      backgroundColor:
                                                                          greyColor),
                                                                  showTitleActions:
                                                                      true,
                                                                  currentTime:
                                                                      currentDate,
                                                                  minTime:
                                                                      DateTime(
                                                                          1950,
                                                                          1,
                                                                          1),
                                                                  onConfirm:
                                                                      (date) {
                                                                setState(() {
                                                                  startingDate =
                                                                      date;

                                                                  // difference =
                                                                  //     "${DateTime.now().year - dateTime!.year}";
                                                                });
                                                                print(
                                                                    difference);
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        40.h,
                                                                    width: double
                                                                        .infinity
                                                                        .w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.r),
                                                                      color:
                                                                          greyColor,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom: 15
                                                                              .h,
                                                                          right: 8
                                                                              .w,
                                                                          left: 8
                                                                              .w,
                                                                          top: 5
                                                                              .h),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: 6.h, left: 35.w),
                                                                              child: defaultText(
                                                                                txt: startingDate == "" ? "Starting date" : startingDate.toString(),
                                                                                color: Color.fromARGB(255, 99, 98, 98),

                                                                                fontSize: 14.sp,
                                                                                // fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: Colors.white,
                                                                              size: 25.h,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )),
                                                                // if (difference != '')
                                                                //   Padding(
                                                                //     padding: EdgeInsets.only(
                                                                //         left: 35.w),
                                                                //     child: Row(
                                                                //       mainAxisAlignment:
                                                                //           MainAxisAlignment
                                                                //               .center,
                                                                //       children: [
                                                                //         defaultText(
                                                                //             txt: 'Starting date ',
                                                                //             color: Colors
                                                                //                 .orangeAccent,
                                                                //             fontSize: 20,
                                                                //             fontWeight:
                                                                //                 FontWeight.bold),
                                                                //         SizedBox(
                                                                //           width: 10.w,
                                                                //         ),
                                                                //         // defaultText(
                                                                //         //     txt: difference +
                                                                //         //         ' years',
                                                                //         //     color: Colors.white,
                                                                //         //     fontSize: 20.sp,
                                                                //         //     fontWeight:
                                                                //         //         FontWeight.bold)

                                                                //       ],
                                                                //     ),

                                                                // )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'Ending date',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/surface1 (1).png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  theme: DatePickerTheme(
                                                                      backgroundColor:
                                                                          greyColor),
                                                                  showTitleActions:
                                                                      true,
                                                                  currentTime:
                                                                      currentDate,
                                                                  minTime:
                                                                      DateTime(
                                                                          1950,
                                                                          1,
                                                                          1),
                                                                  onConfirm:
                                                                      (date) {
                                                                setState(() {
                                                                  endingDate =
                                                                      date;

                                                                  // difference =
                                                                  //     "${DateTime.now().year - dateTime!.year}";
                                                                });
                                                                print(
                                                                    difference);
                                                              });
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        40.h,
                                                                    width: double
                                                                        .infinity
                                                                        .w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.r),
                                                                      color:
                                                                          greyColor,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom: 15
                                                                              .h,
                                                                          right: 8
                                                                              .w,
                                                                          left: 8
                                                                              .w,
                                                                          top: 5
                                                                              .h),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: 6.h, left: 35.w),
                                                                              child: defaultText(
                                                                                txt: endingDate == "" ? "Ending date" : endingDate.toString(),
                                                                                color: Color.fromARGB(255, 99, 98, 98),

                                                                                fontSize: 14.sp,
                                                                                // fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: Colors.white,
                                                                              size: 25.h,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'League type',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/surface1 (3).png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: buildTextFormField(
                                                              hint:
                                                                  'League type',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      199,
                                                                      198,
                                                                      198),
                                                              controller:
                                                                  leagueController,
                                                              type:
                                                                  TextInputType
                                                                      .text),
                                                        ),
                                                      ],
                                                    ),
                                                    // defaultText(
                                                    //     txt: 'Position',
                                                    //     fontSize: 20,
                                                    //     fontWeight: FontWeight.bold,
                                                    //     color: Colors.white),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'images/position.png',
                                                          height: 30.h,
                                                          width: 30.w,
                                                        ),
                                                        SizedBox(
                                                          width: 6.w,
                                                        ),
                                                        Expanded(
                                                          child: buildTextFormField(
                                                              hint: 'Position',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      199,
                                                                      198,
                                                                      198),
                                                              controller:
                                                                  positionController,
                                                              type:
                                                                  TextInputType
                                                                      .name),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          if (isExprience == true &&
                                              exprience == false)
                                            Positioned(
                                              bottom: 10.h,
                                              child: Column(
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
                                                        isExprience = true;
                                                      });
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                        height: 30.h,
                                                        width: 199.w,
                                                        child: Center(
                                                            child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .green,
                                                                size: 30.h,
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              defaultText(
                                                                  txt:
                                                                      'add exprience card',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ],
                                                          ),
                                                        ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),

                                    Align(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      child: state is AddExprienceLoading
                                          ? CupertinoActivityIndicator()
                                          : greenButton(
                                              txt: 'Save',
                                              onPress: () {
                                                print(
                                                  startingDate.toString(),
                                                );
                                                print(
                                                  endingDate
                                                      .toString()
                                                      .replaceAll(
                                                          '00:00:00.000', ' '),
                                                );
                                                print(clubNameController.text);
                                                // cubit.addExprience(
                                                //   clubName:
                                                //       clubNameController.text,
                                                //   endingDate: endingDate
                                                //       .toString()
                                                //       .replaceAll(
                                                //           '00:00:00.000', ' '),
                                                //   startingDate: startingDate
                                                //       .toString()
                                                //       .replaceAll(
                                                //           '00:00:00.000', ' '),
                                                //   leagueType:
                                                //       leagueController.text,
                                                // );
                                            
                                              }),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  defaultText(
                                      txt: 'Contacts',
                                      color: Colors.yellowAccent,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(
                                            'images/Path 382.png',
                                            height: 150.h,
                                            width: double.infinity.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 160.w, top: 15.h),
                                            child: Image.asset(
                                                'images/sportıve ıcon.png'),
                                          ),
                                        ],
                                      ),
                                      contactContainer(
                                          txt: 'Mobile number',
                                          headerText: 'request',
                                          icon: Icons.phone_callback_rounded,
                                          widget: Column(
                                            children: [
                                              Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 80.w,
                                                    child: CountryCodePicker(
                                                      onChanged:
                                                          onCountryChange,
                                                      initialSelection: 'IT',
                                                      favorite: ['+39', 'FR'],
                                                      showCountryOnly: false,
                                                      showOnlyCountryWhenClosed:
                                                          false,
                                                      alignLeft: false,
                                                    ),
                                                    // country(context),
                                                  ),
                                                  Expanded(
                                                    // flex: 3,
                                                    child: buildTextFormField(
                                                      color: greyColor,

                                                      controller:
                                                          phoneController,
                                                      hint: '01267889997',
                                                      // label: '0126577765',
                                                      type: TextInputType.phone,
                                                      validate: (String? val) {
                                                        if (val!.isEmpty) {
                                                          return 'please enter your phone';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              Container(
                                                width: 120.w,
                                                child: mainButton(
                                                    txt: 'request',
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    ontap: () {
                                                      // cubit.contactInfo(
                                                      //     contentType: 'phone',
                                                      //     contentvalue:
                                                      //         phoneController
                                                      //             .text,
                                                      //     privacy: 'private');
                                                    
                                                    }),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 7,
                                  // ),
                                  Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(
                                            'images/Path 382.png',
                                            height: 150.h,
                                            width: double.infinity.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 160.w, top: 15.h),
                                            child: Image.asset(
                                                'images/sportıve ıcon.png'),
                                          ),
                                        ],
                                      ),
                                      contactContainer(
                                          txt: 'Social media',
                                          headerText: 'request',
                                          color: Colors.red,
                                          icon: Icons.mark_email_read,
                                          widget: Column(
                                            children: [
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        color: Colors.white30,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/12.png'),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.r)),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Expanded(
                                                    child: buildTextFormField(
                                                      color: greyColor,
                                                      controller:
                                                          socialController,
                                                      hint: 'http//',
                                                      // label: '0126577765',
                                                      type: TextInputType
                                                          .emailAddress,
                                                      validate: (String? val) {
                                                        if (val!.isEmpty) {
                                                          return 'please enter your Social address';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Container(
                                                width: 120.w,
                                                child: mainButton(
                                                    colorButton: Colors.red,
                                                    txt: 'request',
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    ontap: () {
                                                      // cubit.contactInfo(
                                                      //     contentType: 'email',
                                                      //     contentvalue:
                                                      //         emailController
                                                      //             .text,
                                                      //     privacy: 'public');
                                                    }),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 2,
                                  // ),
                                  Align(
                                    alignment: AlignmentDirectional.center,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            ),
                                          ),
                                          height: 30.h,
                                          width: 140.w,
                                          child: Center(
                                              child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
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
                                                    color: Colors.white,
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ],
                                            ),
                                          ))),
                                    ),
                                  ),
                                  defaultText(
                                      txt: 'My Agent',
                                      color: Colors.yellowAccent,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),

                                  Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(
                                            'images/Path 382.png',
                                            height: 150.h,
                                            width: double.infinity.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 160.w, top: 15.h),
                                            child: Image.asset(
                                                'images/sportıve ıcon.png'),
                                          ),
                                        ],
                                      ),
                                      contactContainer(
                                          txt: 'Email',
                                          headerText: 'request',
                                          icon: Icons.email,
                                          color: Colors.red,
                                          widget: Column(
                                            children: [
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        color: Colors.white30,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/CompositeLayer (3).png'),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.r)),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Expanded(
                                                    child: buildTextFormField(
                                                      color: greyColor,
                                                      controller:
                                                          emailController,
                                                      hint: 'http//',
                                                      // label: '0126577765',
                                                      type: TextInputType
                                                          .emailAddress,
                                                      validate: (String? val) {
                                                        if (val!.isEmpty) {
                                                          return 'please enter your Email';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Container(
                                                width: 120.w,
                                                child: mainButton(
                                                    txt: 'request',
                                                    colorButton: Colors.blue,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    ontap: () {
                                                      // cubit.contactInfo(
                                                      //     contentType:
                                                      //         'social media',
                                                      //     contentvalue:
                                                      //         socialController
                                                      //             .text,
                                                      //     privacy: 'private');
                                                 
                                                    }),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: greenButton(
                                        txt: 'Save', onPress: () {}),
                                  )
                                ]),
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
          ;
    });
  }

  void onCountryChange(CountryCode countryCode) {
    print("New Country selected: " + countryCode.toString());
  }
}

// new Slidable(
//   delegate: new SlidableDrawerDelegate(),
//   actionExtentRatio: 0.25,
//   child: new Container(
//     color: Colors.white,
//     child: new ListTile(
//       leading: new CircleAvatar(
//         backgroundColor: Colors.indigoAccent,
//         child: new Text('$3'),
//         foregroundColor: Colors.white,
//       ),
//       title: new Text('Tile n°$3'),
//       subtitle: new Text('SlidableDrawerDelegate'),
//     ),
//   ),
//   actions: <Widget>[
//     new IconSlideAction(
//       caption: 'Archive',
//       color: Colors.blue,
//       icon: Icons.archive,
//       onTap: () => _showSnackBar('Archive'),
//     ),
//     new IconSlideAction(
//       caption: 'Share',
//       color: Colors.indigo,
//       icon: Icons.share,
//       onTap: () => _showSnackBar('Share'),
//     ),
//   ],
//   secondaryActions: <Widget>[
//     new IconSlideAction(
//       caption: 'More',
//       color: Colors.black45,
//       icon: Icons.more_horiz,
//       onTap: () => _showSnackBar('More'),
//     ),
//     new IconSlideAction(
//       caption: 'Delete',
//       color: Colors.red,
//       icon: Icons.delete,
//       onTap: () => _showSnackBar('Delete'),
//     ),
//   ],
// );
