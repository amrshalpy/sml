import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/module/player/home/about_me.dart';
import 'package:sportive/module/player/player_login/player_login.dart';
import 'package:sportive/module/player/qr_code/qr_code.dart';

void main() {
  runApp(const MyApp());
}
//
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit())
      ],
      child: ScreenUtilInit(
        builder: ( context, child) =>MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sportive',
          home: PlayerLogin(),
        ),
  designSize:const Size(360, 640),
      ),
    );
  }
}
