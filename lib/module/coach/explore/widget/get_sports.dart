// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sportive/module/coach/coach-cubit/coach_cubit.dart';
// import 'package:sportive/module/coach/coach-cubit/coach_state.dart';
// import 'package:sportive/module/coach/explore/widget/get_sub_sport.dart';

// Widget getSports(context) {
//   return BlocConsumer<CoachCubit, CoachState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return CoachCubit.get(context).sportModel != null
//             ? Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 400.h,
//                   width: 25.w,
//                   child: CoachCubit.get(context).sportModel!.data != null
//                       ? ListView.separated(
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) => InkWell(
//                                 onTap: () {
//                                   CoachCubit.get(context).getIndex(index);
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       color:
//                                           CoachCubit.get(context).sportIndex ==
//                                                   index
//                                               ? Colors.orangeAccent
//                                               : Colors.transparent,
//                                       borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(10),
//                                         topRight: Radius.circular(10),
//                                       )),
//                                   // child: getSubSport(
//                                   //     CoachCubit.get(context)
//                                   //         .sportModel!
//                                   //         .data[index],
//                                   //     ),
//                                 ),
//                               ),
//                           separatorBuilder: (context, index) => SizedBox(
//                                 height: 15.h,
//                               ),
//                           itemCount:
//                               CoachCubit.get(context).sportModel!.data.length)
//                       : CircularProgressIndicator(),
//                 ),
//               )
//             : Center(child: CircularProgressIndicator());
//       });
// }
