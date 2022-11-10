import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';

Widget flipCard() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 530.h,
                    // width: 290.w,
                    child: Image.asset('images/PT card2.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 190.h),
                    child: Column(
                      children: [
                        defaultText(
                          txt: 'Al ahly ',
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        defaultText(
                          txt: 'Ex : 1/2/2020 ',
                          color: Colors.yellowAccent,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        defaultText(
                          txt: '02:30:00 ',
                          color: Colors.yellowAccent,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Transform.rotate(
                          angle: 183,
                          child: Container(
                            height: 105.h,
                            width: 105.w,
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
                          height: 20,
                        ),
                        defaultText(
                          txt: 'Ali Ahmed',
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        Container(
                            height: 108.h,
                            width: 117.w,
                            child:
                                Image.asset('images/CompositeLayer (10).png')),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 100.h, left: 20.w),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: 28,
                        width: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Flip',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {},
                        )),
                    SizedBox(
                      width: 58,
                    ),
                    Container(
                        height: 28,
                        width: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: 20,
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
