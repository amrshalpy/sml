import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

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
                              PlayerCubit.get(context).getIndex(index);
                            },
                            child: Container(
                              color: PlayerCubit.get(context).sportIndex == index
                                  ? Colors.orangeAccent
                                  : Colors.transparent,
                              child: getPosition(PlayerCubit.get(context)
                                  .subSportModel!
                                  .data[index]),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 7,
                          ),
                          itemCount:
                              PlayerCubit.get(context).sportModel!.data.length,
                          shrinkWrap: true,
                        ),
                     
        ],
      ),
    );
  }
}