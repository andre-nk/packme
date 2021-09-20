import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pack_me/config/configs.dart';
import 'package:pack_me/cubit/authentication_cubit.dart';
import 'package:pack_me/pages/pages.dart';
import 'package:pack_me/repository/repositories.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory()
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthenticationRepository()),
        ),
      ],
     child: InitialPage())
  );
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.watch<AuthCubit>().state);
    return MaterialApp(
      theme: ThemeData(
        dividerColor: Palette.greenAccent
      ),
      initialRoute: '/',
      routes: {
        '/auth': (context) => CTAAuthPage(),
        '/homepage': (context) => HomePage()
      },
      debugShowCheckedModeBanner: false,
      title: "PackMe",
      home: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state){
          if(state is AuthFailedState){
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          if(state is AuthSuccess){
            return HomePage();
          } else if (state is OnboardingIsNotCompleted || state is AuthInitial) {
            return OnboardingPages();
          } else {
            return CTAAuthPage();
          }
        },
      )
    );
  }
}
