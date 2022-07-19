import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/club/club_cubit/club_cubit.dart';

class Titles extends StatelessWidget {
   Titles({Key? key}) : super(key: key);
  var titlesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 15.w,left: 15.w),
      child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                          txt: 'Tiles',
                          color: Colors.yellowAccent,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                      defaultText(
                          txt: 'at least one title',
                          color: greyColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  defaultText(
                      txt: 'total title  25',
                      color: Colors.yellowAccent,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            defaultText(
                txt: 'Game type',
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Image.asset(
                  'images/sportıve ıcon (1).png',
                  height: 40.h,
                  width: 35.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: contactColor,
                      borderRadius: BorderRadius.circular(10.r),
                      // border: Border.all(),
                    ),
                    child: Center(
                      child: DropdownButtonFormField(
                          dropdownColor: contactColor,
                          // itemHeight: 40,
                          style: TextStyle(
                              color: hintColor,
                              // backgroundColor: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          items: ClubCubit.get(context)
                              .gender
                              .map<DropdownMenuItem<String>>(
                                  (String val) => DropdownMenuItem(
                                        child: Text(val),
                                        value: val,
                                      ))
                              .toList(),
                          value: ClubCubit.get(context).ganderVal,
                          onChanged: (val) {
                            ClubCubit.get(context).onChangedGender(val);
                          }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            defaultText(
                txt: 'Titles type',
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Image.asset(
                  'images/cub.png',
                  height: 40.h,
                  width: 35.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: contactColor,
                      borderRadius: BorderRadius.circular(10.r),
                      // border: Border.all(),
                    ),
                    child: Center(
                      child: DropdownButtonFormField(
                          dropdownColor: contactColor,
                          // itemHeight: 40,
                          style: TextStyle(
                              color: hintColor,
                              // backgroundColor: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          items: ClubCubit.get(context)
                              .gender
                              .map<DropdownMenuItem<String>>(
                                  (String val) => DropdownMenuItem(
                                        child: Text(val),
                                        value: val,
                                      ))
                              .toList(),
                          value: ClubCubit.get(context).ganderVal,
                          onChanged: (val) {
                            ClubCubit.get(context).onChangedGender(val);
                          }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            defaultText(
                txt: 'Owner',
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Image.asset(
                  'images/surface1 (1).png',
                  height: 40.h,
                  width: 35.w,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: buildTextFormField(
                      controller: titlesController,
                      color: contactColor,
                      label: 'Titles number',
                      type: TextInputType.number),
                ),
              ],
            ),
             SizedBox(
              height: 15.h,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                
                ),

              ),
              height: 25.h,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Colors.green,),
                    SizedBox(width: 15,),
                    defaultText(txt: 'Add titles Card',
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 25.h,
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: greenButton(txt: 'Save', onPress: (){}))
          ]),
    );
  }
}
