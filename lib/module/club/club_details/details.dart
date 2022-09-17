import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  DateTime? dateTime;
  DateTime currentDate = DateTime.now();
  String difference = "";
    var ownerController = TextEditingController();
    var founderController = TextEditingController();
    var mangerController = TextEditingController();
    var arenasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Container(
            padding: EdgeInsets.only(right: 10.h, left: 10.h),
            // height: MediaQuery.of(context).size.height * .50.h,
            child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
             
             
              SelectState(
                dropdownColor: Colors.grey.shade700,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                ),
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              // InkWell(
              //   onTap: () {
              //     DatePicker.showDatePicker(
              //         theme: DatePickerTheme(backgroundColor: greyColor),
              //         context,
              //         showTitleActions: true,
              //         currentTime: currentDate,
              //         minTime: DateTime(1950, 1, 1), onConfirm: (date) {
              //       setState(() {
              //         dateTime = date;

              //         difference = "${dateTime!.year}";
              //       });
              //       print(difference);
              //     });
              //   },
              //   child: Column(
              //     children: [
              //       Container(
              //           height: 40.h,
              //           width: double.infinity.w,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(5.r),
              //             color: Color(0xff40768C),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.only(
              //                 bottom: 15.h, right: 8.w, left: 8.w, top: 5.h),
              //             child: Center(
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   defaultText(
              //                     txt: dateTime == null
              //                         ? "Founded"
              //                         : '${difference}',
              //                     color: hintColor,
              //                     fontSize: 16.sp,
              //                     // fontWeight: FontWeight.bold,
              //                   ),
              //                   Icon(
              //                     Icons.keyboard_arrow_down,
              //                     color: Colors.white,
              //                     size: 25.h,
              //                   )
              //                 ],
              //               ),
              //             ),
              //           )),
                   
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 5.h,
              // ),
              defaultText(
                  txt: 'Optional',
                  color: Colors.yellowAccent,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 10.h,
              ),
             
              defaultText(
                  txt: 'Owner',
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/owner.png',
                    height: 40.h,
                    width: 35.w,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: buildTextFormField(
                        controller: ownerController,
                        
                        color: contactColor,
                        label: 'Owner',
                        type: TextInputType.text),
                  ),
                  
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              defaultText(
                  txt: 'Founder',
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/founder.png',
                    height: 35.h,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: buildTextFormField(
                        color: contactColor,
                        controller: founderController,
                        // hint: 'weight',
                        label: 'Founder',
                        type: TextInputType.text),
                  ),
                 
                  
                ],
              ),
               SizedBox(
                height: 7.h,
              ),
              defaultText(
                  txt: 'Manger',
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/manger.png',
                    height: 35.h,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: buildTextFormField(
                        color: contactColor,
                        controller: mangerController,
                        // hint: 'weight',
                        label: 'Manger',
                        type: TextInputType.text),
                  ),
                 
                  
                ],
              ), SizedBox(
                height: 7.h,
              ),
              defaultText(
                  txt: 'Arnase/staduims',
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/stadium.png',
                    height: 35.h,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: buildTextFormField(
                        color: contactColor,
                        controller: arenasController,
                        // hint: 'weight',
                        label: 'Arnase/staduims',
                        type: TextInputType.text),
                  ),
                 
                  
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: greenButton(txt: 'Save', onPress: () {}))
            ]),
          ),
        ),
      ],
    );
  }
}
