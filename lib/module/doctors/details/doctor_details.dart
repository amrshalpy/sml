import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/doctors/explore/explore.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({Key? key}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
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

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Explore(),
              ListView(
                children: [
                  Container(
                    child: Container(
                      padding: EdgeInsets.only(right: 10.h, left: 10.h),
                      // height: MediaQuery.of(context).size.height * .50.h,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                fontSize: 17,
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
                                            BorderRadius.circular(5.r),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                txt: "Birth day",
                                                color: hintColor,
                                                fontSize: 16.sp,
                                                // fontWeight: FontWeight.bold,
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
                                  if (difference != '')
                                    Padding(
                                      padding: EdgeInsets.only(left: 35.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          defaultText(
                                              txt: 'Your age ',
                                              color: Colors.orangeAccent,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          defaultText(
                                              txt: difference + ' years',
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)
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
                            Container(
                              height: 177.h,
                              width: 412.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.yellowAccent),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.r),
                                  topLeft: Radius.circular(30.r),
                                ),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.h, right: 10.w, left: 10.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
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
                                                                "Certificate Date",
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
                                                      left: 35.w, top: 5.h),
                                                  child: Row(
                                                    children: [
                                                      defaultText(
                                                          txt:
                                                              'Certificate date ',
                                                          color: Colors
                                                              .orangeAccent,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      defaultText(
                                                          txt: dateTime
                                                              .toString()
                                                              .substring(0, 11),
                                                          color: Colors.white,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold)
                                                    ],
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Image.asset(
                                        'images/certifcate.png',
                                        height: 50.h,
                                        width: 50.w,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 7.w, right: 7.w, bottom: 7.h),
                                  child: TextField(
                                    controller: certificateController,
                                    cursorColor: Colors.white,
                                    minLines: 1,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: contactColor,
                                        hintStyle: TextStyle(
                                            color: hintColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.yellowAccent)),
                                        hintText: 'Certificate name'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    greenButton(txt: 'Upload', onPress: () {}),
                                    greenButton(txt: 'View', onPress: () {})
                                  ],
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
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
                                    width: 199.w,
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.only(left: 15),
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
                                              txt: 'add certificate card',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        ],
                                      ),
                                    ))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: greenButton(txt: 'Save', onPress: () {}))
                          ]),
                    ),
                  ),
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
                              alignment: AlignmentDirectional.center,
                              children: [
                                expriance(),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.w, left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional.topEnd,
                                        child: defaultText(
                                            txt: 'Total time',
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellowAccent),
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'images/club.png',
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                                color: Color.fromARGB(
                                                    255, 199, 198, 198),
                                                hint: 'Club name',
                                                controller: clubNameController,
                                                type: TextInputType.name),
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
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                                ontap: () {
                                                  showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate: DateTime(
                                                              1980, 1, 1),
                                                          lastDate:
                                                              DateTime.parse(
                                                                  '2060-01-01'))
                                                      .then((value) => {
                                                            startingDataController
                                                                    .text =
                                                                DateFormat
                                                                        .yMMMd()
                                                                    .format(
                                                                        value!),
                                                          });
                                                },
                                                color: Color.fromARGB(
                                                    255, 199, 198, 198),
                                                hint: 'Starting date',
                                                controller:
                                                    startingDataController,
                                                type: TextInputType.datetime),
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
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                                ontap: () {
                                                  showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate: DateTime(
                                                              1980, 1, 1),
                                                          lastDate:
                                                              DateTime.parse(
                                                                  '2060-01-01'))
                                                      .then((value) => {
                                                            endingDataController
                                                                    .text =
                                                                DateFormat
                                                                        .yMMMd()
                                                                    .format(
                                                                        value!),
                                                          });
                                                },
                                                hint: 'Ending date',
                                                color: Color.fromARGB(
                                                    255, 199, 198, 198),
                                                controller:
                                                    endingDataController,
                                                type: TextInputType.datetime),
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
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                                hint: 'League type',
                                                color: Color.fromARGB(
                                                    255, 199, 198, 198),
                                                controller: leagueController,
                                                type: TextInputType.text),
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
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                                hint: 'Position',
                                                color: Color.fromARGB(
                                                    255, 199, 198, 198),
                                                controller: positionController,
                                                type: TextInputType.name),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   height: 7.h,
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
                                    width: 199.w,
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.only(left: 15),
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
                                              txt: 'add exprience card',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        ],
                                      ),
                                    ))),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: greenButton(
                                  txt: 'Save',
                                  onPress: () {
                                    print('green');
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
                                    padding:
                                        EdgeInsets.only(left: 160.w, top: 15.h),
                                    child:
                                        Image.asset('images/sportıve ıcon.png'),
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
                                        children: [
                                          Container(
                                            width: 100.w,
                                            child: CountryCodePicker(
                                              showDropDownButton: true,
                                              onChanged: onCountryChange,
                                              initialSelection: 'IT',
                                              favorite: ['+39', 'FR'],
                                              showCountryOnly: false,
                                              showOnlyCountryWhenClosed: false,
                                              alignLeft: false,
                                            ),
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                              color: greyColor,
                                              controller: phoneController,
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
                                            ontap: () {}),
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
                                    padding:
                                        EdgeInsets.only(left: 160.w, top: 15.h),
                                    child:
                                        Image.asset('images/sportıve ıcon.png'),
                                  ),
                                ],
                              ),
                              contactContainer(
                                  txt: 'Social media',
                                  headerText: 'request',
                                  color: Colors.red,
                                  icon: Icons.phone_callback_rounded,
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
                                                    color: Colors.black),
                                                color: Colors.white30,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/12.png'),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                              color: greyColor,
                                              controller: socialController,
                                              hint: 'http//',
                                              // label: '0126577765',
                                              type: TextInputType.emailAddress,
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
                                        height: 9.h,
                                      ),
                                      Container(
                                        width: 120.w,
                                        child: mainButton(
                                            colorButton: Colors.red,
                                            txt: 'request',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            ontap: () {}),
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
                                    padding: EdgeInsets.only(left: 10.w),
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
                                            fontWeight: FontWeight.bold),
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
                                    padding:
                                        EdgeInsets.only(left: 160.w, top: 15.h),
                                    child:
                                        Image.asset('images/sportıve ıcon.png'),
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
                                                    color: Colors.black),
                                                color: Colors.white30,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/CompositeLayer (3).png'),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                              color: greyColor,
                                              controller: emailController,
                                              hint: 'http//',
                                              // label: '0126577765',
                                              type: TextInputType.emailAddress,
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
                                        height: 9.h,
                                      ),
                                      Container(
                                        width: 120.w,
                                        child: mainButton(
                                            txt: 'request',
                                            colorButton: Colors.blue,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            ontap: () {}),
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
                            child: greenButton(txt: 'Save', onPress: () {}),
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
    );
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