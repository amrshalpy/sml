import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/module/player/explore/widget/get_search.dart';
import 'package:sportive/module/player/explore/widget/sports/get_sub_sports.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

Widget subSportsCategory({id}) {
  return BlocProvider<PlayerCubit>(
    create: (context) => PlayerCubit()..getSubSports(sId: id),
    child: BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return PlayerCubit.get(context).subSportModel != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PlayerCubit.get(context).subSportModel!.data != null
                      ? ListView.separated(
                          scrollDirection: Axis.vertical,
                          // physics: NeverScrollableScrollPhysics(),
                          controller: PlayerCubit.get(context).controller,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                // color:
                                //     PlayerCubit.get(context).sportIndex ==
                                //             index
                                //         ? Colors.orangeAccent
                                //         : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                )),
                            child: subSports(
                                PlayerCubit.get(context)
                                    .subSportModel!
                                    .data[index],
                                context,
                                index),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15.h,
                              ),
                          itemCount: PlayerCubit.get(context)
                              .subSportModel!
                              .data
                              .length)
                      : CircularProgressIndicator(),
                )
              : Center(child: CircularProgressIndicator());
        }),
  );
}
