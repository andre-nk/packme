
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:pack_me/ui/models/userProfileModel.dart';
class DatabaseService{

  //initialize datas
  final String uid;
  final String email;
  final String password;
  final String userName;
  final String phoneNumber;
  final String userQR;
  final String userAddress;
  final int credit;
  DatabaseService({this.uid, this.email, this.password, this.userName, this.phoneNumber, this.userQR, this.userAddress, this.credit});

  //USER COLLECTION
  final CollectionReference dbUser = FirebaseFirestore.instance.collection('users');

  // ignore: non_constant_identifier_names
  Future updateUserData(String uid, String userAddress, String userQR, String password, String userName, String phoneNumber, String email) async{
      return await dbUser.doc(uid).set({
        "uid" : uid,
        "address" : userAddress,
        "userQR" : userQR,
        "password" : password,
        "displayName" : userName,
        "phoneNumber" : phoneNumber,
        "email" : email,
        "currentCredit" : credit.toString(),
      }
    );
  }

  //FOR USER PROFILE IN DRAWER
  Stream<QuerySnapshot> get currentUserInfo {
    return dbUser.snapshots();
  }

  //METHOD #1 
  List<UserProfileModel> _userProfileModelSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return UserProfileModel(
        uid: doc.data()['uid'],
        email: doc.data()['email'],
        phoneNumber: doc.data()['phoneNumber'],
        password: doc.data()['password'],
        userAddress: doc.data()['address'],
        userQR: doc.data()['userQR'],
        userName: doc.data()['displayName'],
        credit: doc.data()['currentCredit']
      );
    }).toList();
  }

  Stream<List<UserProfileModel>> get userProfile{
    return dbUser.snapshots().map(_userProfileModelSnapshot);
  }

}