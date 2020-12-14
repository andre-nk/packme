import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:pack_me_alpha/interface/app/withdrawConfirmationPage.dart';
import 'package:pack_me_alpha/models/user.dart';
import 'package:pack_me_alpha/models/zephyrnaut_icons.dart';
import 'package:pack_me_alpha/cubit/user_cubit.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawPage extends StatefulWidget {
  final Transaction transaction;

  WithdrawPage({this.transaction});
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  String index = '0';
  String input;
  String output;
  String error = '';

  Widget formContent() {
    Widget outputWidget;
    switch (index) {
      case '0':
        setState(() {
          outputWidget = Text('Credit Card');
          output = 'Credit Card';
        });
        break;
      case '1':
        setState(() {
          outputWidget = Text('OVO');
          output = 'OVO';
        });

        break;
      case '2':
        setState(() {
          outputWidget = Text('Go-Pay');
          output = 'Go-Pay';
        });

        break;
      case '3':
        setState(() {
          outputWidget = Text('LinkAja!');
          output = 'LinkAja!';
        });

        break;
      case '4':
        setState(() {
          outputWidget = Text('DANA');
          output = 'DANA';
        });
        break;
    }
    return outputWidget;
  }

  @override
  Widget build(BuildContext context) {
    final User user = (context.watch<UserCubit>().state as UserLoaded).user;
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
          title: Text('Penarikan Dana',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: HexColor('#030835'))),
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: HexColor('#ECFBF4'),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  height: MediaQuery.of(context).size.height * 0.817,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Jumlah penarikan: ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text('Rp',
                                  style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 5, 0, 10),
                                    isDense: true,
                                    hintText: 'Masukkan nominal',
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.grey[500], fontSize: 24),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff43D1A5),
                                            width: 2.0))),
                                onChanged: (val) {
                                  setState(() => input = val);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                            'dari total saldo: ' +
                                NumberFormat.currency(
                                        decimalDigits: 0,
                                        symbol: 'IDR',
                                        locale: 'id-ID')
                                    .format(user.credit),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                            error,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.red
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  width: 2.0, color: HexColor('#B9EEDC')),
                              bottom: BorderSide(
                                  width: 2.0, color: HexColor('#B9EEDC')),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    child: Card(
                                        color: HexColor('#B9EEDC'),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Icon(Zephyrnaut.cardMark),
                                        )),
                                    onTap: () {
                                      setState(() {
                                        index = '0';
                                      });
                                    },
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025),
                                  GestureDetector(
                                    child: Card(
                                        color: HexColor('#B9EEDC'),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Icon(Zephyrnaut.cardMark),
                                        )),
                                    onTap: () {
                                      setState(() {
                                        index = '1';
                                      });
                                    },
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025),
                                  GestureDetector(
                                    child: Card(
                                        color: HexColor('#B9EEDC'),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Icon(Zephyrnaut.cardMark),
                                        )),
                                    onTap: () {
                                      setState(() {
                                        index = '2';
                                      });
                                    },
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025),
                                  GestureDetector(
                                    child: Card(
                                        color: HexColor('#B9EEDC'),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Icon(Zephyrnaut.cardMark),
                                        )),
                                    onTap: () {
                                      setState(() {
                                        index = '3';
                                      });
                                    },
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025),
                                  GestureDetector(
                                    child: Card(
                                        color: HexColor('#B9EEDC'),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: Icon(Zephyrnaut.cardMark),
                                        )),
                                    onTap: () {
                                      setState(() {
                                        index = '4';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        formContent(), //wait for midtrans
                        Center(
                          child: Container(
                            height: 50,
                            width: 190,
                            child: RaisedButton(
                              elevation: 0,
                              color: HexColor('#FF8787'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: () {
                                if (input != null) {
                                  setState((){
                                    error = '';
                                  });
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            WithdrawConfirmationPage(
                                              transaction: widget.transaction,
                                              inputPassed: int.parse(input),
                                              midtransMethod: output,
                                            )),
                                  );
                                }else{
                                  setState((){
                                    error = 'Masukkan nominal penarikan terlebih dahulu';
                                  });
                                }
                              },
                              child: Text('Lanjut',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
