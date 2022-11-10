import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/player/pt/widgets/image_pt.dart';

Widget filterCard() {
  var searchController = TextEditingController();
  return SingleChildScrollView(
    child: Column(children: [
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
              height: 240.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r),
                  ),
                  border: Border.all(color: Colors.yellow)),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 250.h,
                      width: 180.w,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h, left: 20.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: TextField(
                                controller: searchController,
                                onChanged: (txt) {},
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: Icon(Icons.search),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.yellowAccent,
                                          width: .3),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: defaultText(
                                      txt: ' attendance ',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.yellowAccent,
                                          width: .3),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: defaultText(
                                      txt: ' Saving ',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.yellowAccent,
                                          width: .3),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: defaultText(
                                      txt: ' views ',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.yellowAccent,
                                          width: .3),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: defaultText(
                                      txt: ' Share ',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.yellowAccent,
                                          width: .3),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: defaultText(
                                      txt: ' Short ',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 140.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.yellowAccent, width: .3),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(
                                      child: defaultText(
                                    txt: ' Scan QrCode ',
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            height: 241.h,
                            width: 120.w,
                            child: Image.asset(
                              'images/PT card3.png',
                              height: 230.h,
                              width: 140.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w, top: 85.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(
                                  txt: 'Performance test',
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/sportıve ıcon (1).png',
                                      height: 6,
                                      width: 6,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    defaultText(
                                      txt: 'Game',
                                      color: Colors.white,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                        height: 10,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color:
                                              Color.fromARGB(255, 70, 117, 72),
                                        ),
                                        child: Center(
                                          child: defaultText(
                                            txt: ' Game',
                                            fontSize: 7,
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
                                      height: 6,
                                      width: 6,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    defaultText(
                                      txt: 'Position',
                                      color: Colors.white,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                        height: 10,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color:
                                              Color.fromARGB(255, 70, 117, 72),
                                        ),
                                        child: Center(
                                          child: defaultText(
                                            txt: 'choose Position',
                                            fontSize: 5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/iconmonstr-user.png',
                                      height: 6,
                                      width: 6,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    defaultText(
                                      txt: 'Type',
                                      color: Colors.white,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 10,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Color.fromARGB(255, 70, 117, 72),
                                      ),
                                      child: Container(
                                        height: 10.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                            child: defaultText(
                                                txt: 'Type',
                                                color: Colors.black54,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/iconmonstr-user.png',
                                      height: 5,
                                      width: 5,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    defaultText(
                                      txt: 'Age',
                                      color: Colors.white,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      height: 7,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Color.fromARGB(255, 70, 117, 72),
                                      ),
                                      child: defaultText(
                                        txt: '7',
                                        fontSize: 7,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    defaultText(
                                      txt: ' years',
                                      fontSize: 7,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    defaultText(
                                      txt: 'to ',
                                      fontSize: 7,
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Container(
                                      height: 7.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Color.fromARGB(255, 70, 117, 72),
                                      ),
                                      child: defaultText(
                                        txt: '9',
                                        fontSize: 7,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    defaultText(
                                      txt: ' years',
                                      fontSize: 7,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(children: [
                                  Image.asset(
                                    'images/surface1 (1).png',
                                    height: 5,
                                    width: 5,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  defaultText(
                                    txt: 'Date',
                                    color: Colors.white,
                                    fontSize: 7,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                      height: 10,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Color.fromARGB(255, 70, 117, 72),
                                      ),
                                      child: defaultText(
                                        txt: ' 1/6/2020',
                                        fontSize: 5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  defaultText(
                                    txt: ' to ',
                                    fontSize: 7,
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Color.fromARGB(255, 70, 117, 72),
                                    ),
                                    child: defaultText(
                                      txt: ' 1/5/2020',
                                      fontSize: 7,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.w),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'images/Rectangle 550.png',
                                        height: 50.h,
                                        width: 50.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Image.asset(
                                          'images/15.png',
                                          height: 30.h,
                                          width: 30.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Column(
                                    children: [
                                      defaultText(
                                        txt: ' Ali Ahmed',
                                        fontSize: 6,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      defaultText(
                                        txt: ' Ex 1/2/2020',
                                        fontSize: 6,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: 178.h),
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 2.5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index) => getImagePT()),
          )
        ],
      ),
    ]),
  );
}
