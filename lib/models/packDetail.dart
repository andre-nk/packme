import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PackDetail extends Equatable{
  final int idPack;
  final String name;
  int quantity;

  PackDetail({this.idPack, this.name, this.quantity});

  @override
  List<Object> get props => [idPack, name, quantity];
}

PackDetail mediumGlass = PackDetail(
  idPack: 8,
  name: 'Medium Glass 500mL',
  quantity: 1,
);