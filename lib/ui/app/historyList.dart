import 'package:flutter/material.dart';
import 'package:pack_me/ui/models/historyTile.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/historyDBModel.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {

    final historyList = Provider.of<List<HistoryModel>>(context); 
    print(historyList);

    return ListView.builder(
      itemCount: historyList.length,
      itemBuilder: (context, index){
        return HistoryTile(history: historyList[index]);
      }
    );
  }
}