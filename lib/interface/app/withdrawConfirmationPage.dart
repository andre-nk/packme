import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:pack_me_alpha/interface/app/homePage.dart';
import 'package:pack_me_alpha/interface/shared/illustrationPage.dart';
import 'package:pack_me_alpha/models/user.dart';
import 'package:pack_me_alpha/cubit/transaction_cubit.dart';
import 'package:pack_me_alpha/cubit/user_cubit.dart';
import 'package:pack_me_alpha/models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawConfirmationPage extends StatefulWidget {
  final Transaction transaction;
  final int inputPassed;
  final String midtransMethod;

  WithdrawConfirmationPage(
      {this.transaction, this.inputPassed, this.midtransMethod});
  @override
  _WithdrawConfirmationPageState createState() =>
      _WithdrawConfirmationPageState();
}

class _WithdrawConfirmationPageState extends State<WithdrawConfirmationPage> {
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
                        MediaQuery.of(context).size.height * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Jumlah penarikan: ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text('Rp',
                                  style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            Expanded(
                              child: Text(widget.inputPassed.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Container())),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Center(
                          child: Container(
                            height: 55,
                            width: 250,
                            child: RaisedButton(
                              elevation: 0,
                              color: HexColor('#FF8787'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: () async {
                                bool result = await context
                                    .read<TransactionCubit>()
                                    .createTransaction(widget.transaction.copyWith(
                                        dateTime: DateTime.now().toString(),
                                        total: widget.inputPassed,
                                        provider: widget.midtransMethod,
                                        user: user,
                                        type: TransactionType.Penarikan,
                                        status: TransactionStatus
                                            .completed //WAIT FOR API 2 SIDE WRITED => COMPLETED
                                        ));
                                if (result == true) {
                                  user.credit -= widget.inputPassed;
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Scaffold(
                                              body: IllustrationPage(
                                                  title:
                                                      'Woohoo!\nPenarikan dana berhasil!',
                                                  description:
                                                      'Jangan lupa pinjam pack kami lagi ya!',
                                                  picturePath: '',
                                                  button1: 'Kembali ke Beranda',
                                                  button1Tap: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              HomePage()),
                                                      ModalRoute.withName('/'),
                                                    );
                                                  }),
                                            )),
                                    ModalRoute.withName('/'),
                                  );
                                } else {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Scaffold(
                                              body: IllustrationPage(
                                                  title:
                                                      'Maaf!\nPenarikan gagal',
                                                  description:
                                                      'Silahkan ulangi penarikan dengan\n menekan tombol di bawah',
                                                  picturePath: '',
                                                  button1: 'Ulangi penarikan',
                                                  button1Tap: () {
                                                    Navigator.pop(context);
                                                  }),
                                            )),
                                  );
                                }
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //       builder: (BuildContext context) =>
                                //           Scaffold(
                                //             body: IllustrationPage(
                                //                 title:
                                //                     'Maaf!\nPeminjaman gagal',
                                //                 description:
                                //                     'Silahkan ulangi peminjaman dengan\n menekan tombol di bawah',
                                //                 picturePath: '',
                                //                 button1: 'Ulangi peminjaman',
                                //                 button1Tap: () {
                                //                   Navigator.pop(context);
                                //                 }),
                                //           )),
                                // );
                              },
                              child: Text('Konfirmasi Penarikan',
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
