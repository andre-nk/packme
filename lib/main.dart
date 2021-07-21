import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pack_me/config/configs.dart';
import 'package:pack_me/cubit/authentication_cubit.dart';
import 'package:pack_me/pages/pages.dart';
import 'package:pack_me/repository/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  runApp(
    BlocProvider<AuthenticationCubit>(
      create: (context) => AuthenticationCubit(AuthenticationRepository()),
      child: InitialPage(),
    )
  );
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.watch<AuthenticationCubit>().state);
    return GetMaterialApp(
      theme: ThemeData(
        dividerColor: Palette.greenAccent
      ),
      initialRoute: '/',
      routes: {
        '/auth': (context) => CTAAuthPage(),
        '/homepage': (context) => UserListener()
      },
      debugShowCheckedModeBanner: false,
      title: "PackMe",
      home: AuthWidget(
        nonSignedInBuilder: (_) {
          final authCubit = context.watch<AuthenticationCubit>();
          return authCubit.state is OnboardingCompleted
          ? CTAAuthPage()
          : OnboardingPages();
        },
        signedInBuilder: (_) => UserListener(),
      ),
    );
  }
}
