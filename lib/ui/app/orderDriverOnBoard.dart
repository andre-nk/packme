import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/ui/app/orderDriverDB.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:pack_me/services/database.dart';

class OrderDriverOnBoard extends StatefulWidget {
  @override
  _OrderDriverOnBoardState createState() => _OrderDriverOnBoardState();
}

class _OrderDriverOnBoardState extends State<OrderDriverOnBoard> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserProfileModel>>.value(
      value: DatabaseService().userProfile,
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
                DriverOrderDB(),
                SizedBox(height: 30),
                Text(
                  'Driver kami akan secara otomatis mengunjungi alamat Anda untuk\nmengambil pack pada tanggal //20//\nsetiap bulannya',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                Text(
                  'Anda dapat panggil driver kami ke alamat Anda sekarang dengan fee tertentu.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(height: 30),
                Container(
                height: 50,
                width: 190,
                child: RaisedButton(
                  color: HexColor('#FF8787'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  child: Text('Pesan Driver',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
              ],
            ),
          ))),
    );
  }
}
