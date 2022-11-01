import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class LogoPage extends StatelessWidget {
  LogoPage({Key? key, required this.context}) : super(key: key);
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            height: 80.h,
            decoration: BoxDecoration(color: mainColor),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'images/logospotive1.png',
                        height: 40.h,
                        width: 160.w,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/req to contact1.png',
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Image.asset(
                          'images/notifcation1.png',
                          height: 15.h,
                          width: 15.w,
                        ),
                        IconButton(
                            onPressed: () {
                              PlayerCubit.get(context).changeIsCancel();
                              // setState(() {
                              //   isCancel = !isCancel;
                              // });
                            },
                            icon: Icon(
                              Icons.menu,
                              size: 15.h,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
