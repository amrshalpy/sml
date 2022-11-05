import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/module/player/explore/widget/get_sport.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

Widget getSports(context) {
  return BlocConsumer<PlayerCubit, PlayerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return PlayerCubit.get(context).sportModel !=null? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400.h,
            width: 25.w,
             child:
            // PlayerCubit.get(context).sportModel!.data .isNotEmpty
                 ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                       decoration: BoxDecoration(
                          // color: PlayerCubit.get(context).sportIndex ==
                          //         index
                          //     ? Colors.orangeAccent
                          //     : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),

                      // child: getSport(
                      //     PlayerCubit.get(context)
                      //         .sportModel!
                      //         .data[index],
                      //     context,index),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15.h,
                        ),
                    itemCount:10
                        // PlayerCubit.get(context).sportModel!.data.length
                        )
                // : CircularProgressIndicator(),
          ),
        ):Center(child: CircularProgressIndicator());
      });
}
