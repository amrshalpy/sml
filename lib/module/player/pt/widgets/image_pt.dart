import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';

Widget getImagePT() {
  return Container(
    height: 320.h,
    width: double.infinity,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 248.h,
                    width: 116.w,
                    child: Image.asset('images/PT card2 (1).png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Column(
                      children: [
                        defaultText(
                          txt: 'Al ahly ',
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        defaultText(
                          txt: 'Ex : 1/2/2020 ',
                          color: Colors.yellowAccent,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        defaultText(
                          txt: '02:30:00 ',
                          color: Colors.yellowAccent,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Transform.rotate(
                          angle: 183,
                          child: Container(
                            height: 40.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'images/mohamed-salah-sportstiger.jpeg')),
                              borderRadius: BorderRadius.circular(15.r),
                              border:
                                  Border.all(width: .4, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        defaultText(
                          txt: 'Ali Ahmed',
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        Container(
                            height: 20.h,
                            width: 20.w,
                            child:
                                Image.asset('images/CompositeLayer (10).png')),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 65.h, left: 15.w),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: 15,
                        width: 20,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Flip',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {},
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 15,
                        width: 20,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {},
                        )),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
