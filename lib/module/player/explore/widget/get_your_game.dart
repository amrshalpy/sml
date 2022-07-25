import 'package:flutter/material.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/componant/style/colors.dart';
import 'package:sportive/player-cubit/player_cubit.dart';

void getGame(context) {
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
                  defaultText(
                      txt: 'Select your game',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1)),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        hintText: 'Search ',
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .61,
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        rotateText(txt: 'All'),
                        SizedBox(
                          height: 10,
                        ),
                        rotateText(txt: 'Defenders'),
                        SizedBox(
                          height: 10,
                        ),
                        rotateText(txt: 'Midfielders'),
                        SizedBox(
                          height: 10,
                        ),
                        rotateText(txt: 'Midfielders'),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            PlayerCubit.get(context).getIndex(index);
                          },
                          child: Container(
                            color: PlayerCubit.get(context).sportIndex == index
                                ? Colors.orangeAccent
                                : Colors.transparent,
                            child: getPosition(PlayerCubit.get(context)
                                .subSportModel!
                                .data![index]),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 7,
                        ),
                        itemCount:
                            PlayerCubit.get(context).subSportModel!.data!.length,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ));
}
