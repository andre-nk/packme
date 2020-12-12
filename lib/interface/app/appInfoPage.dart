import "package:flutter/material.dart";
import 'package:pack_me_alpha/interface/shared/pages.dart';
import 'package:pack_me_alpha/services/appInfoDB.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GeneralPage(title: 'Informasi'),
          AppInfoDB(),
        ]
      ),
    );
  }
}
