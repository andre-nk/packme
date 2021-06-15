part of '../pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () async {
        context.read<AuthenticationCubit>().signOut();
      },
      child: Text("Sign out and")
    );
  }
}
