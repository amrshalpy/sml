import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/player/explore/widget/get_poistion.dart';
import 'package:sportive/module/player/explore/widget/get_your_game.dart';

class ClubExploreGold extends StatefulWidget {
  ClubExploreGold({Key? key}) : super(key: key);

  @override
  State<ClubExploreGold> createState() => _ClubExploreGoldState();
}

class _ClubExploreGoldState extends State<ClubExploreGold> {
  var foundedController = TextEditingController();

  var clubController = TextEditingController();
  DateTime? dateTime;
  DateTime currentDate = DateTime.now();
  String difference = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset(
                'images/silver club (1).png',
                // fit: BoxFit.contain,
                width: 350.w,
                height: 460.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 82.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 70.w),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              defaultText(
                                  txt: '25',
                                  color: Color.fromARGB(255, 3, 65, 116),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                              defaultText(
                                  txt: 'Titles',
                                  color: Color.fromARGB(255, 2, 56, 100),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                              // Divider(color: Colors.black,thickness: 9,),
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.asset(
                                'images/CompositeLayer.png',
                                height: 30.h,
                                width: 30.w,
                                fit: BoxFit.contain,
                              ),
                              defaultText(txt: '100 ' + "K"),
                              SizedBox(
                                height: 5.h,
                              ),
                              Icon(Icons.favorite),
                              defaultText(txt: '100 ' + "K"),
                              SizedBox(
                                height: 5.h,
                              ),
                              Image.asset(
                                'images/icons8-share-48 (3).png',
                                height: 30.h,
                                width: 30.w,
                              ),
                              defaultText(txt: '100 ' + "K"),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 80.h, right: 18.w),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/18.png',
                                      height: 170.h,
                                      width: 150.w,
                                    ),
                                  ],
                                ),
                                height: 170.h,
                                width: 150.w,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ],
                    ),

                    defaultText(
                        txt: 'LiverPool',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                    Divider(
                      color: Colors.blue,
                      endIndent: 100,
                      indent: 90,
                      height: 5,
                      thickness: 3,
                    ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),

                    Container(
                        child: defaultText(
                            txt: 'Founded 1980',
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold)),

                    SizedBox(
                      height: 8.h,
                    ),
                    // InkWell(
                    //   child: defaultText(
                    //     txt: 'your game name',
                    //     color: Colors.blue,
                    //     fontSize: 17.sp,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //   onTap: () {
                    //     getGame(context);
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // InkWell(
                    //   child: defaultText(
                    //     txt: 'your position',
                    //     color: Colors.blue,
                    //     fontSize: 20.sp,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //   onTap: () {
                    //     getPoistion(context);
                    //   },
                    // ),
                  ],
                ),
              ),
              // SizedBox(height: 5.h,),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                right: 15.w, bottom: 10.h, top: 1.h, left: 15.w),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  greenButton(txt: 'back', onPress: () {}),
                  greenButton(txt: 'Save', onPress: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
