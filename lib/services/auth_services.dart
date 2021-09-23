part of 'services.dart';

class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  Future<UserModel> signUp({
    required String email,
    required String name,
    required String password
  }) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
        isEmailVerified: userCredential.user!.emailVerified,
        id: userCredential.user!.uid,
        email: email,
        name: name,
        provider: "e-mail",
        profileURL: "",
        address: ""
      );
      _auth.currentUser!.updateDisplayName(name);
      // await UserService().createUser(user);
      return user;
    } catch (e){
      throw e;
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
        isEmailVerified: userCredential.user!.emailVerified,
        id: userCredential.user!.uid,
        email: email,
        name: userCredential.user!.displayName ?? "",
        profileURL: userCredential.user!.photoURL ?? "",
        provider: 'email',
        address: ""
      );
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUpWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleAuth.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken
      );

      UserCredential userCredential = await _auth.signInWithCredential(credentials);
      UserModel user = UserModel(
        isEmailVerified: userCredential.user!.emailVerified,
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? "",
        name: userCredential.user!.displayName ?? "",
        profileURL: userCredential.user!.photoURL ?? "",
        provider: 'google',
        address: ""
      );

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOutWithGoogle() async {
    try {
      await _googleAuth.disconnect();
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> changeDisplayName(String name, UserModel user) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      return UserModel(
        isEmailVerified: user.isEmailVerified,
        id: user.id,
        provider: user.provider,
        name: name, 
        email: user.email,
        profileURL: user.profileURL,
        address: user.address
      );
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> changeAddress(String address, UserModel user) async {
    try {
      return UserModel(
        isEmailVerified: user.isEmailVerified,
        id: user.id,
        provider: user.provider,
        name: user.name, 
        email: user.email,
        profileURL: user.profileURL,
        address: address
      );
    } catch (e) {
      throw e;
    }
  }

  Future<void> verifyEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      throw e;
    }
  }
}