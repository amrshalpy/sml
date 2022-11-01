import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/acount_type.dart';

Widget getAccountType(Data data) {
  return Padding(
    padding: EdgeInsets.only(left: 10.w, right: 2.w),
    child: Center(
      child: defaultText(
          txt: '${data.name}',
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold),
    ),
  );
}
