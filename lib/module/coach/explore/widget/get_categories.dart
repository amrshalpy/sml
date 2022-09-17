// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sportive/componant/componant/componant.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// import 'package:sportive/player-cubit/player_state.dart';

// Widget getCategories({id}) {
//   return BlocProvider<PlayerCubit>(
//     create: (context) => PlayerCubit()..getSports()..getSubSports(id: id),
//     child: BlocConsumer<PlayerCubit, PlayerState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 400.h,
//               width: 25.w,
//               child: PlayerCubit.get(context).subSportModel!= null
//                   ? ListView.separated(
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) => InkWell(
//                             onTap: () {
//                               PlayerCubit.get(context).getCategoryIndex(index);
//                             },
//                             child: Container(
//                                decoration: BoxDecoration(
//                                   color: PlayerCubit.get(context).categoryIndex ==
//                                           index
//                                       ? Colors.orangeAccent
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(10),
//                                     topRight: Radius.circular(10),
//                                   )),

//                               child:  getPosition(PlayerCubit.get(context)
//                                 .subSportModel!
//                                 .data[index],
//                                   ),
//                             ),
//                           ),
//                       separatorBuilder: (context, index) => SizedBox(
//                             height: 15.h,
//                           ),
//                       itemCount:
//                             PlayerCubit.get(context).subSportModel!.data.length)
//                   : Center(child: CircularProgressIndicator()),
//             ),
//           );
//         }),
//   );
// }
