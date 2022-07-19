import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/club/club_pt/widgets/get_details.dart';

Widget getClubPt(context) {
  return InkWell(
    onTap: () {
      getClubDetails(context);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Stack(
              children: [
                Image.asset('images/PT card3.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 55),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 17,
                          width: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                'Flip',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () {},
                          )),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                          height: 17,
                          width: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    fontSize: 10.sp,
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
                    bottom: 35,
                    left: 35,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset('images/Rectangle 550.png'),
                        Image.asset('images/15.png'),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: defaultText(
                      txt: 'Performance test',
                      color: Colors.white,
                      fontSize: 11,
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
                        height: 13,
                        width: 13,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      defaultText(
                        txt: 'Game',
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 10,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromARGB(255, 70, 117, 72),
                          ),
                          child: Center(
                            child: defaultText(
                              txt: 'Football',
                              fontSize: 8,
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
                        height: 13,
                        width: 13,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      defaultText(
                        txt: 'Position',
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 10,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromARGB(255, 70, 117, 72),
                          ),
                          child: Center(
                            child: defaultText(
                              txt: 'Goal Keeper',
                              fontSize: 8,
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
                        height: 13,
                        width: 13,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      defaultText(
                        txt: 'Type',
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 10,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromARGB(255, 70, 117, 72),
                          ),
                          child: Center(
                            child: defaultText(
                              txt: 'Player',
                              fontSize: 8,
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
                        height: 13,
                        width: 13,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      defaultText(
                        txt: 'Age',
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 10,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromARGB(255, 70, 117, 72),
                          ),
                          child: Center(
                            child: defaultText(
                              txt: '17 years',
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      defaultText(
                        txt: 'to ',
                        fontSize: 8,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                          height: 10,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromARGB(255, 70, 117, 72),
                          ),
                          child: Center(
                            child: defaultText(
                              txt: '19 years',
                              fontSize: 8,
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
                        height: 13,
                        width: 13,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      defaultText(
                        txt: 'Data',
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 10,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromARGB(255, 70, 117, 72),
                          ),
                          child: Center(
                            child: defaultText(
                              txt: '1/2/2020',
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      defaultText(
                        txt: 'to ',
                        fontSize: 8,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                          height: 10,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromARGB(255, 70, 117, 72),
                          ),
                          child: Center(
                            child: defaultText(
                              txt: '1/2/2022',
                              fontSize: 8,
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
        Container(
          height: 55,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
              ),
              color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'images/QR (1).png',
                      height: 20,
                      width: 20,
                    ),
                    defaultText(txt: '100 k', color: Colors.white),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/Untitled-7.png',
                      height: 20,
                      width: 20,
                    ),
                    defaultText(txt: '100 k', color: Colors.white),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/icons8-share-48 (2).png',
                      height: 20,
                      width: 20,
                    ),
                    defaultText(txt: '100 k', color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
