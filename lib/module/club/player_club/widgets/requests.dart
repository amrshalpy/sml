import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/Path 382.png',
                      height: 150.h,
                      width: 395.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160.w, top: 15.h),
                      child: Image.asset('images/sportıve ıcon.png'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 31.h),
                        child: Image.asset(
                          'images/my agent.png',
                          height: 45.h,
                          width: 50.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 37.h),
                        child: Center(
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: defaultText(
                                  txt: 'tennis',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Image.asset('images/Group 80.png')),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.w,
                                          ),
                                          color: greyColor,
                                        ),
                                        height: 30.h,
                                        width: 70.w,
                                        child: Center(
                                          child: defaultText(
                                              txt: 'player',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.w,
                                          ),
                                          color: contactColor,
                                        ),
                                        height: 30.h,
                                        width: 160.w,
                                        child: Center(
                                          child: defaultText(
                                              txt: 'Ali ahmed',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Container(
                                  width: 120.w,
                                  child: mainButton(
                                      txt: 'Accept',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      ontap: () {}),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/Path 382.png',
                      height: 150.h,
                      width: 395.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160.w, top: 15.h),
                      child: Image.asset('images/sportıve ıcon.png'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 31.h),
                        child: Image.asset(
                          'images/my agent.png',
                          height: 45.h,
                          width: 50.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 37.h),
                        child: Center(
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: defaultText(
                                  txt: 'tennis',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Image.asset('images/Group 80.png')),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.w,
                                          ),
                                          color: greyColor,
                                        ),
                                        height: 30.h,
                                        width: 70.w,
                                        child: Center(
                                          child: defaultText(
                                              txt: 'player',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.w,
                                          ),
                                          color: contactColor,
                                        ),
                                        height: 30.h,
                                        width: 160.w,
                                        child: Center(
                                          child: defaultText(
                                              txt: 'Ali ahmed',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Container(
                                  width: 120.w,
                                  child: mainButton(
                                      txt: 'Accept',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      ontap: () {}),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/Path 382.png',
                      height: 150.h,
                      width: 395.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160.w, top: 15.h),
                      child: Image.asset('images/sportıve ıcon.png'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 31.h),
                        child: Image.asset(
                          'images/my agent.png',
                          height: 45.h,
                          width: 50.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 37.h),
                        child: Center(
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: defaultText(
                                  txt: 'tennis',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Image.asset('images/Group 80.png')),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.w,
                                          ),
                                          color: greyColor,
                                        ),
                                        height: 30.h,
                                        width: 70.w,
                                        child: Center(
                                          child: defaultText(
                                              txt: 'player',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2.w,
                                          ),
                                          color: contactColor,
                                        ),
                                        height: 30.h,
                                        width: 160.w,
                                        child: Center(
                                          child: defaultText(
                                              txt: 'Ali ahmed',
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Container(
                                  width: 120.w,
                                  child: mainButton(
                                      txt: 'Accept',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      ontap: () {}),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
