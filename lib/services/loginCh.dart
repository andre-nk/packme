import 'package:flutter/material.dart';
import 'package:pack_me/ui/authentication/login.dart';

class LoginChecker extends StatelessWidget {
  const LoginChecker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //operator for Logged / not logged in, USE PACKAGE
    return Login();

  }
}