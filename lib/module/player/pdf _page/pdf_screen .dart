import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/constants/constants.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/coach/pdf%20_page/view_pdf.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/module/player/pdf%20_page/widgets/pdf_one.dart';
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

  String page = '1';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return
              //  Center(
              //         child: Padding(
              //           padding: EdgeInsets.only(top: 97.h),
              //           child: Column(
              //             children: [
              //               Lottie.asset('assets/33283-plik-pdf.json'),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               defaultText(
              //                   txt: 'Please complete your profile ',
              //                   color: Colors.white10,
              //                   fontSize: 16.sp,
              //                   fontWeight: FontWeight.bold)
              //             ],
              //           ),
              //         ),
              //       )

              Stack(
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
                                ontap: () async {
                                  nextPage(context: context, page: ViewPdf());
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
                            decoration: BoxDecoration(color: Colors.white),
                            child: Center(
                                child: defaultText(
                                    txt: 'Page  ' + page, color: Colors.black)),
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
                      } else {
                        setState(() {
                          page = '3';
                        });
                      }
                    },
                    controller: pageController,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      cubit.getProfileData != null
                          ? Container(
                              // height: MediaQuery.of(context).size.height * .78,
                              child: pdfOne(
                                img: cubit.getProfileData!.data!.user!.image ==
                                        null
                                    ? 'https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg'
                                    : kUrl+'${cubit.getProfileData!.data!.user!.image}',
                                widgetRight: Padding(
                                  padding:
                                      EdgeInsets.only(left: 197.h, top: 140.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/Group 204.png')),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9.h,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
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
                                    
                                      cubit.getProfileData!.data!.user!
                                                  .performance!.runTime ==
                                              null
                                          ? defaultText(
                                              txt: '--/--',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : defaultText(
                                              txt:
                                                  '${cubit.getProfileData!.data!.user!.performance!.runTime}',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.normal),
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
                                      cubit
                                                  .getProfileData!
                                                  .data!
                                                  .user!
                                                  .performance!
                                                  .verticalJumpDistance ==
                                              null
                                          ? defaultText(
                                              txt: '--/--',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : defaultText(
                                              txt:
                                                  '${cubit.getProfileData!.data!.user!.performance!.verticalJumpDistance}',
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
                                      cubit
                                                  .getProfileData!
                                                  .data!
                                                  .user!
                                                  .performance!
                                                  .longJumpDistance ==
                                              null
                                          ? defaultText(
                                              txt: '--/--',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : defaultText(
                                              txt:
                                                  '${cubit.getProfileData!.data!.user!.performance!.longJumpDistance}',
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
                                      cubit.getProfileData!.data!.user!
                                                  .performance!.liftingWeight ==
                                              null
                                          ? defaultText(
                                              txt: '--/--',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : defaultText(
                                              txt:
                                                  '${cubit.getProfileData!.data!.user!.performance!.liftingWeight}',
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
                                      cubit
                                                  .getProfileData!
                                                  .data!
                                                  .user!
                                                  .performance!
                                                  .liftingWeightLeg ==
                                              null
                                          ? defaultText(
                                              txt: '--/--',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : defaultText(
                                              txt:
                                                  '${cubit.getProfileData!.data!.user!.performance!.liftingWeightLeg}',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                                    null
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
                                                    null
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
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 4.h),
                                            cubit.getProfileData!.data!.user!
                                                        .city!.name ==
                                                    null
                                                ? defaultText(
                                                    txt: '--/--',
                                                    color: Colors.white,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                : defaultText(
                                                    txt:
                                                        '${cubit.getProfileData!.data!.user!.city!.name}',
                                                    color: Colors.yellowAccent,
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
                                                    null
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
                                        txt: 'Physical properties',
                                        color: Colors.orange,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(height: 7.h),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                          cubit.getProfileData!.data!.user!
                                                      .gender ==
                                                  null
                                              ? defaultText(
                                                  txt: ' --/--',
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                )
                                              : defaultText(
                                                  txt:
                                                      ' ${cubit.getProfileData!.data!.user!.gender}',
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
                                          cubit.getProfileData!.data!.user!
                                                      .weight ==
                                                  null
                                              ? defaultText(
                                                  txt: '--/--',
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                )
                                              : defaultText(
                                                  txt:
                                                      '${cubit.getProfileData!.data!.user!.weight}',
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
                                          cubit.getProfileData!.data!.user!
                                                      .height ==
                                                  null
                                              ? defaultText(
                                                  txt: '--/--',
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                )
                                              : defaultText(
                                                  txt:
                                                      '${cubit.getProfileData!.data!.user!.height}',
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
                                      cubit.getProfileData!.data!.user!
                                                  .performance!.right ==
                                              null
                                          ? defaultText(
                                              txt: '--/--',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : defaultText(
                                              txt:
                                                  '${cubit.getProfileData!.data!.user!.performance!.right}',
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                    ],
                                  ),
                                ),
                                playerName: cubit
                                            .getProfileData!.data!.user!.name ==
                                        null
                                    ? '--/--'
                                    : cubit.getProfileData!.data!.user!.name,
                                playerGame: cubit.getProfileData!.data!.user!
                                            .position!.name ==
                                        null
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.position!.name}',
                                nameGame: cubit.getProfileData!.data!.user!
                                            .sport!.name ==
                                        null
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.sport!.name}',
                              ),
                            )
                          : Container(
                              // height: MediaQuery.of(context).size.height * .78,
                              child: pdfOne(
                                img: 'images/mohamed-salah-sportstiger.jpeg',
                                widgetRight: Padding(
                                  padding:
                                      EdgeInsets.only(left: 197.h, top: 140.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/Group 204.png')),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9.h,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.topStart,
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
                                        txt: '--/--',
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
                                        txt: '--/--',
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
                                        txt: '--/--',
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
                                        txt: '--/--',
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
                                        txt: '--/--',
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                            defaultText(
                                              txt: '--/--',
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
                                              txt: '--/--',
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
                                              txt: '--/--',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                            txt: ' --/--',
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
                                            txt: '--/--',
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
                                            txt: '--/--',
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
                                        txt: '--/--',
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                playerName: '--/--',
                                playerGame: '--/--',
                                nameGame: '--/--',
                              ),
                            ),
                      cubit.getPlayerData != null
                          ? Container(
                              // height: Me.hdiaQuery.of(context).size.height * ..h78,
                              child: pdfOne(
                                img: cubit.getProfileData!.data!.user!.image ==
                                        null
                                    ? 'https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg'
                                    : kUrl+'${cubit.getProfileData!.data!.user!.image}',
                                widgetRight: Padding(
                                  padding: EdgeInsets.only(
                                    left: 186.w,
                                    top: 100.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 50.w,
                                        ),
                                        child: Container(
                                          height: 60.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/Group 204.png')),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      cubit.getProfileData!.data!.user!
                                                      .experiences !=
                                                  null &&
                                              cubit.getProfileData!.data!.user!
                                                      .experiences!.length >
                                                  index1
                                          ? Stack(
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
                                                                  .experiences!
                                                                  .elementAt(
                                                                      index1)
                                                                  .clubName ==
                                                              null
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
                                                                  '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index1).clubName}',
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
                                                                  .experiences!
                                                                  .elementAt(
                                                                      index1)
                                                                  .clubName ==
                                                              null
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
                                                                  '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index1).clubName}',
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
                                                                  .experiences!
                                                                  .elementAt(
                                                                      index1)
                                                                  .endDate ==
                                                              null
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
                                                              txt: '--/--',
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
                                                      defaultText(
                                                        // txt: '--/--',
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
                                          : Stack(
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
                                                                  .clubName ==
                                                              null
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
                                                                  '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index1).clubName}',
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
                                                                  .experiences!
                                                                  .elementAt(
                                                                      index1)
                                                                  .startDate ==
                                                              null
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
                                                                  '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index1).startDate}',
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
                                                                  .experiences!
                                                                  .elementAt(
                                                                      index1)
                                                                  .endDate ==
                                                              null
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
                                                                  '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index1).endDate}',
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
                                                                  .experiences!
                                                                  .elementAt(
                                                                      index1)
                                                                  .leagueType ==
                                                              null
                                                          ? defaultText(
                                                              // txt: '--/--',
                                                              txt: '--/--',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )
                                                          : defaultText(
                                                              // txt: '--/--',
                                                              txt:
                                                                  '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index1).leagueType}',
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
                                                                  .experiences!
                                                                  .elementAt(
                                                                      index1)
                                                                  .position!.name ==
                                                              null
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
                                                                  '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index1).position!.name}',
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
                                  ),
                                ),
                                widgetLeft: Padding(
                                    padding: EdgeInsets.only(
                                        left: 3.w, top: 50.h, right: 10.w),
                                    child: cubit.getProfileData!.data!.user!
                                                    .experiences !=
                                                null &&
                                            cubit.getProfileData!.data!.user!
                                                    .experiences!.length >
                                                index2
                                        ? Stack(
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 170.w),
                                                    child: Image.asset(
                                                        'images/Path 403.png',
                                                        height: 180.h,
                                                        width: 230.w),
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
                                                    top: 22.h,
                                                    right: 180.w,
                                                    left: 15.w),
                                                child: Column(
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
                                                                .experiences!
                                                                .elementAt(
                                                                    index2)
                                                                .clubName ==
                                                            null
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index2).clubName}',
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
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .experiences!
                                                                .elementAt(
                                                                    index2)
                                                                .startDate ==
                                                            null
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index2).startDate}',
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
                                                                .experiences!
                                                                .elementAt(
                                                                    index2)
                                                                .endDate ==
                                                            null
                                                        ? defaultText(
                                                            // txt: '--/--',
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            // txt: '--/--',
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index2).endDate}',
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
                                                                .experiences!
                                                                .elementAt(
                                                                    index2)
                                                                .leagueType ==
                                                            null
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index2).leagueType}',
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
                                                    cubit
                                                                .getProfileData!
                                                                .data!
                                                                .user!
                                                                .experiences!
                                                                .elementAt(
                                                                    index2)
                                                                .position!.name ==
                                                            null
                                                        ? defaultText(
                                                            txt: '--/--',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : defaultText(
                                                            txt:
                                                                '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index2).position!.name}',
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
                                        : Stack(
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 170.w),
                                                    child: Image.asset(
                                                        'images/Path 403.png',
                                                        height: 180.h,
                                                        width: 230.w),
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
                                                    top: 22.h,
                                                    right: 180.w,
                                                    left: 15.w),
                                                child: Column(
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
                                                      // txt: '--/--'
                                                      txt: '--/--',
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
                                                      // txt: '--/--',
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
                                                      // txt: '--/--',
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
                                                      // txt: '--/--',
                                                      txt: '--/--',
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
                                          )),
                                playerName: cubit
                                            .getProfileData!.data!.user!.name ==
                                        null
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.name}',
                                playerGame: cubit.getProfileData!.data!.user!
                                            .position!.name ==
                                        null
                                    ? '--/--'
                                    : "${cubit.getProfileData!.data!.user!.position!.name}",
                                nameGame: cubit.getProfileData!.data!.user!
                                            .sport !.name==
                                        null
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.sport!.name}',
                              ),
                            )
                          : Container(
                              // height: Me.hdiaQuery.of(context).size.height * ..h78,
                              child: pdfOne(
                                img: 'images/mohamed-salah-sportstiger.jpeg',
                                widgetRight: Padding(
                                  padding: EdgeInsets.only(
                                    left: 186.w,
                                    top: 100.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 50.w,
                                        ),
                                        child: Container(
                                          height: 60.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/Group 204.png')),
                                          ),
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',

                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',

                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',
                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',
                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                    padding: EdgeInsets.only(
                                        left: 3.w, top: 50.h, right: 10.w),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 170.w),
                                              child: Image.asset(
                                                  'images/Path 403.png',
                                                  height: 180.h,
                                                  width: 230.w),
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
                                              top: 22.h,
                                              right: 180.w,
                                              left: 15.w),
                                          child: Column(
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
                                                // txt: '--/--'
                                                txt: '--/--',
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
                                                // txt: '--/--',
                                                txt: '--/--',
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
                                                // txt: '--/--',
                                                txt: '--/--',
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
                                                // txt: '--/--',
                                                txt: '--/--',
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
                                                txt: '--/--',
                                                color: Colors.white,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                playerName: '--/--',
                                playerGame: '--/--',
                                nameGame: '--/--',
                              ),
                            ),
                      cubit.getProfileData != null
                          ? Container(
                              // height: Me.hdiaQuery.of(context).size.height * ..h78,
                              child: pdfOne(
                                img: cubit.getProfileData!.data!.user!.image ==
                                        null
                                    ? 'https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg'
                                    :kUrl+ '${cubit.getProfileData!.data!.user!.image}',
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
                                        child: Container(
                                          height: 60.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/Group 204.png')),
                                          ),
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
                                            padding: EdgeInsets.only(
                                                top: 18.h, left: 2.w),
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
                                                      color:
                                                          Colors.yellowAccent,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 1,.h
                                                // ),
                                                cubit.getProfileData!.data!
                                                            .user!.experiences!
                                                            .elementAt(index3)
                                                            .clubName !=
                                                        null
                                                    ? defaultText(
                                                        txt:
                                                            '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index3).clubName}',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )
                                                    : defaultText(
                                                        // txt: '--/--',

                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
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
                                                      color:
                                                          Colors.yellowAccent,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 1,.h
                                                // ),
                                                cubit.getProfileData!.data!
                                                            .user!.experiences!
                                                            .elementAt(index3)
                                                            .startDate ==
                                                        null
                                                    ? defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )
                                                    : defaultText(
                                                        txt:
                                                            '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index3).startDate}',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
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
                                                      color:
                                                          Colors.yellowAccent,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 2,.h
                                                // ),
                                                cubit.getProfileData!.data!
                                                            .user!.experiences!
                                                            .elementAt(index3)
                                                            .endDate ==
                                                        null
                                                    ? defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )
                                                    : defaultText(
                                                        txt:
                                                            '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index3).endDate}',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
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
                                                      color:
                                                          Colors.yellowAccent,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 2,.h
                                                // ),
                                                cubit.getProfileData!.data!
                                                            .user!.experiences!
                                                            .elementAt(index3)
                                                            .leagueType ==
                                                        null
                                                    ? defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )
                                                    : defaultText(
                                                        txt:
                                                            '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index3).leagueType}',
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
                                                      color:
                                                          Colors.yellowAccent,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 2,.h
                                                // ),
                                                cubit.getProfileData!.data!
                                                            .user!.experiences!
                                                            .elementAt(index3)
                                                            .position!.name ==
                                                        null
                                                    ? defaultText(
                                                        txt: '--/--',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )
                                                    : defaultText(
                                                        txt:
                                                            '${cubit.getProfileData!.data!.user!.experiences!.elementAt(index3).position!.name}',
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
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
                                widgetLeft: cubit.getProfileData!.data!.user!
                                                .contacts !=
                                            null &&
                                        cubit.getProfileData!.data!.user!
                                                .contacts!.length >
                                            index1
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.w, top: 50.h),
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 172.w, top: 20.h),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                        'images/Path 404.png',
                                                        width: 180.w,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                  padding: EdgeInsets.only(
                                                      top: 18.h, left: 2.w),
                                                  child: Row(children: [
                                                    Icon(
                                                      Icons.phone,
                                                      color: Colors.white,
                                                    ),
                                                    RotatedBox(
                                                        quarterTurns: 3,
                                                        child: defaultText(
                                                            txt:
                                                                'mobile number',
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.white)),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                        child: cubit
                                                                    .getProfileData!
                                                                    .data!
                                                                    .user!
                                                                    .contacts!
                                                                    .elementAt(
                                                                        index1)
                                                                    .countryCode ==
                                                                null
                                                            ? defaultText(
                                                                txt: '--/--',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              )
                                                            : defaultText(
                                                                txt:
                                                                    '${cubit.getProfileData!.data!.user!.contacts!.elementAt(index1).countryCode}',
                                                                color:
                                                                    hintColor,
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                          txt: cubit
                                                                      .getProfileData!
                                                                      .data!
                                                                      .user!
                                                                      .contacts!
                                                                      .elementAt(
                                                                          index1)
                                                                      .text ==
                                                                  null
                                                              ? ' --/-- '
                                                              : cubit
                                                                  .getProfileData!
                                                                  .data!
                                                                  .user!
                                                                  .contacts!
                                                                  .elementAt(
                                                                      index1)
                                                                  .text,
                                                          color: hintColor,
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                      right: 172.w, top: 16.h),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                        'images/Path 404.png',
                                                        width: 180.w,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                  padding: EdgeInsets.only(
                                                      top: 18.h, left: 2.w),
                                                  child: Row(children: [
                                                    Icon(
                                                      Icons.phone,
                                                      color: Colors.white,
                                                    ),
                                                    RotatedBox(
                                                        quarterTurns: 3,
                                                        child: defaultText(
                                                            txt:
                                                                'mobile number',
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
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
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      right: 172.w, top: 16.h),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                          'images/Path 404.png',
                                                          width: 180.w),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                  padding: EdgeInsets.only(
                                                      top: 18.h, left: 2.w),
                                                  child: Row(children: [
                                                    Icon(
                                                      Icons.phone,
                                                      color: Colors.white,
                                                    ),
                                                    RotatedBox(
                                                        quarterTurns: 3,
                                                        child: defaultText(
                                                            txt:
                                                                'mobile number',
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
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
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ))
                                    : Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.w, top: 50.h),
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 172.w, top: 20.h),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                        'images/Path 404.png',
                                                        width: 180.w,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                  padding: EdgeInsets.only(
                                                      top: 18.h, left: 2.w),
                                                  child: Row(children: [
                                                    Icon(
                                                      Icons.phone,
                                                      color: Colors.white,
                                                    ),
                                                    RotatedBox(
                                                        quarterTurns: 3,
                                                        child: defaultText(
                                                            txt:
                                                                'mobile number',
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.white)),
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
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                          color: hintColor,
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                      right: 172.w, top: 16.h),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                        'images/Path 404.png',
                                                        width: 180.w,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                  padding: EdgeInsets.only(
                                                      top: 18.h, left: 2.w),
                                                  child: Row(children: [
                                                    Icon(
                                                      Icons.phone,
                                                      color: Colors.white,
                                                    ),
                                                    RotatedBox(
                                                        quarterTurns: 3,
                                                        child: defaultText(
                                                            txt:
                                                                'mobile number',
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
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
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      right: 172.w, top: 16.h),
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                          'images/Path 404.png',
                                                          width: 180.w),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                  padding: EdgeInsets.only(
                                                      top: 18.h, left: 2.w),
                                                  child: Row(children: [
                                                    Icon(
                                                      Icons.phone,
                                                      color: Colors.white,
                                                    ),
                                                    RotatedBox(
                                                        quarterTurns: 3,
                                                        child: defaultText(
                                                            txt:
                                                                'mobile number',
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
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
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                playerName: cubit
                                            .getProfileData!.data!.user!.name ==
                                        null
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.position!.name}',
                                playerGame: cubit.getProfileData!.data!.user!
                                            .position!.name ==
                                        null
                                    ? '--/--'
                                    : '${cubit.getProfileData!.data!.user!.sport!.name}',
                                nameGame:cubit.getProfileData!.data!.user!.sport!.name==null? '--/--':'${cubit.getProfileData!.data!.user!.sport!.name}',
                              ),
                            )
                          : Container(
                              // height: Me.hdiaQuery.of(context).size.height * ..h78,
                              child: pdfOne(
                                img: 'images/mohamed-salah-sportstiger.jpeg',
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
                                        child: Container(
                                          height: 60.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/Group 204.png')),
                                          ),
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
                                            padding: EdgeInsets.only(
                                                top: 18.h, left: 2.w),
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',

                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',

                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',

                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                                  // txt: '--/--',

                                                  txt: '--/--',
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
                                                      color:
                                                          Colors.yellowAccent,
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
                                    padding:
                                        EdgeInsets.only(left: 3.w, top: 50.h),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 172.w, top: 20.h),
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
                                              padding: EdgeInsets.only(
                                                  top: 18.h, left: 2.w),
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  right: 172.w, top: 16.h),
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
                                              padding: EdgeInsets.only(
                                                  top: 18.h, left: 2.w),
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                  right: 172.w, top: 16.h),
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                      'images/Path 404.png',
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
                                              padding: EdgeInsets.only(
                                                  top: 18.h, left: 2.w),
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                playerName: '--/--',
                                playerGame: '--/--',
                                nameGame: '--/--',
                              ),
                            ),
                    ],
                  ),
                ),
              )
              // : Center(
              //     child: Padding(
              //       padding: EdgeInsets.only(top: 97.h),
              //       child: Column(
              //         children: [
              //           Lottie.asset('assets/33283-plik-pdf.json'),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           defaultText(
              //               txt: 'Please complete your profile ',
              //               color: Colors.white10,
              //               fontSize: 16.sp,
              //               fontWeight: FontWeight.bold)
              //         ],
              //       ),
              //     ),
              //   ),
            ],
          );
        });
  }
}
