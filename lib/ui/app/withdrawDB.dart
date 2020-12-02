import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/UserProfileModel.dart';

class WithdrawDB extends StatefulWidget {
  @override
WithdrawDBState createState() => WithdrawDBState();
}

class WithdrawDBState extends State<WithdrawDB> {
  @override
  Widget build(BuildContext context) {

    String userCredit;

    final withdrawDBData = Provider.of<List<UserProfileModel>>(context);
    withdrawDBData.forEach((element) { 
      //user avatar
      userCredit = element.credit;
    });

    return Text('$userCredit', 
      style: TextStyle(
        fontWeight: FontWeight.w900, fontSize: 18
      ),
    );            
  }
}