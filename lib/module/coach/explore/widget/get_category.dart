// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sportive/componant/componant/componant.dart';
// import 'package:sportive/player-cubit/player_cubit.dart';
// import 'package:sportive/player-cubit/player_state.dart';

// Widget category({id}) {
//   return BlocProvider(
//     create: (context) => PlayerCubit()
//       // ..getSubSports(id: id)
//       // ..getSports(),
//     ,child: BlocConsumer<PlayerCubit, PlayerState>(listener: (context, state) {
//       if (state is GetSubSportsSuccess) {
//         Center(
//             child: CircularProgressIndicator(
//           color: Colors.orangeAccent,
//         ));
//       }
//     }, builder: (context, state) {
//       PlayerCubit cubit = PlayerCubit.get(context);
//       return cubit.subSportModel != null
//           ? Column(children: [
//               cubit.subSportModel!.data != null
//                   ? ListView.separated(
//                       itemBuilder: (context, index) => InkWell(
//                         onTap: () {
//                           PlayerCubit.get(context).getCategoryIndex(index);
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                               bottomRight: Radius.circular(15),
//                             ),
//                             color:
//                                 PlayerCubit.get(context).categoryIndex == index
//                                     ? Colors.orangeAccent
//                                     : Colors.transparent,
//                           ),
//                           child: getSports(PlayerCubit.get(context)
//                               .subSportModel!
//                               .data[index]),
//                         ),
//                       ),
//                       separatorBuilder: (context, index) => SizedBox(
//                         height: 7,
//                       ),
//                       itemCount:
//                           PlayerCubit.get(context).subSportModel!.data.length,
//                       shrinkWrap: true,
//                     )
//                   : Center(child: CircularProgressIndicator())
//             ])
//           : Center(child: CircularProgressIndicator());
//     }),
//   );
// }
