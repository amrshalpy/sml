import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/club/club_explore/club_explore_gold.dart';
import 'package:sportive/module/club/club_details/details.dart';
import 'package:sportive/module/club/titles/titles.dart';

class ClubDetails extends StatefulWidget {
  const ClubDetails({Key? key}) : super(key: key);

  @override
  _ClubDetailsState createState() => _ClubDetailsState();
}

class _ClubDetailsState extends State<ClubDetails> {
  var pageController = PageController();
    var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var socialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 700.h,
          width: double.infinity.w,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (index) {},
            children: [
              ClubExploreGold(),
              Details(),
              Titles(),
              SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(
                              txt: 'Contacts',
                              color: Colors.yellowAccent,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            height: 2.h,
                          ),
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
                                    padding:
                                        EdgeInsets.only(left: 160.w, top: 15.h),
                                    child:
                                        Image.asset('images/sportıve ıcon.png'),
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
                                        children: [
                                          Container(
                                            width: 100.w,
                                            child: CountryCodePicker(
                                              showDropDownButton: true,
                                              onChanged: onCountryChange,
                                              initialSelection: 'IT',
                                              favorite: ['+39', 'FR'],
                                              showCountryOnly: false,
                                              showOnlyCountryWhenClosed: false,
                                              alignLeft: false,
                                            ),
                                          ),
                                          Expanded(
                                            child: buildTextFormField(
                                              color: greyColor,
                                              controller: phoneController,
                                              hint: '01267889997',
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
                                            ontap: () {}),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          // SizedBox(
                          //   height: 7,
                          // ),
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
                                    padding:
                                        EdgeInsets.only(left: 160.w, top: 15.h),
                                    child:
                                        Image.asset('images/sportıve ıcon.png'),
                                  ),
                                ],
                              ),
                              contactContainer(
                                  txt: 'Social media',
                                  headerText: 'request',
                                  color: Colors.red,
                                  icon: Icons.phone_callback_rounded,
                                  widget: Column(
                                    children: [
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 45.w,
                                            height: 35.h,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: Colors.white30,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/12.png'),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                          ),
                                          SizedBox(
                                            width: 8.w,
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
                                        height: 9.h,
                                      ),
                                      Container(
                                        width: 120.w,
                                        child: mainButton(
                                            colorButton: Colors.red,
                                            txt: 'request',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            ontap: () {}),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          // SizedBox(
                          //   height: 2,
                          // ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  height: 30.h,
                                  width: 140.w,
                                  child: Center(
                                      child: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.green,
                                          // size: 30,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                            txt: 'add Card',
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                  ))),
                            ),
                          ),
                          defaultText(
                              txt: 'My Agent',
                              color: Colors.yellowAccent,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),

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
                                    padding:
                                        EdgeInsets.only(left: 160.w, top: 15.h),
                                    child:
                                        Image.asset('images/sportıve ıcon.png'),
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
                                            width: 45.w,
                                            height: 35.h,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: Colors.white30,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/CompositeLayer (3).png'),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                          ),
                                          SizedBox(
                                            width: 8.w,
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
                                        height: 9.h,
                                      ),
                                      Container(
                                        width: 120.w,
                                        child: mainButton(
                                            txt: 'request',
                                            colorButton: Colors.blue,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            ontap: () {}),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: greenButton(txt: 'Save', onPress: () {}),
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 5,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotWidth: 16,
                dotHeight: 5,
                activeDotColor: Color.fromARGB(255, 204, 153, 12),
              ),
            ),
          ),
        )
      ],
    );
  }

  void onCountryChange(CountryCode countryCode) {
    print("New Country selected: " + countryCode.toString());
  }
}
