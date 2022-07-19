import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/module/player/explore/explore.dart';

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
                                DatePicker.showDatePicker(
                                    theme: DatePickerTheme(
                                        backgroundColor: greyColor),
                                    context,
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
                                                txt: dateTime == null
                                                    ? "Birth day"
                                                    : '${dateTime}',
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
                                      if(difference != '')
                                  defaultText(
                                      txt: difference + ' years',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
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
                                      borderRadius: BorderRadius.circular(10.r),
                                      // border: Border.all(),
                                    ),
                                    child: Center(
                                      child: DropdownButtonFormField(
                                          dropdownColor: contactColor,
                                          // itemHeight: 40,
                                          style: TextStyle(
                                              color: hintColor,
                                              // backgroundColor: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.normal),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r))),
                                          items: HomeCubit.get(context)
                                              .gender
                                              .map<DropdownMenuItem<String>>(
                                                  (String val) =>
                                                      DropdownMenuItem(
                                                        child: Text(val),
                                                        value: val,
                                                      ))
                                              .toList(),
                                          value:
                                              HomeCubit.get(context).ganderVal,
                                          onChanged: (val) {
                                            HomeCubit.get(context)
                                                .onChangedGender(val);
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
                                color: Color.fromRGBO(255, 255, 255, 1),
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
                                      hint: 'height',
                                      color: contactColor,
                                      label: 'height',
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
                                      hint: 'weight',
                                      label: 'weight',
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
                    padding: EdgeInsets.only(top: 5.h, right: 15.w, left: 10.w),
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
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: DropdownButtonFormField(
                                    dropdownColor: contactColor,
                                    style: TextStyle(
                                        color: hintColor,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.normal),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    items: HomeCubit.get(context)
                                        .direction
                                        .map<DropdownMenuItem<String>>(
                                            (String val) => DropdownMenuItem(
                                                  child: Text(val),
                                                  value: val,
                                                ))
                                        .toList(),
                                    value: HomeCubit.get(context).right,
                                    onChanged: (val) {
                                      HomeCubit.get(context)
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
                                hint: 'Running time',
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

                                hint: 'Vertical Jumping distance ',
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

                                hint: 'Long Jumping',
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

                                hint: 'Leg weights ',
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
                            child: greenButton(txt: 'Save', onPress: () {}))
                      ],
                    ),
                  )),
                ],
              ),
              ListView(
                children: [
                  Container(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultText(
                              txt: 'Expriance ',
                              color: Colors.yellowAccent,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Stack(
                              children: [
                                expriance(),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 25.h, right: 10.w, left: 10.w),
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
                            SizedBox(
                              height: 7.h,
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
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
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


//////  Flutter DraggableScrollableSheet with sticky headers/////////

// SizedBox.expand(
//     child: DraggableScrollableSheet(
//       maxChildSize: 0.9,
//       minChildSize: 0.2,
//       initialChildSize: 0.3,
//       expand: false,
//       builder:
//           (BuildContext context, ScrollController scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               )),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   margin: EdgeInsets.symmetric(vertical: 8),
//                   height: 8.0,
//                   width: 70.0,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[400],
//                       borderRadius: BorderRadius.circular(10.0)),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Text(
//                   'Neuigkeiten',
//                   style: TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(height: 20.0),
//                     Text('Erfahre mehr ... '),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//               Expanded(child: NewsList(controller: scrollController))
//             ],
//           ),
//         );
//       },
//     ),
//   );
// ////////// //// // ////////   //////

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DraggableScrollableSheet'),
//       ),
//       body: SizedBox.expand(
//         child: DraggableScrollableSheet(
//           builder: (BuildContext context, ScrollController scrollController) {
//             return Stack(
//               children: [
//                 //this section is your list
//                 Container(
//                   color: Colors.blue[100],
//                   child: ListView.builder(
//                     controller: scrollController,
//                     itemCount: 26,
//                     itemBuilder: (BuildContext context, int index) {
//                       if(index == 0)return Container(height: 50);//this is the padding on the top of the list
//                       return ListTile(title: Text('Item ${index-1}'));
//                       },
//                   ),
//                 ),
//                 //this section is your header
//                 IgnorePointer(
//                   child: Container(
//                     height: 50,
//                     child: AppBar(
//                       title: Text("Sheet title"),
//                       automaticallyImplyLeading: false,//this prevents the appBar from having a close button (that button wouldn't work because of IgnorePointer)
//                     ),
//                 )),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }