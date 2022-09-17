import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_cubit.dart';
import 'package:sportive/module/doctors/doctor_cubit/doctor_state.dart';
import 'package:sportive/module/doctors/explore/widget/get_positions.dart';

class GetSportsModel extends StatefulWidget {
  const GetSportsModel({Key? key}) : super(key: key);

  @override
  _GetSportsModelState createState() => _GetSportsModelState();
}

class _GetSportsModelState extends State<GetSportsModel> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {},
        builder: (context, state) {
          DoctorCubit cubit = DoctorCubit.get(context);
          return cubit.positionModel != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      cubit.positionModel!.data.isNotEmpty
                          ? ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  DoctorCubit.get(context).getIndex(index);
                                },
                                child: Container(
                                  color: DoctorCubit.get(context).sportIndex ==
                                          index
                                      ? Colors.orangeAccent
                                      : Colors.transparent,
                                  child: getPosition(DoctorCubit.get(context)
                                      .positionModel!
                                      .data[index]),
                                ),
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 7,
                              ),
                              itemCount: DoctorCubit.get(context)
                                  .positionModel!
                                  .data
                                  .length,
                              shrinkWrap: true,
                            )
                          : Center(child: CircularProgressIndicator()),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
