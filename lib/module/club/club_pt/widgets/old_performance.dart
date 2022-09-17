import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          height: 70.h,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  getSportsList(ClubCubit.get(context).sportsList[index]),
              separatorBuilder: (context, index) => SizedBox(
                    width: 12.w,
                  ),
              itemCount: ClubCubit.get(context).sportsList.length),
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
              borderRadius: BorderRadius.circular(15.r),
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
          child: Padding(
            padding:  EdgeInsets.only(left: 15.w),
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
