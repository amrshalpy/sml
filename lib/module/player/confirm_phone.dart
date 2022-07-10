import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/player/home/about_me.dart';

class ConfimPhone extends StatelessWidget {
  String phone = ' mobile number';
  ConfimPhone({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: AlignmentDirectional.center, children: [
        crdientColor(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding:  EdgeInsets.only(right: 10.w,left: 10.w),
              child: logo(),
            ),
            SizedBox(
              height: 140.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
              child: secandContainer(
                txt: 'Mobile number',
                icon: Icons.phone_callback,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 10.h),
                      child: Container(
                        width: 100.w,
                        child: mainButton(
                            txt: 'respond',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            ontap: () {}),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: defaultText(
                          txt: 'Enter Code',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 41.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                          child: TextField(
                        onChanged: (String val) {},
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 30.w),
                            hintText: 'code'),
                      )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    mainButton(
                        txt: 'Send',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        ontap: () {
                          nextPage(context: context, page: Home());
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
