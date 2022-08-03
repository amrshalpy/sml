import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/module/coach/coach-cubit/coach_cubit.dart';
import 'package:sportive/module/coach/coach-cubit/coach_state.dart';
import 'package:sportive/module/coach/details/coach_details.dart';
import 'package:sportive/module/coach/free_styling/free_styling.dart';
import 'package:sportive/module/coach/home/widget/get_list/get_list.dart';
import 'package:sportive/module/coach/pdf%20_page/pdf_screen.dart';
import 'package:sportive/module/coach/qr_code/qr_code.dart';
import 'package:sportive/model/widget_list_model.dart';
import 'package:sportive/module/player/following/following.dart';
import 'package:sportive/module/player/pt/pt_screen.dart';
import 'package:sportive/module/player/skills/skills.dart';

class CoachHome extends StatefulWidget {
  CoachHome({Key? key}) : super(key: key);

  @override
  State<CoachHome> createState() => _CoachHomeState();
}

class _CoachHomeState extends State<CoachHome> {
  Widget page = CoachDetails();
  List<WidgetList> list = [
    WidgetList(img: 'images/icons8-more-info-30.png', txt: 'about me'),
    WidgetList(img: 'images/sportıve ıcon (1).png', txt: 'Courses'),
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
    return BlocConsumer<CoachCubit, CoachState>(
        listener: (context, state) {},
        builder: (context, state) {
          CoachCubit cubit = CoachCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
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
                                    onTap: () {
                                      if (list[index].img ==
                                          'images/icons8-more-info-30.png') {
                                        setState(() {
                                          page = CoachDetails();
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
                                          page = FreeStyling();
                                        });
                                      } else if (list[index].img ==
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
        });
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