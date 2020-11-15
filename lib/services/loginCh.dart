//EQUAL TO AUTH.DART

import 'package:flutter/material.dart';
import 'package:pack_me/ui/authentication/landing.dart';
// ignore: unused_import
import 'package:pack_me/ui/authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pack_me/ui/models/user.dart';

class LoginChecker extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    
    //SAMPLE ROUTING
    return Landing();

    //sign in (email)
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
}