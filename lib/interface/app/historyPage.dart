import 'package:flutter/material.dart';
import 'package:pack_me_alpha/interface/shared/customTabBar.dart';
import 'package:pack_me_alpha/interface/shared/historyTile.dart';
import 'package:pack_me_alpha/interface/shared/pages.dart';
import 'package:pack_me_alpha/models/transaction.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Transaction> inProgress = mockTransaction
      .where((element) =>
          element.status == TransactionStatus.in_progress ||
          element.status == TransactionStatus.pending)
      .toList();

  List<Transaction> completed = mockTransaction
      .where((element) => element.status == TransactionStatus.completed)
      .toList();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (inProgress.length == 0 && completed.length == 0) {
      return Scaffold(
        body: Column(children: [
          GeneralPage(title: 'Riwayat'),
        ]),
      );
    } else {
      return Scaffold(
        body: ListView(children: [
          GeneralPage(title: 'Riwayat'),
          CustomTabBar(
            titles: ['Dalam Proses', 'Selesai'],
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0),
            child: Column(
                children: (selectedIndex == 0 ? inProgress : completed)
                    .map((e) => HistoryTile(
                        provider: e.provider,
                        type: e.type,
                        total: e.total,
                        dateTime: e.dateTime))
                    .toList()),
          ),
        ]),
      );
    }
  }
}
