
import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService{

  final String uid;
  final String email;
  final String password;
  final String userName;
  final String phoneNumber;
  final int credit = 0;
  DatabaseService({this.uid, this.email, this.password, this.userName, this.phoneNumber});

  //USER COLLECTION
  final CollectionReference dbUser = FirebaseFirestore.instance.collection('users');

  Future updateUserData() async{

      return await dbUser.doc(uid).set({
        "displayName" : userName,
        "phoneNumber" : phoneNumber,
        "email" : email,
        "currentCredit" : credit.toString(),
      }
    );
  }

  Stream<QuerySnapshot> get currentUserInfo {
    return dbUser.snapshots();
  }

  // Widget displayUserProfile(){

  //   print(this.userName);

  //   return Column(
  //     children: [
  //       SizedBox(height: 20),
  //       Text(, 
  //         style: TextStyle(
  //         fontWeight: FontWeight.w900, fontSize: 18
  //         ),
  //       ),
  //       Text(email ?? "userEmail", 
  //         style: TextStyle(
  //          fontWeight: FontWeight.w600, fontSize: 14
  //         ),
  //       ),
  //     ]
  //   );
  // }
}