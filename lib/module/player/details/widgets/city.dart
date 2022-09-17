import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/module/player/details/widgets/get_city.dart';
import 'package:sportive/module/player/player_login/widgets/get_country.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

Widget city(context) =>  Padding(
        padding: EdgeInsets.only(left: 20.w, top: 120.h),
        child: Container(
          height: 300.h,
          width: 200.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: PlayerCubit.get(context).cityModel != null
              ? ListView.separated(
                  itemBuilder: (context, index) => getCity(
                      PlayerCubit.get(context).cityModel!.data![index],
                      context),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                        child: Divider(
                          color: Colors.black,
                          thickness: .1,
                        ),
                      ),
                  itemCount:
                      PlayerCubit.get(context).cityModel!.data!.length)
              : Center(child: CircularProgressIndicator()),
        ),
      );
    
