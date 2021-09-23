part of "models.dart";

class UserModel extends Equatable{

  final String id;
  final String provider;
  final String name;
  final String email;
  final int balance;
  final bool isEmailVerified;
  final String? address;
  final String? profileURL;

  UserModel({
    required this.id,
    required this.provider,
    required this.name,
    required this.email,
    required this.isEmailVerified,
    this.profileURL,
    this.address,
    this.balance = 215000
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      isEmailVerified: json["isEmailVerified"] as bool,
      id: json["id"] as String,
      provider: json["provider"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      profileURL: (json["profileURL"] ?? "") as String,
      balance: (json["balance"] ?? 215000) as int,
      address: (json["address"] ?? "") as String
    );
  }

  Map<String, dynamic> toJson(UserModel instance){
    return {
      "id": instance.id,
      "name": instance.name,
      "email": instance.email,
      "profileURL": instance.profileURL,
      "balance": instance.balance,
      "provider": instance.provider,
      "address": instance.address,
      "isEmailVerified": instance.isEmailVerified
    };
  }

  @override
  List<Object?> get props => [isEmailVerified, id, provider, name, email, balance, profileURL, address];
}