import 'package:flutter/material.dart';
import 'package:pack_me/services/loginChecker.dart';
import 'package:pack_me/ui/app/historyPage.dart';
import 'package:pack_me/ui/app/userHomePage.dart';
import 'package:pack_me/ui/app/orderPage.dart';
import 'package:pack_me/ui/authentication/signIn.dart';
import 'package:pack_me/ui/authentication/signUp.dart';
import 'package:pack_me/ui/authentication/splashScreen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pack_me/ui/models/userModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.init("f5a5b726-ea96-44f1-a5a3-df0509aee349", iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: false
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() { 
    super.initState();
    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
    // will be called whenever a notification is received
    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('Notification was tapped');
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StreamProvider<Pengguna>.value(
      value: LoginChecker().user,
      child: MaterialApp(
        title: 'PackMe',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: HexColor('#FF8787'),
          accentColor: HexColor('#43D1A5'),
          textTheme: GoogleFonts.poppinsTextTheme(textTheme),
          appBarTheme:
              AppBarTheme(textTheme: GoogleFonts.poppinsTextTheme(textTheme)),
        ),
        //porting to LoginChecker
        home: SplashScreen(),
        routes: {
          '/signup': (context) => SignUp(),
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
}
