part of "../pages.dart";

class AuthWidget extends ConsumerWidget {
  final WidgetBuilder? nonSignedInBuilder;
  final WidgetBuilder? signedInBuilder;

  AuthWidget({this.nonSignedInBuilder, this.signedInBuilder});
  
  // const AuthWidget({
  //   required this.signedInBuilder,
  //   required this.nonSignedInBuilder,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authStateChanges = watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) => _data(context, user),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
        body: Text("error")
      ),
    );
  }

  Widget _data(BuildContext context, User? user) {
    if (user != null) {
      return signedInBuilder!(context);
    }
    return nonSignedInBuilder!(context);
  }
}