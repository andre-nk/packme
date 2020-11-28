import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/ui/models/historyTile.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {
    
    dynamic test = MediaQuery.of(context).size.width * 0.36;
    dynamic test2 = MediaQuery.of(context).size.height * 0.03;

    return Scaffold(
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
          Padding(
            padding: EdgeInsets.fromLTRB(0,test2,test,0),
            child: Text('Riwayat', style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#030835')
            )),
          )
        ],
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListTileHead('Tarik Saldo', 'OVO', '19/11/2020', -100000, context),
              buildListTileNormal('Terima Saldo', 'OVO', '19/11/2020', 50000, context),
              buildListTileNormal('Pengembalian', 'Pick-Up', '19/11/2020', -15, context),
              buildListTileNormal('Peminjaman', 'Pick-Up', '19/11/2020', 15, context),
              buildListTileNormal('Terima Saldo', 'OVO', '19/11/2020', 50000, context),
              buildListTileNormal('Pengembalian', 'Pick-Up', '19/11/2020', -15, context),
              buildListTileNormal('Peminjaman', 'Pick-Up', '19/11/2020', 15, context)
            ],
          ),
        ],
      )
    );
  }
}