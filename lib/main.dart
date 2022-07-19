import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportive/cubit/home_cubit.dart';
import 'package:sportive/module/club/club_cubit/club_cubit.dart';
import 'package:sportive/module/club/home/home.dart';

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
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ClubCubit()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sportive',
          home: ClubHome(),
        ),
        designSize: Size(360, 640),
      ),
    );
  }
}
