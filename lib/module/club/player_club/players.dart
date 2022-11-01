import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/club/player_club/widgets/accepted.dart';
import 'package:sportive/module/club/player_club/widgets/get_sports.dart';
import 'package:sportive/module/club/player_club/widgets/requests.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

class PlayersClub extends StatelessWidget {
  PlayersClub({Key? key}) : super(key: key);
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
                          txt: 'requests ',
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 60.h,
                  color: Colors.grey,
                  child: Center(
                      child: defaultText(
                          txt: 'accepted ',
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 70.h,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    getSportsList(PlayerCubit.get(context).sportsList[index]),
                separatorBuilder: (context, index) => SizedBox(
                      width: 12.w,
                    ),
                itemCount: PlayerCubit.get(context).sportsList.length),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w, right: 10.w),
            child: Container(
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: txtController,
                    onChanged: (val) {},
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        iconColor: Colors.white,
                        labelText: 'Search',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        )),
                  ),
                ),
                Image.asset(
                  'images/adv search.png',
                  height: 30.h,
                  width: 30.w,
                )
              ]),
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              Requests(),
              Accepted(),
            ]),
          )
        ],
      ),
    );
  }
}
