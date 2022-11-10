import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/sub_sport_model.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

Widget subSports() => Padding(
  padding: EdgeInsets.only(top: 1.h),
  child: Container(
    child: Padding(
      padding: EdgeInsets.only(
        right: 7.w,
        left: 7.w,
      ),
      child: defaultText(
        txt: '',
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    ),
    decoration: BoxDecoration(
      color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        )),
  ),
);
