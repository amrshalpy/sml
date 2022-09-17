import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/module/player/explore/widget/get_sub_sport.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

Widget category() {
  return BlocProvider(
    create: (context) => PlayerCubit()
       ,
    child: BlocConsumer<PlayerCubit, PlayerState>(listener: (context, state) {
      if (state is GetSubSportsSuccess) {
        Center(
            child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        ));
      }
    }, builder: (context, state) {
      PlayerCubit cubit = PlayerCubit.get(context);
      return  Column(children: [
            ListView.separated(
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          // color:
                          //     PlayerCubit.get(context).categoryIndex == index
                          //         ? Colors.orangeAccent
                          //         : Colors.transparent,
                        ),
    child: getSubSport(PlayerCubit.get(context)
                              .subSportModel!
                              .data[index],context,index),                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 7,
                      ),
                      itemCount:
                          PlayerCubit.get(context).subSportModel!.data.length,
                      shrinkWrap: true,
                    )
                 
            ])
          ;
    }),
  );
}
