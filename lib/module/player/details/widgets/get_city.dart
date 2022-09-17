import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/city_model.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

Widget getCity(Data data, BuildContext context) {
  return InkWell(
    onTap: () {
      PlayerCubit.get(context).changecity(data.countryCode);
      PlayerCubit.get(context).changeIsCity();
    },
    child: Padding(
      padding: EdgeInsets.only(left: 10.w, right: 2.w),
      child: Center(
        child: defaultText(
            txt: '${data.name}',
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}
