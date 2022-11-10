import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/coach/explore/widget/get_your_game.dart';
import 'package:sportive/module/player/explore/widget/get_post_model.dart';
import 'package:sportive/module/player/player_login/widgets/get_types.dart';
import 'package:sportive/module/player/pt/widgets/flip_card.dart';
import 'package:sportive/module/player/pt/widgets/fliter_card.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class NewPerformance extends StatefulWidget {
  NewPerformance({Key? key}) : super(key: key);

  @override
  State<NewPerformance> createState() => _NewPerformanceState();
}

class _NewPerformanceState extends State<NewPerformance> {
  var typeController = TextEditingController();

  var ageTOController = TextEditingController();

  var ageController = TextEditingController();
  DateTime? dateTime;
  DateTime? dateTime2;
  DateTime currentDate = DateTime.now();
  String difference = "";
  bool isType = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return filterCard();
          //  Container(
          //   // height: 550,
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Stack(
          //           children: [
          //             Stack(
          //               children: [
          //                 Padding(
          //                   padding: EdgeInsets.only(left: 60.w),
          //                   child: Stack(
          //                     alignment: AlignmentDirectional.centerStart,
          //                     children: [
          //                       Stack(
          //                         children: [
          //                           Image.asset(
          //                             'images/PT card3 (1).png',
          //                             height: 530,
          //                           ),
          //                           Padding(
          //                             padding: EdgeInsets.only(top: 82.h),
          //                             child: Row(
          //                               // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                               children: [
          //                                 Container(
          //                                     height: 28,
          //                                     width: 90,
          //                                     child: ElevatedButton(
          //                                       style: ElevatedButton.styleFrom(
          //                                         primary: Colors.green,
          //                                       ),
          //                                       child: Center(
          //                                         child: Text(
          //                                           'Flip',
          //                                           style: TextStyle(
          //                                               fontSize: 20,
          //                                               fontWeight:
          //                                                   FontWeight.bold,
          //                                               color: Colors.white),
          //                                         ),
          //                                       ),
          //                                       onPressed: () {},
          //                                     )),
          //                                 SizedBox(
          //                                   width: 58,
          //                                 ),
          //                                 Container(
          //                                     height: 28,
          //                                     width: 90,
          //                                     child: ElevatedButton(
          //                                       style: ElevatedButton.styleFrom(
          //                                         primary: Colors.green,
          //                                       ),
          //                                       child: Center(
          //                                         child: Text(
          //                                           'Edit',
          //                                           style: TextStyle(
          //                                               fontSize: 20,
          //                                               fontWeight:
          //                                                   FontWeight.bold,
          //                                               color: Colors.white),
          //                                         ),
          //                                       ),
          //                                       onPressed: () {},
          //                                     )),
          //                               ],
          //                             ),
          //                           ),
          //                           Positioned(
          //                               bottom: 70,
          //                               left: 61,
          //                               child: Stack(
          //                                 alignment:
          //                                     AlignmentDirectional.center,
          //                                 children: [
          //                                   Container(
          //                                     height: 100.h,
          //                                     width: 115.w,
          //                                     child: Image.asset(
          //                                       'images/Rectangle 550.png',
          //                                       fit: BoxFit.cover,
          //                                     ),
          //                                   ),
          //                                   Image.asset(
          //                                     'images/15 (1).png',
          //                                     height: 80.h,
          //                                     width: 59.w,
          //                                   ),
          //                                 ],
          //                               )),
          //                         ],
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.only(
          //                             left: 30, bottom: 15),
          //                         child: Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Padding(
          //                               padding:
          //                                   const EdgeInsets.only(left: 10),
          //                               child: defaultText(
          //                                 txt: 'Performance test',
          //                                 color: Colors.white,
          //                                 fontSize: 20,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               height: 3,
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Image.asset(
          //                                   'images/sportıve ıcon (1).png',
          //                                   height: 20,
          //                                   width: 20,
          //                                   fit: BoxFit.contain,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 5,
          //                                 ),
          //                                 defaultText(
          //                                   txt: 'Game',
          //                                   color: Colors.white,
          //                                   fontSize: 11,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 14,
          //                                 ),
          //                                 Container(
          //                                     height: 16,
          //                                     width: 60,
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                           BorderRadius.circular(3),
          //                                       color: Color.fromARGB(
          //                                           255, 70, 117, 72),
          //                                     ),
          //                                     child: InkWell(
          //                                       onTap: () {
          //                                         getGame(context);
          //                                       },
          //                                       child: Center(
          //                                         child: defaultText(
          //                                           txt: 'choose Game',
          //                                           fontSize: 7,
          //                                           color: Colors.white,
          //                                           fontWeight: FontWeight.bold,
          //                                         ),
          //                                       ),
          //                                     ))
          //                               ],
          //                             ),
          //                             SizedBox(
          //                               height: 3,
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Image.asset(
          //                                   'images/position.png',
          //                                   height: 20,
          //                                   width: 20,
          //                                   fit: BoxFit.contain,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 5,
          //                                 ),
          //                                 defaultText(
          //                                   txt: 'Position',
          //                                   color: Colors.white,
          //                                   fontSize: 11,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 14,
          //                                 ),
          //                                 Container(
          //                                     height: 16,
          //                                     width: 60,
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                           BorderRadius.circular(3),
          //                                       color: Color.fromARGB(
          //                                           255, 70, 117, 72),
          //                                     ),
          //                                     child: InkWell(
          //                                       onTap: () {
          //                                         getPositions(context);
          //                                       },
          //                                       child: Center(
          //                                         child: defaultText(
          //                                           txt: 'choose Position',
          //                                           fontSize: 7,
          //                                           color: Colors.white,
          //                                           fontWeight: FontWeight.bold,
          //                                         ),
          //                                       ),
          //                                     ))
          //                               ],
          //                             ),
          //                             SizedBox(
          //                               height: 3,
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Image.asset(
          //                                   'images/iconmonstr-user.png',
          //                                   height: 20,
          //                                   width: 20,
          //                                   fit: BoxFit.contain,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 5,
          //                                 ),
          //                                 defaultText(
          //                                   txt: 'Type',
          //                                   color: Colors.white,
          //                                   fontSize: 14,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 14,
          //                                 ),
          //                                 Container(
          //                                   height: 16,
          //                                   width: 60,
          //                                   decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(3),
          //                                     color: Color.fromARGB(
          //                                         255, 70, 117, 72),
          //                                   ),
          //                                   child: InkWell(
          //                                     onTap: () {
          //                                       setState(() {
          //                                         isType = true;
          //                                       });
          //                                     },
          //                                     child: Container(
          //                                       height: 40.h,
          //                                       width: 260.w,
          //                                       decoration: BoxDecoration(
          //                                         border: Border.all(
          //                                             color: Colors.black38),
          //                                         borderRadius:
          //                                             BorderRadius.circular(
          //                                                 10.r),
          //                                         color: Colors.white,
          //                                       ),
          //                                       child: Center(
          //                                           child: defaultText(
          //                                               txt: cubit.acountType ==
          //                                                       null
          //                                                   ? 'Type'
          //                                                   : cubit.acountType,
          //                                               color: Colors.black54,
          //                                               fontSize: 11.sp,
          //                                               fontWeight:
          //                                                   FontWeight.normal)),
          //                                     ),
          //                                   ),
          //                                 )
          //                               ],
          //                             ),
          //                             SizedBox(
          //                               height: 3,
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Image.asset(
          //                                   'images/iconmonstr-user.png',
          //                                   height: 20,
          //                                   width: 20,
          //                                   fit: BoxFit.contain,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 5,
          //                                 ),
          //                                 defaultText(
          //                                   txt: 'Age',
          //                                   color: Colors.white,
          //                                   fontSize: 14,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 16,
          //                                 ),
          //                                 Container(
          //                                     height: 16,
          //                                     width: 20,
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                           BorderRadius.circular(3),
          //                                       color: Color.fromARGB(
          //                                           255, 70, 117, 72),
          //                                     ),
          //                                     child: TextField(
          //                                       textAlign: TextAlign.center,
          //                                       style: TextStyle(
          //                                         color: Colors.white,
          //                                         fontSize: 10.sp,
          //                                       ),
          //                                       controller: ageController,
          //                                     )),
          //                                 defaultText(
          //                                   txt: ' years',
          //                                   fontSize: 11,
          //                                   color: Colors.white,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 5.w,
          //                                 ),
          //                                 defaultText(
          //                                   txt: 'to ',
          //                                   fontSize: 14,
          //                                   color: Colors.yellowAccent,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 Container(
          //                                     height: 16.h,
          //                                     width: 20.w,
          //                                     decoration: BoxDecoration(
          //                                       borderRadius:
          //                                           BorderRadius.circular(3),
          //                                       color: Color.fromARGB(
          //                                           255, 70, 117, 72),
          //                                     ),
          //                                     child: TextField(
          //                                       textAlign: TextAlign.center,
          //                                       style: TextStyle(
          //                                         color: Colors.white,
          //                                         fontSize: 10.sp,
          //                                       ),
          //                                       controller: ageTOController,
          //                                     )),
          //                                 defaultText(
          //                                   txt: ' years',
          //                                   fontSize: 11,
          //                                   color: Colors.white,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                               ],
          //                             ),
          //                             SizedBox(
          //                               height: 3,
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Image.asset(
          //                                   'images/surface1 (1).png',
          //                                   height: 20,
          //                                   width: 20,
          //                                   fit: BoxFit.contain,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 5,
          //                                 ),
          //                                 defaultText(
          //                                   txt: 'Date',
          //                                   color: Colors.white,
          //                                   fontSize: 14,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 SizedBox(
          //                                   width: 7,
          //                                 ),
          //                                 Container(
          //                                   height: 16,
          //                                   width: 55,
          //                                   decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(3),
          //                                     color: Color.fromARGB(
          //                                         255, 70, 117, 72),
          //                                   ),
          //                                   child: InkWell(
          //                                     onTap: () {
          //                                       DatePicker.showDatePicker(
          //                                           context,
          //                                           theme: DatePickerTheme(
          //                                               backgroundColor:
          //                                                   greyColor),
          //                                           showTitleActions: true,
          //                                           currentTime: currentDate,
          //                                           minTime:
          //                                               DateTime(1950, 1, 1),
          //                                           onConfirm: (date) {
          //                                         setState(() {
          //                                           dateTime = date;

          //                                           // difference =
          //                                           //     "${DateTime.now().year - dateTime!.year}";
          //                                         });
          //                                         // print(difference);
          //                                       });
          //                                     },
          //                                     child: Container(
          //                                         height: 20.h,
          //                                         width: 40.w,
          //                                         decoration: BoxDecoration(
          //                                           borderRadius:
          //                                               BorderRadius.circular(
          //                                                   5.r),
          //                                           color: Color(0xff40768C),
          //                                         ),
          //                                         child: Padding(
          //                                           padding: EdgeInsets.only(
          //                                               bottom: 15.h,
          //                                               right: 8.w,
          //                                               left: 8.w,
          //                                               top: 5.h),
          //                                           child: Center(
          //                                             child: Row(
          //                                               mainAxisAlignment:
          //                                                   MainAxisAlignment
          //                                                       .spaceBetween,
          //                                               children: [
          //                                                 defaultText(
          //                                                   txt: dateTime ==
          //                                                           null
          //                                                       ? "data time"
          //                                                       : "${dateTime}",
          //                                                   color: Colors.white,
          //                                                   fontSize: 6.sp,
          //                                                   // fontWeight: FontWeight.bold,
          //                                                 ),
          //                                                 Icon(
          //                                                   Icons
          //                                                       .keyboard_arrow_down,
          //                                                   color: Colors.white,
          //                                                   size: 25.h,
          //                                                 )
          //                                               ],
          //                                             ),
          //                                           ),
          //                                         )),
          //                                   ),
          //                                 ),
          //                                 defaultText(
          //                                   txt: ' to ',
          //                                   fontSize: 14,
          //                                   color: Colors.yellowAccent,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                                 Container(
          //                                   height: 16,
          //                                   width: 55,
          //                                   decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(3),
          //                                     color: Color.fromARGB(
          //                                         255, 70, 117, 72),
          //                                   ),
          //                                   child: InkWell(
          //                                     onTap: () {
          //                                       DatePicker.showDatePicker(
          //                                           context,
          //                                           theme: DatePickerTheme(
          //                                               backgroundColor:
          //                                                   greyColor),
          //                                           showTitleActions: true,
          //                                           currentTime: currentDate,
          //                                           minTime:
          //                                               DateTime(1950, 1, 1),
          //                                           onConfirm: (date) {
          //                                         setState(() {
          //                                           dateTime2 = date;

          //                                           // difference =
          //                                           //     "${DateTime.now().year - dateTime!.year}";
          //                                         });
          //                                         // print(difference);
          //                                       });
          //                                     },
          //                                     child: Container(
          //                                         height: 20.h,
          //                                         width: 40.w,
          //                                         decoration: BoxDecoration(
          //                                           borderRadius:
          //                                               BorderRadius.circular(
          //                                                   5.r),
          //                                           color: Color(0xff40768C),
          //                                         ),
          //                                         child: Padding(
          //                                           padding: EdgeInsets.only(
          //                                               bottom: 15.h,
          //                                               right: 8.w,
          //                                               left: 8.w,
          //                                               top: 5.h),
          //                                           child: Center(
          //                                             child: Row(
          //                                               mainAxisAlignment:
          //                                                   MainAxisAlignment
          //                                                       .spaceBetween,
          //                                               children: [
          //                                                 defaultText(
          //                                                   txt: dateTime2 ==
          //                                                           null
          //                                                       ? "data time"
          //                                                       : "${dateTime2}",
          //                                                   color: Colors.white,
          //                                                   fontSize: 6.sp,
          //                                                   // fontWeight: FontWeight.bold,
          //                                                 ),
          //                                                 Icon(
          //                                                   Icons
          //                                                       .keyboard_arrow_down,
          //                                                   color: Colors.white,
          //                                                   size: 25.h,
          //                                                 )
          //                                               ],
          //                                             ),
          //                                           ),
          //                                         )),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 if (isType == true)
          //                   Padding(
          //                       padding:
          //                           EdgeInsets.only(left: 50.w, top: 180.h),
          //                       child: Container(
          //                         height: 170.h,
          //                         width: 200.w,
          //                         decoration: BoxDecoration(
          //                           color: Color.fromARGB(255, 187, 185, 185),
          //                           borderRadius: BorderRadius.circular(15),
          //                         ),
          //                         child: ListView.separated(
          //                           itemBuilder: (context, index) => InkWell(
          //                             onTap: () {
          //                               cubit.changeAccountType(
          //                                 cubit.accountTypeModel!.data![index]
          //                                     .id!,
          //                                 cubit.accountTypeModel!.data![index]
          //                                     .name!,
          //                               );
          //                               cubit.changeType(
          //                                 acount: cubit.accountTypeModel!
          //                                     .data![index].name
          //                                     .toString(),
          //                               );
          //                               // CacheHelper.setInt(
          //                               //         key: kType1,
          //                               //         value: cubit.accountTypeModel!
          //                               //             .data![index].id)
          //                               //     .then((value) {
          //                               //   print(value.toString());
          //                               // });
          //                               // print(cubit.accountType);
          //                               // print(cubit.acountType);
          //                               setState(() {
          //                                 isType = false;
          //                               });
          //                             },
          //                             child: getAccountType(
          //                                 PlayerCubit.get(context)
          //                                     .accountTypeModel!
          //                                     .data![index]),
          //                           ),
          //                           separatorBuilder: (context, index) =>
          //                               SizedBox(
          //                             height: 10,
          //                             child: Divider(
          //                               color: Colors.black,
          //                               thickness: .1,
          //                             ),
          //                           ),
          //                           itemCount: PlayerCubit.get(context)
          //                               .accountTypeModel!
          //                               .data!
          //                               .length,
          //                         ),
          //                       )),
          //               ],
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(left: 10.w, top: 10.h),
          //               child: Align(
          //                   alignment: Alignment.topLeft,
          //                   child: greenButton(
          //                       txt: 'Save',
          //                       onPress: () {
          //                         cubit.addPtest(
          //                           ageFrom: int.parse(ageController.text),
          //                           ageTo: int.parse(ageTOController.text),
          //                           dateFrom: dateTime.toString(),
          //                           dateTo: dateTime2.toString(),
          //                           typeId: cubit.accountType,
          //                           positionId: cubit.positionId,
          //                           sportId: cubit.spId,
          //                         );
          //                       })),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        });
  }
}
