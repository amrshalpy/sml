import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';

class UploadVideo extends StatefulWidget {
  UploadVideo({Key? key}) : super(key: key);
  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  var typeController = TextEditingController();
  var titleController = TextEditingController();
  bool isTitle = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => pop(context: context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            crdientColor(),
            Column(
              children: [
                LogoPage(context: context),
                InkWell(
                    onTap: () {
                      pop(context: context);
                    },
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ))),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'images/Path 384 (1).png',
                                  height: 650.h,
                                  width: 340.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 137.w, top: 18.h),
                                  child: Image.asset(
                                      'images/sportıve ıcon (3).png'),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 10.w,
                                  top: 36.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defaultText(
                                        txt: DateTime.now()
                                            .toString()
                                            .substring(0, 11),
                                        fontSize: 15.sp,
                                        color: Colors.white),
                                    Row(
                                      children: [
                                        mainButton(
                                            fontWeight: FontWeight.bold,
                                            ontap: () {},
                                            colorButton: Colors.orangeAccent,
                                            txt: 'upload video',
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                        // SizedBox(
                                        //   width: 15.w,
                                        // ),
                                        // InkWell(
                                        //     onTap: () {},
                                        //     child: Image.asset('images/delet.png'))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Container(
                                  // height: 30.h,
                                  width: 300.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                    child: TextField(
                                      maxLines: 2,
                                      minLines: 1,
                                      controller: typeController,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide()),
                                          hintText: 'Add type of title',
                                          suffixIcon: Icon(
                                            Icons.add,
                                            color: Colors.yellowAccent,
                                          ),
                                          hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Container(
                                  height: 240,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 50.h),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.video_call_outlined,
                                              color: Colors.white,
                                              size: 45,
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            defaultText(
                                                txt: 'upload video',
                                                color: Colors.white,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  mainButton(
                                      txt: 'fit size',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      ontap: () {}),
                                  mainButton(
                                      txt: 'custom size',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      ontap: () {})
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: defaultText(
                                  txt: 'max 30 secand',
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child:
                                    Image.asset('images/CompositeLayer3.png'),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              if (isTitle == true)
                                Padding(
                                  padding: EdgeInsets.only(left: 120.w),
                                  child: Container(
                                    height: 30.h,
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Center(
                                      child: TextField(
                                        // maxLines: 10,
                                        // minLines: 1,
                                        controller: titleController,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Add title',
                                            hintStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ),
                              if (isTitle == false)
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 70.w),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isTitle = true;
                                        });
                                      },
                                      child: Container(
                                        width: 120.w,
                                        height: 70.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.yellowAccent),
                                            borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(25.r),
                                              topLeft: Radius.circular(25.r),
                                            )),
                                        child: Column(children: [
                                          Image.asset(
                                            'images/sportıve ıcon (1).png',
                                            height: 50.h,
                                            width: 50.w,
                                          ),
                                          // SizedBox(
                                          //   height: 3.h,
                                          // ),
                                          defaultText(
                                              txt: 'Add title',
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30.w, top: 550),
                              child: Image.asset(
                                'images/silver club (1).png',
                                height: 160.h,
                                width: 70.w,
                              ),
                            ),
                          ),
                          SizedBox(width: 80),
                          Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Image.asset(
                                'images/sportıve ıcon (1).png',
                                height: 40.h,
                                width: 45.w,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
