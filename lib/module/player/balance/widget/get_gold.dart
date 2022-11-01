import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

getGold(context) {
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
                            'images/gold2.png',
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
                                  fontSize: 14.sp,
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
                        txt: ' Unlimited Upload videos ',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    SizedBox(
                      height: 10.h,
                    ),
                    defaultText(
                        txt: ' Unlimited Sending request contact ',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    SizedBox(
                      height: 10.h,
                    ),
                    defaultText(
                        txt: ' 8 Usd/ month  ',
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
                          activeColor: Colors.orange,
                          // selectedTileColor: Colors.orangeAccent,
                          subtitle: FaIcon(
                            FontAwesomeIcons.applePay,
                            color: Colors.black,
                            size: 50,
                          ),
                          value: PlayerCubit.get(context).changed,
                          onChanged: (bool? changed) {
                            PlayerCubit.get(context).isChanged(changed);
                          }),
                    ),
                    Container(
                      width: 180.w,
                      child: CheckboxListTile(
                          activeColor: Colors.orange,
                          // selectedTileColor: Colors.orangeAccent,
                          title: Image.asset(
                            'images/Library_PayPal.png',
                            fit: BoxFit.cover,
                            height: 30.h,
                            width: 180.w,
                          ),
                          value: PlayerCubit.get(context).changed1,
                          onChanged: (bool? changed) {
                            PlayerCubit.get(context).isChanged1(changed);
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
                          value: PlayerCubit.get(context).changed2,
                          onChanged: (bool? changed) {
                            PlayerCubit.get(context).isChanged2(changed);
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
                    ),
                  ]);
                }),
          ));
}
