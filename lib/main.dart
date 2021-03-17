import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_me/pages/pages.dart';
import 'package:pack_me/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pack_me/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(sharedPreferences),
        ),
      ],
      child: InitialPage(),
    )
  );
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/auth': (context) => CTAAuthPage(),
        '/homepage': (context) => HomePage()
      },
      debugShowCheckedModeBanner: false,
      title: "PackMe",
      home: AuthWidget(
        nonSignedInBuilder: (_) => Consumer(
          builder: (context, watch, _) {
            final didCompleteOnboarding =
                watch(onboardingViewModelProvider.state);
            return didCompleteOnboarding ? CTAAuthPage() : OnboardingPages();
          },
        ),
        signedInBuilder: (_) => HomePage(),
      ),
    );
  }
}
