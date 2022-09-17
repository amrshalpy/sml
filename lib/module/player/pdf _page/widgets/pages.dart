import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sportive/model/get_player_data.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

 firstPage() {
  return Stack(
    children: [
      Container(
        child: Image.asset(
          'images/002.png',
        ),
      ),
      RotationTransition(
        turns: AlwaysStoppedAnimation(20 / 180),
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 90,
            ),
            child: Container(
              // margin: EdgeInsets.only(left: 60),
              height: 90,
              width: 100,
              // child: RotatedBox(
              //   quarterTurns: 7,
              //   child: Image.asset(
              //     'images/mohamed-salah-sportstiger.jpeg',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${PlayerCubit.get(context).getPlayerProfileData!.data!.profilePicture}'),
                    fit: BoxFit.cover),
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
