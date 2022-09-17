import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/player/free_styling/free_styling.dart';
import 'package:sportive/module/player/pdf%20_page/pdf_screen%20.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';
import 'package:sportive/model/widget_list_model.dart';
import 'package:sportive/module/player/details/details.dart';
import 'package:sportive/module/player/following/following.dart';
import 'package:sportive/module/player/home/widget/get_list/get_list.dart';
import 'package:sportive/module/player/pt/pt_screen.dart';
import 'package:sportive/module/player/qr_code/qr_code.dart';
import 'package:sportive/module/player/skills/skills.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget page = PlayerDetails();
  // getist(img: "images/icons8-more-info-30.png", txt: "Profile"),
  // getist(img: "images/icons8-pdf-30.png", txt: "Pdf"),
  // getist(img: "images/sportıve ıcon (1).png", txt: "Skills"),
  // getist(img: "images/icons8-share-48 (3).png", txt: "Share"),
  // getist(img: "images/pt.png", txt: "Pt"),
  // getist(img: "images/icons8-user-groups-64.png", txt: "Followings"),
  // getist(img: "images/QR (1).png", txt: "Qr"),
  // getist(img: "images/freestyling3.png", txt: "FreeStyling"),
  List<WidgetList> list = [
    WidgetList(img: 'images/icons8-more-info-30.png', txt: 'Profile'),
    WidgetList(img: 'images/sportıve ıcon (1).png', txt: 'Skills'),
    WidgetList(img: 'images/icons8-pdf-30.png', txt: 'Pdf'),
    WidgetList(img: 'images/icons8-share-48 (3).png', txt: 'Share'),
    WidgetList(img: 'images/pt.png', txt: 'Pt'),
    WidgetList(img: 'images/icons8-user-groups-64.png', txt: 'following'),
    WidgetList(img: 'images/QR (1).png', txt: 'QR'),
    WidgetList(img: 'images/freestyling3.png', txt: 'Free styling'),
  ];

  var nameController = TextEditingController();

  var clubController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isFreestyle = false;
  bool isRemoveStyling = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerCubit>(
      create: (context) => PlayerCubit()
      // ..getPosition()
      // ..getPlayerData()
      // ..getSportsData()
      // ..getSearch()
      // ..getCountry()
      // ..fetchData()
      // ..getCity()
      // ..getSports()
      // ..getSubSports()
      // ..getAcounts()
      ,
      child: BlocConsumer<PlayerCubit, PlayerState>(listener: (context, state) {
        if (state is GetSportsDataLoading) {
          Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
              value: .7,
              strokeWidth: 1,
            ),
          );
        }
      }, builder: (context, state) {
        PlayerCubit cubit = PlayerCubit.get(context);
        return Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              crdientColor(),
              NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Container(
                          height: 66.h,
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
                                    // onLongPress: () {
                                    //   // if (list[index].img ==
                                    //   //     "images/freestyling3.png") {
                                    //   //   setState(() {
                                    //   //     page = FreeStyling();
                                    //   //     isFreestyle = true;
                                    //   //     list.removeAt(index);
                                    //   //   });
                                    //   // }
                                    // },
                                    onTap: () {
                                      if (list[index].img ==
                                          "images/freestyling3.png") {
                                        setState(() {
                                          page = FreeStyling();
                                          isFreestyle = true;
                                          list.removeAt(index);
                                        });
                                      }
                                      if (list[index].img ==
                                          'images/icons8-more-info-30.png') {
                                        setState(() {
                                          page = PlayerDetails();
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
                                      }
                                      // else if (list[index].img ==
                                      //     "images/freestyling3.png") {
                                      //   setState(() {
                                      //     page = FreeStyling();
                                      //   });
                                      // }
                                      else if (list[index].img ==
                                          "images/icons8-user-groups-64.png") {
                                        setState(() {
                                          page = Following();
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
                                    },
                                    child:
                                        Container(child: getist(list[index])))),
                            onReorder: (int oldIndex, int newIndex) {
                              setState(() {
                                list.insert(newIndex, list.removeAt(oldIndex));
                              });
                            },
                          ),
                        ),
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
                      Container(height: 520.h, child: page),
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
                                  page = FreeStyling();
                                });
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(right: 15.w, bottom: 90.h),
                                child: Column(
                                  children: [
                                    Container(
                                      // key: ValueKey(list),
                                      height: 60.h,
                                      width: 55.w,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 240, 238, 238),
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
                                        img: 'images/freestyling3.png',
                                        txt: 'Free styling'),
                                  );
                                });
                              },
                              child: isRemoveStyling
                                  ? CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Colors.white.withOpacity(.5),
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
            ]));
      }),
    );
  }
}
// List<String> list = ["B", "C", "D"];
// list.insert(0, "A"); // at index 0 we are adding A
// list now becomes ["A", "B", "C", "D"]
////////////////////////
/// List<Widget> _cardList = [];

// void _addCardWidget() {
//   setState(() {
//     _cardList.add(_card());
//   });
