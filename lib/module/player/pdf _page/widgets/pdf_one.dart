import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final pdf = pw.Document;

Widget pdfOne({
  String? img,
  String? playerName,
  String? playerGame,
  String? nameGame,
  Widget? widgetRight,
  Widget? widgetLeft,
  BuildContext? context,
}) {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: .5.w),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        'images/002.png',
                      ),
                    ),
                    // RotationTransition(
                    //   turns: AlwaysStoppedAnimation(20 / 180),
                    //   child: Align(
                    //     alignment: AlignmentDirectional.topCenter,
                    //     child: Padding(
                    //       padding: EdgeInsets.only(
                    //         right: 20.h,
                    //         left: 90.h,
                    //       ),
                    //       child:
                    Padding(
                      padding: EdgeInsets.only(left: 120.w, top: 5.h),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'images/Rectangle 474.png',
                          ),
                          Transform.rotate(
                            angle: -30,
                            child: Container(
                              // margin: EdgeInsets.only(left: 60),
                              height: 80.h,
                              width: 70.w,
                              // child: RotatedBox(
                              //   quarterTurns: 7,
                              //   child: Image.asset(
                              //     'images/mohamed-salah-sportstiger.jpeg',
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(img!),
                                    fit: BoxFit.contain),
                                // border: Border.all(color: Colors.white, width: 3),
                                // borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    widgetRight!,
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 190.w,
                          height: 70.h,
                          child: Image.asset(
                            'images/1.png',
                            // width: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              defaultText(
                                txt: playerName,
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              defaultText(
                                txt: playerGame,
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              defaultText(
                                  txt: nameGame,
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    widgetLeft!,
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
