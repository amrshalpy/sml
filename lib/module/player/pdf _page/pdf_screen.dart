import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/module/player/pdf%20_page/widgets/pdf_one.dart';

class PdfScreen extends StatelessWidget {
  PdfScreen({Key? key}) : super(key: key);
  var pageController = PageController();
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: 69.h,
          width: double.infinity,
          color: contactColor,
          child: Padding(
            padding: EdgeInsets.only(top: 4.h, left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  mainButton(
                      txt: 'update',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      ontap: () {}),
                  SizedBox(
                    width: 100.w,
                  ),
                  mainButton(
                      txt: 'Share',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      ontap: () {}),
                ]),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(onTap: () {}, child: Icon(Icons.arrow_back)),
                    Container(
                      height: 25.h,
                      width: 120.w,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                          child: defaultText(
                              txt: 'Page  ' + '${PlayerCubit.get(context).indexPage}', color: Colors.black)),
                    ),
                    InkWell(onTap: () {}, child: Icon(Icons.arrow_forward)),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 69.h),
          child: Container(
            height: 750.h,
            width: double.infinity,
            child: PageView(
              onPageChanged: (index) {
                PlayerCubit.get(context).changePage(index);
              },
              controller: pageController,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * .78,
                  child: pdfOne(
                    img: 'images/mohamed-salah-sportstiger.jpeg',
                    widgetRight: Padding(
                      padding: EdgeInsets.only(left: 197.h, top: 140.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/Group 204.png',
                            height: 60.h,
                            width: 60.w,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: defaultText(
                                txt: 'Performance',
                                color: Colors.orange,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/Group 23.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              defaultText(
                                txt: 'Running time',
                                color: Colors.yellowAccent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          defaultText(
                            txt: '100 ' + "s/100 m ",
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/verical jumb.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              defaultText(
                                txt: 'Vertical jumbing',
                                color: Colors.yellowAccent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          defaultText(
                            txt: '3',
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/long jumping di.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              defaultText(
                                txt: 'Long jumbing',
                                color: Colors.yellowAccent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          defaultText(
                            txt: '3',
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/leftting weight.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              defaultText(
                                txt: 'Lifiting weights',
                                color: Colors.yellowAccent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          defaultText(
                            txt: '3',
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/leg weight.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              defaultText(
                                txt: 'legs weights',
                                color: Colors.yellowAccent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          defaultText(
                            txt: '50',
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    widgetLeft: Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 210.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/Path 317.png',
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                      txt: 'nationality',
                                      color: Colors.yellowAccent,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                defaultText(
                                  txt: 'Egyption',
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/Path 321.png',
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                      txt: 'country',
                                      color: Colors.yellowAccent,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                defaultText(
                                  txt: 'Egypt',
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/Path 274.png',
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                      txt: 'City',
                                      color: Colors.yellowAccent,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                defaultText(
                                  txt: 'Alex',
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 3.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/surface1 (1).png',
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    defaultText(
                                      txt: 'birthday',
                                      color: Colors.yellowAccent,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                defaultText(
                                  txt: '10 March 2000',
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 8.h),
                              ]),
                          defaultText(
                            txt: 'Physical properties',
                            color: Colors.orange,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 7.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'images/gender.png',
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  defaultText(
                                    txt: 'Gender',
                                    color: Colors.yellowAccent,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                              defaultText(
                                txt: 'male',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Image.asset(
                                    'images/surface1.png',
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  defaultText(
                                    txt: 'Weight',
                                    color: Colors.yellowAccent,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                              defaultText(
                                txt: '80',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Image.asset(
                                    'images/CompositeLayer2.png',
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  defaultText(
                                    txt: 'Height',
                                    color: Colors.yellowAccent,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                              defaultText(
                                txt: '180',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 3.h),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "images/roght or left p.png",
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              defaultText(
                                txt: 'Right or left',
                                color: Colors.yellowAccent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          defaultText(
                            txt: 'right',
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    playerName: 'Mohamed Salah',
                    playerGame: 'football player',
                    nameGame: 'gool keeper',
                  ),
                ),
                Container(
                  // height: Me.hdiaQuery.of(context).size.height * ..h78,
                  child: pdfOne(
                    img: 'images/mohamed-salah-sportstiger.jpeg',
                    widgetRight: Padding(
                      padding: EdgeInsets.only(
                        left: 186.w,
                        top: 100.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 50.w,
                            ),
                            child: Image.asset(
                              'images/Group 204.png',
                              height: 60.h,
                              width: 60.w,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Stack(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'images/Path 403.png',
                                    height: 180.h,
                                    width: 230.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 71.w,
                                      // top: 7.h,
                                      // bottom: 30.h,
                                    ),
                                    child: Image.asset(
                                        'images/sportıve ıcon (2).png'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 22.h, left: 13.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/club.png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'Club name',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 1,.h
                                    // ),
                                    defaultText(
                                      txt: 'Liverbool ',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // SizedBox(
                                    //   height: 1,.h
                                    // ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/surface1 (1).png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'Starting date',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 1,.h
                                    // ),
                                    defaultText(
                                      txt: '3/3/2019',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/surface1 (1).png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'Ending date',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    defaultText(
                                      txt: '5/3/2020',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/surface1 (3).png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'League type',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    defaultText(
                                      txt: 'first league',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/position.png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'Position',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    defaultText(
                                      txt: 'goal keeper',
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    widgetLeft: Padding(
                        padding:
                            EdgeInsets.only(left: 3.w, top: 50.h, right: 10.w),
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 170.w),
                                  child: Image.asset('images/Path 403.png',
                                      height: 180.h, width: 230.w),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 72.w,
                                    // top: 3.h,
                                  ),
                                  child: Image.asset(
                                      'images/sportıve ıcon (2).png'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 22.h, right: 180.w, left: 15.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/club.png',
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      defaultText(
                                        txt: 'Club name',
                                        color: Colors.yellowAccent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 1,.h
                                  // ),
                                  defaultText(
                                    txt: 'Liverbool ',
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // SizedBox(
                                  //   height: 1,.h
                                  // ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/surface1 (1).png',
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      defaultText(
                                        txt: 'Starting date',
                                        color: Colors.yellowAccent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 1,.h
                                  // ),
                                  defaultText(
                                    txt: '3/3/2019',
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // SizedBox(
                                  //   height: 2,.h
                                  // ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/surface1 (1).png',
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      defaultText(
                                        txt: 'Ending date',
                                        color: Colors.yellowAccent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 2,.h
                                  // ),
                                  defaultText(
                                    txt: '5/3/2020',
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/surface1 (3).png',
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      defaultText(
                                        txt: 'League type',
                                        color: Colors.yellowAccent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 2,.h
                                  // ),
                                  defaultText(
                                    txt: 'first league',
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/position.png',
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      defaultText(
                                        txt: 'Position',
                                        color: Colors.yellowAccent,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 2,.h
                                  // ),
                                  defaultText(
                                    txt: 'goal keeper',
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    playerName: 'Mohamed Salah',
                    playerGame: 'football player',
                    nameGame: 'gool keeper',
                  ),
                ),
                Container(
                  // height: Me.hdiaQuery.of(context).size.height * ..h78,
                  child: pdfOne(
                    img: 'images/mohamed-salah-sportstiger.jpeg',
                    widgetRight: Padding(
                      padding: EdgeInsets.only(left: 194.w, top: 90.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 50.w,
                            ),
                            child: Image.asset(
                              'images/Group 204.png',
                              height: 70.h,
                              width: 70.w,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Stack(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'images/Path 403.png',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 67.w,
                                      bottom: 4.h,
                                    ),
                                    child: Image.asset(
                                        'images/sportıve ıcon (2).png'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 18.h, left: 2.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/club.png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        defaultText(
                                          txt: 'Club name',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 1,.h
                                    // ),
                                    defaultText(
                                      txt: 'Liverbool ',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // SizedBox(
                                    //   height: 1,.h
                                    // ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/surface1 (1).png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'Starting date',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 1,.h
                                    // ),
                                    defaultText(
                                      txt: '3/3/2019',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/surface1 (1).png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'Ending date',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    defaultText(
                                      txt: '5/3/2020',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/surface1 (3).png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'League type',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    defaultText(
                                      txt: 'first league',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'images/position.png',
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                          txt: 'Position',
                                          color: Colors.yellowAccent,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 2,.h
                                    // ),
                                    defaultText(
                                      txt: 'goal keeper',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    widgetLeft: Padding(
                        padding: EdgeInsets.only(left: 3.w, top: 50.h),
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 172.w, top: 20.h),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'images/Path 404.png',
                                        width: 180.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 82.w,
                                          bottom: 12.h,
                                        ),
                                        child: Image.asset(
                                            'images/sportıve ıcon (2).png'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 18.h, left: 2.w),
                                  child: Row(children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    RotatedBox(
                                        quarterTurns: 3,
                                        child: defaultText(
                                            txt: 'mobile number',
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: defaultText(
                                          txt: '20',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      height: 25.h,
                                      width: 35.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      height: 25.h,
                                      width: 90.w,
                                      color: Colors.white,
                                      child: Center(
                                        child: defaultText(
                                          txt: '1222899777',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 172.w, top: 16.h),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'images/Path 404.png',
                                        width: 180.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 82.w,
                                          bottom: 12.h,
                                        ),
                                        child: Image.asset(
                                            'images/sportıve ıcon (2).png'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 18.h, left: 2.w),
                                  child: Row(children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    RotatedBox(
                                        quarterTurns: 3,
                                        child: defaultText(
                                            txt: 'mobile number',
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: defaultText(
                                          txt: '20',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      height: 25.h,
                                      width: 35.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      height: 25.h,
                                      width: 90.w,
                                      color: Colors.white,
                                      child: Center(
                                        child: defaultText(
                                          txt: '1222899777',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 172.w, top: 16.h),
                                  child: Stack(
                                    children: [
                                      Image.asset('images/Path 404.png',
                                          width: 180.w),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 82.w,
                                          bottom: 12.h,
                                        ),
                                        child: Image.asset(
                                            'images/sportıve ıcon (2).png'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 18.h, left: 2.w),
                                  child: Row(children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    RotatedBox(
                                        quarterTurns: 3,
                                        child: defaultText(
                                            txt: 'mobile number',
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: defaultText(
                                          txt: '20',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      height: 25.h,
                                      width: 35.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      height: 25.h,
                                      width: 90.w,
                                      color: Colors.white,
                                      child: Center(
                                        child: defaultText(
                                          txt: '1222899777',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            )
                          ],
                        )),
                    playerName: 'Mohamed Salah',
                    playerGame: 'football player',
                    nameGame: 'gool keeper',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
