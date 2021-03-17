part of 'providers.dart';

class AuthenticationViewModel with ChangeNotifier {
  AuthenticationViewModel({required this.auth});
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;
  dynamic error;

  Future<void> signIn(String? email, String? password) async {
    try {
      isLoading = true;
      notifyListeners();
      await auth.signInWithEmailAndPassword(email: email!, password: password!);
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUpWithEmail({String? email, String? password, String? userName}) async {
    try {
      isLoading = true;
      notifyListeners();
      await auth.createUserWithEmailAndPassword(email: email!, password: password!);
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUpWithGoogle() async{
    try {
      isLoading = true;
      notifyListeners();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
      await auth.signInWithCredential(
        credentials
      );
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut () async {
    try {
      isLoading = true;
      notifyListeners();
      await auth.signOut();
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }  
    notifyListeners();
  }

   Future<void> signOutWithGoogle() async {
    try {
      isLoading = true;
      notifyListeners();
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }  
    notifyListeners();
  }
}
