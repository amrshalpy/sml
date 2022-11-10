import 'package:flutter/material.dart';
import 'package:sportive/module/player/explore/widget/get_all.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

getAllSports(context) {
  return PlayerCubit.get(context).sportModel!.data != null
      ? Padding(
          padding: EdgeInsets.only(right: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      PlayerCubit.get(context).getSportIndex(index);
                      PlayerCubit.get(context).getSportId(
                          PlayerCubit.get(context).sportModel!.data![index].id);
                      PlayerCubit.get(context).getPositions(
                          id: PlayerCubit.get(context)
                              .sportModel!
                              .data![index]
                              .id);
                      print(PlayerCubit.get(context).spId);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.yellowAccent,
                            width: .4,
                          ),
                          color: PlayerCubit.get(context).sportIndex == index
                              ? Colors.orangeAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: getAllSport(
                        PlayerCubit.get(context).sportModel!.data![index],
                        context,
                      ),
                    ),
                  ),
                  itemCount: PlayerCubit.get(context).sportModel!.data!.length,
                ),
              )
            ],
          ),
        )
      : Center(child: CircularProgressIndicator());
}
