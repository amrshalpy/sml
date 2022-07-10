import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/model/sport.dart';

Widget buildTextFormField({
  TextEditingController? controller,
  String? hint,
  String? label,
  Color color = Colors.white,
  IconData? icon,
  Function? validate,
  IconData? suffixIcon,
  bool obscure = false,
  TextInputType? type,
  Function()? press,
  Function()? ontap,
}) {
  return Container(
    height: 50,
    width: double.infinity,
    child: TextFormField(
      onTap: ontap,
      controller: controller,
      textAlign: TextAlign.justify,
      decoration: InputDecoration(
          filled: true,
          fillColor: color,
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 56, 56, 56),
              fontSize: 14,
              fontWeight: FontWeight.normal),
          prefixIcon: Icon(icon),
          suffix: IconButton(icon: Icon(suffixIcon), onPressed: press),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (String? val) {
        validate!(val!);
      },
      keyboardType: type,
      obscureText: obscure,
    ),
  );
}

buildButton({
  required Function press,
  required String txt,
}) {
  return Container(
    height: 30,
    width: double.infinity,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: scandColor,
        ),
        onPressed: () {
          press();
        },
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
  );
}

Widget mainButton(
    {required String txt,
    required double fontSize,
    required FontWeight fontWeight,
    Color colorButton = Colors.yellow,
    required Function() ontap,
    Color color = Colors.white}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12),
        child: Center(
          child: defaultText(
              color: color,
              txt: txt,
              fontSize: fontSize,
              fontWeight: fontWeight),
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: colorButton,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
    ),
  );
}

defaultText({
  String? txt,
  Color color = Colors.black,
  double? fontSize,
  FontWeight fontWeight = FontWeight.bold,
}) =>
    Text(
      txt!,
      style: GoogleFonts.actor(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

nextPage({
  required BuildContext context,
  required Widget page,
}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));

nextPageUntil({
  required BuildContext context,
  required Widget page,
}) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);

pop({
  required BuildContext context,
}) =>
    Navigator.pop(context);

Widget container() {
  return Stack(
    alignment: AlignmentDirectional.topCenter,
    children: [
      Image.asset('images/Path 399.png',
      width: 390.w,
      height: 200.h,
      ),
      Padding(
        padding:  EdgeInsets.only(left: 24.w,top: 25.h),
        child: Image.asset('images/sportıve ıcon.png'),
      ),
    ],
  );
}

Widget buildTextField({Function()? onchange}) {
  return Container(
    height: 50,
    width: double.infinity,
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      onChanged: (String val) {
        onchange;
      },
    ),
  );
}

Widget secandContainer({
  String? txt,
  IconData? icon,
  Widget? widget,
}) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      container(),
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        child: Container(
          height: 160.h,
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              RotatedBox(
                  quarterTurns: 3,
                  child: defaultText(
                      txt: txt,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                width: 16.w,
              ),
              Expanded(child: widget!)
            ],
          ),
        ),
      ),
    ],
  );
}

Widget logo() {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Image.asset("images/logospotive1.png"),
  );
}

Widget logoPages(context) {
  return Container(
    height: 90.h,
    decoration: BoxDecoration(color: mainColor),
    child: Center(
      child: Padding(
        padding:  EdgeInsets.only(top: 25.h, left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/logospotive1.png',
              width: MediaQuery.of(context).size.width * .5.w,
            ),
            Row(
              children: [
                Image.asset('images/req to contact1.png'),
                SizedBox(
                  width: 10.w,
                ),
                Image.asset('images/notifcation1.png'),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 30.h,
                      color: Colors.white,
                    ))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// class LogoPages extends StatelessWidget {
//   const LogoPages({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 100,
//         decoration: BoxDecoration(color: mainColor),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset('images/logospotive2.png'),
//                 Row(
//                   children: [
//                     Image.asset('images/req to contact1.png'),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Image.asset('images/notifcation1.png'),
//                     IconButton(
//                         onPressed: () {
//                           Scaffold.of(context).openDrawer();
//                         },
//                         icon: Icon(
//                           Icons.menu,
//                           size: 30,
//                           color: Colors.white,
//                         ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

Widget getPosition(Sport sport) {
  return Container(
    child: Padding(
      padding: EdgeInsets.only(right: 4.w, left: 4.w),
      child: defaultText(
        txt: '${sport.title}',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
    ),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.w,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
        )),
  );
}

Widget rotateText({required String txt, Color color = Colors.orange}) {
  return RotatedBox(
      quarterTurns: 3,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(right: 4, left: 4),
          child: defaultText(
            txt: txt,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            color: color,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            )),
      ));
}

Widget expriance() {
  return Stack(
    children: [
      Image.asset('images/Path 381.png',
      
      ),
      Padding(
        padding:  EdgeInsets.only(left: 144.w),
        child: Image.asset('images/sportıve ıcon.png'),
      ),
    ],
  );
}

Widget greenButton({required String txt, required Function onPress}) {
  return InkWell(
    onTap: () {
      onPress();
    },
    child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: Center(
          child: defaultText(
            txt: txt,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
  );
}

Widget contactContainer(
    {required String txt,
    required String headerText,
    required IconData icon,
     Color color = Colors.green,
    required Widget widget}) {
  return Padding(
    padding:  EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 5.w,
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 8.h,top: 8.h),
          child: Center(
            child: RotatedBox(
                quarterTurns: 3,
                child: defaultText(
                    txt: txt,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 10.h),
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: defaultText(
                    txt: headerText,
                    color: color,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              widget,
            ],
          ),
        ),
      ],
    ),
  );
}
