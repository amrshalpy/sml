import 'package:flutter/material.dart';
import 'package:sportive/module/club/player_club/widgets/get_accepted.dart';

class Accepted extends StatelessWidget {
  const Accepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => getAccepted(),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
