import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/ui/models/infoTile.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    dynamic test = MediaQuery.of(context).size.width * 0.22;
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12,0,8,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoTileHead(
                  'Mengapa akun saya dibatasi?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus molestie dolor sodales commodo condimentum. Curabitur eu dictum nulla, sed tincidunt erat. Morbi arcu tellus, scelerisque nec tellus eu, dignissim egestas nisl. Maecenas bibendum tincidunt risus in elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ornare rhoncus leo quis tristique. Sed purus risus, volutpat quis metus quis, dictum lacinia dolor. Aenean sem magna, feugiat vitae ullamcorper in, luctus vel dui. Nulla nec cursus risus, sed ornare nibh. Fusce convallis, turpis sed lacinia viverra, nisl lorem porttitor dui, at malesuada lectus tortor eu risus. Curabitur cursus egestas libero ut aliquet. Curabitur eget finibus magna. Sed et sapien sit amet purus blandit ultricies quis eget nisi.'
                ),
                buildInfoTile(
                  'Mengapa akun saya dibatasi?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus molestie dolor sodales commodo condimentum. Curabitur eu dictum nulla, sed tincidunt erat. Morbi arcu tellus, scelerisque nec tellus eu, dignissim egestas nisl. Maecenas bibendum tincidunt risus in elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ornare rhoncus leo quis tristique. Sed purus risus, volutpat quis metus quis, dictum lacinia dolor. Aenean sem magna, feugiat vitae ullamcorper in, luctus vel dui. Nulla nec cursus risus, sed ornare nibh. Fusce convallis, turpis sed lacinia viverra, nisl lorem porttitor dui, at malesuada lectus tortor eu risus. Curabitur cursus egestas libero ut aliquet. Curabitur eget finibus magna. Sed et sapien sit amet purus blandit ultricies quis eget nisi.'
                ),
                 buildInfoTile(
                  'Mengapa akun saya dibatasi?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus molestie dolor sodales commodo condimentum. Curabitur eu dictum nulla, sed tincidunt erat. Morbi arcu tellus, scelerisque nec tellus eu, dignissim egestas nisl. Maecenas bibendum tincidunt risus in elementum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ornare rhoncus leo quis tristique. Sed purus risus, volutpat quis metus quis, dictum lacinia dolor. Aenean sem magna, feugiat vitae ullamcorper in, luctus vel dui. Nulla nec cursus risus, sed ornare nibh. Fusce convallis, turpis sed lacinia viverra, nisl lorem porttitor dui, at malesuada lectus tortor eu risus. Curabitur cursus egestas libero ut aliquet. Curabitur eget finibus magna. Sed et sapien sit amet purus blandit ultricies quis eget nisi.'
                ),
              ]
            ),
          ),
        ],
      )
    );
  }
}
