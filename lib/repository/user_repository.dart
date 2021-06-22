part of 'repositories.dart';

abstract class UserRepository{
  Future<UserModel> getUserData();
  Future<void> createUserData();
}

class UserDataRepository implements UserRepository{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> createUserData() async {
    return await firestore
    .collection('users')
    .doc(auth.currentUser!.uid)
    .set({
      'name': auth.currentUser!.displayName,
      'value': 0,
      'id': 'PM - ' + auth.currentUser!.uid
    });
  }

  @override
  Future<UserModel> getUserData() async {
    UserModel user = UserModel(uid: auth.currentUser!.uid);

    firestore
    .collection('users')
    .doc(auth.currentUser!.uid)
    .snapshots()
    .map((event){
      user = UserModel(
        uid: event.data()!['name'],
        value: event.data()!['value'],
        id: event.data()!['code']
      );
    });

    return user;
  }
}