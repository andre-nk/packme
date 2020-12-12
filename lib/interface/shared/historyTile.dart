import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:pack_me_alpha/models/user.dart';

class HistoryTile extends StatelessWidget {

  final int id;
  final String provider;
  final String providerLocation;
  final String dateTime;
  final int total;
  final List packDetail;
  final TransactionStatus status;
  final TransactionType type;
  final User user;

  HistoryTile(
      {this.id,
      this.provider,
      this.providerLocation,
      this.dateTime,
      this.total,
      this.type,
      this.packDetail,
      this.status,
      this.user});

  @override
  Widget build(BuildContext context) {

    String typeString = type.toString();
    typeString = typeString.substring(16,typeString.length);

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
                        Text(typeString,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            )),
                        Text(provider,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )),
                        Text(dateTime,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(total.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(height: 1.5, width: 500, color: HexColor('#C7F1E4')),
            ],
          ),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          color: HexColor('#FF8787'),
          icon: FlutterIcons.delete_outline_mco,
          onTap: () => {
            
          }
        ),
      ],
    );
  }
}