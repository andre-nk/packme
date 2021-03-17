part of '../pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
      },
      child: Text("Sign out and")
    );
  }
}
