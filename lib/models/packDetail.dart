import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PackDetail extends Equatable{
  final int idPack;
  final String name;
  int quantity;
  final int packValue;
  final int totalValue;

  PackDetail({this.idPack, this.name, this.quantity, this.packValue, this.totalValue});

  @override
  List<Object> get props => [idPack, name, quantity, packValue, totalValue];
}

// List<PackDetail> packDetails = [
//   PackDetail(
//     idPack: 8,
//     name: 'Medium Glass 500mL',
//     quantity: 3,
//     packValue: 500,
//   ),
// ];