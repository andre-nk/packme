part of '../pages.dart';

class OnboardingPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<SharedPref>(context, listen: false).setIsFirstTime(false);
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
      },
      child: Text("Check")
    );
  }
}