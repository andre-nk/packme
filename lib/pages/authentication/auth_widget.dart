part of "../pages.dart";

class AuthWidget extends StatelessWidget {
  final WidgetBuilder? nonSignedInBuilder;
  final WidgetBuilder? signedInBuilder;

  AuthWidget({required this.nonSignedInBuilder, required this.signedInBuilder});
  
  @override
  Widget build(BuildContext context) {

    AuthState states = context.watch<AuthenticationCubit>().state;

    if(states is AuthInitial){
      context.read<AuthenticationCubit>().isLoggedIn();
    }

    if(states is NotAuthenticated){
      context.read<AuthenticationCubit>().isOnboardingCompleted();
    }

    return states is AuthInitial || states is AuthLoading
    ? Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      )
    : states is Authenticated
      ? signedInBuilder!(context)
      : states is NotAuthenticated
        ? nonSignedInBuilder!(context)
        : Scaffold(
            body: Center(
              //TODO: 404 PAGE
              child: CircularProgressIndicator(color: Colors.red,),
            ),
          );
  }
}