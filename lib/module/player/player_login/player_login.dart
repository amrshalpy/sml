// ignore_for_file: null_check_always_fails, dead_code

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/const/const.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/club/home/home.dart';
import 'package:sportive/module/coach/home/about_me.dart';
import 'package:sportive/module/company/home/about_me.dart';
import 'package:sportive/module/doctors/home/about_me.dart';
import 'package:sportive/module/player/home/about_me.dart';
import 'package:sportive/module/player/player_login/widgets/country.dart';
import 'package:sportive/module/player/player_login/widgets/get_country_code.dart';
import 'package:sportive/module/player/player_login/widgets/get_types.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';
import 'package:sportive/module/player/confirm_phone.dart';
import 'package:sportive/share/cache_helper.dart';

class PlayerLogin extends StatefulWidget {
  PlayerLogin({Key? key}) : super(key: key);

  @override
  State<PlayerLogin> createState() => _PlayerLoginState();
}

class _PlayerLoginState extends State<PlayerLogin> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String code = '';
  String confirmPassword = '';
  bool isCountry = false;
  bool isType = false;
  String countryCode = '';
  int accountType = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(listener: (context, state) {
      if (state is RegisterError) {
        SnackBar(
            content: Text(
          ' ${state.message}',
        ));
      }

      if (state is RegisterSuccess) {
        showAboutDialog(context: context, children: [
          Center(
            child: Text(
              ' success',
            ),
          )
        ]);
        // CacheHelper.setShared(key: kUid, value: state.uid).then((value) {
        //  PlayerCubit.get(context).getPlayerData();
        nextPage(
            context: context,
            page: ConfimPhone(
              phone: phoneController.text,
            ));

        // });
      }
    }, builder: (context, state) {
      PlayerCubit cubit = PlayerCubit.get(context);

      return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: InkWell(
          onTap: () {
            setState(() {
              isCountry = false;
              isType = false;
            });
          },
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff154E66), Color(0xff06141A)])),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
                      child: Image.asset("images/logospotive1.png"),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 5.w, left: 5.w),
                      child: Stack(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Image.asset(
                                'images/gold5.png',
                                height: 440.h,
                                // fit: BoxFit.contain,
                                width: 360.w,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Form(
                                key: formKey,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  child: Column(children: [
                                    defaultText(
                                        txt: 'New account',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      width: 260.w,
                                      child: buildTextFormField(
                                        controller: nameController,
                                        hint: 'please enter your name',
                                        label: 'Enter your name',
                                        type: TextInputType.text,
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'please enter your name';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      width: 260.w,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isCountry = true;
                                              });
                                            },
                                            child: Container(
                                              height: 40.h,
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black45),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                  child: defaultText(
                                                      txt: cubit.codeCountry ==
                                                              null
                                                          ? '+93 '
                                                          : cubit.codeCountry,
                                                      color: Colors.black,
                                                      fontSize: 7.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                              controller: phoneController,
                                              hint: '',
                                              label: 'Enter your phone',
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
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      width: 260.w,
                                      child: buildTextFormField(
                                        controller: passwordController,
                                        hint: 'please enter your password',
                                        label: 'Enter your password',
                                        type: TextInputType.visiblePassword,
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'please enter your password';
                                          } else if (val.length < 8) {
                                            return 'at least 8 characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      width: 260.w,
                                      child: buildTextFormField(
                                        controller: confirmPasswordController,
                                        hint: 'confirm Password',
                                        label: 'confirm Password',
                                        type: TextInputType.text,
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'please enter your confirmPassword';
                                          } else if (val !=
                                              passwordController.text) {
                                            return ' confirmPassword must be eqaul password';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    // defaultText(
                                    //     txt: 'account type',
                                    //     fontSize: 16.sp,
                                    //     fontWeight: FontWeight.bold),
                                    // SizedBox(
                                    //   height: 7.h,
                                    // ),
                                    // Container(
                                    //   width: 260.w,
                                    //   child: DropdownButtonFormField(
                                    //       decoration: InputDecoration(
                                    //           border: OutlineInputBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(10))),
                                    //       items: cubit.roles
                                    //           .map<DropdownMenuItem<String>>(
                                    //               (String val) => DropdownMenuItem(
                                    //                     child: Text(val),
                                    //                     value: val,
                                    //                   ))
                                    //           .toList(),
                                    //       value: cubit.rolesVal,
                                    //       onChanged: (val) {
                                    //         cubit.onChangedservices(val);
                                    //       }),
                                    // ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isType = true;
                                        });
                                      },
                                      child: Container(
                                        height: 40.h,
                                        width: 260.w,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                            child: defaultText(
                                                txt: cubit.acountType == null
                                                    ? 'account Type'
                                                    : cubit.acountType,
                                                color: Colors.black54,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          if (isCountry == true)
                            InkWell(
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, top: 80.h),
                                  child: Container(
                                    height: 300.h,
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListView.separated(
                                      itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            cubit.changeCountryCode(
                                                cubit.countryModel!.data![index]
                                                    .id!,
                                                cubit.countryModel!.data![index]
                                                    .countryCode!);
                                            print(cubit.countryModel!
                                                .data![index].countryCode);
                                            // print('country');
                                            setState(() {
                                              isCountry = false;
                                            });
                                            // setState(() {
                                            //   cubit.countryModel!.data![index]
                                            //       .countryCode = countryCode;
                                            //   print(countryCode);
                                            // });
                                          },
                                          child: getCountryCode(
                                              PlayerCubit.get(context)
                                                  .countryModel!
                                                  .data![index])),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: 10,
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: .1,
                                        ),
                                      ),
                                      itemCount: PlayerCubit.get(context)
                                          .countryModel!
                                          .data!
                                          .length,
                                    ),
                                  )),
                            ),
                          if (isType == true)
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 50.w, top: 180.h),
                                child: Container(
                                  height: 170.h,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 187, 185, 185),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListView.separated(
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        cubit.changeAccountType(
                                          cubit.accountTypeModel!.data![index]
                                              .id!,
                                          cubit.accountTypeModel!.data![index]
                                              .name!,
                                        );
                                        cubit.changeType(
                                          acount: cubit.accountTypeModel!
                                              .data![index].name
                                              .toString(),
                                        );
                                        // CacheHelper.setInt(
                                        //         key: kType1,
                                        //         value: cubit.accountTypeModel!
                                        //             .data![index].id)
                                        //     .then((value) {
                                        //   print(value.toString());
                                        // });
                                        // print(cubit.accountType);
                                        // print(cubit.acountType);
                                        setState(() {
                                          isType = false;
                                        });
                                      },
                                      child: getAccountType(
                                          PlayerCubit.get(context)
                                              .accountTypeModel!
                                              .data![index]),
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 10,
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: .1,
                                      ),
                                    ),
                                    itemCount: PlayerCubit.get(context)
                                        .accountTypeModel!
                                        .data!
                                        .length,
                                  ),
                                )),
                      
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Positioned(
                bottom: 5.h,
                child: state is RegisterLoading
                    ? CupertinoActivityIndicator()
                    : mainButton(
                        ontap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.register(
                                name: nameController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                phone: phoneController.text,
                                countryCode: cubit.countrCode,
                                roleTypeId: cubit.accountType,
                                fcmToken: cubit.devicesId,
                                phoneType: cubit.fmcToken);
                            CacheHelper.setInt(
                                    key: kType1, value: cubit.accountType)
                                .then((value) {
                              print(value.toString());
                            });
                            print('account type = ${cubit.accountType}');
                            print('device type = ${cubit.devicesId}');
                          }
                        },
                        txt: 'confirm phone',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    });
  }
}
