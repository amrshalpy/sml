import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/coach/explore/widget/get_sports.dart';
import 'package:sportive/module/company/company_cubit/company_cubit.dart';
import 'package:sportive/module/company/company_cubit/company_state.dart';

Widget category({id}) {
  return BlocProvider(
    create: (context) => CompanyCubit()
      ..getSubSports(id: id)
      ..getSports(),
    child: BlocConsumer<CompanyCubit, CompanyState>(listener: (context, state) {
      if (state is GetSubSportsSuccess) {
        Center(
            child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        ));
      }
    }, builder: (context, state) {
      CompanyCubit cubit = CompanyCubit.get(context);
      return cubit.subSportModel != null
          ? Column(children: [
              cubit.subSportModel!.data != null
                  ? ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          CompanyCubit.get(context).getCategoryIndex(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color:
                                CompanyCubit.get(context).categoryIndex == index
                                    ? Colors.orangeAccent
                                    : Colors.transparent,
                          ),
                          child: getSports(CompanyCubit.get(context)
                              .subSportModel!
                              .data[index]),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 7,
                      ),
                      itemCount:
                          CompanyCubit.get(context).subSportModel!.data.length,
                      shrinkWrap: true,
                    )
                  : Center(child: CircularProgressIndicator())
            ])
          : Center(child: CircularProgressIndicator());
    }),
  );
}
