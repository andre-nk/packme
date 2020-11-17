//EQUAL TO AUTH.DART
// ignore: unused_import
// import 'package:pack_me/services/database.dart';
import 'package:pack_me/ui/authentication/login.dart';
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
    Future registerWithEmailAndPassword(String email, String password) async {
      try {
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User user = result.user;
   
        //create user profile
//         await DatabaseService(uid: user.uid, displayName: user.displayName /*update display name later*/).updateUserData( //function to assign some value (dummy here)
//         import "package:cloud_firestore/cloud_firestore.dart";

// class DatabaseService{

//   final String uid;
//   final String displayName;
//   DatabaseService({this.uid, this.displayName});

//   //USER COLLECTION
//   final CollectionReference dbUser = FirebaseFirestore.instance.collection('users');

//   Future updateUserData() async{
//     return await dbUser.doc(uid).set({
      
//     }
//     );
//   }

        // }
        // );
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