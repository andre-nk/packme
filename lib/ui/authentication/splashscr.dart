import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pack_me/services/loggedDecider.dart';
import 'package:pack_me/ui/authentication/login.dart';

class SplasScreen extends StatefulWidget {
  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {

  bool _firstTime = true;

  dynamic firstTimeChecker(inputter){
    if(inputter == true){
      return LoginDecider();
    }else{
      return Login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text('a'), //TBA Images
      nextScreen: firstTimeChecker(_firstTime),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}