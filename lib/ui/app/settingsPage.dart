import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _main = false;
  bool _driver = false;
  bool _return = false;
  bool _promos = false;

  @override
  Widget build(BuildContext context) {

    dynamic test = MediaQuery.of(context).size.width * 0.3;
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
        title: Text('Pengaturan',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: HexColor('#030835'))),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            decoration: new BoxDecoration(
                      border: new Border(
                        top: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,6,10,6),
              child: SwitchListTile(
                title: Text('Notifikasi Utama',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                value: _main,
                onChanged: (bool value) {
                  setState(() {
                    _main = value;
                    _driver = value;
                    _return = value;
                    _promos = value;
                  });
                },
              ),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
                      border: new Border(
                        
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,6,10,6),
              child:SwitchListTile(
                title: Text('Notifikasi Driver',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                value: _driver,
                onChanged: (bool value) {
                  setState(() {
                    _driver = value;
                    _main = value;
                  });
                },
              ),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
                      border: new Border(
                        
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,6,10,6),
              child: SwitchListTile(
                title: Text('Notifikasi Pengembalian',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                value: _return,
                onChanged: (bool value) {
                  setState(() {
                    _return = value;
                    _main = value;
                  });
                },
              ),
            ),
          ),
          Container(
            decoration: new BoxDecoration(
                      border: new Border(
                        
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,6,10,6),
              child: SwitchListTile(
                title: Text('Notifikasi Promo',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                value: _promos,
                onChanged: (bool value) {
                  setState(() {
                    _promos = value;
                    _main = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.35),
          Center(child: Text('Version 1.0.0 BETA'))
        ],
      )
    );
  }
}