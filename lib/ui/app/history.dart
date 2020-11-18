import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [Text('Riwayat', style: GoogleFonts.poppins(
        //       fontSize: 24,
        //       fontWeight: FontWeight.w700,
        //       color: HexColor('#030835')
        //     )),
        //   ]
        // ),
        leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(12,0,0,0),
              child: 
              IconButton(
                      icon: new Icon(Feather.arrow_left),
                      onPressed: () => Navigator.pop(context),
              ),
            ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,26,153,0),
            child: Text('Riwayat', style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#030835')
            )),
          )
        ],
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                                    Text('Tarik Saldo (TBA)', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 16, 
                                      ),
                                    )),
                                    Text('OVO / Method', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400, fontSize: 14, 
                                      ),
                                    )),
                                    Text('11/11/2020 (Date)', style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400, fontSize: 14, 
                                      ),
                                    )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                  child: Text('-50.000 (saldo)', style: GoogleFonts.poppins(
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
              ),
              Slidable(
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
                                  Text('Tarik Saldo (TBA)', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 16, 
                                    ),
                                  )),
                                  Text('OVO / Method', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 14, 
                                    ),
                                  )),
                                  Text('11/11/2020 (Date)', style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 14, 
                                    ),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                child: Text('-50.000 (saldo)', style: GoogleFonts.poppins(
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
            ],
          ),
        ],
      )
    );
  }
}