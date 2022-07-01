import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/module/player/explore/widget/get_poistion.dart';
import 'package:sportive/module/player/explore/widget/get_your_game.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);
  var nameController = TextEditingController();

  var clubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          'images/gold5.png',
          fit: BoxFit.contain,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .7,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/CompositeLayer (2).png',
                      height: 80,
                      width: 80,
                      // fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'images/CompositeLayer.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                    defaultText(txt: '100 ' + "K"),
                    SizedBox(
                      height: 8,
                    ),
                    Icon(Icons.favorite),
                    defaultText(txt: '100 ' + "K"),
                    SizedBox(
                      height: 8,
                    ),
                    Image.asset(
                      'images/icons8-share-48 (3).png',
                      height: 40,
                      width: 40,
                    ),
                    defaultText(txt: '100 ' + "K"),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.upload_file,
                                    size: 35,
                                  )),
                              defaultText(
                                txt: 'Upload image',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        height: 220,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 39, 3, 3),
                          ),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 30,
              width: 150,
              child: TextField(
                textAlign: TextAlign.center,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'enter your name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              width: 150,
              child: TextField(
                textAlign: TextAlign.center,
                controller: clubController,
                decoration: InputDecoration(
                  hintText: 'enter your club',
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              child: defaultText(
                txt: 'your position',
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              onTap: () {
                getPoistion(context);
              },
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              child: defaultText(
                txt: 'your game name',
                color: Colors.blue,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              onTap: () {
                getGame(context);
              },
            )
          ],
        ),
      ],
    );
  }
}
