import 'package:equatable/equatable.dart';
import 'package:pack_me_alpha/models/packDetail.dart';

// ignore: must_be_immutable
class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String password;
  final String phoneNumber;
  final String picturePath;
  final String personalQR;
  int credit;
  final List<PackDetail> packAmount;
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
      this.pickupDate,
      this.packAmount});

  @override
  List<Object> get props =>
      [id, name, email, address, password, phoneNumber, picturePath, personalQR, credit, pickupDate, packAmount];
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
  List<PackDetail> packAmount,
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
    pickupDate: pickupDate,
    packAmount: packAmount
  );
}

User sampleUser = User(
    id: 1,
    name: 'Andreas Kwik',
    address: 'Jalan Ahmad Yani, no. 76, Wonosobo, Wonosobo Barat, 56311',
    password: '23Januari2004',
    phoneNumber: '082243010141',
    picturePath: 'https://i.ibb.co/JxqPxjd/profile-p.png',
    personalQR:  'https://api.qrserver.com/v1/create-qr-code/?data=pack-me-user-1&amp;size=500x500',
    email: 'andreasnotokusumo23@gmail.com',
    credit: 34000,
    pickupDate: '20',
    packAmount: [
      
    ], //TOTAL PACK FROM ALL ACTIVE TRANSACTION (HAVEN'T BEEN RETURNED) //EMPTY IF ALL PACKS ARE ALREADY RETURNED
);
