import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/module/player/explore/widget/get_all.dart';
import 'package:sportive/module/player/explore/widget/get_search.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

searchSports() {
  return BlocConsumer<PlayerCubit, PlayerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return PlayerCubit.get(context).searchSports != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlayerCubit.get(context).searchSports!.data != null
                    ? ListView.separated(
                        scrollDirection: Axis.vertical,
                        // physics: NeverScrollableScrollPhysics(),
                        controller: PlayerCubit.get(context).controller,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                PlayerCubit.get(context).getSportIndex(index);
                                PlayerCubit.get(context).getSportId(
                                    PlayerCubit.get(context)
                                        .sportModel!
                                        .data![index]
                                        .id);
                                PlayerCubit.get(context).getPositions(
                                    id: PlayerCubit.get(context)
                                        .sportModel!
                                        .data![index]
                                        .id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.yellowAccent, width: .3),
                                    color:
                                        PlayerCubit.get(context).sportIndex ==
                                                index
                                            ? Colors.orangeAccent
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    )),
                                child: getSearch(
                                    PlayerCubit.get(context)
                                        .searchSports!
                                        .data![index],
                                    context,
                                    index),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15.h,
                            ),
                        itemCount:
                            PlayerCubit.get(context).searchSports!.data!.length)
                    : CircularProgressIndicator(),
              )
            : Center(child: CircularProgressIndicator());
      });
}
