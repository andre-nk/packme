import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pack_me_alpha/interface/app/homePage.dart';
import 'package:pack_me_alpha/interface/auth/splashScreen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pack_me_alpha/interface/auth/signIn.dart';
import 'package:pack_me_alpha/interface/auth/signUp.dart';

void main() async{
  //onesignal config
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

  runApp(AppInit());
}

class AppInit extends StatefulWidget {
  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pack Me V-Alpha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PackMe',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: HexColor('#FF8787'),
          accentColor: HexColor('#43D1A5'),
          textTheme: GoogleFonts.poppinsTextTheme(textTheme),
          appBarTheme: AppBarTheme(textTheme: GoogleFonts.poppinsTextTheme(textTheme)),
        ),
        
        //nav to LoginChecker
        home: SplashScreen(),
        routes: {
          '/signup': (context) => SignUp(),
          '/signin': (context) => SignIn(),
          '/homepage': (context) => HomePageSample(),
        },
        // onGenerateRoute: (settings) {
        //   switch (settings.name) {
        //     case '/history':
        //       return PageTransition(
        //         child: HistoryPage(),
        //         type: PageTransitionType.bottomToTop,
        //         settings: settings,
        //       );
        //       break;
        //     case '/userHome':
        //       return PageTransition(
        //         child: UserHome(),
        //         type: PageTransitionType.bottomToTop,
        //         settings: settings,
        //       );
        //       break;
        //     case '/userOrder':
        //       return PageTransition(
        //         child: Order(),
        //         type: PageTransitionType.bottomToTop,
        //         settings: settings,
        //       );
        //       break;
        //     case '/userHomeFromBar':
        //       return PageTransition(
        //         child: UserHome(),
        //         type: PageTransitionType.fade,
        //         settings: settings,
        //       );
        //       break;
        //     default:
        //       return null;
        //   }
        // },
    );
  }
}
