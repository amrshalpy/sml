import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/country_model.dart';

Widget getCountry(Data data) {
  return Padding(
    padding: EdgeInsets.only(left: 10.w, right: 2.w),
    child: Center(
      child:Row(
        children: [ defaultText(
          txt: '${data.name}',
          color: Colors.black,
          fontSize: 17.sp,
          fontWeight: FontWeight.normal),
         
          ],
      ),
    ),
  );
}
