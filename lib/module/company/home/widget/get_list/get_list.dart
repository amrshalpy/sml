import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/widget_list_model.dart';

Widget getist(WidgetList list) {
  return Padding(
    padding: EdgeInsets.only(left: 4.w, right: 4.w),
    child: Column(
      children: [
        Container(
          // key: ValueKey(list),
          height: 51.h,
          width: 45.w,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 238, 238),
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage('${list.img}')),
            shape: BoxShape.circle,
            border: Border.all(
              // color: Colors.red,
              width: .5.w,
            ),
          ),
        ),
        defaultText(
            txt: "${list.txt}",
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white)
      ],
    ),
  );
}
