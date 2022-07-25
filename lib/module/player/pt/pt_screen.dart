import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/module/player/pt/widgets/get_pt.dart';
import 'package:sportive/module/player/pt/widgets/get_sports_list.dart';
import 'package:sportive/module/player/pt/widgets/new_performance.dart';
import 'package:sportive/module/player/pt/widgets/old_performance.dart';

class PtScreen extends StatelessWidget {
  PtScreen({Key? key}) : super(key: key);
  var txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: PlayerCubit.get(context).indexTab,
      child: Column(
        children: [
          Container(
            height: 50,
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
                  child: Center(
                      child: defaultText(
                          txt: 'New Performance ',
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold)),
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
              OldPerformance(),
            ]),
          )
        ],
      ),
    );
  }
}
