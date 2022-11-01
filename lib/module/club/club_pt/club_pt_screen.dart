import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/club/club_pt/widgets/new_performance.dart';
import 'package:sportive/module/club/club_pt/widgets/old_performance.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

class ClubPtScreen extends StatelessWidget {
  ClubPtScreen({Key? key}) : super(key: key);
  var txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: PlayerCubit.get(context).indexTab,
      child: Column(
        children: [
          Container(
            height: 50.h,
            color: Colors.grey,
            child: TabBar(
              onTap: (index) {
                PlayerCubit.get(context).changeTabBar(index);
                PlayerCubit.get(context).changeIsTab();
              },
              indicatorColor: Colors.amber,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Container(
                  height: 55.h,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                      child: defaultText(
                          txt: 'Old Performance ',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 60.h,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        thickness: .5,
                        width: .5.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Center(
                          child: defaultText(
                              txt: 'New Performance ',
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: TabBarView(children: [
              OldPerformance(),
              NewPerformance(),
            ]),
          )
        ],
      ),
    );
  }
}
