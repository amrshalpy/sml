import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/player/explore/widget/get_poistion.dart';
import 'package:sportive/module/player/explore/widget/get_your_game.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class Explore extends StatelessWidget {
  PageController? pageController;
  Explore({Key? key, this.pageController}) : super(key: key);
  var nameController = TextEditingController();

  var clubController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return Stack(
            children: [
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
                        padding: EdgeInsets.only(top: 40.h),
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
                        padding: EdgeInsets.only(top: 80.h),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.h, right: 18.w),
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 50.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.upload_file,
                                                size: 35.h,
                                              )),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          defaultText(
                                            txt: 'Upload image',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ),
                                    height: 170.h,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 39, 3, 3),
                                      ),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                ),
                                // cubit.getPlayerProfileData!.data!
                                //             .profilePicture ==
                                //         null
                                //     ?
                                //     Container(
                                //         child: cubit.imageProfile == null
                                //             ? Padding(
                                //                 padding:
                                //                     EdgeInsets.only(top: 40.h),
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.center,
                                //                   children: [
                                //                     Icon(
                                //                       Icons.upload_file,
                                //                       size: 35.h,
                                //                     ),
                                //                     SizedBox(
                                //                       height: 5.h,
                                //                     ),
                                //                     defaultText(
                                //                       txt: 'Upload image',
                                //                       fontSize: 16.sp,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                       color: Colors.black,
                                //                     )
                                //                   ],
                                //                 ),
                                //               )
                                //             : Image.file(
                                //                 File(cubit.imageProfile!.path),
                                //                 fit: BoxFit.cover,
                                //               ),
                                //         height: 170.h,
                                //         width: 150.w,
                                //         decoration: BoxDecoration(
                                //           border: Border.all(
                                //             color:
                                //                 Color.fromARGB(255, 39, 3, 3),
                                //           ),
                                //           shape: BoxShape.rectangle,
                                //           borderRadius:
                                //               BorderRadius.circular(10.r),
                                //         ),
                                //       )
                                //     :
                                // Container(
                                //   height: 170.h,
                                //   width: 150.w,
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         fit: BoxFit.cover,
                                //         image: NetworkImage('')),
                                //     border: Border.all(
                                //       color: Color.fromARGB(255, 39, 3, 3),
                                //     ),
                                //     shape: BoxShape.rectangle,
                                //     borderRadius: BorderRadius.circular(15.r),
                                //   ),
                                // ),

                                // InkWell(
                                //   onTap: () {
                                //     // cubit.upladImage();
                                //   },
                                //   child: CircleAvatar(
                                //     backgroundColor:
                                //         Colors.grey.withOpacity(.3),
                                //     child: Icon(Icons.camera_alt_sharp),
                                //   ),
                                // )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
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
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              txt: 'name')),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          child: defaultText(
                        txt:
                            // PlayerCubit.get(context)
                            //             .getPlayerProfileData!
                            //             .data!
                            //             .player!
                            //             .experiences[0]
                            //             .clubName !=
                            //         null
                            //     ? PlayerCubit.get(context)
                            //     .getPlayerProfileData!
                            //     .data!
                            //     .player!
                            //     .experiences[0]
                            //     .clubName
                            // :
                            'club name',
                        color: Colors.black45,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  InkWell(
                    child: defaultText(
                      txt: 'your game name',
                      color: Colors.blue,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      getGame(context);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    child: defaultText(
                      txt: 'your position',
                      color: Colors.blue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
                      getPoistion(context);
                    },
                  ),
                ],
              ),
              Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: State is StorageImagePlayerSuccess
                      ? CupertinoActivityIndicator()
                      : greenButton(
                          txt: 'Save',
                          onPress: () {
                            // PlayerCubit.get(context).storageImageInApi(
                            //     sportId: cubit.sportId,
                            //     positionId: cubit.positionId);
                            print('save');

                            pageController!.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeInOut);
                          }))
            ],
          );
        });
  }
}
