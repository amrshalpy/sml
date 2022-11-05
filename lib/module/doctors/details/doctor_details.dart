import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/coach/details/widget/get_certificate.dart';
import 'package:sportive/module/company/details/widgets/get_contacts.dart';
import 'package:sportive/module/doctors/explore/explore.dart';
import 'package:sportive/module/player/details/widgets/experience.dart';
import 'package:sportive/module/player/details/widgets/get_city.dart';
import 'package:sportive/module/player/details/widgets/get_country.dart';
import 'package:sportive/module/player/details/widgets/social.dart';
import 'package:sportive/module/player/player_login/widgets/get_country_code.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({Key? key}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
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
  var certificateController = TextEditingController();
  var endingDataController = TextEditingController();
  var leagueController = TextEditingController();
  var leagueController1 = TextEditingController();
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
  DateTime? startingDate1;
  DateTime? endingDate1;
  DateTime? startingDate2;
  DateTime? endingDate2;

  String result = '';
  DateTime currentDate = DateTime.now();
  String difference = "";
  bool exprience = false;
  bool isCityVal = false;
  bool isExprience = false;
  bool isNationality = false;
  bool isCountry = false;
  bool isCity = false;
  List<Widget> certificateList = [
    GetCertificate(),
  ];
  List<Widget> experienceList = [
    GetExperience(),
  ];
  List<Widget> contactList = [
    GetContacts(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return cubit.getProfileData != null
              ? Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      // height: 700.h,
                      // width: double.infinity.w,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        onPageChanged: (index) {},
                        children: [
                          Explore(),
                          ListView(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 10.h, left: 10.h),
                                      // height: MediaQuery.of(context).size.height * .50.h,
                                      child: Column(
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
                                                child: Center(
                                                    child: cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .country!
                                                                .name ==
                                                            ''
                                                        ? defaultText(
                                                            txt: cubit.countryVal ==
                                                                    null
                                                                ? 'country'
                                                                : cubit.countryVal
                                                                    .toString(),
                                                            color: hintColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)
                                                        : defaultText(
                                                            txt: cubit.countryVal ==
                                                                    null
                                                                ? '${cubit.getProfileData!.data!.user!.country!.name}'
                                                                : cubit
                                                                    .countryVal
                                                                    .toString(),
                                                            color: hintColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                              ),
                                            ),
                                            if (isCityVal == true)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
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
                                                          color:
                                                              Colors.black45),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: contactColor,
                                                    ),
                                                    child: Center(
                                                        child: cubit
                                                                    .getProfileData!
                                                                    .data!
                                                                    .user!
                                                                    .city!
                                                                    .name ==
                                                                ''
                                                            ? defaultText(
                                                                txt: cubit.cityVal == null
                                                                    ? 'City'
                                                                    : cubit.cityVal
                                                                        .toString(),
                                                                color:
                                                                    hintColor,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)
                                                            : defaultText(
                                                                txt: cubit.cityVal ==
                                                                        null
                                                                    ? '${cubit.getProfileData!.data!.user!.city!.name}'
                                                                    : cubit
                                                                        .cityVal
                                                                        .toString(),
                                                                color:
                                                                    hintColor,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)),
                                                  ),
                                                ),
                                              ),
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
                                                child: Center(
                                                    child: cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .nationality!
                                                                .name ==
                                                            ''
                                                        ? defaultText(
                                                            txt: cubit.nationVal ==
                                                                    null
                                                                ? 'Nationality'
                                                                : cubit.nationVal
                                                                    .toString(),
                                                            color: hintColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)
                                                        : defaultText(
                                                            txt: cubit.nationVal ==
                                                                    null
                                                                ? '${cubit.getProfileData!.data!.user!.nationality!.name}'
                                                                : cubit
                                                                    .nationVal
                                                                    .toString(),
                                                            color: hintColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                DatePicker.showDatePicker(
                                                    context,
                                                    theme: DatePickerTheme(
                                                        backgroundColor:
                                                            greyColor),
                                                    showTitleActions: true,
                                                    currentTime: currentDate,
                                                    minTime:
                                                        DateTime(1950, 1, 1),
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
                                                            BorderRadius
                                                                .circular(5.r),
                                                        color:
                                                            Color(0xff40768C),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                                color: Colors
                                                                    .white,
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
                                                                  FontWeight
                                                                      .bold),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          defaultText(
                                                              txt: difference +
                                                                  ' years',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)
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
                                                txt: 'Certificates:',
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Column(
                                              children: [
                                                ListView.separated(
                                                  itemBuilder:
                                                      (context, index) =>
                                                          GetCertificate(),
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    height: 10,
                                                  ),
                                                  itemCount:
                                                      certificateList.length,
                                                  shrinkWrap: true,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    certificateList
                                                        .add(GetCertificate());
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
                                                    width: 220.w,
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
                                                                  'add certificate card',
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
                                              height: 10,
                                            ),
                                            Align(
                                                alignment: AlignmentDirectional
                                                    .bottomEnd,
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
                                                        countryId:
                                                            cubit.country,
                                                      
                                                      
                                                        nationality:
                                                            cubit.nation,
                                                      );
                                                      pageController.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve:
                                                              Curves.easeInOut);
                                                    }))
                                          ]),
                                    ),
                                  ),
                                  if (isCountry == true)
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
                                                        cubit.changeCountr(
                                                            cubit
                                                                .countryModel!
                                                                .data![index]
                                                                .id,
                                                            cubit
                                                                .countryModel!
                                                                .data![index]
                                                                .name);
                                                        print(cubit.city);
                                                        // print('country');
                                                        setState(() {
                                                          isCountry = false;
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
                                                  (context, index) => SizedBox(
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
                                    ),
                                  if (isCity == true)
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
                                                        cubit.changecity(
                                                          cubit.cityModel!
                                                              .data![index].id,
                                                          cubit
                                                              .cityModel!
                                                              .data![index]
                                                              .name,
                                                        );
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
                                                  (context, index) => SizedBox(
                                                height: 10,
                                                child: Divider(
                                                  color: Colors.black,
                                                  thickness: .1,
                                                ),
                                              ),
                                              itemCount:
                                                  PlayerCubit.get(context)
                                                      .cityModel!
                                                      .data!
                                                      .length,
                                            ),
                                          )),
                                    ),
                                  if (isNationality == true)
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
                                                        cubit.changeNation(
                                                          cubit.countryModel!
                                                              .data![index].id,
                                                          cubit
                                                              .countryModel!
                                                              .data![index]
                                                              .name,
                                                        );
                                                        print(cubit.nation);
                                                        // print('country');
                                                        setState(() {
                                                          isNationality = false;
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
                                                  (context, index) => SizedBox(
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
                                    ),
                                ],
                              ),
                            ],
                          ),
                          ListView(
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.w, left: 10.w),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  itemBuilder:
                                                      (context, index) =>
                                                          GetExperience(),
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    height: 10,
                                                  ),
                                                  itemCount:
                                                      experienceList.length,
                                                  shrinkWrap: true,
                                                ),
                                              ],
                                            ),
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
                                                      experienceList
                                                          .add(GetExperience());
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
                                                        width: 219.w,
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
                                          alignment:
                                              AlignmentDirectional.bottomEnd,
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
                                                              '00:00:00.000',
                                                              ' '),
                                                    );
                                                    print(clubNameController
                                                        .text);
                                                    cubit.uploadExprience(
                                                      startDate: cubit
                                                          .startingDate
                                                          .toString()
                                                          .substring(0, 10),
                                                      endDate: cubit.endingDate
                                                          .toString()
                                                          .substring(0, 10),
                                                      clubName: '22',
                                                      positionId: 1,
                                                      sportId: 1,
                                                      leagueType: 1,
                                                      teamOne: '2',
                                                      teamTwo: 'w',
                                                      teamOneScore: 2,
                                                      teamTwoScore: 3,
                                                      type: 1,
                                                    );
                                                  }),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              cubit.isCountry = false;
                              cubit.isSocial = false;
                            },
                            child: SingleChildScrollView(
                              child: Stack(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
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
                                            Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      200,
                                                  child: ListView.builder(
                                                    itemBuilder: (context,
                                                            index) =>
                                                        InkWell(
                                                            onTap: () {
                                                              PlayerCubit.get(
                                                                      context)
                                                                  .changeIsCountry();
                                                            },
                                                            child:
                                                                GetContacts()),
                                                    itemCount:
                                                        contactList.length,
                                                    shrinkWrap: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  child: InkWell(
                                                    onTap: () {
                                                      contactList
                                                          .add(GetContacts());
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
                                                        width: 140.w,
                                                        child: Center(
                                                            child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .green,
                                                                // size: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              defaultText(
                                                                  txt:
                                                                      'add Card',
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
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional
                                                  .bottomEnd,
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
                                                            cubit
                                                                .countryModel!
                                                                .data![index]
                                                                .id!,
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
                                                          PlayerCubit.get(
                                                                  context)
                                                              .countryModel!
                                                              .data![index])),
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
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
                                    ),
                                  if (cubit.isSocial == true)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 230.h, left: 20.w),
                                      child: Container(
                                        height: 140.h,
                                        width: 120.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black38,
                                                width: .7),
                                            color: Colors.white),
                                        child: Column(children: [
                                          Expanded(
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                      onTap: () {
                                                        cubit.getSocial(
                                                            cubit.social[index]
                                                                .id,
                                                            '${cubit.social[index].text}');
                                                        // setState(() {
                                                        //   isSocial = false;
                                                        // });
                                                        cubit.changeIsSocial();
                                                      },
                                                      child: getSocial(
                                                          cubit.social[index])),
                                              separatorBuilder:
                                                  (context, index) =>
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