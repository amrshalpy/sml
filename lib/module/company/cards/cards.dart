import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/company/cards/widgets/get_card.dart';
import 'package:sportive/module/company/cards/widgets/widgets/new_performance.dart';
import 'package:sportive/module/company/cards/widgets/widgets/old_performance.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                  height: 370.h,
                  width: double.infinity,
                  child: TabBarView(children: [
                    OldPerformance(),
                    NewPerformance(),
                  ]),
                )
              ],
            ),
          );
        });

    
  }
}
