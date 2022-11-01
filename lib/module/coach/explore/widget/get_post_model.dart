// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sportive/componant/componant/componant.dart';
// import 'package:sportive/module/coach/explore/widget/get_positions.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// import 'package:sportive/player-cubit/player_state.dart';

// class GetSportModel extends StatefulWidget {
//   const GetSportModel({Key? key}) : super(key: key);

//   @override
//   _GetSportModelState createState() => _GetSportModelState();
// }

// class _GetSportModelState extends State<GetSportModel> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PlayerCubit, PlayerState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return PlayerCubit.get(context).positionModel != null
//               ? Column(
//                   children: [
//                     PlayerCubit.get(context).positionModel!.data.isNotEmpty
//                         ? ListView.separated(
//                             itemBuilder: (context, index) => InkWell(
//                               onTap: () {
//                                 CoachCubit.get(context).getIndex(index);
//                               },
//                               child: Container(
//                                 color:
//                                     CoachCubit.get(context).sportIndex == index
//                                         ? Colors.orangeAccent
//                                         : Colors.transparent,
//                                 child: getPosition(CoachCubit.get(context)
//                                     .positionModel!
//                                     .data[index]),
//                               ),
//                             ),
//                             separatorBuilder: (context, index) => SizedBox(
//                               height: 7,
//                             ),
//                             itemCount: CoachCubit.get(context)
//                                 .positionModel!
//                                 .data
//                                 .length,
//                             shrinkWrap: true,
//                           )
//                         : Center(child: CircularProgressIndicator()),
//                   ],
//                 )
//               : Center(child: CircularProgressIndicator());
//         });
//   }
// }
