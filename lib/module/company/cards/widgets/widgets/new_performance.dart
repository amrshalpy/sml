import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class NewPerformance extends StatelessWidget {
  NewPerformance({Key? key}) : super(key: key);
  var typeController = TextEditingController();
  var discountController = TextEditingController();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            // height: 550,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Image.asset(
                          'images/CompositeLayer (5).png',
                          height: 300.h,
                          width: 410.w,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13.w, top: 54.h),
                              child: Align(
                                alignment: AlignmentDirectional.center,
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: defaultText(
                                    txt: 'DISCOUNT',
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 42.h, left: 19.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  defaultText(
                                    txt: 'Nike',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    children: [
                                      defaultText(
                                        txt: 'Type:  ',
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: 180.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Colors.black12,
                                        ),
                                        child: TextField(
                                          controller: typeController,
                                          cursorColor: Colors.black12,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12)),
                                              contentPadding:
                                                  EdgeInsets.only(left: 5)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      defaultText(
                                        txt: 'Discount:  ',
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Colors.black12,
                                        ),
                                        child: TextField(
                                          controller: discountController,
                                          cursorColor: Colors.black12,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12)),
                                              contentPadding:
                                                  EdgeInsets.only(left: 5)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      defaultText(
                                        txt: 'Address:  ',
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: 120.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Colors.black12,
                                        ),
                                        child: TextField(
                                          controller: addressController,
                                          cursorColor: Colors.black12,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12)),
                                              contentPadding:
                                                  EdgeInsets.only(left: 5)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      PlayerCubit.get(context)
                                          .upladImageCoupon(
                                            
                                          );
                                    },
                                    child: Container(
                                      height: 100.h,
                                      width: 210.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        border:
                                            Border.all(color: Colors.black26),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 20.h),
                                        child: PlayerCubit.get(context)
                                                    .imageCoupon ==
                                                null
                                            ? Column(children: [
                                                Icon(
                                                  Icons.add,
                                                  size: 40,
                                                  color: Colors.grey,
                                                ),
                                                defaultText(
                                                  txt: 'Upload photo',
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent,
                                                ),
                                              ])
                                            : Image.file(File(
                                                '${PlayerCubit.get(context).imageCoupon!.path}')),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Image.asset(
                          'images/CompositeLayer (4).png',
                          height: 210.h,
                          width: 340.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 60.w, top: 10.h),
                          child: Column(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      defaultText(
                                        txt: 'Game Type',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                                height: 30.h,
                                width: 170.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black26,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.asset(
                                'images/copun QR.png',
                                height: 100.h,
                                width: 120.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      defaultText(
                                        txt: 'Enabled QrCode',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                height: 30.h,
                                width: 210.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 20, 184, 5),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  greenButton(
                      txt: 'Save',
                      onPress: () {
                        PlayerCubit.get(context).storageImageCoupon(
                          name: typeController.text,
                          discount: int.parse(discountController.text),
                          sportId: 1,
                          address: addressController.text,
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
