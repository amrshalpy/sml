import 'package:flutter/material.dart';

Color mainColor = Color(0xff093A50);
Color contactColor = Color(0xff40768C);
Color hintColor = Color.fromARGB(255, 54, 54, 54);
Color greyColor = Color.fromARGB(255, 199, 198, 198);

Color scandColor = Color(0xffffb500);
Color thirdColor = Color(0xff8699d2);
Color loginColor = Color(0xffd5f8e5);
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
