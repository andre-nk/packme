import 'package:flutter/material.dart';
import 'package:pack_me/ui/app/userHomePage.dart';
import 'package:pack_me/ui/authentication/signIn.dart';
import 'package:pack_me/ui/models/userModel.dart';
import 'package:provider/provider.dart';

class LoginDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Pengguna>(context);
    // print(user.email);
    
    // return either the Home or Authenticate widget
    if (user == null){
      print(user);
      return Login();  
    } else {
      return UserHome();
    }
  }
}