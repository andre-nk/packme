import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/services/database.dart';
import 'package:pack_me/ui/app/infoTileDB.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/infoDBModel.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    dynamic test = MediaQuery.of(context).size.width * 0.22;
    return StreamProvider<List<InfoModel>>.value(
        value: DatabaseService().appInfoFAQ,
        child: Scaffold(
        appBar: AppBar(
          leading: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.fromLTRB(12,0,0,0),
                child: 
                IconButton(
                        icon: new Icon(Feather.arrow_left),
                        onPressed: () => Navigator.pop(context),
                ),
              ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0,5,test,0),
                  child: Text('Informasi', style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: HexColor('#030835')
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,22,0),
                  child: Icon(Icons.contact_support),
                )
              ],
            )
          ],
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: InfoTileDB()
      ),
    );
  }
}
