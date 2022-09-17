import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/search_model.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

Widget getSearch(SreachData data,context,index) {
  return InkWell(
    onTap: () {
      PlayerCubit.get(context).getSportId(index);
      PlayerCubit.get(context).sportedId(data.id);
  //  PlayerCubit.get(context).storageImageInApi(
  //         sportId: data.id,
  //       );

    },
    child: Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 4.w, left: 4.w),
          child: defaultText(
            txt: '${data.name}',
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18.sp,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color:PlayerCubit.get(context).sportId==index?Colors.orange:Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 2.w,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.r),
            topLeft: Radius.circular(10.r),
          )),
    ),
  );
}
