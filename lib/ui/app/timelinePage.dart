import 'package:flutter/material.dart';
import 'package:pack_me/services/database.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/ui/app/timelineDB.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/historyDBModel.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<HistoryModel>>.value(
        value: DatabaseService().userHistory,
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
            title: Text('Timeline',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#030835'))),
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: TimelineDB(),
        ));
  }
}
