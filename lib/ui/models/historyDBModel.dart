import 'package:pack_me/ui/models/userModel.dart';

class HistoryModel extends Pengguna{

  final historyModel = Pengguna();

  final String amount;
  final String type;
  final String provider;
  final String date;
  HistoryModel({this.amount, this.type, this.provider, this.date});
}