import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';

class OrderCounterOnBoard extends StatefulWidget {
  @override
  _OrderCounterOnBoardState createState() => _OrderCounterOnBoardState();
}

class _OrderCounterOnBoardState extends State<OrderCounterOnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Text('Pengembalian',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#030835'))),
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 30),
                Text(
                  'Pilih counter di atas sesuai \n dengan counter yang Anda tuju lalu klik "Scan QR"',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                Container(
                height: 50,
                width: 270,
                child: RaisedButton(
                  color: HexColor('#FF8787'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  child: Text('Scan QR Code Counter',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
              ],
            ),
          ))
    );
  }
}