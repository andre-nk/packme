import 'package:flutter/material.dart';
import 'package:pack_me/ui/models/infoTileModel.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/infoDBModel.dart';

class InfoTileDB extends StatefulWidget {
  @override
  _InfoTileDBState createState() => _InfoTileDBState();
}

class _InfoTileDBState extends State<InfoTileDB> {
  @override
  Widget build(BuildContext context) {
    
    final infoTile = Provider.of<List<InfoModel>>(context);
    
    return ListView.builder(
      itemCount: infoTile.length,
      itemBuilder: (context, index){
        return InfoTileModel(infoList: infoTile[index]);
        // infoContainerReversed = infoContainer.reversed.toList();
      }
    );
  }
}