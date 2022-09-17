import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/coach/coach-cubit/coach_cubit.dart';
import 'package:sportive/module/company/explore/widget/get_positions.dart';

class GetSportModel extends StatefulWidget {
  const GetSportModel({ Key? key }) : super(key: key);

  @override
  _GetSportModelState createState() => _GetSportModelState();
}

class _GetSportModelState extends State<GetSportModel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListView.separated(
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              CoachCubit.get(context).getIndex(index);
                            },
                            child: Container(
                              color: CoachCubit.get(context).sportIndex == index
                                  ? Colors.orangeAccent
                                  : Colors.transparent,
                              child: getPosition(CoachCubit.get(context)
                                  .positionModel!
                                  .data[index]),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 7,
                          ),
                          itemCount:
                              CoachCubit.get(context).positionModel!.data.length,
                          shrinkWrap: true,
                        ),
                     
        ],
      ),
    );
  }
}