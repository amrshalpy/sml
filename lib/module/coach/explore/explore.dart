import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/coach/explore/widget/get_poistion.dart';
import 'package:sportive/module/coach/explore/widget/get_your_game.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);
  var nameController = TextEditingController();

  var clubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'images/gold5.png',
                fit: BoxFit.contain,
                width: 330.w,
                height: 450.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/CompositeLayer (2).png',
                              height: 65.h,
                              width: 65.w,
                              // fit: BoxFit.contain,
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
                            padding: EdgeInsets.only(top: 10.h, right: 18.w),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: 50.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.upload_file,
                                          size: 35.h,
                                        )),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    defaultText(
                                      txt: 'Upload image',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                              height: 170.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 39, 3, 3),
                                ),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 30.h,
                    width: 150.w,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'enter your name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 30.h,
                    width: 150.w,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: clubController,
                      decoration: InputDecoration(
                        hintText: 'enter your club',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  InkWell(
                    child: defaultText(
                      txt: 'your game name',
                      color: Colors.blue,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      getGame(context);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    child: defaultText(
                      txt: 'your position',
                      color: Colors.blue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      getPoistion(context);
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: greenButton(txt: 'Save', onPress: () {}))
        ],
      ),
    );
  }
}
