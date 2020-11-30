import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/services/database.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:pack_me/ui/app/userProfileFull.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserProfileModel>>.value(
        value: DatabaseService().userProfile,
        child: Scaffold(
        appBar: AppBar(
          leading: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(12,25,0,0),
                child: 
                IconButton(
                        icon: new Icon(Feather.arrow_left),
                        onPressed: () => Navigator.pop(context),
                ),
              ),
          ),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: UserProfileFull(),
      ),
    );
  }
}