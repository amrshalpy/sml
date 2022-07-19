import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/module/club/club_cubit/club_cubit.dart';
import 'package:sportive/module/club/club_pt/widgets/new_performance.dart';
import 'package:sportive/module/club/club_pt/widgets/old_performance.dart';

class ClubPtScreen extends StatelessWidget {
  ClubPtScreen({Key? key}) : super(key: key);
  var txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: HomeCubit.get(context).indexTab,
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.grey,
            child: TabBar(
              onTap: (index) {
                ClubCubit.get(context).changeTabBar(index);
                ClubCubit.get(context).changeIsTab();
              },
              indicatorColor: Colors.amber,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Container(
                  height: 55,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                      child: defaultText(
                          txt: 'Old Performance ',
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 60,
                  color: Colors.grey,
                  child: Row(
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                        width: 1.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Center(
                          child: defaultText(
                              txt: 'New Performance ',
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
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
