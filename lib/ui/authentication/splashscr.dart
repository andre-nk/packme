import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pack_me/ui/authentication/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text('a'),
      nextScreen: Login(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}