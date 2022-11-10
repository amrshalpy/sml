import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/club/player_club/players.dart';
import 'package:sportive/module/player/skills/skills.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

void deleteSkills(context, id) {
  final alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    content: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      defaultText(
          txt: 'you want delete this video',
          color: Colors.black,
          fontSize: 14.sp),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                primary: Color.fromARGB(255, 209, 121, 121)),
            onPressed: () {
              PlayerCubit.get(context).deleteSkill(id: id);
              pop(context: context);
            },
            child:
                defaultText(txt: ' OK ', color: Colors.black, fontSize: 14.sp),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              pop(context: context);
            },
            child: defaultText(
                txt: ' cancel ', color: Colors.black, fontSize: 14.sp),
          )
        ],
      )
    ]),
  );
  showDialog(
      context: context,
      builder: (context) => Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.h),
              child: Column(
                children: [
                  alert,
                ],
              ),
            ),
          ));
}
