// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sportive/componant/componant/componant.dart';
// import 'package:sportive/componant/style/colors.dart';
// import 'package:sportive/module/player/explore/widget/get_all_sports.dart';
// import 'package:sportive/module/player/explore/widget/search.dart';
// import 'package:sportive/module/player/explore/widget/sports/main_sports.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// import 'package:sportive/player-cubit/player_state.dart';

// void getGame(context) {
//   var txtController = TextEditingController();
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: mainColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
//       builder: (context) => Padding(
//             padding: EdgeInsets.only(
//                 top: 20.h, right: 10.w, bottom: 40.h, left: 10.w),
//             child: BlocConsumer<PlayerCubit, PlayerState>(
//                 listener: (context, state) {},
//                 builder: (context, state) {
//                   return SingleChildScrollView(
//                     child: Column(mainAxisSize: MainAxisSize.min, children: [
//                       Row(
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 pop(context: context);
//                               },
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white,
//                               )),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           defaultText(
//                               txt: 'Select your game',
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Container(
//                         height: 40.h,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: Colors.white, width: 1)),
//                           child: TextField(
//                             onChanged: (String txt) {
//                               PlayerCubit.get(context).getSearch(txt: txt);
//                             },
//                             textAlign: TextAlign.center,
//                             controller: txtController,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14.sp,
//                             ),
//                             decoration: InputDecoration(
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.white, width: 2)),
//                                 hintText: 'Search ',
//                                 suffixIcon: Icon(
//                                   Icons.search,
//                                   color: Colors.white,
//                                 )),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40.h,
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height * .65,
//                         child: txtController.text == ''
//                             ? Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Expanded(child: mainSports(context)),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 15,
//                                   ),
//                                   Expanded(child: getAllSports()),
//                                 ],
//                               )
//                             : searchSports(),
//                       )
//                     ]),
//                   );
//                 }),
//           ));

// }
