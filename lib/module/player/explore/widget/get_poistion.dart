// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sportive/componant/componant/componant.dart';
// import 'package:sportive/componant/style/colors.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// void getPoistion(context) {
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: mainColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
//       builder: (context) => Padding(
//             padding:
//                  EdgeInsets.only(top: 20.h, right: 10.w, bottom: 40.h, left: 10.w),
//             child: PlayerCubit.get(context).sportModel !=null
//                 ? Column(mainAxisSize: MainAxisSize.min, children: [
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               pop(context: context);
//                             },
//                             icon: Icon(
//                               Icons.arrow_back,
//                               color: Colors.white,
//                             )),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         defaultText(
//                             txt: 'Select your Position',
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     Container(
//                       height: MediaQuery.of(context).size.height * .65,
//                       child: Row(
//                         children: [
//                           // Column(
//                           //   children: [
//                           //   getSports(context),
//                           //   ],
//                           // ),
//                           SizedBox(
//                             width: 15.w,
//                           ),
//                         Expanded(child: GetSportsModel()),
//                         ],
//                       ),
//                     )
                 
//                   ])
//                 : Center(child: CircularProgressIndicator()),
//           ));

// }
