// // ignore_for_file: dead_code

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:sportive/componant/componant/componant.dart';
// import 'package:sportive/componant/style/colors.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// import 'package:sportive/module/player/pdf%20_page/widgets/pdf_one.dart';
// import 'package:sportive/player-cubit/player_state.dart';

// class PdfScreen extends StatefulWidget {
//   PdfScreen({Key? key}) : super(key: key);

//   @override
//   State<PdfScreen> createState() => _PdfScreenState();
// }

// class _PdfScreenState extends State<PdfScreen> {
//   var pageController = PageController();

//   int index = 1;

//   String page = '1';

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PlayerCubit, PlayerState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           PlayerCubit cubit = PlayerCubit.get(context);
//           return Stack(
//                   alignment: AlignmentDirectional.topCenter,
//                   children: [
//                     Container(
//                       height: 69.h,
//                       width: double.infinity,
//                       color: contactColor,
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 4.h, left: 10.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   mainButton(
//                                       txt: 'update',
//                                       fontSize: 13.sp,
//                                       fontWeight: FontWeight.bold,
//                                       ontap: () {
//                                         // nextPage(context: context, page: PlayerDetails());
//                                       }),
//                                   SizedBox(
//                                     width: 100.w,
//                                   ),
//                                   mainButton(
//                                       txt: 'Share',
//                                       fontSize: 13.sp,
//                                       fontWeight: FontWeight.bold,
//                                       ontap: () {}),
//                                 ]),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 InkWell(
//                                     onTap: () {
//                                       pageController.previousPage(
//                                           duration: Duration(microseconds: 300),
//                                           curve: Curves.easeInOut);
//                                     },
//                                     child: Icon(Icons.arrow_back)),
//                                 Container(
//                                   height: 25.h,
//                                   width: 120.w,
//                                   decoration:
//                                       BoxDecoration(color: Colors.white),
//                                   child: Center(
//                                       child: defaultText(
//                                           txt: 'Page  ' + page,
//                                           color: Colors.black)),
//                                 ),
//                                 InkWell(
//                                     onTap: () {
//                                       pageController.nextPage(
//                                           duration: Duration(microseconds: 300),
//                                           curve: Curves.easeInOut);
//                                     },
//                                     child: Icon(Icons.arrow_forward)),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                      cubit.getPlayerProfileData != null
//               ?
//                     Padding(
//                       padding: EdgeInsets.only(top: 69.h),
//                       child: Container(
//                         height: 750.h,
//                         width: double.infinity,
//                         child: PageView(
//                           onPageChanged: (index) {
//                             if (index == 0) {
//                               setState(() {
//                                 page = '1';
//                               });
//                             } else if (index == 1) {
//                               setState(() {
//                                 page = '2';
//                               });
//                             } else {
//                               setState(() {
//                                 page = '3';
//                               });
//                             }
//                           },
//                           controller: pageController,
//                           physics: BouncingScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             Container(
//                               // height: MediaQuery.of(context).size.height * .78,
//                               child: pdfOne(
//                                 img:
//                                     '${cubit.getPlayerProfileData!.data!.profilePicture}',
//                                 widgetRight: Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 210.w, top: 100.h),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       cubit.getPlayerProfileData!.data!.qrCodeImage!=null?
//                                       Image.network(
//                                         '${cubit.getPlayerProfileData!.data!.qrCodeImage}',
//                                         height: 60.h,
//                                         width: 60.w,
//                                       ):Container(),
//                                       SizedBox(
//                                         height: 9.h,
//                                       ),
//                                       Align(
//                                         alignment:
//                                             AlignmentDirectional.topStart,
//                                         child: defaultText(
//                                             txt: 'Performance',
//                                             color: Colors.orange,
//                                             fontSize: 17.sp,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       SizedBox(
//                                         height: 7.h,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             'images/Group 23.png',
//                                             height: 15.h,
//                                             width: 15.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           defaultText(
//                                             txt: 'Running time',
//                                             color: Colors.yellowAccent,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 4.h,
//                                       ),
//                                       defaultText(
//                                         txt:cubit.getPlayerProfileData!.data!.player!.runningTime!=null?
//                                             "${cubit.getPlayerProfileData!.data!.player!.runningTime}" +
//                                                 " s/100 m ": ' ------ ',
//                                         color: Colors.white,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       SizedBox(
//                                         height: 4.h,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             'images/verical jumb.png',
//                                             height: 15.h,
//                                             width: 15.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           defaultText(
//                                             txt: 'Vertical jumbing',
//                                             color: Colors.yellowAccent,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       defaultText(
//                                         txt:cubit.getPlayerProfileData!.data!.player!.verticalJumpingDistance!=null?
//                                             '${cubit.getPlayerProfileData!.data!.player!.verticalJumpingDistance}' +
//                                                 ' m': ' ------ ',
//                                         color: Colors.white,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             'images/long jumping di.png',
//                                             height: 15.h,
//                                             width: 15.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           defaultText(
//                                             txt: 'Long jumbing',
//                                             color: Colors.yellowAccent,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       defaultText(
//                                         txt:cubit.getPlayerProfileData!.data!.player!.longJumpingDistance!=null?
//                                             '${cubit.getPlayerProfileData!.data!.player!.longJumpingDistance}' +
//                                                 ' m':" ---- ",
//                                         color: Colors.white,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             'images/leftting weight.png',
//                                             height: 15.h,
//                                             width: 15.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           defaultText(
//                                             txt: 'Lifiting weights',
//                                             color: Colors.yellowAccent,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       defaultText(
//                                         txt:cubit.getPlayerProfileData!.data!.player!.liftingArmsWeights!=null?
//                                             '${cubit.getPlayerProfileData!.data!.player!.liftingArmsWeights}' +
//                                                 ' kg': " ----- ",
//                                         color: Colors.white,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             'images/leg weight.png',
//                                             height: 15.h,
//                                             width: 15.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           defaultText(
//                                             txt: 'legs weights',
//                                             color: Colors.yellowAccent,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       defaultText(
//                                         txt:cubit.getPlayerProfileData!.data!.player!.liftingLegWeights!=null?
//                                             '${cubit.getPlayerProfileData!.data!.player!.liftingLegWeights}' +
//                                                 ' kg':" ----- ",
//                                         color: Colors.white,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 widgetLeft: Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 10.h, right: 210.w),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Image.asset(
//                                                   'images/Path 317.png',
//                                                   height: 15.h,
//                                                   width: 15.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 defaultText(
//                                                   txt: 'nationality',
//                                                   color:
//                                                       Colors.yellowAccent,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 3.h,
//                                             ),
//                                             defaultText(
//                                               txt: cubit
//                                                           .getPlayerProfileData!
//                                                           .data!
//                                                           .player!
//                                                           .nationality!
//                                                           .name !=
//                                                       null
//                                                   ? '${cubit.getPlayerProfileData!.data!.player!.nationality!.name} '
//                                                   : 'egypt',
//                                               color: Colors.white,
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             SizedBox(
//                                               height: 3.h,
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Image.asset(
//                                                   'images/Path 321.png',
//                                                   height: 15.h,
//                                                   width: 15.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 defaultText(
//                                                   txt: 'country',
//                                                   color:
//                                                       Colors.yellowAccent,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 3.h,
//                                             ),
//                                             defaultText(
//                                               txt: cubit
//                                                           .getPlayerProfileData!
//                                                           .data!
//                                                           .player!
//                                                           .livingCountry!
//                                                           .name !=
//                                                       null
//                                                   ? '${cubit.getPlayerProfileData!.data!.player!.livingCountry!.name}'
//                                                   : 'egypt',
//                                               color: Colors.white,
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             SizedBox(
//                                               height: 3.h,
//                                             ),
//                                             Row(
//                                               children: [
//                                                 Image.asset(
//                                                   'images/Path 274.png',
//                                                   height: 15.h,
//                                                   width: 15.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 defaultText(
//                                                   txt: 'City',
//                                                   color:
//                                                       Colors.yellowAccent,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(height: 4.h),
//                                             defaultText(
//                                               txt: cubit
//                                                           .getPlayerProfileData!
//                                                           .data!
//                                                           .player!
//                                                           .livingCity!
//                                                           .name !=
//                                                       null
//                                                   ? "${cubit.getPlayerProfileData!.data!.player!.livingCity!.name}"
//                                                   : ' ----- ',
//                                               color: Colors.white,
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             SizedBox(height: 3.h),
//                                             Row(
//                                               children: [
//                                                 Image.asset(
//                                                   'images/surface1 (1).png',
//                                                   height: 15.h,
//                                                   width: 15.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 defaultText(
//                                                   txt: 'birthday',
//                                                   color:
//                                                       Colors.yellowAccent,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(height: 3.h),
//                                             defaultText(
//                                               txt:cubit.getPlayerProfileData!.data!.player!.dateOfBirth!=null?
//                                                   '${cubit.getPlayerProfileData!.data!.player!.dateOfBirth}':" ----- ",
//                                               color: Colors.white,
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             SizedBox(height: 8.h),
//                                           ]),
//                                       defaultText(
//                                         txt: 'Physical properties',
//                                         color: Colors.orange,
//                                         fontSize: 13.sp,
//                                         fontWeight: FontWeight.w900,
//                                       ),
//                                       SizedBox(height: 7.h),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Image.asset(
//                                                 'images/gender.png',
//                                                 height: 15.h,
//                                                 width: 15.w,
//                                               ),
//                                               SizedBox(
//                                                 width: 5.w,
//                                               ),
//                                               defaultText(
//                                                 txt: 'Gender',
//                                                 color: Colors.yellowAccent,
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: 3.h),
//                                           defaultText(
//                                             txt:cubit.getPlayerProfileData!.data!.player!.gender !=null?
//                                                 '${cubit.getPlayerProfileData!.data!.player!.gender}':' ----- ',
//                                             color: Colors.white,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           SizedBox(height: 3.h),
//                                           Row(
//                                             children: [
//                                               Image.asset(
//                                                 'images/surface1.png',
//                                                 height: 15.h,
//                                                 width: 15.w,
//                                               ),
//                                               SizedBox(
//                                                 width: 5.w,
//                                               ),
//                                               defaultText(
//                                                 txt: 'Weight',
//                                                 color: Colors.yellowAccent,
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: 3.h),
//                                           defaultText(
//                                             txt:cubit.getPlayerProfileData!.data!.player!.weight !=null?
//                                                 '${cubit.getPlayerProfileData!.data!.player!.weight}' +
//                                                     ' kg':' ---- ',
//                                             color: Colors.white,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           SizedBox(height: 3.h),
//                                           Row(
//                                             children: [
//                                               Image.asset(
//                                                 'images/CompositeLayer2.png',
//                                                 height: 15.h,
//                                                 width: 15.w,
//                                               ),
//                                               SizedBox(
//                                                 width: 5.w,
//                                               ),
//                                               defaultText(
//                                                 txt: 'Height',
//                                                 color: Colors.yellowAccent,
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: 3.h),
//                                           defaultText(
//                                             txt:cubit.getPlayerProfileData!.data!.player!.height !=null?
//                                                 '${cubit.getPlayerProfileData!.data!.player!.height}' +
//                                                     ' kg':" ----- ",
//                                             color: Colors.white,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           SizedBox(height: 3.h),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           Image.asset(
//                                             "images/roght or left p.png",
//                                             height: 15.h,
//                                             width: 15.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           defaultText(
//                                             txt: 'Right or left',
//                                             color: Colors.yellowAccent,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       defaultText(
//                                         txt: cubit.getPlayerProfileData!
//                                             .data!.player!.limbsDirection!=null?
//                                         cubit.getPlayerProfileData!
//                                             .data!.player!.limbsDirection: ' ----- ',
//                                         color: Colors.white,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 playerName:
//                                 cubit.getPlayerProfileData!.data!.name!=null?
//                                     cubit.getPlayerProfileData!.data!.name:' ----- ',
//                                 playerGame:
//                                 cubit.getPlayerProfileData!.data!.player!.sport!.name!=null?
//                                     '${cubit.getPlayerProfileData!.data!.player!.sport!.name}':" ---- ",
//                                 nameGame:
//                                 cubit.getPlayerProfileData!.data!.player!.position!.name!=null?
//                                     '${cubit.getPlayerProfileData!.data!.player!.position!.name}':" ----- ",
//                               ),
//                             ),
//                             Container(
//                               // height: Me.hdiaQuery.of(context).size.height * ..h78,
//                               child: pdfOne(
//                                 img: cubit.getPlayerProfileData!.data!
//                                     .profilePicture,
//                                 widgetRight: Padding(
//                                   padding: EdgeInsets.only(
//                                     left: 186.w,
//                                     top: 90.h,
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.stretch,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                           left: 50.w,
//                                         ),
//                                         child: cubit.getPlayerProfileData!.data!.qrCodeImage!=null?
//                                         Image.network(
//                                           '${cubit.getPlayerProfileData!.data!.qrCodeImage}',
//                                           height: 50.h,
//                                           width: 50.w,
//                                         ):Container(),
//                                       ),
//                                       SizedBox(
//                                         height: 10.h,
//                                       ),
//                                       Stack(
//                                         children: [
//                                           Stack(
//                                             children: [
//                                               Image.asset(
//                                                 'images/Path 403.png',
//                                                 height: 180.h,
//                                                 width: 230.w,
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                   left: 71.w,
//                                                   // top: 7.h,
//                                                   // bottom: 30.h,
//                                                 ),
//                                                 child: Image.asset(
//                                                     'images/sportıve ıcon (2).png'),
//                                               ),
//                                             ],
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: 22.h, left: 13.w),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/club.png',
//                                                       height: 11.h,
//                                                       width: 11.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Club name',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 1,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt: cubit
//                                                               .getPlayerProfileData!
//                                                               .data!
//                                                               .player!
//                                                               .experiences[
//                                                                   0]
//                                                               .clubName ==
//                                                           null
//                                                       ? 'liverbool'
//                                                       : '${cubit.getPlayerProfileData!.data!.player!.experiences[0].clubName}',
//                                                   color: Colors.white,
//                                                   fontSize: 13.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 1,.h
//                                                 // ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/surface1 (1).png',
//                                                       height: 11.h,
//                                                       width: 11.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Starting date',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 1,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.experiences[0].startingDate!=null?
//                                                       '${cubit.getPlayerProfileData!.data!.player!.experiences[0].startingDate}':' ----- ',
//                                                   color: Colors.white,
//                                                   fontSize: 13.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/surface1 (1).png',
//                                                       height: 11.h,
//                                                       width: 11.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Ending date',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.experiences[0].endingDate!=null?
//                                                       '${cubit.getPlayerProfileData!.data!.player!.experiences[0].endingDate}':' ----- ',
//                                                   color: Colors.white,
//                                                   fontSize: 13.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/surface1 (3).png',
//                                                       height: 11.h,
//                                                       width: 11.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'League type',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.experiences[0].leagueType!=null?
//                                                       '${cubit.getPlayerProfileData!.data!.player!.experiences[0].leagueType}': ' ----- ',
//                                                   color: Colors.white,
//                                                   fontSize: 13.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/position.png',
//                                                       height: 11.h,
//                                                       width: 11.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Position',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt: cubit
//                                                               .getPlayerProfileData!
//                                                               .data!
//                                                               .player!
//                                                               .position!
//                                                               .name !=
//                                                           null
//                                                       ? '${cubit.getPlayerProfileData!.data!.player!.position!.name}'
//                                                       : ' ----- ',
//                                                   color: Colors.white,
//                                                   fontSize: 13.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 widgetLeft: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 3.w, top: 50.h, right: 10.w),
//                                     child: Stack(
//                                       children: [
//                                         Stack(
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   right: 170.w),
//                                               child: Image.asset(
//                                                   'images/Path 403.png',
//                                                   height: 180.h,
//                                                   width: 230.w),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                 left: 72.w,
//                                                 // top: 3.h,
//                                               ),
//                                               child: Image.asset(
//                                                   'images/sportıve ıcon (2).png'),
//                                             ),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               top: 22.h,
//                                               right: 180.w,
//                                               left: 15.w),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/club.png',
//                                                     height: 11.h,
//                                                     width: 11.w,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5.w,
//                                                   ),
//                                                   defaultText(
//                                                     txt: 'Club name',
//                                                     color:
//                                                         Colors.yellowAccent,
//                                                     fontSize: 12.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold,
//                                                   ),
//                                                 ],
//                                               ),
//                                               // SizedBox(
//                                               //   height: 1,.h
//                                               // ),
//                                               defaultText(
//                                                 txt: cubit
//                                                             .getPlayerProfileData!
//                                                             .data!
//                                                             .player!
//                                                             .experiences[1]
//                                                             .clubName ==
//                                                         null
//                                                     ? ' ---- '
//                                                     : '${cubit.getPlayerProfileData!.data!.player!.experiences[1].clubName}',
//                                                 color: Colors.white,
//                                                 fontSize: 13.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                               // SizedBox(
//                                               //   height: 1,.h
//                                               // ),
//                                               Row(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/surface1 (1).png',
//                                                     height: 16.h,
//                                                     width: 16.w,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5.w,
//                                                   ),
//                                                   defaultText(
//                                                     txt: 'Starting date',
//                                                     color:
//                                                         Colors.yellowAccent,
//                                                     fontSize: 12.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold,
//                                                   ),
//                                                 ],
//                                               ),
//                                               // SizedBox(
//                                               //   height: 1,.h
//                                               // ),
//                                               defaultText(
//                                                 txt:cubit.getPlayerProfileData!.data!.player!.experiences[1].startingDate!=null?
//                                                     '${cubit.getPlayerProfileData!.data!.player!.experiences[1].startingDate}':' ---- ',
//                                                 color: Colors.white,
//                                                 fontSize: 13.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                               // SizedBox(
//                                               //   height: 2,.h
//                                               // ),
//                                               Row(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/surface1 (1).png',
//                                                     height: 16.h,
//                                                     width: 16.w,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5.w,
//                                                   ),
//                                                   defaultText(
//                                                     txt: 'Ending date',
//                                                     color:
//                                                         Colors.yellowAccent,
//                                                     fontSize: 12.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold,
//                                                   ),
//                                                 ],
//                                               ),
//                                               // SizedBox(
//                                               //   height: 2,.h
//                                               // ),
//                                               defaultText(
//                                                 txt:cubit.getPlayerProfileData!.data!.player!.experiences[1].endingDate!=null?
//                                                     '${cubit.getPlayerProfileData!.data!.player!.experiences[1].endingDate}': ' ----- ',
//                                                 color: Colors.white,
//                                                 fontSize: 13.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/surface1 (3).png',
//                                                     height: 16.h,
//                                                     width: 16.w,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5.w,
//                                                   ),
//                                                   defaultText(
//                                                     txt: 'League type',
//                                                     color:
//                                                         Colors.yellowAccent,
//                                                     fontSize: 12.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold,
//                                                   ),
//                                                 ],
//                                               ),
//                                               // SizedBox(
//                                               //   height: 2,.h
//                                               // ),
//                                               defaultText(
//                                                 txt:cubit.getPlayerProfileData!.data!.player!.experiences[1].leagueType!=null?
//                                                     '${cubit.getPlayerProfileData!.data!.player!.experiences[1].leagueType}':' ---- ',
//                                                 color: Colors.white,
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/position.png',
//                                                     height: 16.h,
//                                                     width: 16.w,
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5.w,
//                                                   ),
//                                                   defaultText(
//                                                     txt: 'Position',
//                                                     color:
//                                                         Colors.yellowAccent,
//                                                     fontSize: 12.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold,
//                                                   ),
//                                                 ],
//                                               ),
//                                               // SizedBox(
//                                               //   height: 2,.h
//                                               // ),
//                                               defaultText(
//                                                 txt:cubit.getPlayerProfileData!.data!.player!.position!.name!=null?
//                                                     '${cubit.getPlayerProfileData!.data!.player!.position!.name}': ' ----- ',
//                                                 color: Colors.white,
//                                                 fontSize: 13.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                 playerName:
//                                     cubit.getPlayerProfileData!.data!.name,
//                                 playerGame: cubit.getPlayerProfileData!
//                                             .data!.player!.sport!.name !=
//                                         null
//                                     ? "${cubit.getPlayerProfileData!.data!.player!.sport!.name}"
//                                     : ' ----- ',
//                                 nameGame: cubit.getPlayerProfileData!.data!
//                                             .player!.position!.name !=
//                                         null
//                                     ? '${cubit.getPlayerProfileData!.data!.player!.position!.name}'
//                                     : ' ----- ',
//                               ),
//                             ),
//                             Container(
//                               // height: Me.hdiaQuery.of(context).size.height * ..h78,
//                               child: pdfOne(
//                                 img:
//                                     "${cubit.getPlayerProfileData!.data!.profilePicture}",
//                                 widgetRight: Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 194.w, top: 90.h),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.stretch,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                           left: 50.w,
//                                         ),
//                                         child: cubit.getPlayerProfileData!.data!.qrCodeImage!=null?Image.network(
//                                           '${cubit.getPlayerProfileData!.data!.qrCodeImage}',
//                                           height: 50.h,
//                                           width: 50.w,
//                                         ):Container(),
//                                       ),
//                                       SizedBox(
//                                         height: 20.h,
//                                       ),
//                                       Stack(
//                                         children: [
//                                           Stack(
//                                             children: [
//                                               Image.asset(
//                                                 'images/Path 403.png',
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                   left: 67.w,
//                                                   bottom: 4.h,
//                                                 ),
//                                                 child: Image.asset(
//                                                     'images/sportıve ıcon (2).png'),
//                                               ),
//                                             ],
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: 18.h, left: 2.w),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/club.png',
//                                                       height: 12.h,
//                                                       width: 12.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 1.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Club name',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 1,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.experiences[2].clubName!=null?
//                                                       '${cubit.getPlayerProfileData!.data!.player!.experiences[2].clubName}':' ---- ',
//                                                   color: Colors.white,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 1,.h
//                                                 // ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/surface1 (1).png',
//                                                       height: 12.h,
//                                                       width: 12.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Starting date',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 1,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.experiences[2].startingDate!=null?
//                                                       '${cubit.getPlayerProfileData!.data!.player!.experiences[2].startingDate}': ' ---- ',
//                                                   color: Colors.white,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/surface1 (1).png',
//                                                       height: 12.h,
//                                                       width: 12.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Ending date',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.experiences[2].endingDate !=null?
//                                                       '${cubit.getPlayerProfileData!.data!.player!.experiences[2].endingDate}':' ---- ',
//                                                   color: Colors.white,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/surface1 (3).png',
//                                                       height: 12.h,
//                                                       width: 12.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'League type',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.experiences[2].leagueType!=null?
//                                                       '${cubit.getPlayerProfileData!.data!.player!.experiences[2].leagueType}':' ----- ',
//                                                   color: Colors.white,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/position.png',
//                                                       height: 12.h,
//                                                       width: 12.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     defaultText(
//                                                       txt: 'Position',
//                                                       color: Colors
//                                                           .yellowAccent,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // SizedBox(
//                                                 //   height: 2,.h
//                                                 // ),
//                                                 defaultText(
//                                                   txt:cubit.getPlayerProfileData!.data!.player!.position!.name !=null?
//                                                       "${cubit.getPlayerProfileData!.data!.player!.position!.name}":' ----- ',
//                                                   color: Colors.white,
//                                                   fontSize: 12.sp,
//                                                   fontWeight:
//                                                       FontWeight.bold,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 widgetLeft: Padding(
//                                     padding: EdgeInsets.only(left: 3.w),
//                                     child: Column(
//                                       children: [
//                                         Stack(
//                                           alignment:
//                                               AlignmentDirectional.center,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   right: 178.w, top: 35.h),
//                                               child: Stack(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/Path 404.png',
//                                                     width: 205.w,
//                                                     height: 86.h,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         EdgeInsets.only(
//                                                       left: 84.w,
//                                                       top: 10.h,
//                                                     ),
//                                                     child: Image.asset(
//                                                         'images/sportıve ıcon (2).png'),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   top: 26.h, left: 10.w),
//                                               child: Row(children: [
//                                                 Icon(
//                                                   Icons.phone,
//                                                   color: Colors.white,
//                                                 ),
//                                                 RotatedBox(
//                                                     quarterTurns: 3,
//                                                     child: defaultText(
//                                                         txt:
//                                                             'mobile number',
//                                                         fontSize: 9.sp,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color:
//                                                             Colors.white)),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius
//                                                             .circular(10.r),
//                                                     color: Colors.white,
//                                                   ),
//                                                   child: Center(
//                                                     child: defaultText(
//                                                       txt: '90',
//                                                       color: Colors.black,
//                                                       fontSize: 11.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   height: 20.h,
//                                                   width: 25.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius
//                                                               .circular(
//                                                                   10.r)),
//                                                   height: 20.h,
//                                                   width: 70.w,
//                                                   child: Center(
//                                                     child: defaultText(
//                                                       txt: '1222899777',
//                                                       color: Colors.black,
//                                                       fontSize: 11.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ]),
//                                             ),
//                                           ],
//                                         ),
//                                         Stack(
//                                           alignment:
//                                               AlignmentDirectional.center,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                 right: 178.w,
//                                               ),
//                                               child: Stack(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/Path 404.png',
//                                                     width: 205.w,
//                                                     height: 86.h,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         EdgeInsets.only(
//                                                       left: 86.w,
//                                                       top: 11.h,
//                                                     ),
//                                                     child: Image.asset(
//                                                         'images/sportıve ıcon (2).png'),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   bottom: 7.h, left: 10.w),
//                                               child: Row(children: [
//                                                 Icon(
//                                                   Icons.phone,
//                                                   color: Colors.white,
//                                                 ),
//                                                 RotatedBox(
//                                                     quarterTurns: 3,
//                                                     child: defaultText(
//                                                         txt:
//                                                             'mobile number',
//                                                         fontSize: 9.sp,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color:
//                                                             Colors.white)),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius
//                                                             .circular(10.r),
//                                                     color: Colors.white,
//                                                   ),
//                                                   child: Center(
//                                                     child: defaultText(
//                                                       txt: '20',
//                                                       color: Colors.black,
//                                                       fontSize: 11.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   height: 20.h,
//                                                   width: 25.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius
//                                                               .circular(
//                                                                   10.r)),
//                                                   height: 20.h,
//                                                   width: 70.w,
//                                                   child: Center(
//                                                     child: defaultText(
//                                                       txt: '1222899777',
//                                                       color: Colors.black,
//                                                       fontSize: 11.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ]),
//                                             ),
//                                           ],
//                                         ),
//                                         Stack(
//                                           alignment:
//                                               AlignmentDirectional.center,
//                                           children: [
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   right: 178.w),
//                                               child: Stack(
//                                                 children: [
//                                                   Image.asset(
//                                                     'images/Path 404.png',
//                                                     width: 205.w,
//                                                     height: 86.h,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         EdgeInsets.only(
//                                                       left: 86.w,
//                                                       top: 11.h,
//                                                     ),
//                                                     child: Image.asset(
//                                                         'images/sportıve ıcon (2).png'),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   bottom: 8.h, left: 10.w),
//                                               child: Row(children: [
//                                                 Icon(
//                                                   Icons.phone,
//                                                   color: Colors.white,
//                                                 ),
//                                                 RotatedBox(
//                                                     quarterTurns: 3,
//                                                     child: defaultText(
//                                                         txt:
//                                                             'mobile number',
//                                                         fontSize: 9.sp,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color:
//                                                             Colors.white)),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius
//                                                             .circular(10.r),
//                                                     color: Colors.white,
//                                                   ),
//                                                   child: Center(
//                                                     child: defaultText(
//                                                       txt: '20',
//                                                       color: Colors.black,
//                                                       fontSize: 11.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   height: 20.h,
//                                                   width: 25.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Container(
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius
//                                                               .circular(
//                                                                   10.r)),
//                                                   height: 20.h,
//                                                   width: 70.w,
//                                                   child: Center(
//                                                     child: defaultText(
//                                                       txt: '1222899777',
//                                                       color: Colors.black,
//                                                       fontSize: 11.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ]),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                                 playerName:
//                                     cubit.getPlayerProfileData!.data!.name,
//                                 playerGame:
//                                     '${cubit.getPlayerProfileData!.data!.player!.sport!.name}',
//                                 nameGame:
//                                     "${cubit.getPlayerProfileData!.data!.player!.position!.name}",
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
               
          
//                : Center(
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 97.h),
//                           child: Column(
//                             children: [
//                               Lottie.asset('assets/33283-plik-pdf.json'),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               defaultText(
//                                   txt: 'Please complete your profile ',
//                                   color: Colors.white10,
//                                   fontSize: 16.sp,
//                                   fontWeight: FontWeight.bold)
//                             ],
//                           ),
//                         ),
//                     ),
        
//           ],
//                 );
              
                  
                

//           ;
//         });
//   }
// }
