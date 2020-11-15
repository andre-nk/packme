import 'package:flutter/material.dart';
import 'package:pack_me/services/loginCh.dart';
import 'package:pack_me/ui/app/userHome.dart';
import 'package:pack_me/ui/app/withdraw.dart';
import 'package:pack_me/ui/app/order.dart';
import 'package:pack_me/ui/authentication/login.dart';
import 'package:pack_me/ui/authentication/splashscr.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pack_me/ui/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return null; //TBA
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<Pengguna>.value(
            value: LoginChecker().user,
            child: MaterialApp(
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
            ),
          );  
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return null; //TBA
      },
    );

    
  }
}

