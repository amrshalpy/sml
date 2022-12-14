import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/module/player/pt/widgets/new_performance.dart';

void getDetails(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (context) => Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 10, bottom: 40, left: 10),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        pop(context: context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 15,
                  ),
                 
                ],
              ),
              SizedBox(
                height: 20,
              ),
              NewPerformance(),
            ]),
          ));
}