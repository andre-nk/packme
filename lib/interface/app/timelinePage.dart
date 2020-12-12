import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pack_me_alpha/interface/shared/pages.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:timelines/timelines.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<Transaction> sourceList = mockTransaction;
  String colorChange = '43D1A5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        GeneralPage(title: 'Timeline'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Column(children: [
          FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                color: HexColor('#43D1A5'),
              ),
              builder: TimelineTileBuilder.connectedFromStyle(
                connectionDirection: ConnectionDirection.after,
                connectorStyleBuilder: (context, index) {
                  if ((sourceList[index].status ==
                      TransactionStatus.in_progress)) {
                    return ConnectorStyle.dashedLine;
                  } else if ((sourceList[index].status ==
                      TransactionStatus.pending)) {
                    return ConnectorStyle.dashedLine;
                  } else {
                    return ConnectorStyle.solidLine;
                  }
                },
                contentsAlign: ContentsAlign.basic,
                oppositeContentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 20, 50),
                  child: Text(sourceList[index].dateTime.toString()),
                ),
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(10, 35, 0, 40),
                  child: GestureDetector(
                      child: Card(
                          color: HexColor('#' + colorChange),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(sourceList[index]
                                .type
                                .toString()
                                .substring(16,
                                    sourceList[index].type.toString().length)),
                          )),
                      onTap: () => showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(sourceList[index].provider,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            Text(
                                                sourceList[index]
                                                    .providerLocation,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            Text(
                                                (sourceList[index].type == TransactionType.Bonus)
                                                    ? NumberFormat.currency(
                                                            symbol: 'IDR',
                                                            decimalDigits: 0,
                                                            locale: 'id-ID')
                                                        .format(sourceList[index].total)
                                                    : (sourceList[index].type ==
                                                            TransactionType
                                                                .Penarikan)
                                                        ? '-' +
                                                            NumberFormat.currency(
                                                                    symbol:
                                                                        'IDR',
                                                                    decimalDigits:
                                                                        0,
                                                                    locale:
                                                                        'id-ID')
                                                                .format(sourceList[index].total)
                                                        : (sourceList[index].type ==
                                                                TransactionType
                                                                    .Peminjaman)
                                                            ? sourceList[index].total.toString() +
                                                                ' pack'
                                                            : (sourceList[index].type ==
                                                                    TransactionType
                                                                        .Pengembalian)
                                                                ? '-' +
                                                                    sourceList[index].total
                                                                        .toString() +
                                                                    ' pack'
                                                                : sourceList[index].total
                                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ])))))),
                ),
                indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                itemCount: sourceList.length,
              )),
        ])
      ],
    ));
  }
}
