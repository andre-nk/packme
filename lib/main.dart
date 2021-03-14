import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:pack_me/config/configs.dart';
import 'package:pack_me/pages/pages.dart';
import 'package:pack_me/services/services.dart';
import 'package:pack_me/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) => ModularApp(
        module: AppModule(),
        child: ChangeNotifierProvider<SharedPref>.value(
          value: SharedPref(snapshot.data),
          child: GetMaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => InitialPage(),
              '/auth': (context) => CTAAuthPage(),
              '/homepage': (context) => HomePage()
            },
            debugShowCheckedModeBanner: false,
            title: "PackMe",
          ),
        )
      ),
    )
  );
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ListenableProvider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().userState,
          initialData: null,
        ),
      ],
      child: AuthenticationWrapper());
  }
}
