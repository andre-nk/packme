
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:pack_me/ui/models/historyDBModel.dart';
import 'package:pack_me/ui/models/infoDBModel.dart';
class DatabaseService{
  //initialize datas
  User alpha = FirebaseAuth.instance.currentUser;
  String uid;
  final String email;
  final String password;
  final String userName;
  final String phoneNumber;
  final String userQR;
  final String userAddress;
  final int credit;
  DocumentReference reference;
  DatabaseService({this.uid,this.email, this.password, this.userName, this.phoneNumber, this.userQR, this.userAddress, this.credit});

  //USER COLLECTION
  final CollectionReference dbUser = FirebaseFirestore.instance.collection('users');

  //FAQ COLLECTION
  final CollectionReference dbFAQ = FirebaseFirestore.instance.collection("app-info-faq");

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
        "amount": 0,
      }
    );
  }

  Future createUserOrder(String userID) async{ 
    final DocumentReference reference = FirebaseFirestore.instance.collection('users').doc(userID).collection('order').doc();
    return await reference.set({
      "amount" : 4,
      "lender": "Red Lotus Resto", //resto
      "borrower": userName,
      "Box A": 1,
      "Box B": 2,
      "Box A - Mini": 1,
    });
  }

  Future createUserHistory(String userID, String historyType, String location, String date, String amount) async{ 
    DocumentReference reference = FirebaseFirestore.instance.collection('users').doc(userID).collection('history').doc();
    return await reference.set({
      "amount" : amount,
      "provider": location, //resto
      "date": date,
      "type": historyType
    });
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
        credit: doc.data()['currentCredit'],
        amount: doc.data()['amount']
      );
    }).toList();
  }

  List<HistoryModel> _userHistory(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      
      return HistoryModel(
        amount: doc.data()['amount'],
        type: doc.data()['type'],
        provider: doc.data()['provider'],
        date: doc.data()['date']
      );
     
    }).toList();
  }

  List<InfoModel> _appInfoFAQ(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return InfoModel(
        description: doc.data()['description'],
        title: doc.data()['title']
      );
    }).toList();
  }
 
  Stream<List<UserProfileModel>> get userProfile{
    return dbUser.snapshots().map(_userProfileModelSnapshot);
  }

  Stream<List<HistoryModel>> get userHistory{
    return FirebaseFirestore.instance.collection('users').doc(alpha.uid).collection('history').snapshots().map(_userHistory);
  }
  

  Stream<List<InfoModel>> get appInfoFAQ{
    return dbFAQ.snapshots().map(_appInfoFAQ);
  }
  // String amount =  FirebaseFirestore.instance.collection('users').doc(userID).collection('order').doc();
}