import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/sport_model.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_cubit.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_state.dart';

Widget getSubSport(Data data) =>
    BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {},
        builder: (context, state) {
          return InkWell(
            onTap: () {
              // CoachCubit.get(context).getId(data.id);
              // category(id: data.id);
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
        });
