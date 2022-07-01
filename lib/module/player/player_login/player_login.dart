import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/cubit/home_state.dart';
import 'package:sportive/module/player/confirm_phone.dart';

class PlayerLogin extends StatelessWidget {
  PlayerLogin({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xff154E66),
                          Color(0xff06141A)
                        ])),
                      )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset("images/logospotive1.png"),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 5, left: 5),
                        child: SingleChildScrollView(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Image.asset(
                                'images/gold5.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Form(
                                key: formKey,
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(children: [
                                    defaultText(
                                        txt: 'New account',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    buildTextFormField(
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        CountryCodePicker(
                                          onChanged: onCountryChange,
                                          initialSelection: 'IT',
                                          favorite: ['+39', 'FR'],
                                          showCountryOnly: false,
                                          showOnlyCountryWhenClosed: false,
                                          alignLeft: false,
                                        ),
                                        Expanded(
                                          child: buildTextFormField(
                                            controller: phoneController,
                                            hint: 'please enter your phone',
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    buildTextFormField(
                                      controller: passwordController,
                                      hint: 'please enter your password',
                                      label: 'Enter your password',
                                      type: TextInputType.visiblePassword,
                                      validate: (String? val) {
                                        if (val!.isEmpty) {
                                          return 'please enter your password';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    buildTextFormField(
                                      controller: confirmPasswordController,
                                      hint:
                                          'please enter your confirm Password',
                                      label: 'Enter your confirm Password',
                                      type: TextInputType.text,
                                      validate: (String? val) {
                                        if (val!.isEmpty) {
                                          return 'please enter your confirmPassword';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    defaultText(
                                        txt: 'account type',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        items: cubit.services
                                            .map<DropdownMenuItem<String>>(
                                                (String val) =>
                                                    DropdownMenuItem(
                                                      child: Text(val),
                                                      value: val,
                                                    ))
                                            .toList(),
                                        value: cubit.servicesVal,
                                        onChanged: (val) {
                                          cubit.onChangedservices(val);
                                        }),
                                
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    child: mainButton(
                        ontap: () {
                          print('phone');
                          nextPage(context: context, page: ConfimPhone(phone: phoneController.text,));
                        },
                        txt: 'confirm phone',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void onCountryChange(CountryCode countryCode) {
    print("New Country selected: " + countryCode.toString());
  }
}
