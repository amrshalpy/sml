import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/model/sport.dart';

Widget buildTextFormField({
  TextEditingController? controller,
  String? hint,
  String? label,
  IconData? icon,
  Function? validate,
  IconData? suffixIcon,
  bool obscure = false,
  TextInputType? type,
  Function()? press,
}) {
  return Container(
    height: 50,
    width: double.infinity,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.normal),
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
    required Function() ontap,
    Color color = Colors.white}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: 30,
      child: Center(
        child: defaultText(
            color: color, txt: txt, fontSize: fontSize, fontWeight: fontWeight),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.yellow,
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
      Image.asset('images/Path 399.png'),
      Padding(
        padding: const EdgeInsets.only(left: 24),
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 160,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                width: 16,
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
    height: 90,
    decoration: BoxDecoration(color: mainColor),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/logospotive1.png',
              width: MediaQuery.of(context).size.width * .5,
            ),
            Row(
              children: [
                Image.asset('images/req to contact1.png'),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/notifcation1.png'),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 30,
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
      padding: EdgeInsets.only(right: 4, left: 4),
      child: defaultText(
        txt: '${sport.title}',
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
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
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
