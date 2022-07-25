import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/model/sub_sport_model.dart';

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
      Image.asset(
        'images/Path 399.png',
        width: 390.w,
        height: 200.h,
      ),
      Padding(
        padding: EdgeInsets.only(left: 24.w, top: 25.h),
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
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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

class LogoPage extends StatelessWidget {
  LogoPage({Key? key, required this.context}) : super(key: key);
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(color: mainColor),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 10.w, right: 10.w),
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

Widget getPosition(Data? data) {
  return Container(
    child: Center(
      child: Padding(
        padding: EdgeInsets.only(right: 4.w, left: 4.w),
        child: defaultText(
          txt: '${data!.name}',
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 18.sp,
        ),
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
      Image.asset(
        'images/Path 381.png',
      ),
      Padding(
        padding: EdgeInsets.only(left: 144.w),
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
    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
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
          padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
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
                padding: EdgeInsets.only(top: 10.h),
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


/////////////////// Flutter sticky header with search bar ////////
// class AnimatedAppBar extends StatefulWidget {
//   const AnimatedAppBar({Key key}) : super(key: key);

//   @override
//   _AnimatedAppBarState createState() => _AnimatedAppBarState();
// }

// class _AnimatedAppBarState extends State<AnimatedAppBar> {
//   final TextEditingController stateController = TextEditingController();
//   final FocusNode stateFocus = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder:
//               (BuildContext context, bool innnerBoxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 expandedHeight: 120.0,
//                 floating: false,
//                 pinned: true,
//                 backgroundColor: Colors.grey,
//                 automaticallyImplyLeading: false,
//                 titleSpacing: 0.0,
//                 toolbarHeight: 90.0,
//                 centerTitle: false,
//                 elevation: 0.0,
//                 leadingWidth: 0.0,
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     if (innnerBoxIsScrolled != null &&
//                         innnerBoxIsScrolled == true)
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             "Search",
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               /* autovalidate is disabled */
//                               controller: stateController,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.deny(
//                                     RegExp(r"\s\s")),
//                                 FilteringTextInputFormatter.deny(RegExp(
//                                     r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
//                               ],
//                               keyboardType: TextInputType.text,
//                               maxLength: 160,
//                               onChanged: (val) {},
//                               maxLines: 1,
//                               validator: (value) {},
//                               focusNode: stateFocus,
//                               autofocus: false,
//                               decoration: InputDecoration(
//                                 errorMaxLines: 3,
//                                 counterText: "",
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(4)),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: Color(0xffE5E5E5),
//                                   ),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(4)),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: Color(0xffE5E5E5),
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(4)),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: Color(0xffE5E5E5),
//                                   ),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(4)),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                   ),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Colors.red,
//                                     )),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(4)),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                                 hintText: "Search" ?? "",
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6.0,
//                           )
//                         ],
//                       ),
//                   ],
//                 ),
//                 // bottom: PreferredSize(
//                 //   preferredSize: Size.fromHeight(5.0),
//                 //   child: Text(''),
//                 // ),
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Search",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 24.0,
//                                     ),
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage: NetworkImage(
//                                         "https://images.ctfassets.net/hrltx12pl8hq/2TRIFRwcjrTuNprkTQHVxs/088159eb8e811aaac789c24701d7fdb1/LP_image.jpg?fit=fill&w=632&h=354&fm=webp"), //NetworkImage
//                                     radius: 16.0,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 /* autovalidate is disabled */
//                                 controller: stateController,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.deny(
//                                       RegExp(r"\s\s")),
//                                   FilteringTextInputFormatter.deny(RegExp(
//                                       r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
//                                 ],
//                                 keyboardType: TextInputType.text,
//                                 maxLength: 160,
//                                 onChanged: (val) {},
//                                 maxLines: 1,
//                                 validator: (value) {},
//                                 focusNode: stateFocus,
//                                 autofocus: false,
//                                 decoration: InputDecoration(
//                                   errorMaxLines: 3,
//                                   counterText: "",
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   disabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                     ),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(4)),
//                                       borderSide: BorderSide(
//                                         width: 1,
//                                         color: Colors.red,
//                                       )),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                   hintText: "Search" ?? "",
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ];
//           },
//           body: Builder(
//             builder: (BuildContext context) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     ListView.builder(
//                       itemCount: 100,
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text("Index value: $index"),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//class AnimatedAppBar extends StatefulWidget {
//   const AnimatedAppBar({Key key}) : super(key: key);

//   @override
//   _AnimatedAppBarState createState() => _AnimatedAppBarState();
// }

// class _AnimatedAppBarState extends State<AnimatedAppBar>
//     with TickerProviderStateMixin {
//   final TextEditingController stateController = TextEditingController();
//   final FocusNode stateFocus = FocusNode();

//   var animation;
//   var controller;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder:
//               (BuildContext context, bool innnerBoxIsScrolled) {
//             if (innnerBoxIsScrolled) {
//               /* Animation */
//               controller = AnimationController(
//                 vsync: this,
//                 duration: Duration(
//                   seconds: 1,
//                 ),
//               );
//               animation = Tween(
//                 begin: 0.0,
//                 end: 1.0,
//               ).animate(controller);
//               /* Animation */
//               controller.forward();
//             }
//             return <Widget>[
//               SliverAppBar(
//                 expandedHeight: 120.0,
//                 floating: false,
//                 pinned: true,
//                 backgroundColor: Colors.grey,
//                 automaticallyImplyLeading: false,
//                 titleSpacing: 0.0,
//                 toolbarHeight: 90.0,
//                 centerTitle: false,
//                 elevation: 0.0,
//                 leadingWidth: 0.0,
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     if (innnerBoxIsScrolled != null &&
//                         innnerBoxIsScrolled == true)
//                       FadeTransition(
//                         opacity: animation,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Text(
//                               "Search",
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 /* autovalidate is disabled */
//                                 controller: stateController,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.deny(
//                                       RegExp(r"\s\s")),
//                                   FilteringTextInputFormatter.deny(RegExp(
//                                       r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
//                                 ],
//                                 keyboardType: TextInputType.text,
//                                 maxLength: 160,
//                                 onChanged: (val) {},
//                                 maxLines: 1,
//                                 validator: (value) {},
//                                 focusNode: stateFocus,
//                                 autofocus: false,
//                                 decoration: InputDecoration(
//                                   errorMaxLines: 3,
//                                   counterText: "",
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   disabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                     ),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(4)),
//                                       borderSide: BorderSide(
//                                         width: 1,
//                                         color: Colors.red,
//                                       )),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                   hintText: "Search" ?? "",
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 6.0,
//                             )
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//                 // bottom: PreferredSize(
//                 //   preferredSize: Size.fromHeight(5.0),
//                 //   child: Text(''),
//                 // ),
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 8.0,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Search",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 24.0,
//                                     ),
//                                   ),
//                                   CircleAvatar(
//                                     backgroundImage: NetworkImage(
//                                         "https://images.ctfassets.net/hrltx12pl8hq/2TRIFRwcjrTuNprkTQHVxs/088159eb8e811aaac789c24701d7fdb1/LP_image.jpg?fit=fill&w=632&h=354&fm=webp"), //NetworkImage
//                                     radius: 16.0,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 /* autovalidate is disabled */
//                                 controller: stateController,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.deny(
//                                       RegExp(r"\s\s")),
//                                   FilteringTextInputFormatter.deny(RegExp(
//                                       r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
//                                 ],
//                                 keyboardType: TextInputType.text,
//                                 maxLength: 160,
//                                 onChanged: (val) {},
//                                 maxLines: 1,
//                                 validator: (value) {},
//                                 focusNode: stateFocus,
//                                 autofocus: false,
//                                 decoration: InputDecoration(
//                                   errorMaxLines: 3,
//                                   counterText: "",
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   disabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0xffE5E5E5),
//                                     ),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                     ),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(4)),
//                                       borderSide: BorderSide(
//                                         width: 1,
//                                         color: Colors.red,
//                                       )),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4)),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                   hintText: "Search" ?? "",
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ];
//           },
//           body: Builder(
//             builder: (BuildContext context) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     ListView.builder(
//                       itemCount: 100,
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text("Index value: $index"),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

