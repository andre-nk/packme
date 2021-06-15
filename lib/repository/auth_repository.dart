part of 'repositories.dart';

abstract class AuthRepository {
  User? currentUser();
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> signUpWithEmail(String email, String password, String userName);
  Future<void> signUpWithGoogle();
  Future<void> signOutWithGoogle();
  // Future<void> passwordResetSubmit(String email);
  // Future<bool> isFirstRun();
  // Future<void> updatePersonalData(String firstname, String lastName, String birthday);
}

class AuthenticationRepository implements AuthRepository{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final SharedPreferencesRepository _prefs = SharedPreferencesRepository();
  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      _prefs.setUserID(result.user!.uid);
    } catch (e) {
      throw(e);
    }
  }

  @override
  Future<void> signUpWithEmail(String email, String password, String userName) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      auth.currentUser!.updateDisplayName(userName);
      _prefs.setUserID(result.user!.uid);
    } catch (e) {
      throw(e);
    }
  }

  @override
  Future<void> signUpWithGoogle() async {
    try {
      //Google
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken
      );

      //Firebase
      UserCredential result = await auth.signInWithCredential(credentials);
      _prefs.setUserID(result.user!.uid); 
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
    }
  }

  @override
  Future<void> signOutWithGoogle() async {
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    } catch (e) {
    }
  }

  @override
  User? currentUser() {
    User? user = auth.currentUser;
    return user;
  }

  // @override
  // Future<bool> isFirstRun() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> passwordResetSubmit(String email) {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> updatePersonalData(String firstname, String lastName, String birthday) {
  //   throw UnimplementedError();
  // }
}
