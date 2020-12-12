import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String password;
  final String phoneNumber;
  final String picturePath;
  final String personalQR;
  final int credit; 
  final String pickupDate;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.password,
      this.phoneNumber,
      this.picturePath,
      this.personalQR,
      this.credit,
      this.pickupDate});

  @override
  List<Object> get props =>
      [id, name, email, address, password, phoneNumber, picturePath];
}

User copyWith({
  int id,
  String name,
  String email,
  String address,
  String password,
  String phoneNumber,
  String picturePath,
  String personalQR,
  int credit,
  String pickupDate
}) {
  return User(
    id: id,
    name: name,
    email: email,
    address: address,
    password: password,
    phoneNumber: phoneNumber,
    picturePath: picturePath,
    credit: credit,
    pickupDate: pickupDate
  );
}

User sampleUser = User(
    id: 1,
    name: 'Andreas Notokusumo',
    address: 'Jalan Ahmad Yani, no. 76, Wonosobo, Wonosobo Barat, 56311',
    password: '23Januari2004',
    phoneNumber: '082243010141',
    picturePath: 'https://i.ibb.co/JxqPxjd/profile-p.png',
    personalQR:  'https://api.qrserver.com/v1/create-qr-code/?data=pack-me-user-1&amp;size=500x500',
    email: 'andreasnotokusumo23@gmail.com',
    credit: 34000,
    pickupDate: '20'
);
