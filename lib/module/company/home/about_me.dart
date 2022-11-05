import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/company/details/company_details.dart';
import 'package:sportive/module/company/free_styling/free_styling.dart';
import 'package:sportive/module/company/pdf%20_page/pdf_screen.dart';
import 'package:sportive/module/company/qr_code/qr_code.dart';

import 'package:sportive/module/doctors/tips/tips.dart';
import 'package:sportive/model/widget_list_model.dart';
import 'package:sportive/module/player/home/widget/get_tabs.dart';
import 'package:sportive/module/player/home/widget/logo.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class CompanyHome extends StatefulWidget {
  CompanyHome({Key? key}) : super(key: key);

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  Widget page = CompanyDetails();
  List<WidgetList> list = [
    WidgetList(img: 'images/icons8-more-info-30.png', txt: 'about me'),
    WidgetList(img: 'images/sportıve ıcon (1).png', txt: 'Tips'),
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerCubit>(
      create: (context) => PlayerCubit()
        ..getProducts()
        ..getCity()
        ..getCountry()
        ..getCategory()
        ..getPlayerData(),
      child: BlocConsumer<PlayerCubit, PlayerState>(
          listener: (context, state) {},
          builder: (context, state) {
            PlayerCubit cubit = PlayerCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              body:cubit.getProfileData!=null &&cubit.getProfileData!.data!.user!.taps !=[]? Stack(
                children: [
                  crdientColor(),
                  Column(
                    children: [
                      LogoPage(
                        context: context,
                      ),
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
                              child: cubit.getProfileData!.data!.user!.taps !=[]? 
                              ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                
                                 (context,index)=>InkWell(
                                      onTap: (){
                                        if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'about me') {
                                                    nextPage(
                                                        context: context,
                                                        page: CompanyDetails());
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'skills videos') {
                                                    nextPage(
                                                        context: context,
                                                        page: Tips());
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'PDF') {
                                                    nextPage(
                                                        context: context,
                                                        page: PdfScreen());
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'QR code') {
                                                    nextPage(
                                                        context: context,
                                                        page: QrCode());
                                                  }else if (cubit
                                                          .getProfileData!
                                                          .data!
                                                          .user!
                                                          .taps![index]
                                                          .name ==
                                                      'freestyle') {
                                                    nextPage(
                                                        context: context,
                                                        page: FreeStyling());
                                                 
                                                  }
                                     },
                                  
                                   child: getTabs(cubit.getProfileData!.data!.user!.taps![index])),
                                separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                                itemCount: cubit.getProfileData!.data!.user!.taps!.length,
                              ):Center(child: CircularProgressIndicator())


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
                           
                            ),
                          ),
                         
                      // Padding(
                      //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      //   child: Container(
                      //       height: 66.h,
                      //       width: double.infinity.w,
                      //       child: ReorderableListView.builder(
                      //         shrinkWrap: true,
                      //         physics: BouncingScrollPhysics(),
                      //         itemCount: list.length,
                      //         scrollDirection: Axis.horizontal,
                      //         buildDefaultDragHandles: list.length > 1,
                      //         itemBuilder: (context, index) => Container(
                      //             key: ValueKey(index),
                      //             child: InkWell(
                      //                 onTap: () {
                      //                   if (list[index].img ==
                      //                       'images/icons8-more-info-30.png') {
                      //                     setState(() {
                      //                       page = CompanyDetails();
                      //                     });
                      //                   } else if (list[index].img ==
                      //                       "images/icons8-pdf-30.png") {
                      //                     setState(() {
                      //                       page = PdfScreen();
                      //                     });
                      //                   } else if (list[index].img ==
                      //                       "images/sportıve ıcon (1).png") {
                      //                     setState(() {
                      //                       page = Tips();
                      //                     });
                      //                   } else if (list[index].img ==
                      //                       "images/QR (1).png") {
                      //                     setState(() {
                      //                       page = QrCode();
                      //                     });
                      //                   } else if (list[index].img ==
                      //                       "images/freestyling3.png") {
                      //                     setState(() {
                      //                       page = FreeStyling();
                      //                     });
                      //                   } else if (list[index].img ==
                      //                       "images/icons8-user-groups-64.png") {
                      //                     setState(() {
                      //                       page = Following();
                      //                     });
                      //                   } else if (list[index].img ==
                      //                       "images/pt.png") {
                      //                     setState(() {
                      //                       page = Cards();
                      //                     });
                      //                   } else if (list[index].img ==
                      //                       "images/icons8-share-48 (2).png") {
                      //                     setState(() {
                      //                       page = PtScreen();
                      //                     });
                      //                   }
                      //                 },
                      //                 child: Container(
                      //                     child: getist(list[index])))),
                      //         onReorder: (newIndex, oldIndex) {
                      //           setState(() {
                      //             if (newIndex > oldIndex) {
                      //               newIndex -= 1;
                      //             }
                      //             final item = list.removeAt(oldIndex);
                      //             list.insert(newIndex, item);
                      //           });
                      //         },
                      //       )),
                      // ),
                     
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
              ):Center(child: CircularProgressIndicator()),
            );
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
// }