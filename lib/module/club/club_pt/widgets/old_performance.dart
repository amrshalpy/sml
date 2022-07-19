import 'package:flutter/material.dart';
import 'package:sportive/module/club/club_cubit/club_cubit.dart';
import 'package:sportive/module/club/club_pt/widgets/get_club_pt.dart';
import 'package:sportive/module/club/club_pt/widgets/get_sports_list.dart';

class OldPerformance extends StatelessWidget {
  OldPerformance({Key? key}) : super(key: key);
  var txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1 / 2.2,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) => getClubPt(context),
              itemCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
