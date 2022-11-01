import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

getSilver(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                top: 20.h, right: 10.w, bottom: 40.h, left: 10.w),
            child: BlocConsumer<PlayerCubit, PlayerState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            'images/silver 455.png',
                            width: 100.w,
                            height: 170.h,
                            // fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              defaultText(
                                  txt: ' Golden ',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              defaultText(
                                  txt: ' Membership ',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    defaultText(
                        txt: ' Upload video 10 videos ',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    SizedBox(
                      height: 10.h,
                    ),
                    defaultText(
                        txt: ' Sending 5 request contact ',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    SizedBox(
                      height: 10.h,
                    ),
                    defaultText(
                        txt: ' 5 Usd/ month  ',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    Divider(
                      color: Colors.orangeAccent,
                      thickness: .3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    defaultText(
                        txt: ' Choose payment method ',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 40.h,
                      width: 180.w,
                      child: CheckboxListTile(
                          selected: true,
                          activeColor: Colors.orange,
                          // selectedTileColor: Colors.orangeAccent,
                          subtitle: FaIcon(
                            FontAwesomeIcons.applePay,
                            color: Colors.black,
                            size: 50,
                          ),
                          value: PlayerCubit.get(context).changedS,
                          onChanged: (bool? changed) {
                            PlayerCubit.get(context).isChangedS(changed);
                          }),
                    ),
                    Container(
                      height: 40.h,
                      width: 180.w,
                      child: CheckboxListTile(
                          enabled: true,
                          selected: true,
                          activeColor: Colors.orange,
                          // selectedTileColor: Colors.orangeAccent,
                          title: Image.asset(
                            'images/Library_PayPal.png',
                            fit: BoxFit.cover,
                            height: 30.h,
                            width: 160.w,
                          ),
                          value: PlayerCubit.get(context).changedS1,
                          onChanged: (bool? changed) {
                            PlayerCubit.get(context).isChangedS1(changed);
                          }),
                    ),
                    Container(
                      width: 180.w,
                      child: CheckboxListTile(
                          selected: true,
                          activeColor: Colors.orange,
                          // selectedTileColor: Colors.orangeAccent,
                          subtitle: FaIcon(
                            FontAwesomeIcons.googlePay,
                            color: Colors.black,
                            size: 50,
                          ),
                          value: PlayerCubit.get(context).changedS2,
                          onChanged: (bool? changed) {
                            PlayerCubit.get(context).isChangedS2(changed);
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        mainButton(
                            txt: 'renew',
                            color: Colors.black,
                            fontSize: 14.sp,
                            colorButton: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            ontap: () {}),
                        mainButton(
                            txt: 'Upgrade',
                            fontSize: 14.sp,
                            colorButton: Colors.orangeAccent,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            ontap: () {}),
                      ],
                    )
                  ]);
                }),
          ));
}
