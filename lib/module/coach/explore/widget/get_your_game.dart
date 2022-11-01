import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/coach/explore/widget/get_category.dart';
import 'package:sportive/module/coach/explore/widget/get_sports.dart';

void getGame(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                top: 20.h, right: 10.w, bottom: 40.h, left: 10.w),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          pop(context: context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 15.w,
                    ),
                    defaultText(
                        txt: 'Select your game',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 40.h,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1)),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          hintText: 'Search ',
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .65,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          // getSports(context),
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      // Expanded(child: category()),
                    ],
                  ),
                )
              ]),
            ),
          ));
}
