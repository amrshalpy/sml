import 'package:flutter/material.dart';

Color mainColor = Color(0xff093A50);
Color drawerColor = Color.fromARGB(255, 2, 125, 182);
Color contactColor = Color(0xff40768C);
Color hintColor = Color.fromARGB(255, 54, 54, 54);
Color greyColor = Color.fromARGB(255, 199, 198, 198);

Color scandColor = Color(0xffffb500);
Color thirdColor = Color(0xff8699d2);
Color loginColor = Color(0xffd5f8e5);
const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xff093A50);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
// const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);

// Color greyColor = Colors.grey;
Widget crdientColor() {
  return Container(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff154E66), Color(0xff06141A)])),
      ));
}
