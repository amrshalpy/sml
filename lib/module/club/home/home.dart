import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/cubit/home_state.dart';
import 'package:sportive/model/widget_list_model.dart';
import 'package:sportive/module/club/club_details/club_details.dart';
import 'package:sportive/module/club/club_explore/club_explore.dart';
import 'package:sportive/module/club/club_explore/club_explore_gold.dart';
import 'package:sportive/module/club/home/widgets/get_list_club.dart';
import 'package:sportive/module/player/details/details.dart';

class ClubHome extends StatefulWidget {
  const ClubHome({ Key? key }) : super(key: key);

  @override
  _ClubHomeState createState() => _ClubHomeState();
}

class _ClubHomeState extends State<ClubHome> {
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            // key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                crdientColor(),
                Column(
                  children: [
                    LogoPage(context: context,),
                    Divider(
                      height: .1,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 10.w, right: 10.w),
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
                                    // onTap: () {

                                    //   if (list[index].img ==
                                    //       'images/icons8-more-info-30.png') {
                                    //     setState(() {
                                    //       page = Details();
                                    //     });
                                    //   } else if (list[index].img ==
                                    //       "images/icons8-pdf-30.png") {
                                    //     setState(() {
                                    //       page = PdfScreen();
                                    //     });
                                    //   }else if (list[index].img ==
                                    //       "images/sportıve ıcon (1).png") {
                                    //     setState(() {
                                    //       page = Skills();
                                    //     });
                                    //   }else if (list[index].img ==
                                    //       "images/QR (1).png") {
                                    //     setState(() {
                                    //       page = QrCode();
                                    //     });
                                        
                                    //   }
                                    //   else if (list[index].img ==
                                    //       "images/freestyling3.png") {
                                    //     setState(() {
                                    //       page = QrCode();
                                    //     });
                                        
                                    //   }
                                    //   else if (list[index].img ==
                                    //       "images/icons8-user-groups-64.png") {
                                    //     setState(() {
                                    //       page = Following();
                                    //     });
                                    //   }else if (list[index].img ==
                                    //       "images/pt.png") {
                                    //     setState(() {
                                    //       page = PtScreen();
                                    //     });
                                    //   }else if (list[index].img ==
                                    //       "images/icons8-share-48 (2).png") {
                                    //     setState(() {
                                    //       page = PtScreen();
                                    //     });
                                    //   }

                                  
                                    // },
                               
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

                    Expanded(child: ClubDetails()),
                    
                  ],
                ),
              ],
            ),

          );
        });
  }
  }
