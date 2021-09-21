import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pack_me/config/configs.dart';
import 'package:pack_me/cubit/auth_cubit.dart';
import 'package:pack_me/pages/pages.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(InitialPage());
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => AuthCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(dividerColor: Palette.greenAccent),
        initialRoute: '/',
        routes: {
          '/auth': (context) => CTAAuthPage(),
          '/homepage': (context) => HomePage()
        },
        debugShowCheckedModeBanner: false,
        title: "PackMe",
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            print(state);
            if(state is AuthSuccess){
              return HomePage();
            } else if (state is OnboardingSuccess || state is NotAuthenticated) {
              return CTAAuthPage();
            } else if (state is AuthInitial || state is OnboardingFailed){
              return OnboardingPages();
            } else if (state is AuthLoading){
              return Center(
                child: CircularProgressIndicator(
                  color: Palette.greenAccent
                )
              );
            } else {
              return CTAAuthPage();
            }
          },
        )
      ),
    );
  }
}
