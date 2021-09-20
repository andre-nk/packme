part of 'repositories.dart';

class UserDataRepository{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  
  Future<void> createUserData() async {
    try {
      return await firestore
      .collection('users')
      .doc(auth.currentUser!.uid)
      .set({
        'name': auth.currentUser!.displayName,
        'value': 0,
        'id': 'PM - ' + auth.currentUser!.uid
      });
    } catch (e) {
      throw e;
    }
  }
}