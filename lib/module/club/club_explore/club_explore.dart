import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/module/player/explore/widget/get_poistion.dart';
import 'package:sportive/module/player/explore/widget/get_your_game.dart';

class ClubExplore extends StatefulWidget {
  ClubExplore({Key? key}) : super(key: key);

  @override
  State<ClubExplore> createState() => _ClubExploreState();
}

class _ClubExploreState extends State<ClubExplore> {
  var foundedController = TextEditingController();

  var clubController = TextEditingController();
   DateTime? dateTime;
  DateTime currentDate = DateTime.now();
  String difference = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          'images/silver club.png',
          fit: BoxFit.contain,
          width: 275.w,
          height: 500.h,
        ),
        Padding(
          padding:  EdgeInsets.only(top: 82.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 70.w ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(
                          height: 5.h,
                        ),
                       defaultText(txt: '25',color: Color.fromARGB(255, 3, 65, 116),fontSize: 20.sp,fontWeight: FontWeight.bold),
                       
                       defaultText(txt: 'Titles',color: Color.fromARGB(255, 2, 56, 100),fontSize: 20.sp,fontWeight: FontWeight.bold),
      SizedBox(height: 10.h,),
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
                  Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 80.h,right: 18.w),
                        child: Container(
                          child: Padding(
                            padding:  EdgeInsets.only(top: 50.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.upload_file,
                                      size: 35.h,
                                    )),
                                    SizedBox(height: 5.h,),
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
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 30.h,
                width: 150.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: clubController,
                  decoration: InputDecoration(
                    hintText: 'Club name',
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              
              InkWell(
                onTap: (){
                     DatePicker.showDatePicker(
                                    theme: DatePickerTheme(
                                        backgroundColor: greyColor),
                                    context,
                                    showTitleActions: true,
                                    currentTime: currentDate,
                                    minTime: DateTime(1950, 1, 1),
                                    onConfirm: (date) {
                                  setState(() {
                                    dateTime = date;
                                    
                                    difference =
                                        "${dateTime!.year}";
                                  });
                                });
                            
                },
                child: 
                difference==''?
                Container(
                  height: 30.h,
                  width: 150.w,
                  child: defaultText(txt: 'Founded date',color: Colors.blueAccent,fontSize: 25.sp,fontWeight: FontWeight.bold)
                ):defaultText(txt:'Founded  '+ difference,color: Colors.black,fontSize: 25.sp,fontWeight: FontWeight.bold),
              ),
               SizedBox(
                height: 8.h,
              ),
              // InkWell(
              //   child: defaultText(
              //     txt: 'your game name',
              //     color: Colors.blue,
              //     fontSize: 17.sp,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   onTap: () {
              //     getGame(context);
              //   },
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // InkWell(
              //   child: defaultText(
              //     txt: 'your position',
              //     color: Colors.blue,
              //     fontSize: 20.sp,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   onTap: () {
              //     getPoistion(context);
              //   },
              // ),
             
            ],
          ),
        ),
        // SizedBox(height: 5.h,),
        Padding(
          padding:  EdgeInsets.only(right: 10.w,bottom: 10.h),
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: greenButton(txt: 'Save',
             onPress: (){}),
          ),
        )
      ],
    );
  }
}