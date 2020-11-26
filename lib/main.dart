import 'package:flutter/material.dart';
import 'package:pack_me/services/loginCh.dart';
import 'package:pack_me/ui/app/history.dart';
import 'package:pack_me/ui/app/userHome.dart';
import 'package:pack_me/ui/app/order.dart';
import 'package:pack_me/ui/authentication/login.dart';
import 'package:pack_me/ui/authentication/signup.dart';
import 'package:pack_me/ui/authentication/splashscr.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pack_me/ui/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){

    final textTheme = Theme.of(context).textTheme;
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
                '/signup' : (context) => SignUp(),
                '/login': (context) => Login(),
              },
              onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/history':
                  return PageTransition(
                    child: HistoryPage(),
                    type: PageTransitionType.bottomToTop,
                    settings: settings,
                  );
                  break;
                case '/userHome':
                  return PageTransition(
                    child: UserHome(),
                    type: PageTransitionType.bottomToTop,
                    settings: settings,
                  );
                  break;
                case '/userOrder':
                  return PageTransition(
                    child: Order(),
                    type: PageTransitionType.bottomToTop,
                    settings: settings,
                  );
                  break;
                case '/userHomeFromBar':
                  return PageTransition(
                    child: UserHome(),
                    type: PageTransitionType.fade,
                    settings: settings,
                  );
                  break;
                default:
              return null;
              }
            },
            ),
          );  
        }
        // Otherwise, show something whilst waiting for initialization to complete
}

