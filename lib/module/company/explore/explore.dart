import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/constants/constants.dart';
import 'package:sportive/module/company/explore/widget/get_product.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class Explore extends StatefulWidget {
  Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var nameController = TextEditingController();
  var pageController = PageController();

  var clubController = TextEditingController();
  bool isProduct = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return cubit.getProfileData != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(children: [
                        Image.asset(
                          'images/gold5.png',
                          // fit: BoxFit.contain,
                          width: 330.w,
                          height: 450.h,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 90.h),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/CompositeLayer (2).png',
                                        height: 65.h,
                                        width: 65.w,
                                        // fit: BoxFit.contain,
                                      ),
                                      Image.asset(
                                        'images/CompositeLayer.png',
                                        height: 30.h,
                                        width: 30.w,
                                        fit: BoxFit.contain,
                                      ),
                                      defaultText(txt: '100 ' + "K"),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Icon(Icons.favorite),
                                      defaultText(txt: '100 ' + "K"),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Image.asset(
                                        'images/icons8-share-48 (3).png',
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      defaultText(txt: '100 ' + "K"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          cubit.getProfileData!.data!.user!
                                                      .image ==
                                                  ''
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5.h, right: 18.w),
                                                  child: cubit.imageProfile ==
                                                          null
                                                      ? Container(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 50.h),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      cubit
                                                                          .upladImage();
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .upload_file,
                                                                      size:
                                                                          35.h,
                                                                    )),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                defaultText(
                                                                  txt:
                                                                      'Upload image',
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          height: 170.h,
                                                          width: 150.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      39, 3, 3),
                                                            ),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                          ),
                                                        )
                                                      : Container(
                                                          height: 170.h,
                                                          width: 150.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border:
                                                                  Border.all(),
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: FileImage(
                                                                      File(
                                                                          '${cubit.imageProfile!.path}')))),
                                                        ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5.h, right: 18.w),
                                                  child:
                                                      cubit.imageProfile == null
                                                          ? Stack(
                                                              children: [
                                                                Container(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 50
                                                                            .h),
                                                                  ),
                                                                  height: 170.h,
                                                                  width: 150.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(kUrl +
                                                                            '${cubit.getProfileData!.data!.user!.image}')),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              39,
                                                                              3,
                                                                              3),
                                                                    ),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.r),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      cubit
                                                                          .upladImage();
                                                                    },
                                                                    child: CircleAvatar(
                                                                        child: FaIcon(
                                                                            FontAwesomeIcons.camera)))
                                                              ],
                                                            )
                                                          : Container(
                                                              height: 170.h,
                                                              width: 150.w,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border
                                                                      .all(),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      image: FileImage(
                                                                          File(
                                                                              '${cubit.imageProfile!.path}')))),
                                                            ),
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    child: defaultText(
                                        color: Colors.blueGrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        txt: cubit.getProfileData!.data!.user!
                                                    .name ==
                                                ''
                                            ? 'name'
                                            : '${cubit.getProfileData!.data!.user!.name}')),
                                SizedBox(
                                  height: 3.h,
                                ),
                              ],
                            ),
                           
                          ],
                        ),
                    
                      ]),
                      SizedBox(
                        height: 1,
                      ),
                         Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: State is StorageImagePlayerSuccess
                                ? CupertinoActivityIndicator()
                                : InkWell(
                                    onTap: () {
                                      PlayerCubit.get(context)
                                          .storageImageInApi(
                                        clubName: clubController.text,
                                        positionId: 1,
                                        sportId: 1,
                                      );
                                      print('save');

                                      pageController.nextPage(
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.easeInOut);
                                    },
                                    child: Container(
                                        height: 30.h,
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: defaultText(
                                            txt: 'Save',
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ))))
               
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
