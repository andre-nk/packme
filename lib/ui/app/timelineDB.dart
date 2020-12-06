import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/historyDBModel.dart';
import 'package:google_fonts/google_fonts.dart';

class TimelineDB extends StatefulWidget {
  @override
  _TimelineDBState createState() => _TimelineDBState();
}

class _TimelineDBState extends State<TimelineDB> {
  @override
  Widget build(BuildContext context) {
    final historyList = Provider.of<List<HistoryModel>>(context);

    List<dynamic> dateList = [];
    List<dynamic> typeList = [];
    List<String> locationList = [];
    List<String> amountList = [];

    historyList.forEach((element) {
      dateList.add(element.date);
      typeList.add(element.type);
      locationList.add(element.provider);
      amountList.add(element.amount);
    });

    // typeList.add('Pick-up');
    // typeList.add('Credited');
    // typeList.add('Withdraw');

    dateList.add('');
    dateList.add('');
    dateList.add('');

    String colorChange = '43D1A5';

    dynamic ternaryOps(index) {
      colorChange = 'FF8787';
      Text(dateList[index]);
    }

    return ListView(children: [
      FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            color: HexColor('#43D1A5'),
          ),
          builder: TimelineTileBuilder.connectedFromStyle(
            connectionDirection: ConnectionDirection.after,
            connectorStyleBuilder: (context, index) {
              return (index > typeList.length - 3)
                  ? ConnectorStyle.dashedLine
                  : ConnectorStyle.solidLine;
            },
            contentsAlign: ContentsAlign.basic,
            oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 20, 50),
                child: (dateList[index] == '')
                    ? ternaryOps(index)
                    : Text(dateList[index])),
            contentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(10, 35, 0, 40),
              child: GestureDetector(
                  child: Card(
                      color: HexColor('#' + colorChange),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(typeList[index]),
                      )),
                  onTap: () => showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          content: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(typeList[index],
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        Text(locationList[index],
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        Text(amountList[index],
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ])))))),
            ),
            indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
            itemCount: typeList.length,
          )),
    ]);
  }
}
