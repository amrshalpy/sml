import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/cubit/home_state.dart';
import 'package:sportive/module/player/Home/widget/widgets.dart';
import 'package:sportive/module/player/details/details.dart';
import 'package:sportive/module/player/explore/explore.dart';
import 'package:sportive/module/player/player_login/player_login.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WidgetList> list = [
    WidgetList(img: 'images/icons8-more-info-30.png'),
    WidgetList(img: 'images/sportıve ıcon (1).png'),
    WidgetList(img: 'images/icons8-pdf-30.png'),
    WidgetList(img: 'images/QR (1).png'),
    WidgetList(img: 'images/icons8-user-groups-64.png'),
    WidgetList(img: 'images/pt.png'),
    WidgetList(img: 'images/icons8-share-48 (2).png'),
  ];

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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                          height: 60,
                          width: double.infinity,
                          child: ReorderableListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: list.length,
                            scrollDirection: Axis.horizontal,
                            buildDefaultDragHandles: list.length > 1,
                            itemBuilder: (context, index) => Container(
                                key: ValueKey(index),
                                child: getist(list[index])),
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
                      height: 10,
                    ),
                    Details(),
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