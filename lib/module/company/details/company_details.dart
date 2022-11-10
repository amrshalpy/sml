import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/company/details/widgets/get_contacts.dart';
import 'package:sportive/module/company/explore/explore.dart';
import 'package:sportive/module/player/details/widgets/get_city.dart';
import 'package:sportive/module/player/details/widgets/get_country.dart';
import 'package:sportive/module/player/details/widgets/social.dart';
import 'package:sportive/module/player/player_login/widgets/get_country_code.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class CompanyDetails extends StatefulWidget {
  CompanyDetails({Key? key}) : super(key: key);

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  var pageController = PageController();
  var wieghtController = TextEditingController();
  var hieghtController = TextEditingController();
  var certificateController = TextEditingController();
  var verticalJumpController = TextEditingController();
  var longJumpingController = TextEditingController();
  var leftingWeightsController = TextEditingController();
  var legWeightsController = TextEditingController();
  var clubNameController = TextEditingController();
  var startingDataController = TextEditingController();
  var endingDataController = TextEditingController();
  var leagueController = TextEditingController();
  var searchController = TextEditingController();
  var positionController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var socialController = TextEditingController();
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  DateTime? dateTime;
  DateTime currentDate = DateTime.now();
  String difference = "";
  bool isCity = false;
  bool isCityVal = false;
  bool isCountry = false;
  bool isProductType = false;
  bool isNationality = false;
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
                      height: 700.h,
                      width: double.infinity.w,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        onPageChanged: (index) {},
                        children: [
                          Explore(pageController: pageController,),
                          ListView(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isCountry = true;
                                              isCityVal = true;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              defaultText(
                                                txt:
                                                    "Information about your Company :",
                                                color: Colors.white54,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              defaultText(
                                                  txt: 'Country',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Container(
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
                                            ],
                                          ),
                                        ),
                                        if (isCityVal == true)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                defaultText(
                                                    txt: 'City',
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                InkWell(
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
                                              ],
                                            ),
                                          ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt: 'Nationality',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
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
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt: 'Founded date :',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
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
                                                      width: double.infinity,
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
                                                                    .center,
                                                            children: [
                                                              Center(
                                                                child: cubit
                                                                            .getProfileData!
                                                                            .data!
                                                                            .user!
                                                                            .founded ==
                                                                        ''
                                                                    ? defaultText(
                                                                        txt:
                                                                            "Founded date",
                                                                        color:
                                                                            hintColor,
                                                                        fontSize:
                                                                            16.sp,
                                                                        // fontWeight: FontWeight.bold,
                                                                      )
                                                                    : defaultText(
                                                                        txt:
                                                                            "${cubit.getProfileData!.data!.user!.founded}",
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.sp,
                                                                        // fontWeight: FontWeight.bold,
                                                                      ),
                                                              ),
                                                              SizedBox(
                                                                width: 90.w,
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
                                                              txt:
                                                                  'Founded from  ',
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
                                                    ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      defaultText(
                                                          txt: 'Company Type :',
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                      SizedBox(
                                                        height: 4.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isProductType =
                                                                true;
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 40.h,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                                width: .7),
                                                            color: contactColor,
                                                          ),
                                                          child: Center(
                                                            child: cubit
                                                                        .getProfileData!
                                                                        .data!
                                                                        .user!
                                                                        .companyType ==
                                                                    null
                                                                ? defaultText(
                                                                    txt:
                                                                        'company type',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.sp,
                                                                  )
                                                                : defaultText(
                                                                    txt:
                                                                        '${cubit.getProfileData!.data!.user!.companyType}',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.sp,
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isProductType =
                                                                true;
                                                          });
                                                        },
                                                        child: defaultText(
                                                            txt:
                                                                'Products Type :',
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                        height: 4.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 40.h,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                                width: .7),
                                                            color: contactColor,
                                                          ),
                                                          child: Center(
                                                            child: defaultText(
                                                              txt:
                                                                  'Products type',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  greenButton(
                                                      txt: 'Save',
                                                      onPress: () {
                                                        cubit.uploadGenralData(
                                                          companyType: 1,
                                                          founded: dateTime,
                                                          cityId: cubit.city,
                                                          countryId:
                                                              cubit.country,
                                                          nationality:
                                                              cubit.nation,
                                                        );
                                                         pageController.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.easeInOut);
                                                      })
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isProductType == true)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.topCenter,
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                    100,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Colors.orangeAccent,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30.r),
                                                      topRight:
                                                          Radius.circular(30.r),
                                                    )),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(top: 15.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isProductType = false;
                                                          });
                                                        },
                                                        child: FaIcon(
                                                            FontAwesomeIcons
                                                                .arrowLeft)),
                                                    SizedBox(
                                                      width: 50.w,
                                                    ),
                                                    defaultText(
                                                        txt: 'More Product',
                                                        color: Colors.black)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                150,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: contactColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(30.r),
                                                  topRight:
                                                      Radius.circular(30.r),
                                                )),
                                            child: Column(children: [
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                                height: 40.h,
                                                width: 280.w,
                                                child: TextField(
                                                  controller: searchController,
                                                  onChanged: (text) {},
                                                  decoration: InputDecoration(
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: 'Search',
                                                    suffix: Image.asset(
                                                        'images/adv search.png'),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                children: [
                                                  RotatedBox(
                                                    quarterTurns: 3,
                                                    child: Container(
                                                      height: 18.h,
                                                      width: 170.w,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.yellow),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: defaultText(
                                                        txt:
                                                            '  New Main Category ',
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 18.h,
                                                        width: 120.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .yellow),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                        child:Center(child:  defaultText(
                                                          txt: ' New Category ',
                                                          color: Colors.black,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Container(
                                                        height: 18.h,
                                                        width: 190.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .yellow),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                        child: Center(child:
                                                          defaultText(
                                                          txt: ' Add New ',
                                                          color: Colors.black,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        )
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              mainButton(
                                                  txt: 'Done',
                                                  fontSize: 18.sp,
                                                  color: Colors.white,
                                                  colorButton:
                                                      Colors.orangeAccent,
                                                  fontWeight: FontWeight.normal,
                                                  ontap: () {
                                                    cubit.addCategory();
                                                  }),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                        // SizedBox(
                                        //   height: 7.h,
                                        // ),
                                        Stack(
                                            // alignment: Alignment.bottomCenter,
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w, right: 10.w),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        defaultText(
                                                            txt: 'Contacts',
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        Stack(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          children: [
                                                            Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height -
                                                                  200,
                                                              child: ListView
                                                                  .builder(
                                                                itemBuilder: (context,
                                                                        index) =>
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          PlayerCubit.get(context)
                                                                              .changeIsCountry();
                                                                        },
                                                                        child:
                                                                            GetContacts()),
                                                                itemCount:
                                                                    contactList
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .center,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    contactList.add(
                                                                        GetContacts());
                                                                  });
                                                                },
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 30
                                                                              .h),
                                                                  child: Container(
                                                                      decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .black,
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
                                                                        padding:
                                                                            EdgeInsets.only(left: 10.w),
                                                                        child:
                                                                            Row(
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
                                                                                fontWeight: FontWeight.bold),
                                                                          ],
                                                                        ),
                                                                      ))),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .bottomEnd,
                                                              child: greenButton(
                                                                  txt: 'Save',
                                                                  onPress:
                                                                      () {
                                                                         pageController.animateToPage(1,
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.easeInOut);
                                                                      }),
                                                            )
                                                          ],
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              if (cubit.isCountry == true)
                                                InkWell(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20.w,
                                                          top: 80.h),
                                                      child: Container(
                                                        height: 300.h,
                                                        width: 300.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child:
                                                            ListView.separated(
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              InkWell(
                                                                  onTap: () {
                                                                    cubit.changeCountryCodes(
                                                                        cubit
                                                                            .countryModel!
                                                                            .data![
                                                                                index]
                                                                            .id!,
                                                                        cubit
                                                                            .countryModel!
                                                                            .data![index]
                                                                            .countryCode
                                                                            .toString());
                                                                    print(cubit
                                                                        .countryModel!
                                                                        .data![
                                                                            index]
                                                                        .countryCode);
                                                                    cubit
                                                                        .changeIsCountry();
                                                                  },
                                                                  child: getCountryCode(PlayerCubit
                                                                          .get(
                                                                              context)
                                                                      .countryModel!
                                                                      .data![index])),
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                            height: 10,
                                                            child: Divider(
                                                              color:
                                                                  Colors.black,
                                                              thickness: .1,
                                                            ),
                                                          ),
                                                          itemCount:
                                                              PlayerCubit.get(
                                                                      context)
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
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.black38,
                                                            width: .7),
                                                        color: Colors.white),
                                                    child: Column(children: [
                                                      Expanded(
                                                        child:
                                                            ListView.separated(
                                                          shrinkWrap: true,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              InkWell(
                                                                  onTap: () {
                                                                    cubit.getSocial(
                                                                        cubit
                                                                            .social[index]
                                                                            .id,
                                                                        '${cubit.social[index].text}');
                                                                    // setState(() {
                                                                    //   isSocial = false;
                                                                    // });
                                                                    cubit
                                                                        .changeIsSocial();
                                                                  },
                                                                  child: getSocial(
                                                                      cubit.social[
                                                                          index])),
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                          itemCount: cubit
                                                              .social.length,
                                                          physics:
                                                              BouncingScrollPhysics(),
                                                        ),
                                                      )
                                                    ]),
                                                  ),
                                                ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                            ]),
                                      ]),
                                ),
                              )
                            ],
                          ),
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