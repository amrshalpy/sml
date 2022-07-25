import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';

class NewPerformance extends StatelessWidget {
  const NewPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60.w),
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'images/PT card3 (1).png',
                        height: 530,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 75.h),
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
                      Positioned(
                          bottom: 70,
                          left: 61,
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
                    padding: const EdgeInsets.only(left: 30, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: defaultText(
                            txt: 'Performance test',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/sportıve ıcon (1).png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            defaultText(
                              txt: 'Game',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Container(
                                height: 16,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromARGB(255, 70, 117, 72),
                                ),
                                child: Center(
                                  child: defaultText(
                                    txt: 'Football',
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/position.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            defaultText(
                              txt: 'Position',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Container(
                                height: 16,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromARGB(255, 70, 117, 72),
                                ),
                                child: Center(
                                  child: defaultText(
                                    txt: 'Goal Keeper',
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/iconmonstr-user.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            defaultText(
                              txt: 'Type',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Container(
                                height: 16,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromARGB(255, 70, 117, 72),
                                ),
                                child: Center(
                                  child: defaultText(
                                    txt: 'Player',
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/iconmonstr-user.png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            defaultText(
                              txt: 'Age',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                                height: 16,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromARGB(255, 70, 117, 72),
                                ),
                                child: Center(
                                  child: defaultText(
                                    txt: '17 years',
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            defaultText(
                              txt: 'to ',
                              fontSize: 14,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            Container(
                                height: 16,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromARGB(255, 70, 117, 72),
                                ),
                                child: Center(
                                  child: defaultText(
                                    txt: '19 years',
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/surface1 (1).png',
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            defaultText(
                              txt: 'Data',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                                height: 16,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromARGB(255, 70, 117, 72),
                                ),
                                child: Center(
                                  child: defaultText(
                                    txt: '1/2/2020',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            defaultText(
                              txt: 'to ',
                              fontSize: 14,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            Container(
                                height: 16,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.fromARGB(255, 70, 117, 72),
                                ),
                                child: Center(
                                  child: defaultText(
                                    txt: '1/2/2022',
                                    fontSize: 14,
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
      ),
    );
  }
}
