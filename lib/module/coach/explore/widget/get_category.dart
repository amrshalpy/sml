import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/coach/coach-cubit/coach_cubit.dart';
import 'package:sportive/module/coach/coach-cubit/coach_state.dart';
import 'package:sportive/module/doctors/explore/widget/get_sports.dart';

Widget category({id}) {
  return BlocProvider(
    create: (context) => CoachCubit()
      ..getSubSports(id: id)
      ..getSports(),
    child: BlocConsumer<CoachCubit, CoachState>(listener: (context, state) {
      if (state is GetSubSportsSuccess) {
        Center(
            child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        ));
      }
    }, builder: (context, state) {
      CoachCubit cubit = CoachCubit.get(context);
      return cubit.subSportModel != null
          ? Column(children: [
              cubit.subSportModel!.data != null
                  ? ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          CoachCubit.get(context).getCategoryIndex(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color:
                                CoachCubit.get(context).categoryIndex == index
                                    ? Colors.orangeAccent
                                    : Colors.transparent,
                          ),
                          child: getSports(CoachCubit.get(context)
                              .subSportModel!
                              .data[index]),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 7,
                      ),
                      itemCount:
                          CoachCubit.get(context).subSportModel!.data.length,
                      shrinkWrap: true,
                    )
                  : Center(child: CircularProgressIndicator())
            ])
          : Center(child: CircularProgressIndicator());
    }),
  );
}
