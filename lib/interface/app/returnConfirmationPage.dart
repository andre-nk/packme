import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:pack_me_alpha/interface/app/homePage.dart';
import 'package:pack_me_alpha/interface/shared/columnBuilder.dart';
import 'package:pack_me_alpha/interface/shared/illustrationPage.dart';
import 'package:pack_me_alpha/models/user.dart';
import 'package:pack_me_alpha/cubit/transaction_cubit.dart';
import 'package:pack_me_alpha/cubit/user_cubit.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnConfirmationPage extends StatefulWidget {
  final Transaction transaction;

  ReturnConfirmationPage({this.transaction});
  @override
  _ReturnConfirmationPageState createState() => _ReturnConfirmationPageState();
}

class _ReturnConfirmationPageState extends State<ReturnConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    final User user = (context.watch<UserCubit>().state as UserLoaded).user;

    int totalRent = 12;
    int estimateBonus = 25000;
    String providerSample = 'Pack Me Ambarrukmo Plaza';
    String providerLocationSample = 'Jalan Magelang, KM 2';

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
                                        print("clicked");
                                        // setState(() {
                                        //   isLoading = true;
                                        // });
                                        print(widget.transaction);
                                        bool result = await context
                                            .read<TransactionCubit>()
                                            .createTransaction(
                                                widget.transaction.copyWith(
                                                    user: user,
                                                    dateTime: DateTime.now()
                                                        .toString(),
                                                    total: totalRent,
                                                    provider: providerSample,
                                                    providerLocation:
                                                        providerLocationSample,
                                                    packDetail:
                                                        transactionPackSample,
                                                    type: TransactionType
                                                        .Pengembalian,
                                                    status: TransactionStatus
                                                        .completed //WAIT FOR API 2 SIDE WRITED => COMPLETED
                                                    ));
                                        // bool result = false;
                                        if (result == true) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Scaffold(
                                                          body:
                                                              IllustrationPage(
                                                                  title:
                                                                      'Woohoo!\nPeminjaman berhasil!',
                                                                  description:
                                                                      'Simpan dan kembalikan pack kami sesuai jadwal untuk dapat uang bonus kamu!',
                                                                  picturePath:
                                                                      '',
                                                                  button1:
                                                                      'Kembali ke Beranda',
                                                                  button1Tap:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushAndRemoveUntil(
                                                                      MaterialPageRoute(
                                                                          builder: (BuildContext context) =>
                                                                              HomePage()),
                                                                      ModalRoute
                                                                          .withName(
                                                                              '/'),
                                                                    );
                                                                  }),
                                                        )),
                                            ModalRoute.withName('/'),
                                          );
                                        } else {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    Scaffold(
                                                      body: IllustrationPage(
                                                          title:
                                                              'Maaf!\nPengembalian gagal',
                                                          description:
                                                              'Silahkan ulangi pengembalian dengan\n menekan tombol di bawah',
                                                          picturePath: '',
                                                          button1:
                                                              'Ulangi pengembalian',
                                                          button1Tap: () {
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                    )),
                                          );
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
