//EQUAL TO AUTH.DART
// ignore: unused_import
import 'package:pack_me/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pack_me/ui/models/user.dart';

class LoginChecker{

  final FirebaseAuth _auth = FirebaseAuth.instance;

   // create user obj based on firebase user
  Pengguna _userFromFirebaseUser(User user) {
    return user != null ? Pengguna(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Pengguna> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
      // .map(_userFromFirebaseUser);
  }

    Future signInWithEmailAndPassword(String email, String password) async {
      try {
        UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        return user;
      } catch (error) {
        print(error.toString());
        return null;
      } 
    }

    //register (email)
    Future registerWithEmailAndPassword(String email, String password, String userName, String phoneNumber) async {
      try {
        String userQR = '';
        String userAddress = ''; //NOT INITIALIZED (PROMPT USER TO ADD LATER (NOTIF))
        int credit = 0;
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User user = result.user;
   
        //create user profile in Firestore
        await DatabaseService(uid: user.uid, email: user.email, password: password, userName: userName, phoneNumber: phoneNumber, userQR: userQR, userAddress: userAddress, credit: credit).
          updateUserData(
            user.uid,
            userAddress,
            userQR,
            password,
            userName,
            phoneNumber,
            user.email,
        );
        return _userFromFirebaseUser(user);
      } catch (error) {
        print(error.toString());
        return null;
      } 
    }

    //sign out
    Future signOut() async {
      try {
      return await _auth.signOut();
      } catch (error) {
      print(error.toString());
      return null;
      }
   } 
}