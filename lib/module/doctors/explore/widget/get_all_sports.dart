import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_cubit.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_state.dart';
import 'package:sportive/module/doctors/explore/widget/get_all.dart';

getAllSports() {
  return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DoctorCubit.get(context).getAllSports != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400.h,
                  width: 25.w,
                  child: DoctorCubit.get(context).getAllSports!.data != null
                      ? ListView.separated(
                          scrollDirection: Axis.vertical,
                          controller: DoctorCubit.get(context).controller,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  DoctorCubit.get(context).getIndex(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          DoctorCubit.get(context).sportIndex ==
                                                  index
                                              ? Colors.orangeAccent
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  child: getAllSport(
                                    DoctorCubit.get(context)
                                        .getAllSports!
                                        .data[index],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15.h,
                              ),
                          itemCount: DoctorCubit.get(context)
                              .dataOfPages!
                              .length += 7)
                      : CircularProgressIndicator(),
                ),
              )
            : Center(child: CircularProgressIndicator());
      });
}
