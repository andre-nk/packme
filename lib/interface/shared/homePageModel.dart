import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me_alpha/interface/app/appInfoPage.dart';
import 'package:pack_me_alpha/interface/app/historyPage.dart';
import 'package:pack_me_alpha/interface/app/returnPage.dart';
import 'package:pack_me_alpha/interface/app/rentConfirmationPage.dart';
import 'package:pack_me_alpha/interface/app/withdrawPage.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:page_transition/page_transition.dart';
// ignore: unused_import
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:pack_me_alpha/models/zephyrnaut_icons.dart';
import 'package:intl/intl.dart';
//import 'package:pack_me/ui/app/qr_scan.dart';

Widget homeGenerator(int index, context, int creditValue, int packAmount) {
  Widget button1;
  Widget button2;
  Widget texts;
  // ignore: unused_local_variable
  String outputCode = "abcURL"; //SAMPLE, REMOVE WHEN API IS READY

  switch (index) {
    case 0:
      button1 = Positioned(
        top: MediaQuery.of(context).size.height * 0.08,
        right: MediaQuery.of(context).size.width * 0.25,
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
                          child: RentConfirmationPage(transaction: Transaction()),
                ));
              },
              child: Icon(Zephyrnaut.qrMark, size: 20),
              backgroundColor: HexColor('#FF8787'),
            ),
          ),
        ),
      );
      button2 = Positioned(
        top: MediaQuery.of(context).size.height * 0.08,
        left: MediaQuery.of(context).size.width * 0.25,
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
      );
      texts = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Scan QR',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                )),
            Text('di restoran / driver',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )),
            Text('untuk mulai meminjam',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )),
          ],
        ),
      );
      break;
    case 1:
      button1 = Center(
        heightFactor: 2.5,
        child: Positioned(
          // top: MediaQuery.of(context).size.height * 0.03,
          // left: MediaQuery.of(context).size.width * 0.41,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 5,
                heroTag: "case1",
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: WithdrawPage(transaction: Transaction(),)));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 9, 0),
                  child: Icon(Zephyrnaut.moneyMark, size: 17),
                ),
                backgroundColor: HexColor('#43D1A5'),
              ),
            ),
          ),
        ),
      );
      button2 = Text('');
      texts = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Text( NumberFormat.currency(
                        symbol: 'IDR', decimalDigits: 0, locale: 'id-ID')
                    .format(creditValue),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
            )),
            Text('total saldo yang dapat ditarik',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )),
            SizedBox(height: 8),
          ],
        ),
      );
      break;
    case 2:
      button1 = Center(
        heightFactor: 2.5,
        child: Positioned(
          // top: MediaQuery.of(context).size.height * 0.09,
          // left: MediaQuery.of(context).size.width * 0.41,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 5,
                heroTag: "case2",
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: ReturnMethod()));
                },
                child: Icon(Feather.box),
                backgroundColor: HexColor('#FF8787'),
              ),
            ),
          ),
        ),
      );
      button2 = Text('');
      texts = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Text( packAmount.toString() + ' pack(s)',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
            )),
            Text('yang dapat dikembalikan',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )),
            SizedBox(height: 8),
          ],
        ),
      );
      break;
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: HexColor('#ECFBF4'),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
              ),
            ),
            button1,
            button2,
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.055,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 240, 0),
                            child: IconButton(
                                onPressed: () => {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: HistoryPage()))
                                    },
                                icon: Icon(LineIcons.clock_o, size: 30)),
                          ),
                          IconButton(
                            icon: Icon(LineIcons.question_circle, size: 30),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: AppInfo()))
                            },
                          ),
                        ],
                      ),
                      texts,
                    ]),
              ),
            )
          ],
        ),
      )
    ],
  );
}
