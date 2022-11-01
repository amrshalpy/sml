import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/module/club/player_club/players.dart';
import 'package:sportive/module/player/player_login/widgets/get_country_code.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

Widget country(context) => Padding(
    padding: EdgeInsets.only(left: 20.w, top: 80.h),
    child: Container(
      height: 300.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) =>
            getCountryCode(PlayerCubit.get(context).countryModel!.data![index]),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
          child: Divider(
            color: Colors.black,
            thickness: .1,
          ),
        ),
        itemCount: PlayerCubit.get(context).countryModel!.data!.length,
      ),
    ));
