import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/player/balance/widget/get_gold.dart';
import 'package:sportive/module/player/balance/widget/get_silver.dart';
import 'package:sportive/module/player/home/about_me.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  final _controller = SidebarXController(selectedIndex: 1, extended: true);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return Scaffold(
            backgroundColor: mainColor,
            body: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                children: [
                  if (cubit.isCancel == true)
                    SidebarX(
                      showToggleButton: false,
                      controller: _controller,
                      theme: SidebarXTheme(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: canvasColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hoverColor: scaffoldBackgroundColor,
                        textStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        selectedTextStyle: const TextStyle(color: Colors.white),
                        itemTextPadding: const EdgeInsets.only(left: 15),
                        selectedItemTextPadding:
                            const EdgeInsets.only(left: 30),
                        itemDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: canvasColor),
                        ),
                        selectedItemDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: actionColor.withOpacity(0.37),
                          ),
                          gradient: LinearGradient(
                            colors: [accentCanvasColor, canvasColor],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.28),
                              blurRadius: 30,
                            )
                          ],
                        ),
                        iconTheme: IconThemeData(
                          color: Colors.white.withOpacity(0.7),
                          size: 20,
                        ),
                        selectedIconTheme: const IconThemeData(
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      extendedTheme: const SidebarXTheme(
                        width: 50,
                        decoration: BoxDecoration(
                          color: canvasColor,
                        ),
                      ),
                      footerDivider: divider,
                      headerBuilder: (context, extended) {
                        return SizedBox(
                          height: 20.h,
                          // child: Padding(
                          //   padding: EdgeInsets.only(
                          //       top: 50.h, left: 12.w, right: 12.w),
                          //   child: Image.asset(
                          //     'images/mohamed-salah-sportstiger.jpeg',
                          //     height: 100.h,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                        );
                      },
                      items: [
                        SidebarXItem(
                          iconWidget: Icon(
                            FontAwesomeIcons.home,
                            color: Colors.white30,
                          ),
                          label: 'Profile',
                          onTap: () {
                            nextPage(context: context, page: Home());
                          },
                        ),
                        SidebarXItem(
                            iconWidget: Icon(
                              FontAwesomeIcons.balanceScaleLeft,
                              color: Colors.white30,
                            ),
                            label: 'Balance',
                            onTap: () {
                              cubit.changeSelectedIndex1();
                            }),
                        SidebarXItem(
                            iconWidget: Icon(
                              FontAwesomeIcons.amazonPay,
                              color: Colors.white30,
                            ),
                            label: 'Upgrade membership',
                            onTap: () {
                              cubit.changeSelectedIndex2();
                            }),
                        SidebarXItem(
                            iconWidget: Icon(
                              Icons.settings,
                              color: Colors.white30,
                            ),
                            label: 'Settings',
                            onTap: () {
                              cubit.changeSelectedIndex3();
                            }),
                        SidebarXItem(
                            iconWidget: Icon(
                              FontAwesomeIcons.qrcode,
                              color: Colors.white30,
                            ),
                            label: 'QrCode',
                            onTap: () {
                              cubit.changeSelectedIndex4();
                            }),
                      ],
                    ),

                  if (cubit.isCancel == false)
                    SizedBox(
                      width: 30.w,
                    ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Image.asset(
                                'images/logospotive1.png',
                                height: 50.h,
                                width: 200.w,
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            InkWell(
                                onTap: () {
                                  cubit.changeIsCancel();
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ],
                        ),
                        if (cubit.select1 == true)
                          Padding(
                            padding: EdgeInsets.only(top: 80.h),
                            child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                width: 230.w,
                                padding: EdgeInsets.only(
                                    left: 5.h, right: 5.w, bottom: 10.h),
                                //extra 10 for top padding because triangle's height = 10
                                decoration: BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        defaultText(
                                            txt: 'Mohamed Ali',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    defaultText(
                                                        txt: 'Upload video:  ',
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    defaultText(
                                                        txt: '5/10',
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    defaultText(
                                                        txt:
                                                            'Request Contact:  ',
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    defaultText(
                                                        txt: '3/5',
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                color: Colors.orangeAccent,
                                              ),
                                              child: defaultText(
                                                  txt: ' Silver ',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r),
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                              'images/QR (1).png'),
                                                          Column(
                                                            children: [
                                                              defaultText(
                                                                  txt: ' 22 ',
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                              defaultText(
                                                                  txt:
                                                                      ' Users ',
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Column(
                                                  children: [
                                                    defaultText(
                                                        txt:
                                                            'Transfer to my subscription',
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          child: defaultText(
                                                              txt:
                                                                  ' transfere ',
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          child: defaultText(
                                                              txt:
                                                                  ' More action ',
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        if (cubit.select2 == true)
                          Padding(
                            padding: EdgeInsets.only(
                              top: 110.h,
                            ),
                            child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                padding: EdgeInsets.only(left: 10.w),
                                // height: 150.h,
                                width: 220.w,
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(children: [
                                  Stack(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              getGold(context);
                                            },
                                            child: Container(
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                children: [
                                                  Image.asset(
                                                    'images/gold2.png',
                                                    width: 100.w,
                                                    height: 170.h,
                                                    // fit: BoxFit.cover,
                                                  ),
                                                  Column(
                                                    children: [
                                                      defaultText(
                                                          txt: ' Golden ',
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                      defaultText(
                                                          txt: ' Membership ',
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      defaultText(
                                                          txt: ' more ',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.green),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              getSilver(context);
                                            },
                                            child: Container(
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                children: [
                                                  Image.asset(
                                                    'images/silver 455.png',
                                                    width: 100.w,
                                                    height: 170.h,
                                                  ),
                                                  Column(
                                                    children: [
                                                      defaultText(
                                                          txt: ' Silver ',
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                      defaultText(
                                                          txt: ' Membership ',
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                      SizedBox(
                                                        height: 20.h,
                                                      ),
                                                      defaultText(
                                                          txt: ' more ',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.green),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          mainButton(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            txt: 'renew',
                                            ontap: () {},
                                            fontWeight: FontWeight.bold,
                                          ),
                                          mainButton(
                                            colorButton: Colors.yellowAccent,
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            txt: 'Upgrade',
                                            ontap: () {},
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        if (cubit.select3 == true)
                          Padding(
                              padding: EdgeInsets.only(
                                top: 150.h,
                              ),
                              child: ClipPath(
                                clipper: TriangleClipper(),
                                child: Container(
                                  width: 220.w,
                                  padding: EdgeInsets.fromLTRB(5, 30, 5,
                                      20), //extra 10 for top padding because triangle's height = 10
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt: ' Notification ',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            mainButton(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              txt: 'on',
                                              ontap: () {},
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            mainButton(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              txt: 'of',
                                              ontap: () {},
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt: ' account ',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            mainButton(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              txt: 'Edit',
                                              ontap: () {},
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            mainButton(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              txt: 'delete',
                                              ontap: () {},
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt: ' Verify ',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            mainButton(
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              txt: 'enter your email',
                                              ontap: () {},
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            mainButton(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              txt: 'verify',
                                              ontap: () {},
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 7.h),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: defaultText(
                                                txt: ' wait for response ',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.redAccent),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                      ]),
                                ),
                              )),
                        if (cubit.select4 == true)
                          Padding(
                            padding: EdgeInsets.only(
                              top: 170.h,
                            ),
                            child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                width: 230.w,
                                padding: EdgeInsets.fromLTRB(5, 30, 5,
                                    20), //extra 10 for top padding because triangle's height = 10
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 140.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                          bottomRight: Radius.circular(20.r),
                                          bottomLeft: Radius.circular(20.r),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'images/logospotive1.png',
                                            height: 30.h,
                                            width: 130.w,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(children: [
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Image.asset(
                                              'images/CompositeLayer ).png',
                                              height: 50.h,
                                              width: 60.w,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'images/gold5.png',
                                                    height: 80.h,
                                                    width: 60.w,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 6.w, top: 8.h),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 8,
                                                                ),
                                                                defaultText(
                                                                    txt: '100',
                                                                    fontSize: 7,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                                Icon(
                                                                  Icons.share,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 8,
                                                                ),
                                                                defaultText(
                                                                    txt: '100',
                                                                    fontSize: 7,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                                Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 8,
                                                                ),
                                                                defaultText(
                                                                    txt: '100',
                                                                    fontSize: 7,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)
                                                              ],
                                                            ),
                                                            Image.asset(
                                                              'images/13 (1).png',
                                                              height: 40.h,
                                                              width: 40.w,
                                                            ),
                                                          ],
                                                        ),
                                                        defaultText(
                                                            txt: 'Ali ahmed',
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                        defaultText(
                                                            txt: 'Kick Boxing',
                                                            fontSize: 7,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    mainButton(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      txt: 'Share',
                                      ontap: () {},
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ]),
                ],
              ),
            ),
          );
        });
  }
}

class TriangleClipper extends CustomClipper<Path> {
  double radius = 10, tw = 20, th = 10; //tw & th = triangle width & height

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, th + radius);
    path.arcToPoint(Offset(size.width - radius, th),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(radius + 10 + tw, th);
    path.lineTo(radius + 10 + tw / 2,
        0); //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
    path.lineTo(radius + 10, th);
    path.lineTo(radius, th);
    path.arcToPoint(Offset(0, th + radius),
        radius: Radius.circular(radius), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
