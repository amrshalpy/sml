import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/club/club_explore/club_explore.dart';
import 'package:sportive/module/club/club_explore/club_explore_gold.dart';
import 'package:sportive/module/club/club_details/details.dart';
import 'package:sportive/module/club/titles/widget/get_titles.dart';
import 'package:sportive/module/company/details/widgets/get_contacts.dart';
import 'package:sportive/module/player/details/widgets/social.dart';
import 'package:sportive/module/player/player_login/widgets/get_country_code.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

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
  List<Widget> contactList = [
    GetContacts(),
  ];
  List<Widget> titileList = [
    GetTitles(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
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
                    ClubExplore(),
                    Details(),
                    // ClubExploreGold(),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w, left: 15.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w, right: 10.w, top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      defaultText(
                                          txt: 'Titles',
                                          color: Colors.yellowAccent,
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.normal),
                                      defaultText(
                                          txt: 'at least one title',
                                          color: greyColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.normal),
                                    ],
                                  ),
                                  defaultText(
                                      txt: 'total title  25',
                                      color: Colors.yellowAccent,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Column(
                              children: [
                                ListView.separated(
                                  itemBuilder: (context, index) => GetTitles(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 10.h,
                                  ),
                                  itemCount: titileList.length,
                                  shrinkWrap: true,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  titileList.add(GetTitles());
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                height: 25.h,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      defaultText(
                                        txt: 'Add titles Card',
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: greenButton(
                                    txt: 'Save',
                                    onPress: () {
                                      cubit.uploadTiltes(
                                        number1: cubit.titlesController.text,
                                        legueType1: 1,
                                        sportId1: 1,
                                      );
                                    }))
                          ]),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.isCountry = false;
                        cubit.isSocial = false;
                      },
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Stack(
                          children: [
                            Container(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      defaultText(
                                          txt: 'Contacts',
                                          color: Colors.yellowAccent,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.normal),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                240,
                                            child: ListView.builder(
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                      onTap: () {
                                                        PlayerCubit.get(context)
                                                            .changeIsCountry();
                                                      },
                                                      child: GetContacts()),
                                              itemCount: contactList.length,
                                              shrinkWrap: true,
                                            ),
                                          ),
                                        SizedBox(height: 10.h,),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  contactList
                                                      .add(GetContacts());
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      topLeft:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  height: 30.h,
                                                  width: 140.w,
                                                  child: Center(
                                                      child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ],
                                                    ),
                                                  ))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        child: greenButton(
                                            txt: 'Save', onPress: () {}),
                                      )
                                    ]),
                              ),
                            ),
                            if (cubit.isCountry == true)
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
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                                onTap: () {
                                                  cubit.changeCountryCodes(
                                                      cubit.countryModel!
                                                          .data![index].id!,
                                                      cubit
                                                          .countryModel!
                                                          .data![index]
                                                          .countryCode
                                                          .toString());
                                                  print(cubit
                                                      .countryModel!
                                                      .data![index]
                                                      .countryCode);
                                                  cubit.changeIsCountry();
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
                            if (cubit.isSocial == true)
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 230.h, left: 20.w),
                                child: Container(
                                  height: 140.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black38, width: .7),
                                      color: Colors.white),
                                  child: Column(children: [
                                    Expanded(
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                                onTap: () {
                                                  cubit.getSocial(
                                                      cubit.social[index].id,
                                                      '${cubit.social[index].text}');
                                                  // setState(() {
                                                  //   isSocial = false;
                                                  // });
                                                  cubit.changeIsSocial();
                                                },
                                                child: getSocial(
                                                    cubit.social[index])),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(height: 5),
                                        itemCount: cubit.social.length,
                                        physics: BouncingScrollPhysics(),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                          ],
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
        });
  }
}
