import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:sportive/module/player/home/widget/logo.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class ClubHome extends StatefulWidget {
  const ClubHome({Key? key}) : super(key: key);

  @override
  _ClubHomeState createState() => _ClubHomeState();
}

class _ClubHomeState extends State<ClubHome> {
  Widget page = ClubDetails();

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
      create: (context) => PlayerCubit()..getPlayerData()..getCity()..getCountry(),
      child: BlocConsumer<PlayerCubit, PlayerState>(
          listener: (context, state) {},
          builder: (context, state) {
            PlayerCubit cubit = PlayerCubit.get(context);
            return Scaffold(
              // key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  crdientColor(),
                  Column(
                    children: [
                      LogoPage(
                        context: context,
                      ),
                      Divider(
                        height: .1.h,
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Container(
                            height: 64.h,
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
                                            "images/my agent.png") {
                                          setState(() {
                                            page = PlayersClub();
                                          });
                                        } else if (list[index].img ==
                                            "images/sportıve ıcon (1).png") {
                                          setState(() {
                                            page = ClubSkills();
                                          });
                                        } else if (list[index].img ==
                                            "images/QR (1).png") {
                                          setState(() {
                                            page = ClubQrCode();
                                          });
                                        } else if (list[index].img ==
                                            "images/freestyling3.png") {
                                          setState(() {
                                            page = ClubFreeStyling();
                                          });
                                        } else if (list[index].img ==
                                            "images/icons8-user-groups-64.png") {
                                          setState(() {
                                            page = ClubSkills();
                                          });
                                        } else if (list[index].img ==
                                            "images/pt.png") {
                                          setState(() {
                                            page = ClubPtScreen();
                                          });
                                        } else if (list[index].img ==
                                            "images/icons8-share-48 (2).png") {
                                          setState(() {
                                            page = ClubPtScreen();
                                          });
                                        }
                                      },
                                      child: Container(
                                          child: getistClub(list[index])))),
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
                      const Divider(
                        height: .1,
                        color: Colors.white,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(child: page),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
