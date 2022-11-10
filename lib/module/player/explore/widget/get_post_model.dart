import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/player/explore/widget/get_positions.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

Widget getPositions(context){
            return PlayerCubit.get(context).getPositionModel!=null?
           SingleChildScrollView(
            child: Column(
              children: [
                PlayerCubit.get(context).getPositionModel!.data!.isNotEmpty
                    ? ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            PlayerCubit.get(context).getPositionIndex(index);
                            PlayerCubit.get(context).getPositionId(PlayerCubit.get(context).getPositionModel!.data![index].id);
                          },
                          child: Container(
                            color: PlayerCubit.get(context).positionIndex == index
                                ? Colors.orangeAccent
                                : Colors.transparent,
                            child: getPosition(PlayerCubit.get(context)
                                .getPositionModel!
                                .data![index]),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 7,
                        ),
                        itemCount: PlayerCubit.get(context)
                            .getPositionModel!
                            .data!
                            .length,
                        shrinkWrap: true,
                      )
                    : Center(child: CircularProgressIndicator()),
              ],
            ),
          ): Center(child: CircularProgressIndicator());
  }

