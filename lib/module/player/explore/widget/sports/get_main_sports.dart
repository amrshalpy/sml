import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/sport_model.dart';
import 'package:sportive/module/player/explore/widget/sports/main_sports.dart';
import 'package:sportive/module/player/explore/widget/sports/sub_sports.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

Widget getMainSport(Data data, context, index) => InkWell(
      onTap: () {
        PlayerCubit.get(context).getIndex( index);
        
        subSportsCategory(id: data.id);
        
        // print('sportId = ${data.id}');
      },
      child: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 7.w,
                  left: 7.w,
                ),
                child: defaultText(
                  txt: '${data.name}',
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              decoration: BoxDecoration(
                  color: PlayerCubit.get(context).sportIndex == index
                      ? Colors.orange
                      : Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
            )),
      ),
    );
