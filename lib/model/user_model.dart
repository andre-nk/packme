part of 'models.dart';
class UserModel extends Equatable{
  final String photoURL;
  final String uid;
  final String? id;
  final String? value;
  UserModel({required this.uid, required this.photoURL, this.id, this.value});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      photoURL: json["photoURL"] as String,
      uid: json["uid"] as String,
      id: json["id"] as String,
      value: json["value"] as String
    );
  }

  Map<String, dynamic> toJson(UserModel userModel){
    return {
      "photoURL": userModel.photoURL,
      "uid": userModel.uid,
      "id": userModel.id,
      "value": userModel.value
    };
  }

  @override
  List<Object?> get props => [uid, id, value];
}