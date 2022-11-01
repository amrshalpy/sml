import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class GetContacts extends StatelessWidget {
 
  GetContacts({Key? key, }) : super(key: key);

  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var socialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(children: [
            Stack(children: [
              Stack(
                children: [
                  Image.asset(
                    'images/Path 382.png',
                    height: 150.h,
                    width: double.infinity.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 160.w, top: 15.h),
                    child: Image.asset('images/sportıve ıcon.png'),
                  ),
                ],
              ),
              contactContainer(
                  txt: 'Mobile number',
                  headerText: 'request',
                  icon: Icons.phone_callback_rounded,
                  widget: Column(
                    children: [
                      Row(
                        // mainAxisAlignment:
                        //     MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: PlayerCubit.get(context).countrCodes !=
                                        null
                                    ? defaultText(
                                        txt:
                                            '${PlayerCubit.get(context).countrCodes}',
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold)
                                    : FaIcon(FontAwesomeIcons.phone)),
                          ),
                          Expanded(
                            // flex: 3,
                            child: buildTextFormField(
                              color: greyColor,

                              controller: phoneController,
                              hint: 'phone number',
                              // label: '0126577765',
                              type: TextInputType.phone,
                              validate: (String? val) {
                                if (val!.isEmpty) {
                                  return 'please enter your phone';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Container(
                        width: 120.w,
                        child: mainButton(
                            txt: 'request',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            ontap: () {
                              PlayerCubit.get(context).uploadContact(
                                  privacy: 1,
                                  social: 1,
                                  type: 1,
                                  code: PlayerCubit.get(context)
                                      .countrCodes
                                      .toString(),
                                  text: phoneController.text);
                            }),
                      )
                    ],
                  )),
            ]),
            Stack(children: [
              Stack(
                children: [
                  Image.asset(
                    'images/Path 382.png',
                    height: 150.h,
                    width: double.infinity.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 160.w, top: 15.h),
                    child: Image.asset('images/sportıve ıcon.png'),
                  ),
                ],
              ),
              contactContainer(
                  txt: 'Social media',
                  headerText: 'request',
                  color: Colors.red,
                  icon: Icons.mark_email_read,
                  widget: Column(
                    children: [
                      SizedBox(
                        width: 7.w,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              PlayerCubit.get(context).changeIsSocial();
                            },
                            child: Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Center(
                                    child:
                                        // PlayerCubit.get(context).socialval == null
                                        //     ?
                                        FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blue,
                                )
                                    // : defaultText(
                                    //     txt: PlayerCubit.get(context)
                                    //         .socialval,
                                    //     fontSize: 10.sp,
                                    //     fontWeight: FontWeight.normal
                                    //   ),
                                    )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: buildTextFormField(
                              color: greyColor,
                              controller: socialController,
                              hint: 'http//',
                              // label: '0126577765',
                              type: TextInputType.emailAddress,
                              validate: (String? val) {
                                if (val!.isEmpty) {
                                  return 'please enter your Social address';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: 120.w,
                        child: mainButton(
                            colorButton: Colors.red,
                            txt: 'request',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            ontap: () {
                              PlayerCubit.get(context).uploadContact(
                                  privacy: 1,
                                  social: PlayerCubit.get(context).socialId,
                                  type: '2',
                                  code: PlayerCubit.get(context)
                                      .countrCodes
                                      .toString(),
                                  text: socialController.text);
                            }),
                      )
                    ],
                  )),

              // SizedBox(
              //   height: 2,
              // ),
            ]),
            Stack(
              children: [
               
                Stack(
                  children: [
                    Image.asset(
                      'images/Path 382.png',
                      height: 150.h,
                      width: double.infinity.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160.w, top: 15.h),
                      child: Image.asset('images/sportıve ıcon.png'),
                    ),
                  ],
                ),
                contactContainer(
                    txt: 'Email',
                    headerText: 'request',
                    icon: Icons.email,
                    color: Colors.red,
                    widget: Column(
                      children: [
                        SizedBox(
                          width: 7.w,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: InkWell(
                                onTap: () {
                                  PlayerCubit.get(context).changeIsSocial();
                                },
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.telegram,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFormField(
                                color: greyColor,
                                controller: emailController,
                                hint: 'http//',
                                // label: '0126577765',
                                type: TextInputType.emailAddress,
                                validate: (String? val) {
                                  if (val!.isEmpty) {
                                    return 'please enter your Email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          width: 120.w,
                          child: mainButton(
                              txt: 'request',
                              colorButton: Colors.blue,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              ontap: () {
                                PlayerCubit.get(context).uploadContact(
                                    privacy: 1,
                                    social: PlayerCubit.get(context).socialval,
                                    type: '2',
                                    code: PlayerCubit.get(context)
                                        .countrCodes
                                        .toString(),
                                    text: emailController.text);
                              }),
                        )
                      ],
                    )),
              ],
            )
          ]);
        });
  }
}
