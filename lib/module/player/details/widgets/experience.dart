import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

class GetExperience extends StatefulWidget {
  TextEditingController? clubNameController ;
   GetExperience({Key? key,this.clubNameController}) : super(key: key);

  @override
  _GetExperienceState createState() => _GetExperienceState();
}

class _GetExperienceState extends State<GetExperience> {
  DateTime currentDate = DateTime.now();
  String difference = "";
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return PlayerCubit.get(context).getProfileData!.data!.user!.experiences !=
                null &&
            PlayerCubit.get(context)
                    .getProfileData!
                    .data!
                    .user!
                    .experiences!
                    .length >
                index
        ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              expriance(),
              Padding(
                padding: EdgeInsets.only(right: 15.w, left: 13.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: buildTextFormField(
                              color: Color.fromARGB(255, 199, 198, 198),
                              hint: PlayerCubit.get(context)
                                          .getProfileData!
                                          .data!
                                          .user!
                                          .experiences![0]
                                          .clubName ==
                                      null
                                  ? 'Club name'
                                  : "${PlayerCubit.get(context).getProfileData!.data!.user!.experiences![0].clubName}",
                              controller:
                                 widget.clubNameController,
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
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
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
                                  PlayerCubit.get(context).startingDate = date;
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
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: greyColor,
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
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 6.h, left: 35.w),
                                              child: PlayerCubit.get(context)
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .experiences![0]
                                                          .startDate ==
                                                      null
                                                  ? defaultText(
                                                      txt: PlayerCubit.get(
                                                                      context)
                                                                  .startingDate ==
                                                              null
                                                          ? "Starting date"
                                                          : PlayerCubit.get(
                                                                  context)
                                                              .startingDate
                                                              .toString()
                                                              .toString()
                                                              .substring(0, 10),
                                                      color: Color.fromARGB(
                                                          255, 99, 98, 98),

                                                      fontSize: 14.sp,
                                                      // fontWeight: FontWeight.bold,
                                                    )
                                                  : defaultText(
                                                      txt:
                                                          '${PlayerCubit.get(context).getProfileData!.data!.user!.experiences![0].startDate}',
                                                      color: Colors.black,
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal),
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
                              DatePicker.showDatePicker(context,
                                  theme: DatePickerTheme(
                                      backgroundColor: greyColor),
                                  showTitleActions: true,
                                  currentTime: currentDate,
                                  minTime: DateTime(1950, 1, 1),
                                  onConfirm: (date) {
                                setState(() {
                                  PlayerCubit.get(context).endingDate = date;

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
                                    width: double.infinity.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: greyColor,
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
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 6.h, left: 35.w),
                                              child: PlayerCubit.get(context)
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .experiences![0]
                                                          .endDate ==
                                                      null
                                                  ? defaultText(
                                                      txt: PlayerCubit.get(
                                                                      context)
                                                                  .endingDate ==
                                                              null
                                                          ? "Ending date"
                                                          : PlayerCubit.get(
                                                                  context)
                                                              .endingDate
                                                              .toString()
                                                              .substring(0, 10),
                                                      color: Color.fromARGB(
                                                          255, 99, 98, 98),

                                                      fontSize: 14.sp,
                                                      // fontWeight: FontWeight.bold,
                                                    )
                                                  : defaultText(
                                                      txt:
                                                          '${PlayerCubit.get(context).getProfileData!.data!.user!.experiences![0].endDate}',
                                                      color: Colors.black,
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal),
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
                              hint: PlayerCubit.get(context)
                                          .getProfileData!
                                          .data!
                                          .user!
                                          .experiences![0]
                                          .leagueType ==
                                      null
                                  ? 'League type'
                                  : "${PlayerCubit.get(context).getProfileData!.data!.user!.experiences![0].leagueType}",
                              color: Color.fromARGB(255, 199, 198, 198),
                              controller:
                                  PlayerCubit.get(context).leagueController,
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
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: buildTextFormField(
                              hint: PlayerCubit.get(context)
                                          .getProfileData!
                                          .data!
                                          .user!
                                          .experiences![0]
                                          .position!.name ==
                                      null
                                  ? 'Position'
                                  : '${PlayerCubit.get(context).getProfileData!.data!.user!.experiences![0].position!.name}',
                              color: Color.fromARGB(255, 199, 198, 198),
                              controller:
                                  PlayerCubit.get(context).positionController,
                              type: TextInputType.name),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        : Stack(
            alignment: AlignmentDirectional.center,
            children: [
              expriance(),
              Padding(
                padding: EdgeInsets.only(right: 15.w, left: 13.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: buildTextFormField(
                              color: Color.fromARGB(255, 199, 198, 198),
                              hint: 'Club name',
                              controller:
                                  PlayerCubit.get(context).clubNameController,
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
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
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
                                  PlayerCubit.get(context).startingDate = date;
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
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: greyColor,
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
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 6.h, left: 35.w),
                                                child: defaultText(
                                                  txt: PlayerCubit.get(context)
                                                              .startingDate ==
                                                          null
                                                      ? "Starting date"
                                                      : PlayerCubit.get(context)
                                                          .startingDate
                                                          .toString()
                                                          .toString()
                                                          .substring(0, 10),
                                                  color: Color.fromARGB(
                                                      255, 99, 98, 98),

                                                  fontSize: 14.sp,
                                                  // fontWeight: FontWeight.bold,
                                                )),
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
                              DatePicker.showDatePicker(context,
                                  theme: DatePickerTheme(
                                      backgroundColor: greyColor),
                                  showTitleActions: true,
                                  currentTime: currentDate,
                                  minTime: DateTime(1950, 1, 1),
                                  onConfirm: (date) {
                                setState(() {
                                  PlayerCubit.get(context).endingDate = date;

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
                                    width: double.infinity.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: greyColor,
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
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 6.h, left: 35.w),
                                                child: defaultText(
                                                  txt: PlayerCubit.get(context)
                                                              .endingDate ==
                                                          null
                                                      ? "Ending date"
                                                      : PlayerCubit.get(context)
                                                          .endingDate
                                                          .toString()
                                                          .substring(0, 10),
                                                  color: Color.fromARGB(
                                                      255, 99, 98, 98),

                                                  fontSize: 14.sp,
                                                  // fontWeight: FontWeight.bold,
                                                )),
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
                              hint: 'League type',
                              color: Color.fromARGB(255, 199, 198, 198),
                              controller:
                                  PlayerCubit.get(context).leagueController,
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
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: buildTextFormField(
                              hint: 'Position',
                              color: Color.fromARGB(255, 199, 198, 198),
                              controller:
                                  PlayerCubit.get(context).positionController,
                              type: TextInputType.name),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
