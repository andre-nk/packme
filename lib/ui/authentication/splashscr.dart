import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pack_me/services/loggedDecider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text('a'),
      nextScreen: LoginDecider(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}