import 'package:flutter/material.dart';
import 'package:pack_me/ui/app/userHome.dart';
import 'package:page_transition/page_transition.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context,  '/userHomeQR');
              },
              child: Text('Login'),
              color: Colors.red,
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/userHomeQR');
              },
              child: Text('Sign Up'),
              color: Colors.red,
            ),
          ],
        ),
      )
    );
  }
}