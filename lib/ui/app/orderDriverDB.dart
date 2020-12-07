import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:pack_me/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DriverOrderDB extends StatefulWidget {
  @override
  _DriverOrderDBState createState() => _DriverOrderDBState();
}

class _DriverOrderDBState extends State<DriverOrderDB> {
  @override
  Widget build(BuildContext context) {
    String userAddress;

    final userProfileAddress = Provider.of<List<UserProfileModel>>(context);
    userProfileAddress.forEach((element) {
      userAddress = element.userAddress;
    });

    print(userAddress);

    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xFF43D1A5).withOpacity(0.3)),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('$userAddress',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              Container(
                height: 50,
                width: 190,
                child: RaisedButton(
                  color: HexColor('#FF8787'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  child: Text('Daftar',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
            ])));
  }
}
