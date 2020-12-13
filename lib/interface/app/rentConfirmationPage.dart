import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:pack_me_alpha/cubit/cubit.dart';
import 'package:pack_me_alpha/models/packDetail.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:pack_me_alpha/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pack_me_alpha/cubit/user_cubit.dart';
import 'package:pack_me_alpha/cubit/transaction_cubit.dart';

class ColumnBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;

  const ColumnBuilder({
    Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.mainAxisAlignment: MainAxisAlignment.start,
    this.mainAxisSize: MainAxisSize.max,
    this.crossAxisAlignment: CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection: VerticalDirection.down,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: new List.generate(
          this.itemCount, (index) => this.itemBuilder(context, index)).toList(),
    );
  }
}

class RentConfirmationPage extends StatefulWidget {
  final Transaction transaction;

  RentConfirmationPage({this.transaction});

  @override
  _RentConfirmationPageState createState() => _RentConfirmationPageState();
}

class _RentConfirmationPageState extends State<RentConfirmationPage> {
  String index = '1';
  bool isLoading = false;

  Widget formContent() {
    Widget output;
    switch (index) {
      case '0':
        output = Text('Credit Card');
        break;
      case '1':
        output = Text('OVO');
        break;
      case '2':
        output = Text('Go-Pay');
        break;
      case '3':
        output = Text('LinkAja!');
        break;
      case '4':
        output = Text('DANA');
        break;
    }
    return output;
  }

  String error = '';

  @override
  Widget build(BuildContext context) {

    //DATAS FOR AND FROM API
    // ignore: unused_local_variable
    final User user = (context.watch<UserCubit>().state as UserLoaded).user;
    List transactionPackTypeSample = [
      'Medium Box',
      'Mini Box',
      'Medium Glass',
      'Big Box',
      'XL Box',
    ];
    List transactionPackAmountSample = [4, 2, 2, 1, 1];
    List transactionPackSample = [
      'Medium Box',
      4,
      'Mini Box',
      2,
      'Medium Glass',
      2,
      'Big Box',
      1,
      'XL Box',
      1
    ];

    // List transactionListOnBoard = (context.watch<TransactionCubit>().state as TransactionLoaded).transaction;
    // for(var i = 0 ; i <= transactionListSample.length; i++ ){
    //   (context.watch<TransactionCubit>().state as TransactionLoaded).transaction[i].packDetail;
    // }
    int totalRent = 12;
    int estimateBonus = 25000;
    String providerSample = 'Solaria Ambarrukmo Plaza';
    String providerLocationSample = 'Jalan Magelang, KM 2';

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: IconButton(
              icon: new Icon(Feather.arrow_left),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text('',
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: HexColor('#030835'))),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.125,
                  child: Column(children: [
                    Text(providerSample,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        )),
                    Text(providerLocationSample,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ))
                  ])),
              flex: 4),
          Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor('#ECFBF4'),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                height: MediaQuery.of(context).size.height * 0.675,
                width: MediaQuery.of(context).size.width * 1,
                child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.04),
                    child: Stack(children: [
                      Column(
                        children: [
                          Center(
                            child: Text('Detail Peminjaman',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                )),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Positioned(
                            child: Expanded(
                              child: ListView(children: [
                                ColumnBuilder(
                                    itemBuilder: (context, index) {
                                      if ((index.isEven || index == 0)) {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  transactionPackTypeSample[
                                                          index]
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text('x' +
                                                  transactionPackAmountSample[
                                                          index]
                                                      .toString()),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  transactionPackTypeSample[
                                                          index]
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text('x' +
                                                  transactionPackAmountSample[
                                                          index]
                                                      .toString()),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    itemCount:
                                        (transactionPackTypeSample.length)),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total peminjaman',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16)),
                                    Text(totalRent.toString(),
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16)),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Perkiraan Bonus',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16)),
                                    Text(
                                        NumberFormat.currency(
                                                symbol: 'IDR',
                                                decimalDigits: 0,
                                                locale: 'id-ID')
                                            .format(estimateBonus),
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16)),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06),
                                Center(
                                  child: Container(
                                    height: 50,
                                    width: 190,
                                    child: RaisedButton(
                                      elevation: 0,
                                      color: HexColor('#FF8787'),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        bool result = await context
                                            .watch<TransactionCubit>()
                                            .createTransaction(
                                                widget.transaction.copyWith(
                                                    dateTime: DateTime.now()
                                                        .toString(),
                                                    total: totalRent,
                                                    provider: providerSample,
                                                    providerLocation:
                                                        providerLocationSample,
                                                    packDetail:
                                                        transactionPackSample,
                                                    type: TransactionType
                                                        .Peminjaman,
                                                    status: TransactionStatus
                                                        .completed //WAIT FOR API 2 SIDE WRITED => COMPLETED
                                                    ));
                                        if (result == true) {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/homepage', //SUCCESS PAGE
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else {
                                          setState(() {
                                            isLoading = false;
                                            error = 'Peminjaman gagal';
                                          });
                                        }
                                      },
                                      child: Text('Konfirmasi',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                0.06),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ])),
              )),
        ],
      ),
    );
  }
}
