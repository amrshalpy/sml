import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportive/componant/componant/componant.dart';
import 'package:sportive/module/company/cards/widgets/get_card.dart';
import 'package:sportive/module/player/pt/widgets/get_pt.dart';
import 'package:sportive/module/player/pt/widgets/get_sports_list.dart';
import 'package:sportive/player-cubit/player_cubit.dart';
import 'package:sportive/player-cubit/player_state.dart';

class OldPerformance extends StatelessWidget {
  OldPerformance({Key? key}) : super(key: key);
  var txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerCubit, PlayerState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlayerCubit cubit = PlayerCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 70,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => getSportsList(
                          PlayerCubit.get(context).sportsList[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 12,
                          ),
                      itemCount: PlayerCubit.get(context).sportsList.length),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    child: Row(children: [
                      Expanded(
                        child: TextField(
                          controller: txtController,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              iconColor: Colors.white,
                              labelText: 'Search',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                        ),
                      ),
                      Image.asset(
                        'images/adv search.png',
                        height: 30,
                        width: 30,
                      )
                    ]),
                  ),
                ),
                cubit.getCouponModel!.data !.isNotEmpty?
                ListView.builder(
                  itemBuilder: (context, index) =>
                      getCard(cubit.getCouponModel!.data![index],context),
                  itemCount: cubit.getCouponModel!.data!.length,
                  shrinkWrap: true,
                ):Column(children: [
                  FaIcon(FontAwesomeIcons.bookOpen,color: Colors.redAccent,),
                  defaultText(txt: 'Coupons Empty',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                  )
                ]),
              ],
            ),
          );
        });
  }
}
