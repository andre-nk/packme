part of "pages.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
        context.read<AuthenticationService>().signOut();
      },
      child: Text("Sign out and ${FirebaseAuth.instance.currentUser.email}")
    );
  }
}
