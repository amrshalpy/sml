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
        return PlayerCubit.get(context).searchModel != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlayerCubit.get(context).searchModel!.data != null
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
                          child: getSearch(
                            PlayerCubit.get(context)
                                .searchModel!
                                .data!
                                .data[index],context,index
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15.h,
                            ),
                        itemCount: PlayerCubit.get(context)
                            .searchModel!
                            .data!
                            .data
                            .length)
                    : CircularProgressIndicator(),
              )
            : Center(child: CircularProgressIndicator());
      });
}
