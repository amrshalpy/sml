import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/club/club_cubit/club_cubit.dart';
import 'package:sportive/module/club/player_club/widgets/accepted.dart';
import 'package:sportive/module/club/player_club/widgets/get_sports.dart';
import 'package:sportive/module/club/player_club/widgets/requests.dart';

class PlayersClub extends StatelessWidget {
  PlayersClub({Key? key}) : super(key: key);
  var txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: ClubCubit.get(context).indexTab,
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
                          txt: 'requests ',
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 60,
                  color: Colors.grey,
                  child: Center(
                      child: defaultText(
                          txt: 'accepted ',
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
          Container(
            height: 70,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    getSportsList(ClubCubit.get(context).sportsList[index]),
                separatorBuilder: (context, index) => SizedBox(
                      width: 12,
                    ),
                itemCount: ClubCubit.get(context).sportsList.length),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 40,
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
                          fontSize: 18,
                        )),
                  ),
                ),
                Image.asset(
                  'images/adv search.png',
                  height: 30,
                  width: 30,
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
