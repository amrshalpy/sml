
import 'package:flutter/material.dart';
import 'package:sportive/module/player/player_login/player_login.dart';


class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override void initState() { 
    super.initState(); 
    new Future.delayed( const Duration(seconds: 12), () =>
    Navigator.pushReplacement( context, 
    MaterialPageRoute(builder: (context) => PlayerLogin()),
       ));
     }

    @override 
     Widget build(BuildContext context) {
     return new Scaffold( 
      backgroundColor: Colors.white, 
       body: Container( 
       height: double.infinity, 
       width: double.infinity, 
      child: Image.asset("images/splash screen.gif", 
      gaplessPlayback: true, 
      fit: BoxFit.fill
      )
      ));
      } 
      }