import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/sports.dart';

Widget getSportsList(Sports sportsList) {
  return Column(
    children: [
      Image.asset(
        '${sportsList.image}',
        height: 50,
        width: 50,
      ),
      defaultText(
        txt: '${sportsList.title}',
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.normal,
      ),
    ],
  );
}
