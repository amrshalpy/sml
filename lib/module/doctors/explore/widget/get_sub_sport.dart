import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/sub_sport_model.dart';
import 'package:sportive/module/doctors/explore/widget/get_category.dart';

Widget getSubSport(Data data,) => InkWell(
      onTap: () {
        // DoctorCubit.get(context).getId(data.sportId);
        category(id: data.id);
        print('sportId = ${data.id}');
      },
      child: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 7.w,
                  left: 7.w,
                ),
                child: defaultText(
                  txt: '${data.name}',
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
            )),
      ),
    );
