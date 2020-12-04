import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/ui/app/historyListDB.dart';
import 'package:pack_me/ui/models/historyDBModel.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/services/database.dart';
import 'package:pack_me/ui/models/userModel.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override

  Widget build(BuildContext context) {
    
    var foo = Pengguna().uid;
    dynamic test = MediaQuery.of(context).size.width * 0.36;
    dynamic test2 = MediaQuery.of(context).size.height * 0.03;

    return StreamProvider<List<HistoryModel>>.value(
      value: DatabaseService(uid: foo).userHistory,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: IconButton(
                icon: new Icon(Feather.arrow_left),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, test2, test, 0),
              child: Text('Riwayat',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#030835'))),
            )
          ],
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: HistoryList(),
      ),
    );
  }
}
