import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';

Widget getAccepted() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Image.asset(
        'images/gold5.png',
        height: 233.h,
        width: 145.w,
      ),
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w, top: 34.h, right: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    defaultText(
                      txt: 'Gk',
                      fontSize: 15.sp,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    Image.asset(
                      'images/CompositeLayer.png',
                      height: 12.h,
                      width: 12.w,
                    ),
                    defaultText(
                      txt: '100',
                      fontSize: 10.sp,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(
                      Icons.favorite,
                      size: 14,
                      color: Colors.black,
                    ),
                    defaultText(
                      txt: '100',
                      fontSize: 12.sp,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    Image.asset(
                      'images/icons8-share-48 (3).png',
                      height: 12.h,
                      width: 12.w,
                    ),
                    defaultText(
                      txt: '100',
                      fontSize: 6.sp,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Container(
                  height: 90.h,
                  width: 72.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/13 (1).png')),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          defaultText(
            txt: 'Ali ahmed',
            fontSize: 15.sp,
            color: Color.fromARGB(255, 3, 46, 121),
            fontWeight: FontWeight.bold,
          ),
          Divider(
            color: Colors.black,
            thickness: 4,
            indent: 40,
            height: 2,
            endIndent: 40,
          ),
          defaultText(
            txt: 'Alhaly egyption club',
            fontSize: 12.sp,
            color: Color.fromARGB(255, 3, 46, 121),
            fontWeight: FontWeight.bold,
          ),
          defaultText(
            txt: 'Boxing player',
            fontSize: 9.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          defaultText(
            txt: 'Boxing game',
            fontSize: 9.sp,
            color: Color.fromARGB(255, 3, 46, 121),
            fontWeight: FontWeight.bold,
          ),
        ],
      )
    ],
  );
}
