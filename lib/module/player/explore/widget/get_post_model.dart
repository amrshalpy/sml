// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sportive/componant/componant/componant.dart';
// import 'package:sportive/module/player/explore/widget/get_positions.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// import 'package:sportive/player-cubit/player_state.dart';

// class GetSportsModel extends StatefulWidget {
//   const GetSportsModel({Key? key}) : super(key: key);

//   @override
//   _GetSportsModelState createState() => _GetSportsModelState();
// }

// class _GetSportsModelState extends State<GetSportsModel> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PlayerCubit, PlayerState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           PlayerCubit cubit = PlayerCubit.get(context);
//           return  SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       cubit.positionModel!.data.isNotEmpty
//                           ? ListView.separated(
//                               physics: BouncingScrollPhysics(),
//                               itemBuilder: (context, index) => InkWell(
//                                 onTap: () {
//                                   PlayerCubit.get(context).getIndex(index);
//                                 },
//                                 child: Container(
//                                   color: PlayerCubit.get(context).sportIndex ==
//                                           index
//                                       ? Colors.orangeAccent
//                                       : Colors.transparent,
//                                   child: getPosition(PlayerCubit.get(context)
//                                       .positionModel!
//                                       .data[index]),
//                                 ),
//                               ),
//                               separatorBuilder: (context, index) => SizedBox(
//                                 height: 7,
//                               ),
//                               itemCount: PlayerCubit.get(context)
//                                   .positionModel!
//                                   .data
//                                   .length,
//                               shrinkWrap: true,
//                             )
//                           : Center(child: CircularProgressIndicator()),
//                     ],
//                   ),
//                 )
//               ;
//         });
//   }
// }
