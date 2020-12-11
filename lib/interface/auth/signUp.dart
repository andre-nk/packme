import 'package:flutter/material.dart';
// import 'package:pack_me/ui/app/userHome.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_icons/flutter_icons.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pack_me/services/loginChecker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pack_me_alpha/models/loader.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _textDecider(String error) {
    if (error == '') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Text(
              'Masuk ke akun Anda  ',
              style: TextStyle(
                  color: HexColor('#030835'),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/signin', (Route<dynamic> route) => false);
            },
            height: 14,
            minWidth: 14,
            padding: EdgeInsets.all(0),
          ),
          Text(
            'atau  ',
            style: TextStyle(
                color: HexColor('#030835'),
                fontSize: 14.0,
                fontWeight: FontWeight.w200),
          ),
          Text(
            'butuh bantuan?',
            style: TextStyle(
                color: HexColor('#030835'),
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      return Text(
        error,
        style: TextStyle(color: Colors.red, fontSize: 14.0),
      );
    }
  }

  // final LoginChecker serviceAuth = LoginChecker();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String userName = '';
  String error = '';
  dynamic phoneNumber = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loader()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 120,
                            right: -70,
                            child: Container(
                                height: 320,
                                width: 320,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).accentColor,
                                ))),
                        Positioned(
                            top: 70,
                            right: 140,
                            child: Container(
                                height: 135,
                                width: 135,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ))),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.12,
                            left: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daftar',
                                  style: GoogleFonts.poppins(
                                      color: HexColor('#030835'),
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'akun baru Anda',
                                  style: GoogleFonts.poppins(
                                      color: HexColor('#030835'),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'dan mulai meminjam!',
                                  style: GoogleFonts.poppins(
                                      color: HexColor('#030835'),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
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
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.015,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.97,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Form(
                                            key: _formKey,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 5, 20, 5),
                                                  decoration: BoxDecoration(
                                                      color: HexColor(
                                                          '#ECFBF4'), //#ECFBF4
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(
                                                              67,
                                                              209,
                                                              165,
                                                              0.1),
                                                          spreadRadius: 5,
                                                          blurRadius: 50,
                                                        )
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                "Nama lengkap",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontSize:
                                                                        18)),
                                                        validator: (val) => val
                                                                .isEmpty
                                                            ? 'Masukkan nama yang benar'
                                                            : null,
                                                        onChanged: (val) {
                                                          setState(() =>
                                                              userName = val);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      IntlPhoneField(
                                                        decoration: InputDecoration(
                                                            labelText:
                                                                'Phone Number',
                                                            labelStyle: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontSize:
                                                                        18),
                                                            border: InputBorder
                                                                .none),
                                                        initialCountryCode:
                                                            'ID',
                                                        onChanged: (phone) {
                                                          setState(() =>
                                                              phoneNumber = phone
                                                                  .number
                                                                  .toString());
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextFormField(
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText: "E-mail",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontSize:
                                                                        18)),
                                                        validator: (val) => val
                                                                .isEmpty
                                                            ? 'Enter an email'
                                                            : null,
                                                        onChanged: (val) {
                                                          setState(() =>
                                                              email = val);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextFormField(
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                "Password",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontSize:
                                                                        18)),
                                                        obscureText: true,
                                                        validator: (val) => val
                                                                    .length <
                                                                6
                                                            ? 'Enter a password 6+ chars long'
                                                            : null,
                                                        onChanged: (val) {
                                                          setState(() =>
                                                              password = val);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                Container(
                                                  height: 70,
                                                  child: FittedBox(
                                                    child: FloatingActionButton(
                                                      elevation: 5,
                                                      heroTag: "register",
                                                      onPressed: () async {
                                                        // if (_formKey
                                                        //     .currentState
                                                        //     .validate()) {
                                                        //   setState(() {
                                                        //     loading = true;
                                                        //   });
                                                        //   dynamic result =
                                                        //       await serviceAuth
                                                        //           .registerWithEmailAndPassword(
                                                        //               email,
                                                        //               password,
                                                        //               userName,
                                                        //               phoneNumber);
                                                        //   if (result == null) {
                                                        //     setState(() {
                                                        //       loading = false;
                                                        //       error =
                                                        //           'Could not sign in with those credentials';
                                                        //     });
                                                        //   }
                                                        // }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 5, 0),
                                                        child: Icon(
                                                            Feather.log_in,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      backgroundColor:
                                                          HexColor('#43D1A5'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                ),
                                                SizedBox(
                                                  child: _textDecider(error),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
