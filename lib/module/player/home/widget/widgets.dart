import 'package:flutter/material.dart';

class WidgetList {
  String img;

  WidgetList({required this.img});
}

Widget getist(WidgetList list) {
  return Padding(
    padding: const EdgeInsets.only(left: 4, right: 4),
    child: Container(
      // key: ValueKey(list),
      height: 55,
      width: 45,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain, image: AssetImage('${list.img}')),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: .5,
        ),
      ),
    ),
  );
}
