import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/constants/constants.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/coach/pdf%20_page/view_pdf.dart';
import 'package:sportive/module/player/pdf%20_page/widgets/pdf_one.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class PdfScreen extends StatefulWidget {
  PdfScreen({Key? key}) : super(key: key);

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  var pageController = PageController();

  int index = 1;
  int index1 = 0;
  int index2 = 1;
  int index3 = 2;
  int index4 = 3;

  String page = '1';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return cubit.getProfileData != null
              ? Stack(
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
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  mainButton(
                                      txt: 'update',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      ontap: () {}),
                                  SizedBox(
                                    width: 100.w,
                                  ),
                                  mainButton(
                                      txt: 'View',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      ontap: () {
                                        nextPage(
                                            context: context, page: ViewPdf());
                                      }),
                                ]),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {
                                      pageController.previousPage(
                                          duration: Duration(microseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                    child: Icon(Icons.arrow_back)),
                                Container(
                                  height: 25.h,
                                  width: 120.w,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Center(
                                      child: defaultText(
                                          txt: 'Page  ' + page,
                                          color: Colors.black)),
                                ),
                                InkWell(
                                    onTap: () {
                                      pageController.nextPage(
                                          duration: Duration(microseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                    child: Icon(Icons.arrow_forward)),
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
                            if (index == 0) {
                              setState(() {
                                page = '1';
                              });
                            } else if (index == 1) {
                              setState(() {
                                page = '2';
                              });
                            } else if (index == 2) {
                              setState(() {
                                page = '3';
                              });
                            } else {
                              setState(() {
                                page = '4';
                              });
                            }
                          },
                          controller: pageController,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              // height: MediaQuery.of(context).size.height * .78,
                              child: pdfOne(
                                img: cubit.getProfileData!.data!.user!.image ==
                                        ''
                                    ? 'https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg'
                                    : kUrl +
                                        '${cubit.getProfileData!.data!.user!.image}',
                                widgetRight: Padding(
                                  padding:
                                      EdgeInsets.only(left: 200.w, top: 110.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'images/Group 204.png',
                                        height: 60.h,
                                        width: 60.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 5.w,
                                          left: 5.w,
                                        ),
                                        child: Column(
                                          children: [
                                            cubit.getProfileData!.data!.user!
                                                            .certificates !=
                                                        null &&
                                                    cubit
                                                            .getProfileData!
                                                            .data!
                                                            .user!
                                                            .certificates!
                                                            .length >
                                                        index1
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 3.h),
                                                    child: Container(
                                                      height: 69.h,
                                                      width: 187.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .yellowAccent,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.r),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.r),
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4.h,
                                                                left: 10.w,
                                                                right: 10.w),
                                                        child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  defaultText(
                                                                      txt: cubit.getProfileData!.data!.user!.certificates![0].date == ''
                                                                          ? '--/--'
                                                                          : '${cubit.getProfileData!.data!.user!.certificates![0].date}',
                                                                      color:
                                                                          hintColor,
                                                                      fontSize:
                                                                          13.sp),
                                                                  Image.asset(
                                                                    'images/certifcate.png',
                                                                    height:
                                                                        25.h,
                                                                    width: 25.w,
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              defaultText(
                                                                  txt: cubit
                                                                              .getProfileData!
                                                                              .data!
                                                                              .user!
                                                                              .certificates![
                                                                                  0]
                                                                              .name ==
                                                                          ''
                                                                      ? '--/--'
                                                                      : '${cubit.getProfileData!.data!.user!.certificates![0].name}',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.sp),
                                                            ]),
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 3.h),
                                                    child: Container(
                                                      height: 69.h,
                                                      width: 187.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .yellowAccent,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.r),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.r),
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4.h,
                                                                left: 10.w,
                                                                right: 10.w),
                                                        child:
                                                            Column(children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              defaultText(
                                                                  txt: '--/--',
                                                                  color:
                                                                      hintColor,
                                                                  fontSize:
                                                                      13.sp),
                                                              Image.asset(
                                                                'images/certifcate.png',
                                                                height: 25.h,
                                                                width: 25.w,
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 3.h,
                                                          ),
                                                          defaultText(
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                            cubit.getProfileData!.data!.user!
                                                            .certificates !=
                                                        null &&
                                                    cubit
                                                            .getProfileData!
                                                            .data!
                                                            .user!
                                                            .certificates!
                                                            .length >
                                                        index2
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 3.h),
                                                    child: Container(
                                                      height: 69.h,
                                                      width: 187.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .yellowAccent,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.r),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.r),
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4.h,
                                                                left: 10.w,
                                                                right: 10.w),
                                                        child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  defaultText(
                                                                      txt: cubit.getProfileData!.data!.user!.certificates![1].date == ""
                                                                          ? '--/--'
                                                                          : "${cubit.getProfileData!.data!.user!.certificates![1].date}",
                                                                      color:
                                                                          hintColor,
                                                                      fontSize:
                                                                          13.sp),
                                                                  Image.asset(
                                                                    'images/certifcate.png',
                                                                    height:
                                                                        25.h,
                                                                    width: 25.w,
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              defaultText(
                                                                  txt: cubit
                                                                              .getProfileData!
                                                                              .data!
                                                                              .user!
                                                                              .certificates![
                                                                                  1]
                                                                              .name ==
                                                                          ""
                                                                      ? '--/--'
                                                                      : '${cubit.getProfileData!.data!.user!.certificates![1].name}',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.sp),
                                                            ]),
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 3.h),
                                                    child: Container(
                                                      height: 69.h,
                                                      width: 187.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .yellowAccent,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.r),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.r),
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4.h,
                                                                left: 10.w,
                                                                right: 10.w),
                                                        child:
                                                            Column(children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              defaultText(
                                                                  txt: '--/--',
                                                                  color:
                                                                      hintColor,
                                                                  fontSize:
                                                                      13.sp),
                                                              Image.asset(
                                                                'images/certifcate.png',
                                                                height: 25.h,
                                                                width: 25.w,
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 3.h,
                                                          ),
                                                          defaultText(
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                            cubit.getProfileData!.data!.user!
                                                            .certificates !=
                                                        null &&
                                                    cubit
                                                            .getProfileData!
                                                            .data!
                                                            .user!
                                                            .certificates!
                                                            .length >
                                                        index3
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 2.h),
                                                    child: Container(
                                                      height: 69.h,
                                                      width: 187.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .yellowAccent,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.r),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.r),
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4.h,
                                                                left: 10.w,
                                                                right: 10.w),
                                                        child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  defaultText(
                                                                      txt: cubit.getProfileData!.data!.user!.certificates![2].date == ""
                                                                          ? '--/--'
                                                                          : '${cubit.getProfileData!.data!.user!.certificates![2].date}',
                                                                      color:
                                                                          hintColor,
                                                                      fontSize:
                                                                          13.sp),
                                                                  Image.asset(
                                                                    'images/certifcate.png',
                                                                    height:
                                                                        25.h,
                                                                    width: 25.w,
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              defaultText(
                                                                  txt: cubit
                                                                              .getProfileData!
                                                                              .data!
                                                                              .user!
                                                                              .certificates![
                                                                                  2]
                                                                              .name ==
                                                                          ""
                                                                      ? '--/--'
                                                                      : "${cubit.getProfileData!.data!.user!.certificates![2].name}",
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.sp),
                                                            ]),
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 2.h),
                                                    child: Container(
                                                      height: 69.h,
                                                      width: 187.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .yellowAccent,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.r),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.r),
                                                          )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 4.h,
                                                                left: 10.w,
                                                                right: 10.w),
                                                        child:
                                                            Column(children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              defaultText(
                                                                  txt: '--/--',
                                                                  color:
                                                                      hintColor,
                                                                  fontSize:
                                                                      13.sp),
                                                              Image.asset(
                                                                'images/certifcate.png',
                                                                height: 25.h,
                                                                width: 25.w,
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 3.h,
                                                          ),
                                                          defaultText(
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                widgetLeft: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.h, right: 210.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                            cubit.getProfileData!.data!.user!
                                                        .nationality!.name ==
                                                    ""
                                                ? defaultText(
                                                    txt: '--/--',
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                : defaultText(
                                                    txt:
                                                        '${cubit.getProfileData!.data!.user!.nationality!.name}',
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
                                            cubit.getProfileData!.data!.user!
                                                        .country!.name ==
                                                    ''
                                                ? defaultText(
                                                    txt: '--/--',
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                : defaultText(
                                                    txt:
                                                        '${cubit.getProfileData!.data!.user!.country!.name}',
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
                                            cubit.getProfileData!.data!.user!
                                                        .city!.name ==
                                                    ''
                                                ? defaultText(
                                                    txt: '--/--',
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                : defaultText(
                                                    txt:
                                                        '${cubit.getProfileData!.data!.user!.city!.name}',
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
                                            cubit.getProfileData!.data!.user!
                                                        .birthDate ==
                                                    ''
                                                ? defaultText(
                                                    txt: '--/--',
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                : defaultText(
                                                    txt:
                                                        '${cubit.getProfileData!.data!.user!.birthDate}',
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            SizedBox(height: 8.h),
                                          ]),
                                      defaultText(
                                        txt: 'Certificates',
                                        color: Colors.orange,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      SizedBox(height: 7.h),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: defaultText(
                                          txt: 'total certificates 4',
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 7.h),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 3.h),
                                        child: Container(
                                          height: 69.h,
                                          width: 187.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.yellowAccent,
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20.r),
                                                topLeft: Radius.circular(20.r),
                                              )),
                                          child: cubit.getProfileData!.data!
                                                          .user!.certificates !=
                                                      null &&
                                                  cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .certificates!
                                                          .length >
                                                      index4
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4.h,
                                                      left: 10.w,
                                                      right: 10.w),
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        defaultText(
                                                            txt: cubit
                                                                        .getProfileData!
                                                                        .data!
                                                                        .user!
                                                                        .certificates![
                                                                            3]
                                                                        .date ==
                                                                    ''
                                                                ? '--/--'
                                                                : "${cubit.getProfileData!.data!.user!.certificates![3].date}",
                                                            color: Colors.grey,
                                                            fontSize: 14.sp),
                                                        Image.asset(
                                                          'images/certifcate.png',
                                                          height: 25.h,
                                                          width: 25.w,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    defaultText(
                                                        txt: cubit
                                                                    .getProfileData!
                                                                    .data!
                                                                    .user!
                                                                    .certificates![
                                                                        3]
                                                                    .name ==
                                                                ''
                                                            ? '--/--'
                                                            : "${cubit.getProfileData!.data!.user!.certificates![3].name}",
                                                        color: Colors.white,
                                                        fontSize: 14.sp),
                                                  ]),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4.h,
                                                      left: 10.w,
                                                      right: 10.w),
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        defaultText(
                                                            txt: '--/--',
                                                            color: Colors.grey,
                                                            fontSize: 14.sp),
                                                        Image.asset(
                                                          'images/certifcate.png',
                                                          height: 25.h,
                                                          width: 25.w,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 14.sp),
                                                  ]),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                playerName: cubit
                                            .getProfileData!.data!.user!.name ==
                                        ""
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.name}',
                                playerGame: cubit.getProfileData!.data!.user!
                                            .sport!.name ==
                                        ""
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.sport!.name}',
                                nameGame: cubit.getProfileData!.data!.user!
                                            .position!.name ==
                                        ""
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.position!.name}',
                              ),
                            ),
                            Container(
                              // height: Me.hdiaQuery.of(context).size.height * ..h78,
                              child: pdfOne(
                                img: cubit.getProfileData!.data!.user!.image ==
                                        ''
                                    ? 'https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg'
                                    : kUrl +
                                        '${cubit.getProfileData!.data!.user!.image}',
                                widgetRight: Padding(
                                  padding: EdgeInsets.only(
                                    left: 186.w,
                                    top: 160.h,
                                  ),
                                  child: cubit.getProfileData!.data!.user!
                                                  .experiences !=
                                              null &&
                                          cubit.getProfileData!.data!.user!
                                                  .experiences!.length >
                                              index1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
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
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 3.w),
                                                      child: Image.asset(
                                                        'images/Path 403.png',
                                                        height: 180.h,
                                                        width: 210.w,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 81.w,
                                                      ),
                                                      child: Image.asset(
                                                          'images/sportıve ıcon (2).png'),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 22.h, left: 13.w),
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 1,.h
                                                      // ),
                                                      cubit
                                                                  .getProfileData!
                                                                  .data!
                                                                  .user!
                                                                  .experiences![
                                                                      0]
                                                                  .clubName ==
                                                              ''
                                                          ? defaultText(
                                                              txt: '--/-- ',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          : defaultText(
                                                              txt:
                                                                  '${cubit.getProfileData!.data!.user!.experiences![0].clubName} ',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                            txt:
                                                                'Starting date',
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 1,.h
                                                      // ),
                                                      cubit
                                                                  .getProfileData!
                                                                  .data!
                                                                  .user!
                                                                  .experiences![
                                                                      0]
                                                                  .startDate ==
                                                              ''
                                                          ? defaultText(
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          : defaultText(
                                                              txt:
                                                                  '${cubit.getProfileData!.data!.user!.experiences![0].startDate}',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 2,.h
                                                      // ),
                                                      cubit
                                                                  .getProfileData!
                                                                  .data!
                                                                  .user!
                                                                  .experiences![
                                                                      0]
                                                                  .endDate ==
                                                              ''
                                                          ? defaultText(
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          : defaultText(
                                                              txt:
                                                                  '${cubit.getProfileData!.data!.user!.experiences![0].endDate}',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 2,.h
                                                      // ),
                                                      cubit
                                                                  .getProfileData!
                                                                  .data!
                                                                  .user!
                                                                  .experiences![
                                                                      0]
                                                                  .leagueType ==
                                                              ''
                                                          ? defaultText(
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          : defaultText(
                                                              txt:
                                                                  '${cubit.getProfileData!.data!.user!.experiences![0].leagueType}',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 2,.h
                                                      // ),
                                                      cubit
                                                                  .getProfileData!
                                                                  .data!
                                                                  .user!
                                                                  .experiences![
                                                                      0]
                                                                  .position!
                                                                  .name ==
                                                              ''
                                                          ? defaultText(
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          : defaultText(
                                                              txt:
                                                                  '${cubit.getProfileData!.data!.user!.experiences![0].position!.name}',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
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
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 3.w),
                                                      child: Image.asset(
                                                        'images/Path 403.png',
                                                        height: 180.h,
                                                        width: 210.w,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 81.w,
                                                      ),
                                                      child: Image.asset(
                                                          'images/sportıve ıcon (2).png'),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 22.h, left: 13.w),
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 1,.h
                                                      // ),
                                                      defaultText(
                                                        txt: '--/-- ',
                                                        color: Colors.white,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                            txt:
                                                                'Starting date',
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 1,.h
                                                      // ),
                                                      defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 2,.h
                                                      // ),
                                                      defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 2,.h
                                                      // ),
                                                      defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      // SizedBox(
                                                      //   height: 2,.h
                                                      // ),
                                                      defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                    padding: EdgeInsets.only(
                                        left: 3.w, top: 50.h, right: 10.w),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: 170.w,
                                              ),
                                              child: Image.asset(
                                                  'images/Path 403.png',
                                                  height: 180.h,
                                                  width: 210.w),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 82.w,
                                                // top: 3.h,
                                              ),
                                              child: Image.asset(
                                                  'images/sportıve ıcon (2).png'),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 22.h,
                                              right: 180.w,
                                              left: 15.w),
                                          child: cubit.getProfileData!.data!
                                                          .user!.experiences !=
                                                      null &&
                                                  cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .experiences!
                                                          .length >
                                                      index2
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 1,.h
                                                    // ),
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .experiences![1]
                                                                .clubName ==
                                                            ''
                                                        ? defaultText(
                                                            txt: '--/-- ',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences![1].clubName} ',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),

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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 1,.h
                                                    // ),
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .experiences![1]
                                                                .startDate ==
                                                            ''
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences![1].startDate}',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 2,.h
                                                    // ),
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .experiences![1]
                                                                .endDate ==
                                                            ''
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences![1].endDate}',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 2,.h
                                                    // ),
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .experiences![1]
                                                                .leagueType ==
                                                            ''
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences![1].leagueType}',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 2,.h
                                                    // ),
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .experiences![1]
                                                                .position!
                                                                .name ==
                                                            ''
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences![1].position!.name}',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          color: Colors
                                                              .yellowAccent,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ],
                                    )),
                                playerName: cubit
                                            .getProfileData!.data!.user!.name ==
                                        ''
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.name}',
                                playerGame: cubit.getProfileData!.data!.user!
                                            .sport!.name ==
                                        ''
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.sport!.name}',
                                nameGame: cubit.getProfileData!.data!.user!
                                            .position!.name ==
                                        ''
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.position!.name}',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  top: 10.h,
                                  bottom: 10.h),
                              child: Container(
                                child: Image.asset(
                                  'images/540x382-1_-BgtS.png',
                                  height: 584.h,
                                  width: 416.w,
                                ),
                              ),
                            ),
                            Container(
                              // height: Me.hdiaQuery.of(context).size.height * ..h78,
                              child: pdfOne(
                                img: cubit.getProfileData!.data!.user!.image ==
                                        ''
                                    ? 'https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg'
                                    : kUrl +
                                        '${cubit.getProfileData!.data!.user!.image}',
                                widgetRight: Padding(
                                  padding:
                                      EdgeInsets.only(left: 194.w, top: 90.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                        height: 15.h,
                                      ),
                                      defaultText(
                                        txt: 'Courses',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orangeAccent,
                                      ),
                                      defaultText(
                                        txt:
                                            'visit my account sportive community App',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: hintColor,
                                      ),
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Image.asset(
                                            'images/gold5.png',
                                            height: 205.h,
                                            width: 127.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 29.w,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Icon(
                                                          Icons.favorite,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                        defaultText(
                                                            txt: '100',
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                        Icon(
                                                          Icons.share,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                        defaultText(
                                                            txt: '100',
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                        Icon(
                                                          Icons.favorite,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                        defaultText(
                                                            txt: '100',
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black)
                                                      ],
                                                    ),
                                                    Image.asset(
                                                      'images/13 (1).png',
                                                      height: 100.h,
                                                      width: 80.w,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      defaultText(
                                                          txt: cubit
                                                                      .getProfileData!
                                                                      .data!
                                                                      .user!
                                                                      .name ==
                                                                  ''
                                                              ? '--/--'
                                                              : '${cubit.getProfileData!.data!.user!.name}',
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                      defaultText(
                                                          txt: cubit
                                                                      .getProfileData!
                                                                      .data!
                                                                      .user!
                                                                      .sport!
                                                                      .name ==
                                                                  ''
                                                              ? '--/--'
                                                              : '${cubit.getProfileData!.data!.user!.name}',
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                widgetLeft: Padding(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 178.w, top: 35.h),
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'images/Path 404.png',
                                                    width: 205.w,
                                                    height: 86.h,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 84.w,
                                                      top: 10.h,
                                                    ),
                                                    child: Image.asset(
                                                        'images/sportıve ıcon (2).png'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 26.h, left: 10.w),
                                              child: Row(children: [
                                                Icon(
                                                  Icons.phone,
                                                  color: Colors.white,
                                                ),
                                                RotatedBox(
                                                    quarterTurns: 3,
                                                    child: defaultText(
                                                        txt: 'mobile number',
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    color: Colors.white,
                                                  ),
                                                  child: Center(
                                                    child: defaultText(
                                                      txt: '20',
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  height: 20.h,
                                                  width: 25.w,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  height: 20.h,
                                                  width: 70.w,
                                                  child: Center(
                                                    child: defaultText(
                                                      txt: '1222899777',
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: 178.w,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'images/Path 404.png',
                                                    width: 205.w,
                                                    height: 86.h,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 86.w,
                                                      top: 11.h,
                                                    ),
                                                    child: Image.asset(
                                                        'images/sportıve ıcon (2).png'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 7.h, left: 10.w),
                                              child: Row(children: [
                                                Icon(
                                                  Icons.phone,
                                                  color: Colors.white,
                                                ),
                                                RotatedBox(
                                                    quarterTurns: 3,
                                                    child: defaultText(
                                                        txt: 'mobile number',
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    color: Colors.white,
                                                  ),
                                                  child: Center(
                                                    child: defaultText(
                                                      txt: '20',
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  height: 20.h,
                                                  width: 25.w,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  height: 20.h,
                                                  width: 70.w,
                                                  child: Center(
                                                    child: defaultText(
                                                      txt: '1222899777',
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 178.w),
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'images/Path 404.png',
                                                    width: 205.w,
                                                    height: 86.h,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 86.w,
                                                      top: 11.h,
                                                    ),
                                                    child: Image.asset(
                                                        'images/sportıve ıcon (2).png'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 8.h, left: 10.w),
                                              child: Row(children: [
                                                Icon(
                                                  Icons.phone,
                                                  color: Colors.white,
                                                ),
                                                RotatedBox(
                                                    quarterTurns: 3,
                                                    child: defaultText(
                                                        txt: 'mobile number',
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    color: Colors.white,
                                                  ),
                                                  child: Center(
                                                    child: defaultText(
                                                      txt: '20',
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  height: 20.h,
                                                  width: 25.w,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  height: 20.h,
                                                  width: 70.w,
                                                  child: Center(
                                                    child: defaultText(
                                                      txt: '1222899777',
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                playerName: cubit
                                            .getProfileData!.data!.user!.name ==
                                        ''
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.name}',
                                playerGame: cubit.getProfileData!.data!.user!
                                            .sport!.name ==
                                        ''
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.sport!.name}',
                                nameGame:cubit.getProfileData!.data!.user!
                                            .position!.name ==
                                        ''
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.position!.name}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 97.h),
                    child: Column(
                      children: [
                        Lottie.asset('assets/33283-plik-pdf.json'),
                        SizedBox(
                          height: 10,
                        ),
                        defaultText(
                            txt: 'Please complete your profile ',
                            color: Colors.white10,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),
                );
        });
  }
}
