part of 'repositories.dart';
class AuthenticationRepository{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  
  Future<UserModel> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      User user = auth.currentUser!;
      return UserModel(uid: user.uid, photoURL: user.photoURL ?? "", value: "215000");
    } catch (e) {
      throw(e);
    }
  }


  Future<UserModel> signUpWithEmail(String email, String password, String userName) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      auth.currentUser!.updateDisplayName(userName);
      User user = auth.currentUser!;
      return UserModel(uid: user.uid, photoURL: user.photoURL ?? "", value: "215000");
    } catch (e) {
      throw(e);
    }
  }

  
  Future<UserModel> signUpWithGoogle() async {
    try {
      //Google
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken
      );
      //Firebase
      await auth.signInWithCredential(credentials);
      User user = auth.currentUser!;
      return UserModel(uid: user.uid, photoURL: user.photoURL ?? "", value: "215000");
    } catch (e) {
      rethrow;
    }
  }

  
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
    }
  }

  
  User? currentUser() {
    User? user = auth.currentUser;
    return user;
  }
  
  Future<void> passwordResetSubmit(String email) async {
    try{
      await auth.sendPasswordResetEmail(email: email);
    } catch (e){
      throw(e);
    }
  }
}
