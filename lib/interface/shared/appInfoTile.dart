import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';

class AppInfoTile extends StatelessWidget {

  // final InfoModel infoList;
  // AppInfoTile({this.infoList});

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
      )
    ),
    child: ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(8,16,8,16),
        child: Text('Sample',
          style: GoogleFonts.poppins(
            color: HexColor('#030835'),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          )
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25,0,25,10),
          child: Column(
            children: [
              Text('Sample Lorem',
                style: GoogleFonts.poppins(
                color: HexColor('#030835'),
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.65
              )
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    ),
  );
  }
}