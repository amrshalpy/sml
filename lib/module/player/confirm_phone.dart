import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/club/home/home.dart';
import 'package:sportive/module/coach/home/about_me.dart';
import 'package:sportive/module/company/home/about_me.dart';
import 'package:sportive/module/doctors/home/about_me.dart';
import 'package:sportive/module/player/home/about_me.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';
import 'package:sportive/share/cache_helper.dart';

class ConfimPhone extends StatefulWidget {
  String phone = ' mobile number';
  ConfimPhone({Key? key, required this.phone}) : super(key: key);

  @override
  State<ConfimPhone> createState() => _ConfimPhoneState();
}

class _ConfimPhoneState extends State<ConfimPhone> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(listener: (context, state) {
      // if (state is ChangeAcountType) {
      //   CacheHelper.setShared(key: kType1, value: state.type).then((value) {});
      // }

      if (state is VerifyPhoneSuccess) {
        CacheHelper.setShared(key: kUid, value: state.uid).then((value) {
          Timer(Duration(seconds: 3), () {
            uid = CacheHelper.getShared(key: kUid) != null
                ? CacheHelper.getShared(key: kUid)
                : null;
          });

          if (uid != null) {
            if (PlayerCubit.get(context).accountType == 1) {
              nextPageUntil(context: context, page: Home());

              print(PlayerCubit.get(context).accountType);
            } else if (PlayerCubit.get(context).accountType == 2) {
              nextPageUntil(context: context, page: ClubHome());
            } else if (PlayerCubit.get(context).accountType == 4) {
              nextPageUntil(context: context, page: DoctorHome());
            } else if (PlayerCubit.get(context).accountType == 3) {
              nextPageUntil(context: context, page: CoachHome());
            } else if (PlayerCubit.get(context).accountType == 5) {
              nextPageUntil(context: context, page: CompanyHome());
            } else if (PlayerCubit.get(context).accountType == 6) {
              nextPageUntil(context: context, page: ClubHome());
            } else if (PlayerCubit.get(context).accountType == 7) {
              // CacheHelper.setShared(
              //         key: kType6, value: PlayerCubit.get(context).accountType)
              //     .then((val) {
              //   nextPageUntil(context: context, page: UserHome());
              //   setState(() {
              //     appPages = UserHome();
              //   });
              // });
            }
          }
        });
      }
    }, builder: (context, state) {
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
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                child: logo(),
              ),
              SizedBox(
                height: 140.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
                child: secandContainer(
                  txt: widget.phone,
                  icon: Icons.phone_callback,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
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
                            ChangeType();
                            PlayerCubit.get(context).verifyPhone(
                              code: '#DE#E##',
                              phone: widget.phone,
                            );
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      );
    });
  }
}
