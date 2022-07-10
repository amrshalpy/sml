import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/cubit/home_state.dart';
import 'package:sportive/model/widget_list_model.dart';
import 'package:sportive/module/player/details/details.dart';
import 'package:sportive/module/player/home/widget/get_list/get_list.dart';
import 'package:sportive/module/player/pdf%20_page/pdf_screen.dart';
import 'package:sportive/module/player/pt/pt_screen.dart';
import 'package:sportive/module/player/qr_code/qr_code.dart';
import 'package:sportive/module/player/skills/skills.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget page = Details();
  List<WidgetList> list = [
    WidgetList(img: 'images/icons8-more-info-30.png', txt: 'about me'),
    WidgetList(img: 'images/sportıve ıcon (1).png', txt: 'Skills'),
    WidgetList(img: 'images/icons8-pdf-30.png', txt: 'Pdf'),
    WidgetList(img: 'images/icons8-share-48 (3).png', txt: 'Share'),
    WidgetList(img: 'images/pt.png', txt: 'Pt'),
    WidgetList(img: 'images/icons8-user-groups-64.png', txt: 'following'),
    WidgetList(img: 'images/QR (1).png', txt: 'QR'),
    WidgetList(img: 'images/freestyling3.png', txt: 'Free styling'),
  ];
  bool isIcon = false;
  var nameController = TextEditingController();

  var clubController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                crdientColor(),
                Column(
                  children: [
                    logoPages(context),
                    Divider(
                      height: .1,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Container(
                          height: 65.h,
                          width: double.infinity.w,
                          child: ReorderableListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: list.length,
                            scrollDirection: Axis.horizontal,
                            buildDefaultDragHandles: list.length > 1,
                            itemBuilder: (context, index) => Container(
                                key: ValueKey(index),
                                child: InkWell(
                                    onTap: () {
                                      if (list[index].img ==
                                          'images/icons8-more-info-30.png') {
                                        setState(() {
                                          page = Details();
                                        });
                                      } else if (list[index].img ==
                                          "images/icons8-pdf-30.png") {
                                        setState(() {
                                          page = PdfScreen();
                                        });
                                      } else if (list[index].img ==
                                          "images/sportıve ıcon (1).png") {
                                        setState(() {
                                          page = Skills();
                                        });
                                      } else if (list[index].img ==
                                          "images/QR (1).png") {
                                        setState(() {
                                          page = QrCode();
                                        });
                                      } else if (list[index].img ==
                                          "images/freestyling3.png") {
                                        setState(() {
                                          page = QrCode();
                                        });
                                      } else if (list[index].img ==
                                          "images/icons8-user-groups-64.png") {
                                        setState(() {
                                          page = PdfScreen();
                                        });
                                      } else if (list[index].img ==
                                          "images/pt.png") {
                                        setState(() {
                                          page = PtScreen();
                                        });
                                      } else if (list[index].img ==
                                          "images/icons8-share-48 (2).png") {
                                        setState(() {
                                          page = PtScreen();
                                        });
                                      }

                                      // if (index == 0) {
                                      //   setState(() {
                                      //     page = Details();
                                      //   });
                                      // } else if (index == 1) {
                                      // } else if (index == 2) {
                                      //   setState(() {
                                      //     page = PdfScreen();
                                      //   });
                                      // } else if (index == 3) {
                                      //   setState(() {
                                      //     page = QrCode();
                                      //   });
                                      // } else if (index == 4) {
                                      //   setState(() {
                                      //     page = QrCode();
                                      //   });
                                      // } else if (index == 5) {
//  setState(() {
//                                           page = PtScreen();
//                                         });                                      }
                                    },
                                    child: Container(
                                        height: 60,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2,
                                                color: isIcon == true
                                                    ? Colors.red
                                                    : Colors.white)),
                                        child: getist(list[index])))),
                            onReorder: (newIndex, oldIndex) {
                              setState(() {
                                if (newIndex > oldIndex) {
                                  newIndex -= 1;
                                }
                                final item = list.removeAt(oldIndex);
                                list.insert(newIndex, item);
                              });
                            },
                          )),
                    ),
                    Divider(
                      height: .1,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    Expanded(child: page),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 10, left: 10),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: mainButton(
                    //             txt: 'Follow',
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold,
                    //             ontap: () {}),
                    //       ),
                    //       SizedBox(
                    //         width: 50,
                    //       ),
                    //       Expanded(
                    //         child: mainButton(
                    //             txt: 'save',
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold,
                    //             ontap: () {}),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
            // bottomNavigationBar: BottomNavyBar(
            //   backgroundColor: mainColor,
            //   // iconSize: 40,
            //   containerHeight: 60,
            //   selectedIndex: cubit.currentIndex,
            //   items: [
            //     BottomNavyBarItem(
            //         icon: Image.asset(
            //           'images/CompositeLayer (1).png',
            //           height: 30,
            //           width: 25,
            //         ),
            //         title: Text(
            //           " Explore",
            //         ),
            //         activeColor: thirdColor,
            //         inactiveColor: Colors.grey),
            //     BottomNavyBarItem(
            //         icon: Image.asset(
            //           'images/icons8-user-groups-64.png',
            //           height: 30,
            //           width: 25,
            //         ),
            //         title: Text(
            //           " Following",
            //           style:
            //               TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
            //         ),
            //         activeColor: thirdColor,
            //         inactiveColor: Colors.grey),
            //     BottomNavyBarItem(
            //         icon: Image.asset(
            //           'images/sportıve ıcon (1).png',
            //           height: 30,
            //           width: 25,
            //         ),
            //         title: Text(
            //           " Skills",
            //         ),
            //         activeColor: thirdColor,
            //         inactiveColor: Colors.grey),
            //     BottomNavyBarItem(
            //         icon: Image.asset(
            //           'images/shope.png',
            //           height: 30,
            //           width: 25,
            //         ),
            //         title: Text(
            //           " Shop",
            //         ),
            //         activeColor: thirdColor,
            //         inactiveColor: mainColor),
            //     BottomNavyBarItem(
            //         icon: Image.asset(
            //           'images/QR (1).png',
            //           height: 30,
            //           width: 25,
            //         ),
            //         title: Text(
            //           " QR",
            //         ),
            //         activeColor: thirdColor,
            //         inactiveColor: Colors.grey),
            //     BottomNavyBarItem(
            //         icon: Image.asset(
            //           'images/icons8-pdf-30.png',
            //           height: 30,
            //           width: 25,
            //         ),
            //         title: Text(
            //           " PDF",
            //         ),
            //         activeColor: thirdColor,
            //         inactiveColor: Colors.grey),
            //   ],
            //   onItemSelected: (int index) {
            //     cubit.changeCurrentIndex(index);
            //   },
            // ),
          );
        });
  }
}
// ListView.separated(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             physics: BouncingScrollPhysics(),
//                             itemBuilder: (context, index) => InkWell(
//                                 onTap: () {
//                                   cubit.changeProfile(index);
//                                   if (index == 0) {
//                                     cubit.profileWiget = PlayerLogin();
//                                   } else if (index == 1) {
//                                     cubit.profileWiget = PlayerLogin();
//                                   } else if (index == 2) {
//                                     cubit.profileWiget = PlayerLogin();
//                                   } else if (index == 3) {
//                                     cubit.profileWiget = PlayerLogin();
//                                   } else if (index == 4) {
//                                     cubit.profileWiget = PlayerLogin();
//                                   } else if (index == 5) {
//                                     cubit.profileWiget = PlayerLogin();
//                                   } else if (index == 6) {
//                                     cubit.profileWiget = PlayerLogin();
//                                   }
//                                 },
//                                 child: getist(list[index])),
//                             separatorBuilder: (context, index) => SizedBox(
//                                   width: 8,
//                                 ),
//                             itemCount: list.length),