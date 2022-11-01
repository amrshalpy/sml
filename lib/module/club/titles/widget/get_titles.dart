import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

class GetTitles extends StatefulWidget {
  const GetTitles({Key? key}) : super(key: key);

  @override
  _GetTitlesState createState() => _GetTitlesState();
}

class _GetTitlesState extends State<GetTitles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.yellowAccent, width: .7),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              bottomLeft: Radius.circular(20.r))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  width: 10.w,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: contactColor,
                        borderRadius: BorderRadius.circular(10.r),
                        // border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: defaultText(
                            txt: 'Game Type',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
                  width: 10.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: contactColor,
                      borderRadius: BorderRadius.circular(10.r),
                      // border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {},
                        child: defaultText(
                          txt: 'Title Type',
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
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
                      controller: PlayerCubit.get(context).titlesController,
                      color: contactColor,
                      label: 'Titles number',
                      type: TextInputType.number),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
