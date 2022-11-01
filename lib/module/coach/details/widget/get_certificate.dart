import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

class GetCertificate extends StatefulWidget {
  const GetCertificate({Key? key}) : super(key: key);

  @override
  State<GetCertificate> createState() => _GetCertificateState();
}

class _GetCertificateState extends State<GetCertificate> {
  @override
  DateTime? dateTime;
  DateTime currentDate = DateTime.now();
  String difference = "";
  var certificateController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      height: 177.h,
      width: 412.w,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.yellowAccent),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.r),
          topLeft: Radius.circular(30.r),
        ),
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        theme: DatePickerTheme(backgroundColor: greyColor),
                        showTitleActions: true,
                        currentTime: currentDate,
                        minTime: DateTime(1950, 1, 1), onConfirm: (date) {
                      setState(() {
                        dateTime = date;

                        difference = "${DateTime.now().year - dateTime!.year}";
                      });
                      print(difference);
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                          height: 40.h,
                          width: double.infinity.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Color(0xff40768C),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 15.h, right: 8.w, left: 8.w, top: 5.h),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  defaultText(
                                    txt: "Certificate Date",
                                    color: hintColor,
                                    fontSize: 16.sp,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 25.h,
                                  )
                                ],
                              ),
                            ),
                          )),
                      if (difference != '')
                        Padding(
                          padding: EdgeInsets.only(left: 35.w, top: 5.h),
                          child: Row(
                            children: [
                              defaultText(
                                  txt: 'Certificate date ',
                                  color: Colors.orangeAccent,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                width: 10.w,
                              ),
                              defaultText(
                                  txt: dateTime.toString().substring(0, 10),
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Image.asset(
                'images/certifcate.png',
                height: 50.h,
                width: 50.w,
              )
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 7.w, right: 7.w, bottom: 7.h),
          child: TextField(
            controller: PlayerCubit.get(context).certificateController,
            cursorColor: Colors.white,
            minLines: 1,
            maxLines: 2,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                filled: true,
                fillColor: contactColor,
                hintStyle: TextStyle(
                    color: hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellowAccent)),
                hintText: 'Certificate name'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            greenButton(
                txt: 'Upload',
                onPress: () {
                  PlayerCubit.get(context).upladImageCertifictae();
                }),
            greenButton(
                txt: 'View',
                onPress: () {
                  PlayerCubit.get(context).uploadCertificate(
                    date1: dateTime.toString().substring(0, 10),
                    name1:PlayerCubit.get(context). certificateController.text,
                  );
                })
          ],
        )
      ]),
    );
  }
}
