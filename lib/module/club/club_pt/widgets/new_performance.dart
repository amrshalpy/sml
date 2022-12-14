import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';

class NewPerformance extends StatelessWidget {
  const NewPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'images/PT card3 (1).png',
                      height: 530.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 110.h, left: 10.w),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 28.h,
                              width: 90.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    'Flip',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {},
                              )),
                          SizedBox(
                            width: 99.w,
                          ),
                          Container(
                              height: 28.h,
                              width: 90.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {},
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 90.h,
                        left: 90.w,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              height: 100.h,
                              width: 115.w,
                              child: Image.asset(
                                'images/Rectangle 550.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Image.asset(
                              'images/15 (1).png',
                              height: 80.h,
                              width: 59.w,
                            ),
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, bottom: 15.h, top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: defaultText(
                          txt: 'Performance test',
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/sport??ve ??con (1).png',
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          defaultText(
                            txt: 'Game',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Container(
                              height: 16.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromARGB(255, 70, 117, 72),
                              ),
                              child: Center(
                                child: defaultText(
                                  txt: '',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/position.png',
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          defaultText(
                            txt: 'Position',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Container(
                              height: 16.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromARGB(255, 70, 117, 72),
                              ),
                              child: Center(
                                child: defaultText(
                                  txt: '',
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/iconmonstr-user.png',
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          defaultText(
                            txt: 'Type',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Container(
                              height: 16.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromARGB(255, 70, 117, 72),
                              ),
                              child: Center(
                                child: defaultText(
                                  txt: '',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/iconmonstr-user.png',
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          defaultText(
                            txt: 'Age',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                              height: 16.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromARGB(255, 70, 117, 72),
                              ),
                              child: Center(
                                child: defaultText(
                                  txt: '',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          defaultText(
                            txt: 'to ',
                            fontSize: 14.sp,
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(
                              height: 16.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromARGB(255, 70, 117, 72),
                              ),
                              child: Center(
                                child: defaultText(
                                  txt: '',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/surface1 (1).png',
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          defaultText(
                            txt: 'Date',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                              height: 16.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromARGB(255, 70, 117, 72),
                              ),
                              child: Center(
                                child: defaultText(
                                  txt: '',
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          defaultText(
                            txt: 'to ',
                            fontSize: 14.sp,
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(
                              height: 16.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromARGB(255, 70, 117, 72),
                              ),
                              child: Center(
                                child: defaultText(
                                  txt: '',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
