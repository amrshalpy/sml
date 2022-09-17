import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/country_model.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

Widget getCountry() {
  return InkWell(
    onTap: () {
      // print(data!.name);
      // print(data.code);
     
    },
    child: Padding(
      padding: EdgeInsets.only(left: 10.w, right: 2.w),
      child: Center(
        child: defaultText(
            txt: '',
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}
