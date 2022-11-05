import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/player/details/widgets/get_city.dart';
import 'package:sportive/module/player/details/widgets/get_country.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  DateTime? dateTime;
  DateTime currentDate = DateTime.now();
  String difference = "";
  var ownerController = TextEditingController();
  var founderController = TextEditingController();
  var mangerController = TextEditingController();
  var arenasController = TextEditingController();
  bool isCountry = false;
  bool isCityVal = false;
  bool isCity = false;
  bool isNationality = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return cubit.getProfileData != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 10.h, left: 10.h),
                            // height: MediaQuery.of(context).size.height * .50.h,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                        border:
                                            Border.all(color: Colors.black45),
                                        borderRadius: BorderRadius.circular(10),
                                        color: contactColor,
                                      ),
                                      child: Center(
                                          child: cubit.getProfileData!.data!
                                                      .user!.country!.name ==
                                                  ''
                                              ? defaultText(
                                                  txt: cubit.countryVal == null
                                                      ? 'country'
                                                      : cubit.countryVal
                                                          .toString(),
                                                  color: hintColor,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal)
                                              : defaultText(
                                                  txt: cubit.countryVal == null
                                                      ? '${cubit.getProfileData!.data!.user!.country!.name}'
                                                      : cubit.countryVal
                                                          .toString(),
                                                  color: hintColor,
                                                  fontSize: 14.sp,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                    ),
                                  ),
                                  if (isCityVal == true)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
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
                                                BorderRadius.circular(10),
                                            color: contactColor,
                                          ),
                                          child: Center(
                                              child: cubit.getProfileData!.data!
                                                          .user!.city!.name ==
                                                      ''
                                                  ? defaultText(
                                                      txt: cubit.cityVal == null
                                                          ? 'City'
                                                          : cubit.cityVal
                                                              .toString(),
                                                      color: hintColor,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.normal)
                                                  : defaultText(
                                                      txt: cubit.cityVal == null
                                                          ? '${cubit.getProfileData!.data!.user!.city!.name}'
                                                          : cubit.cityVal
                                                              .toString(),
                                                      color: hintColor,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.normal)),
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
                                        border:
                                            Border.all(color: Colors.black45),
                                        borderRadius: BorderRadius.circular(10),
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
                                                  txt: cubit.nationVal == null
                                                      ? 'Nationality'
                                                      : cubit.nationVal
                                                          .toString(),
                                                  color: Colors.black,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold)
                                              : defaultText(
                                                  txt: cubit.nationVal == null
                                                      ? '${cubit.getProfileData!.data!.user!.nationality!.name}'
                                                      : cubit.nationVal
                                                          .toString(),
                                                  color: Colors.black,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold)),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .founded ==
                                                            ''
                                                        ? defaultText(
                                                            txt: "Founded date",
                                                            color: hintColor,
                                                            fontSize: 16.sp,
                                                            // fontWeight: FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                "${cubit.getProfileData!.data!.user!.founded}",
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
                                            padding:
                                                EdgeInsets.only(left: 35.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                defaultText(
                                                    txt: 'Founded from : ',
                                                    color: Colors.orangeAccent,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                defaultText(
                                                    txt: difference,
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
                                      txt: 'Optional',
                                      color: Colors.yellowAccent,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  defaultText(
                                      txt: 'Owner',
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/owner.png',
                                        height: 40.h,
                                        width: 35.w,
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                        child: buildTextFormField(
                                            controller: ownerController,
                                            color: contactColor,
                                            label: cubit.getProfileData!.data!
                                                        .user!.owner ==
                                                    ''
                                                ? 'Owner'
                                                : '${cubit.getProfileData!.data!.user!.owner}',
                                            type: TextInputType.text),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  defaultText(
                                      txt: 'Founder',
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/founder.png',
                                        height: 35.h,
                                        width: 30.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: buildTextFormField(
                                            color: contactColor,
                                            controller: founderController,
                                            // hint: 'weight',
                                            label: cubit.getProfileData!.data!
                                                        .user!.founder ==
                                                    ''
                                                ? 'Founder'
                                                : '${cubit.getProfileData!.data!.user!.founder}',
                                            type: TextInputType.text),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  defaultText(
                                      txt: 'Manger',
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/manger.png',
                                        height: 35.h,
                                        width: 30.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: buildTextFormField(
                                            color: contactColor,
                                            controller: mangerController,
                                            // hint: 'weight',
                                            label: cubit.getProfileData!.data!
                                                        .user!.manager ==
                                                    ''
                                                ? 'Manger'
                                                : '${cubit.getProfileData!.data!.user!.manager}',
                                            type: TextInputType.text),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  defaultText(
                                      txt: 'Arnase/staduims',
                                      color: Colors.white,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/stadium.png',
                                        height: 35.h,
                                        width: 30.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: buildTextFormField(
                                            color: contactColor,
                                            controller: arenasController,
                                            // hint: 'weight',
                                            label: cubit.getProfileData!.data!
                                                        .user!.stadium ==
                                                    ''
                                                ? 'Arnase/staduims'
                                                : "${cubit.getProfileData!.data!.user!.stadium}",
                                            type: TextInputType.text),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Align(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      child: greenButton(
                                          txt: 'Save',
                                          onPress: () {
                                            cubit.uploadGenralData(
                                              // dateTime
                                              //         .toString()
                                              //         .replaceAll(
                                              //             '00:00:00.000', ' '),
                                              founded: dateTime.toString()
                                                      .replaceAll(
                                                          '00:00:00.000', ' '),
                                              cityId: cubit.city,
                                            

                                              countryId: cubit.country,
                                              nationality: cubit.nation,
                                              founder: founderController.text,
                                              manager: mangerController.text,
                                              stadium: arenasController.text,
                                              // nationality: nationality
                                            );
                                          }))
                                ]),
                          ),
                          if (isCountry == true)
                            InkWell(
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, top: 80.h),
                                  child: Container(
                                    height: 300.h,
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListView.separated(
                                      itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            cubit.changeCountr(
                                                cubit.countryModel!.data![index]
                                                    .id,
                                                cubit.countryModel!.data![index]
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
                                              .countryModel!.data![index])),
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
                          if (isCity == true)
                            InkWell(
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, top: 80.h),
                                  child: Container(
                                    height: 300.h,
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListView.separated(
                                      itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            cubit.changecity(
                                              cubit.cityModel!.data![index].id,
                                              cubit
                                                  .cityModel!.data![index].name,
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
                                          child: getCity(
                                              cubit.cityModel!.data![index])),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: 10,
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: .1,
                                        ),
                                      ),
                                      itemCount: PlayerCubit.get(context)
                                          .cityModel!
                                          .data!
                                          .length,
                                    ),
                                  )),
                            ),
                          if (isNationality == true)
                            InkWell(
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, top: 80.h),
                                  child: Container(
                                    height: 300.h,
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListView.separated(
                                      itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            cubit.changeNation(
                                              cubit.countryModel!.data![index]
                                                  .id,
                                              cubit.countryModel!.data![index]
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
                                              .countryModel!.data![index])),
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
                        ],
                      ),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
