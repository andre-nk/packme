import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pack_me_alpha/interface/app/rentConfirmationPage.dart';
import 'package:pack_me_alpha/interface/app/returnConfirmationPage.dart';
import 'package:pack_me_alpha/interface/app/returnPageCounter.dart';
import 'package:pack_me_alpha/interface/app/returnPageDriver.dart';
import 'package:pack_me_alpha/interface/shared/columnBuilder.dart';
import 'package:pack_me_alpha/interface/shared/pages.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:pack_me_alpha/models/zephyrnaut_icons.dart';
import 'package:page_transition/page_transition.dart';

class ReturnCounterOnBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        GeneralPage(
          title: 'Metode Counter',
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.815,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.675,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: HexColor('#ECFBF4'),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.09,
                right: MediaQuery.of(context).size.width * 0.225,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: FittedBox(
                    child: FloatingActionButton(
                      elevation: 5,
                      heroTag: "case0A",
                      onPressed: () async {
                        // outputCode = await scanner.scan();
                        //URLLauncher to API based on outputCode string
                        Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: ReturnConfirmationPage(transaction: Transaction()),
                        ));
                      },
                      child: Icon(Zephyrnaut.qrMark, size: 20),
                      backgroundColor: HexColor('#FF8787'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.09,
                left: MediaQuery.of(context).size.width * 0.225,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: FittedBox(
                    child: FloatingActionButton(
                      elevation: 5,
                      heroTag: "case0B",
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                        child: Icon(Octicons.file_binary),
                      ),
                      backgroundColor: HexColor('#43D1A5'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Daftar Pack yang Dipinjam',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30,0,30,0),
                          child: ColumnBuilder(
                              itemBuilder: (context, index) {
                                if ((index.isEven || index == 0)) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('a')
                                        // Text(
                                        //     transactionPackTypeSample[
                                        //             index]
                                        //         .toString(),
                                        //     style: GoogleFonts.poppins(
                                        //         fontWeight:
                                        //             FontWeight.w600)),
                                        // Text('x' +
                                        //     transactionPackAmountSample[
                                        //             index]
                                        //         .toString()),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('a')
                                        // Text(
                                        //     transactionPackTypeSample[
                                        //             index]
                                        //         .toString(),
                                        //     style: GoogleFonts.poppins(
                                        //         fontWeight:
                                        //             FontWeight.w600)),
                                        // Text('x' +
                                        //     transactionPackAmountSample[
                                        //             index]
                                        //         .toString()),
                                      ],
                                    ),
                                  );
                                }
                              },
                              itemCount: 9),
                        ),
                        
                      ]),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
