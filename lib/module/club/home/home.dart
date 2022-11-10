import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/model/widget_list_model.dart';
import 'package:sportive/module/club/club_details/club_details.dart';
import 'package:sportive/module/club/club_details/details.dart';
import 'package:sportive/module/club/club_pt/club_pt_screen.dart';
import 'package:sportive/module/club/club_skills/club_skills.dart';
import 'package:sportive/module/club/free_styling/free_styling.dart';
import 'package:sportive/module/club/home/widgets/get_list_club.dart';
import 'package:sportive/module/club/player_club/players.dart';
import 'package:sportive/module/club/qr_code/club_qr_code.dart';
import 'package:sportive/module/player/balance/balance.dart';
import 'package:sportive/module/player/home/widget/get_tabs.dart';
import 'package:sportive/module/player/home/widget/logo.dart';
import 'package:sportive/module/player/skills/skills.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class ClubHome extends StatefulWidget {
  const ClubHome({Key? key}) : super(key: key);

  @override
  _ClubHomeState createState() => _ClubHomeState();
}

class _ClubHomeState extends State<ClubHome> {
  Widget page = ClubDetails();
 bool isFreestyle = false;
  bool isRemoveStyling = false;

  List<WidgetList> list = [
    WidgetList(img: 'images/icons8-more-info-30.png', txt: 'about me'),
    WidgetList(img: 'images/sportıve ıcon (1).png', txt: 'Titles'),
    WidgetList(img: 'images/my agent.png', txt: 'Players'),
    WidgetList(img: 'images/icons8-share-48 (3).png', txt: 'Share'),
    WidgetList(img: 'images/pt.png', txt: 'Pt'),
    WidgetList(img: 'images/icons8-user-groups-64.png', txt: 'following'),
    WidgetList(img: 'images/QR (1).png', txt: 'QR'),
    WidgetList(img: 'images/freestyling3.png', txt: 'Free styling'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerCubit()
        ..getCountry()
        ..getPlayerData()
        ..getCity()
        ..getCategory()
        ..getAcounts()
        ..getPositions()
        ..getSports()
        ..getProducts()
        ..getCoupons(),
      child: BlocConsumer<PlayerCubit, PlayerState>(
          listener: (context, state) {},
          builder: (context, state) {
            PlayerCubit cubit = PlayerCubit.get(context);
            return Scaffold(
              // key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              body: cubit.getProfileData != null &&
                      cubit.getProfileData!.data!.user!.taps != []
                  ? 
                   Stack(
                    children: [
                      Stack(children: [
                        crdientColor(),
                        NestedScrollView(
                          physics: BouncingScrollPhysics(),
                          floatHeaderSlivers: true,
                          headerSliverBuilder: (context, innerBoxIsScrolled) =>
                              [
                            SliverAppBar(
                              backgroundColor: mainColor.withOpacity(.9),
                              expandedHeight: 80.h,
                              flexibleSpace: FlexibleSpaceBar(
                                title: Row(
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
                                            onPressed: () {},
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
                              pinned: true,
                              floating: true,
                              snap: true,
                            )
                          ],
                          body: CustomScrollView(slivers: [
                            SliverToBoxAdapter(
                              child: Column(children: [
                                Divider(
                                  height: .1,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, right: 10.w),
                                  child: Container(
                                      height: 66.h,
                                      width: double.infinity.w,
                                      child: cubit.getProfileData!.data!.user!
                                                  .taps !=
                                              []
                                          ?  ListView.separated(
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                 onTap: (){
                                        if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'about me') {
                                                   setState(() {
                                                      page= ClubDetails();
                                                   });
                                                       
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'skills videos') {
                                                   setState(() {
                                                     page= ClubSkills();
                                                   });
                                                        
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'Pt') {
                                                   setState(() {
                                                     page= ClubPtScreen();
                                                   });
                                                        
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'QR code') {
                                                   setState(() {
                                                      page= ClubQrCode();
                                                   });
                                                       
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'freestyle') {
                                                   setState(() {
                                                     page= ClubFreeStyling();
                                                   });
                                                        
                                                 
                                                  }
                                     },
                                  
                                                child: getTabs(cubit.getProfileData!
                                                    .data!.user!.taps![index]),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                            width: 10.w,
                                          ),
                                          itemCount: cubit.getProfileData!.data!
                                              .user!.taps!.length,
                                        )
                                     
                                         

                                      // ReorderableListView.builder(
                                      //   shrinkWrap: true,
                                      //   physics: BouncingScrollPhysics(),
                                      //   itemCount: list.length,
                                      //   scrollDirection: Axis.horizontal,
                                      //   buildDefaultDragHandles: list.length > 1,
                                      //   itemBuilder: (context, index) => Container(
                                      //       key: ValueKey(index),
                                      //       child: InkWell(
                                      //           // onLongPress: () {
                                      //           //   // if (list[index].img ==
                                      //           //   //     "images/freestyling3.png") {
                                      //           //   //   setState(() {
                                      //           //   //     page = FreeStyling();
                                      //           //   //     isFreestyle = true;
                                      //           //   //     list.removeAt(index);
                                      //           //   //   });
                                      //           //   // }
                                      //           // },
                                      //           onTap: () {
                                      //             if (list[index].img ==
                                      //                 "images/freestyling3.png") {
                                      //               setState(() {
                                      //                 page = FreeStyling();
                                      //                 isFreestyle = true;
                                      //                 list.removeAt(index);
                                      //               });
                                      //             }
                                      //             if (list[index].img ==
                                      //                 'images/icons8-more-info-30.png') {
                                      //               setState(() {
                                      //                 page = PlayerDetails();
                                      //               });
                                      //             } else if (list[index].img ==
                                      //                 "images/icons8-pdf-30.png") {
                                      //               setState(() {
                                      //                 page = PdfScreen();
                                      //               });
                                      //             } else if (list[index].img ==
                                      //                 "images/sportıve ıcon (1).png") {
                                      //               setState(() {
                                      //                 page = Skills();
                                      //               });
                                      //             } else if (list[index].img ==
                                      //                 "images/QR (1).png") {
                                      //               setState(() {
                                      //                 page = QrCode();
                                      //               });
                                      //             }
                                      //             // else if (list[index].img ==
                                      //             //     "images/freestyling3.png") {
                                      //             //   setState(() {
                                      //             //     page = FreeStyling();
                                      //             //   });
                                      //             // }
                                      //             else if (list[index].img ==
                                      //                 "images/icons8-user-groups-64.png") {
                                      //               setState(() {
                                      //                 page = Following();
                                      //               });
                                      //             } else if (list[index].img ==
                                      //                 "images/pt.png") {
                                      //               setState(() {
                                      //                 page = PtScreen();
                                      //               });
                                      //             } else if (list[index].img ==
                                      //                 "images/icons8-share-48 (2).png") {
                                      //               setState(() {
                                      //                 page = PtScreen();
                                      //               });
                                      //             }
                                      //           },
                                      //           child: Container(
                                      //               child: getist(list[index])))),
                                      //   onReorder: (int oldIndex, int newIndex) {
                                      //     setState(() {
                                      //       list.insert(
                                      //           newIndex, list.removeAt(oldIndex));
                                      //     });
                                      //   },
                                      // ),

                                      :Center(child: CircularProgressIndicator())),
                                ),
                                const Divider(
                                  height: .1,
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ]),
                            ),
                            SliverToBoxAdapter(
                                child: Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                Container(height: 526.h, child: page),
                                if (isFreestyle)
                                  Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      InkWell(
                                        onLongPress: () {
                                          setState(() {
                                            isRemoveStyling = true;
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            page = Skills();
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 15.w, bottom: 90.h),
                                          child: Column(
                                            children: [
                                              Container(
                                                // key: ValueKey(list),
                                                height: 60.h,
                                                width: 55.w,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 240, 238, 238),
                                                  image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: AssetImage(
                                                          'images/freestyling3.png')),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    // color: Colors.red,
                                                    width: .5.w,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isFreestyle = false;
                                            isRemoveStyling = false;
                                            list.add(
                                              WidgetList(
                                                  img:
                                                      'images/freestyling3.png',
                                                  txt: 'Free styling'),
                                            );
                                          });
                                        },
                                        child: isRemoveStyling
                                            ? CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white
                                                    .withOpacity(.5),
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Colors.black,
                                                ))
                                            : Container(),
                                      )
                                    ],
                                  ),
                              ],
                            )),
                          ]),
                        )
                      ]),
                      if (cubit.isCancel == true)
                        SidebarX(
                          controller: cubit.sidebarcontroller,
                          theme: SidebarXTheme(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hoverColor: mainColor,
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.7)),
                            selectedTextStyle:
                                const TextStyle(color: Colors.white),
                            itemTextPadding: const EdgeInsets.only(left: 15),
                            selectedItemTextPadding:
                                const EdgeInsets.only(left: 30),
                            itemDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: canvasColor),
                            ),
                            selectedItemDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: actionColor.withOpacity(0.37),
                              ),
                              gradient: LinearGradient(
                                colors: [accentCanvasColor, canvasColor],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.28),
                                  blurRadius: 30,
                                )
                              ],
                            ),
                            iconTheme: IconThemeData(
                              color: Colors.white.withOpacity(0.7),
                              size: 20,
                            ),
                            selectedIconTheme: const IconThemeData(
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          extendedTheme: const SidebarXTheme(
                            width: 210,
                            decoration: BoxDecoration(
                              color: canvasColor,
                            ),
                          ),
                          footerDivider: divider,
                          headerBuilder: (context, extended) {
                            return SizedBox(
                              height: 80.h,
                              // child: Padding(
                              //   padding: EdgeInsets.only(
                              //       top: 50.h, left: 12.w, right: 12.w),
                              //   child: Image.asset(
                              //     'images/mohamed-salah-sportstiger.jpeg',
                              //     height: 100.h,
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                            );
                          },
                          items: [
                            SidebarXItem(
                              iconWidget: Icon(
                                FontAwesomeIcons.home,
                                color: Colors.white38,
                              ),
                              label: 'Profile',
                              onTap: () {
                                nextPage(context: context, page: ClubDetails());
                              },
                            ),
                            SidebarXItem(
                                iconWidget: Icon(
                                  FontAwesomeIcons.balanceScaleLeft,
                                  color: Colors.white30,
                                ),
                                label: 'Balance',
                                onTap: () {
                                  setState(() {
                                    cubit.select1 = true;
                                    cubit.select2 = false;
                                    cubit.select3 = false;
                                    cubit.select4 = false;
                                  });
                                  nextPage(context: context, page: Balance());
                                }),
                            SidebarXItem(
                                iconWidget: Icon(
                                  FontAwesomeIcons.amazonPay,
                                  color: Colors.white30,
                                ),
                                label: 'Upgrade membership',
                                onTap: () {
                                  setState(() {
                                    cubit.select1 = false;
                                    cubit.select2 = true;
                                    cubit.select3 = false;
                                    cubit.select4 = false;
                                  });
                                  nextPage(context: context, page: Balance());
                                }),
                            SidebarXItem(
                                iconWidget: Icon(
                                  Icons.settings,
                                  color: Colors.white30,
                                ),
                                label: 'Settings',
                                onTap: () {
                                  setState(() {
                                    cubit.select1 = false;
                                    cubit.select2 = false;
                                    cubit.select3 = true;
                                    cubit.select4 = false;
                                  });
                                  nextPage(context: context, page: Balance());
                                }),
                            SidebarXItem(
                                iconWidget: Icon(
                                  FontAwesomeIcons.qrcode,
                                  color: Colors.white30,
                                ),
                                label: 'QrCode',
                                onTap: () {
                                  setState(() {
                                    cubit.select1 = false;
                                    cubit.select2 = false;
                                    cubit.select3 = false;
                                    cubit.select4 = true;
                                  });
                                  nextPage(context: context, page: Balance());
                                }),
                          ],
                        ),
                    ],
                  ):Center(child: CircularProgressIndicator())
               
                  
                  
                
            );
          }),
    );
  }
}
