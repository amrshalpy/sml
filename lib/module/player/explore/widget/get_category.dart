import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/player/explore/widget/get_sub_sport.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

Widget category({String? id}) {
   print("id is =${id}");

  return Builder(builder: (context) {
    PlayerCubit.get(context).getSubSports(id: id);
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return cubit.subSportModel!.data!.isNotEmpty
              ? Column(children: [
                  cubit.subSportModel!.data != null
                      ? ListView.separated(
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              PlayerCubit.get(context).getCategoryIndex(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color:
                                    PlayerCubit.get(context).categoryIndex == index
                                        ? Colors.orangeAccent
                                        : Colors.transparent,
                              ),
                              child: getPosition(PlayerCubit.get(context)
                                  .subSportModel!
                                  .data![index]),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 7,
                          ),
                          itemCount: PlayerCubit.get(context)
                              .subSportModel!
                              .data!
                              .length,
                          shrinkWrap: true,
                        )
                      : Center(child: CircularProgressIndicator())
                ])
              : Center(child: CircularProgressIndicator());
        });
  });
}
