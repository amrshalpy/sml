import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_cubit.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_state.dart';
import 'package:sportive/module/doctors/explore/widget/get_sub_sport.dart';

Widget category({id}) {
  return BlocProvider(
    create: (context) => DoctorCubit()
      ..getSubSports()
      ..getSports()
      ..getSportsData(),
    child: BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
      if (state is GetSubSportsSuccess) {
        Center(
            child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        ));
      }
    }, builder: (context, state) {
      DoctorCubit cubit = DoctorCubit.get(context);
      return cubit.subSportModel != null
          ? Column(children: [
              cubit.subSportModel!.data != null
                  ? ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          DoctorCubit.get(context).getCategoryIndex(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color:
                                DoctorCubit.get(context).categoryIndex == index
                                    ? Colors.orangeAccent
                                    : Colors.transparent,
                          ),
                          child: getSubSport(DoctorCubit.get(context)
                              .subSportModel!
                              .data[index]),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 7,
                      ),
                      itemCount:
                          DoctorCubit.get(context).subSportModel!.data.length,
                      shrinkWrap: true,
                    )
                  : Center(child: CircularProgressIndicator())
            ])
          : Center(child: CircularProgressIndicator());
    }),
  );
}
