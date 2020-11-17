import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pack_me/ui/app/userHome.dart';
import 'package:pack_me/ui/authentication/landing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future langsungan() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');
    
    if (firstTime != null && !firstTime) {// Not first time
      return AnimatedSplashScreen(
      splash: Text('a'), //TBA Images
      nextScreen: UserHome(),
      splashTransition: SplashTransition.rotationTransition,
      );
    } else {// First time
      prefs.setBool('first_time', false);
      return AnimatedSplashScreen(
      splash: Text('a'), //TBA Images
      nextScreen: Landing(),
      splashTransition: SplashTransition.rotationTransition,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text('a'), //TBA Images
      nextScreen: UserHome(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}


