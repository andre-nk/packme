import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';

Widget buildInfoTileHead(String title, String description){
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: HexColor('#C7F1E4')),
        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
      )
    ),
    child: ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      title: Text('$title',
        style: GoogleFonts.poppins(
          color: HexColor('#030835'),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        )
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15,0,15,0),
          child: Column(
            children: [
              Text('$description',
                style: GoogleFonts.poppins(
                color: HexColor('#030835'),
                fontWeight: FontWeight.w400,
                fontSize: 16,
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

Widget buildInfoTile(String title, String description){
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
      )
    ),
    child: ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      title: Text('$title',
        style: GoogleFonts.poppins(
          color: HexColor('#030835'),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        )
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15,0,15,0),
          child: Column(
            children: [
              Text('$description',
                style: GoogleFonts.poppins(
                color: HexColor('#030835'),
                fontWeight: FontWeight.w400,
                fontSize: 16,
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