import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/player/pt/widgets/new_performance.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
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
        // mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            labelColor: Colors.grey,
            isScrollable: true,
            onTap: (index) {
              PlayerCubit.get(context).changeTabBar(index);
              PlayerCubit.get(context).changeIsTab();
            },
            indicatorColor: Colors.amber,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Container(
                height: 60,
                // width: 180.w,
                // color: Colors.grey,
                child: Center(
                    child: defaultText(
                        txt: 'Old Performance ',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 60,
                width: 180.w,
                // color: Colors.grey,
                child: Center(
                    child: defaultText(
                        txt: 'New Performance ',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 460.h,
            width: double.infinity,
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
