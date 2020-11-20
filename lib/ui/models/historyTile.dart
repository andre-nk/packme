import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget buildListTileNormal(String transactionType, String transactionMethod, String date, int amount,  context) {
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  String amountString = amount.toString();
  String asu = amountString.substring(0,1);
  String asu2 = amountString.substring(1, amountString.length);
 
  transactionType.indexOf('minjam') > 0 || transactionType.indexOf('bali') > 0 ?
    amount > 0 ? 
      amountString = '+ ' + amountString + ' pack(s)'
    :
      amountString = amountString + ' pack(s)'
  : 
    amount > 0 ? 
      amountString = '+ ' + 'Rp' +  amountString
    :
      amountString = asu + ' Rp' + asu2;


  return Slidable(
  actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.20,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 12, 10, 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$transactionType', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16, 
                                    ),
                                  )),
                                  Text('$transactionMethod', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 14, 
                                    ),
                                  )),
                                  Text('$date', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 14, 
                                    ),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                child: Text('$amountString', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 16, 
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.5,
                          width: 500,
                          color: HexColor('#C7F1E4')
                        ),
                      ],
                    ),
                  ),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    color: HexColor('#FF8787'),
                    icon: FlutterIcons.delete_outline_mco,
                    onTap: () => _showSnackBar(context, 'Delete'),
                  ),
                ],           
  );
}

Widget buildListTileHead(String transactionType, String transactionMethod, String date, int amount,  context) {
  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  String amountString = amount.toString();
  String asu = amountString.substring(0,1);
  String asu2 = amountString.substring(1, amountString.length);
 
  transactionType.indexOf('Peminjaman') > 0 ||  transactionType.indexOf('Pengembalian') > 0 ?
    amount > 0 ? 
      amountString = '+ ' + amountString + 'pack(s)'
    :
      amountString = amountString + 'pack(s)'
  : 
    amount > 0 ? 
      amountString = '+ ' + 'Rp' +  amountString
    :
      amountString = asu + ' Rp' + asu2;


  return Padding(
                padding: const EdgeInsets.all(0),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.20,
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 1.5,
                            width: 500,
                            color: HexColor('#C7F1E4')
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$transactionType', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 16, 
                                      ),
                                    )),
                                    Text('$transactionMethod', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400, fontSize: 14, 
                                      ),
                                    )),
                                    Text('$date', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400, fontSize: 14, 
                                      ),
                                    )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                  child: Text('$amountString',  style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 16, 
                                        ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.5,
                            width: 500,
                            color: HexColor('#C7F1E4')
                          ),
                        ],
                      ),
                    ),
                  ),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      color: HexColor('#FF8787'),
                      icon: FlutterIcons.delete_outline_mco,
                      onTap: () => _showSnackBar(context, 'Delete'),
                    ),
                  ],
                ),
              );
}