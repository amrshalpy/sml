import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/model/widget_list_model.dart';

Widget getistClub(WidgetList list) {
  return Padding(
    padding: const EdgeInsets.only(left: 4, right: 4),
    child: Column(
      children: [
        Container(
          // key: ValueKey(list),
          height: 55,
          width: 45,
          decoration: BoxDecoration(
             color: Color.fromARGB(255, 240, 238, 238),
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage('${list.img}')),
            shape: BoxShape.circle,
            border: Border.all(
              // color: Colors.red,
              width: .5,
            ),
          ),
        ),
        defaultText(
            txt: "${list.txt}",
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: Colors.white)
      ],
    ),
  );
}
