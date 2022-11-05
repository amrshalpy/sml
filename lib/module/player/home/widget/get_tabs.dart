import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/model/get_user_data.dart';

Widget getTabs(Taps taps) {
  return Container(
    height: 60.h,
    width: 60.w,
    child: Column(
      children: [
        // Image.network(
        //   '${taps.image}',
        //   height: 40.h,
        //   width: 40.w,
        // ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          '${taps.name}',
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        )
      ],
    ),
  );
}
