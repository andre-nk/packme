import 'package:flutter/material.dart';
import 'package:pack_me/services/loginCh.dart';
import 'package:pack_me/ui/app/userHome.dart';
import 'package:pack_me/ui/app/withdraw.dart';
import 'package:pack_me/ui/app/order.dart';
import 'package:pack_me/ui/authentication/login.dart';
import 'package:pack_me/ui/authentication/splashscr.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: HexColor('#FF8787'),
          accentColor: HexColor('#43D1A5'),
          textTheme: GoogleFonts.poppinsTextTheme(textTheme),
          appBarTheme: AppBarTheme(textTheme: GoogleFonts.poppinsTextTheme(textTheme)),
        ),
        //porting to LoginChecker
        home: SplashScreen(),
        routes: {
          '/login': (context) => Login(),
          '/userHomeQR': (context) => UserHome(),
          '/withdraw': (context) => Withdraw(),
          '/order': (context) => Order()
        }
    );
  }
}

