import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/get_sport_model.dart';

Widget getAllSport(Data data, BuildContext context) => Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Container(
        child: Padding(
            padding: EdgeInsets.only(
              right: 7.w,
              left: 7.w,
            ),
            child: Center(
              child: defaultText(
                txt: '${data.name}',
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            )),
      ),
    );
