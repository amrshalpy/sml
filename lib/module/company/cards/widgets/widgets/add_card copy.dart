import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';

addCarts({context, image, discount, address, type}) {
  var typeController = TextEditingController();
  var discountController = TextEditingController();
  var addressController = TextEditingController();
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: mainColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white24, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(30.r)),
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(top: 20.h, right: 10.w, bottom: 40.h, left: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Image.asset(
                        'images/CompositeLayer (5).png',
                        height: 310.h,
                        width: 410.w,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w, top: 1.h),
                            child: Align(
                              alignment: AlignmentDirectional.center,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: defaultText(
                                  txt: 'DISCOUNT',
                                  fontSize: 38.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 28.h, left: 19.w),
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
                                  height: 4.h,
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
                                            hintText: type == null ? '' : type,
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
                                            hintText: discount == null
                                                ? ''
                                                : discount,
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
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Colors.black12,
                                      ),
                                      child: TextField(
                                        controller: addressController,
                                        cursorColor: Colors.black12,
                                        decoration: InputDecoration(
                                            hintText:
                                                address == null ? '' : address,
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
                                Container(
                                  height: 90.h,
                                  width: 210.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                  child: image == null
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: Column(children: [
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
                                          ]),
                                        )
                                      : Image.network('${image}'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                      padding: EdgeInsets.only(left: 50.w, top: 10.h),
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
                            width: 130.w,
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
                  txt: type == null && discount == null ? 'Save' : 'Update',
                  onPress: () {})
            ],
          )));
}
