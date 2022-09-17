import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/sports.dart';

Widget getSportsList(Sportss sportsList) {
  return Column(
    children: [
      Image.asset(
        '${sportsList.image}',
        height: 50.h,
        width: 50.w,
      ),
      defaultText(
        txt: '${sportsList.title}',
        color: Colors.white,
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
      ),
    ],
  );
}
