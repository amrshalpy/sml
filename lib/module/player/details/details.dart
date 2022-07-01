import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/cubit/home_cubit.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var pageController = PageController();
  var wieghtController = TextEditingController();
  var hieghtController = TextEditingController();
  var runningController = TextEditingController();
  var verticalJumpController = TextEditingController();
  var longJumpingController = TextEditingController();
  var leftingWeightsController = TextEditingController();
  var legWeightsController = TextEditingController();
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .78,
          width: double.infinity,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (index) {},
            children: [
              Container(
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: MediaQuery.of(context).size.height * .74,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultText(
                            txt: 'Personal Data :',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        defaultText(
                            txt:
                                'This data will make the profile more powerful',
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 15,
                        ),
                        CSCPicker(
                          onCountryChanged: (String value) {
                            setState(() {
                              countryValue = value;
                            });
                          },
                          onStateChanged: (String? value) {
                            setState(() {
                              stateValue = value.toString();
                            });
                          },
                          onCityChanged: (String? value) {
                            setState(() {
                              cityValue = value.toString();
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            DateTime? newDateTime = await showRoundedDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 80),
                              lastDate: DateTime(DateTime.now().year + 1),
                              context: context,
                              background: Colors.white,
                              theme: ThemeData(
                                primaryColor: Colors.red[400],
                                accentColor: Colors.green[800],
                                dialogBackgroundColor: Colors.purple[50],
                                textTheme: TextTheme(
                                  // body1: TextStyle(color: Colors.red),
                                  caption: TextStyle(color: Colors.blue),
                                ),
                                disabledColor: Colors.orange,
                                accentTextTheme: TextTheme(
                                    // body2 : TextStyle(color: Colors.green[200]),
                                    ),
                              ),
                            );
                          },
                          child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defaultText(
                                      txt: 'Birth day',
                                      color: Color.fromARGB(255, 78, 78, 78),
                                      fontSize: 16,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultText(
                            txt: 'Physical Properties :',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/gender.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(),
                                ),
                                child: Center(
                                  child: DropdownButtonFormField(
                                      // dropdownColor: Colors.white,
                                      // itemHeight: 40,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // backgroundColor: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      items: HomeCubit.get(context)
                                          .gender
                                          .map<DropdownMenuItem<String>>(
                                              (String val) => DropdownMenuItem(
                                                    child: Text(val),
                                                    value: val,
                                                  ))
                                          .toList(),
                                      value: HomeCubit.get(context).ganderVal,
                                      onChanged: (val) {
                                        HomeCubit.get(context)
                                            .onChangedGender(val);
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultText(
                            txt: 'height',
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/CompositeLayer2.png',
                              height: 40,
                              width: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: buildTextFormField(
                                  controller: hieghtController,
                                  hint: 'height',
                                  label: 'height',
                                  type: TextInputType.number),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            defaultText(
                                txt: 'meter',
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultText(
                            txt: 'Weight',
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/surface1.png',
                              height: 35,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: buildTextFormField(
                                  controller: wieghtController,
                                  hint: 'weight',
                                  label: 'weight',
                                  type: TextInputType.number),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            defaultText(
                                txt: 'Kg',
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ]),
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 15, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/roght or left p.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: DropdownButtonFormField(
                              // dropdownColor: Colors.white,
                              // itemHeight: 40,
                              style: TextStyle(
                                  color: Colors.black,
                                  // backgroundColor: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              items: HomeCubit.get(context)
                                  .gender
                                  .map<DropdownMenuItem<String>>(
                                      (String val) => DropdownMenuItem(
                                            child: Text(val),
                                            value: val,
                                          ))
                                  .toList(),
                              value: HomeCubit.get(context).ganderVal,
                              onChanged: (val) {
                                HomeCubit.get(context).onChangedGender(val);
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultText(
                        txt: 'Performance :',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/Group 23.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: buildTextFormField(
                            hint: 'Running time',
                            label: 'Running time',
                            controller: runningController,
                            type: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        defaultText(
                            txt: 'sec/100 m',
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/verical jumb.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: buildTextFormField(
                            hint: 'Vertical Jumping distance ',
                            label: 'Vertical Jumping distance',
                            controller: verticalJumpController,
                            type: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        defaultText(
                            txt: 'meter',
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/long jumping di.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: buildTextFormField(
                            hint: 'Long Jumping',
                            label: 'Long Jumping',
                            controller: longJumpingController,
                            type: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        defaultText(
                            txt: 'meter',
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/leftting weight.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: buildTextFormField(
                            hint: 'Lefting Weights',
                            label: 'Lefting Weights',
                            controller: leftingWeightsController,
                            type: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        defaultText(
                            txt: 'Kg',
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/leg weight.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: buildTextFormField(
                            hint: 'Leg weights ',
                            label: 'Leg weights',
                            controller: legWeightsController,
                            type: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        defaultText(
                            txt: 'Kg',
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              )),
              Container(
                child: Column(children: []),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 2,
              effect: JumpingDotEffect(),
            ),
          ),
        )
      ],
    );
  }
}
