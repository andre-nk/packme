import 'package:flutter/material.dart';
import 'package:pack_me_alpha/interface/shared/customTabBar.dart';
import 'package:pack_me_alpha/interface/shared/historyTile.dart';
import 'package:pack_me_alpha/interface/shared/illustrationPage.dart';
import 'package:pack_me_alpha/interface/shared/pages.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pack_me_alpha/cubit/transaction_cubit.dart';
import 'package:pack_me_alpha/models/loader.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
 


     
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.length == 0) {
          return Scaffold(
            body: ListView(children: [
              GeneralPage(title: 'Riwayat'),
              IllustrationPage(
                  title: 'Sepi ya!',
                  description: 'Pinjem pack kami yuk!\nBiar rame!',
                  picturePath: '',
                  button1: 'Pinjam pack',
                  button1Tap: () {})
            ]),
          );
        } else {
          return Scaffold(
            body: ListView(children: [
              GeneralPage(title: 'Riwayat'),
              CustomTabBar(
                titles: ['Menunggu Tindakan', 'Pending', 'Selesai'],
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0),
                child: Builder(
                  builder: (_){
                    List<Transaction> transactions = (selectedIndex == 0)
                      ? state.transaction.where((element) =>
                          element.status == TransactionStatus.in_progress).toList()
                      : (selectedIndex == 1)? 
                        state.transaction.where((element) =>
                          element.status == TransactionStatus.pending).toList()
                        :
                        state.transaction
                          .where((element) => element.status == TransactionStatus.completed)
                          .toList();
                    return Column(
                    children: transactions
                        .map((e) => HistoryTile(
                            provider: e.provider,
                            type: e.type,
                            total: e.total,
                            dateTime: e.dateTime))
                        .toList());
                  }
                )
              ),
            ]),
          );
        }
      } else {
        return Loader();
      }
    });
  }
}
