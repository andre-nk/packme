import 'package:flutter/material.dart';
import 'package:pack_me/ui/app/userHome.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RaisedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserHome()));
        },
        child: Text('Login'),
        color: Colors.red,
      )
    );
  }
}