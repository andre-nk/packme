import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pack_me_alpha/interface/shared/pages.dart';
import 'package:pack_me_alpha/interface/shared/profilePageTile.dart';
import 'package:pack_me_alpha/models/user.dart';
import 'package:pack_me_alpha/models/zephyrnaut_icons.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userEmail;
  String userName;
  String userPhone;
  String userPassword;
  String userAddress;
  String userQR;
  String userUID;
  String oldPass;
  String oldPassMatcher;
  String profilePic;

  final User user = sampleUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        GeneralPage(title: ''),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Stack(children: [
                Positioned(
                  top: MediaQuery.of(context).size.width * -0.02,
                  left: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: GestureDetector(
                    child: (user.picturePath != null)
                        ? Container(
                            decoration: new BoxDecoration(
                              color: Colors.cyan,
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.contain,
                                image: new NetworkImage(user.picturePath,
                                    scale: 0.5),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.cyan,
                          ),
                    onTap: () {
                      // uploadImage(userUID);
                    },
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.52,
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.075,
                    child: ClipOval(
                      child: Material(
                        color: HexColor('#B9EEDC'), // button color
                        child: InkWell(
                          splashColor: Colors.red, // inkwell color
                          child: Container(
                              width: 20,
                              height: 20,
                              child: Icon(Feather.edit_2, size: 14)),
                          onTap: () {},
                        ),
                      ),
                    )),
              ]),
            ),
            ProfilePageTile(
              userSource: user,
              type: 'Nama',
            ),
            ProfilePageTile(
              userSource: user,
              type: 'Alamat',
            ),
            ProfilePageTile(
              userSource: user,
              type: 'Nomor Telepon',
            ),
             ProfilePageTile(
              userSource: user,
              type: 'Password',
            ),
            ProfilePageTile(
              userSource: user,
              type: 'QR Code Personal',
            ),
            Container(
              height: 65,
              decoration: new BoxDecoration(
                  border: new Border(
                bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 4, 4, 0),
                child: ListTile(
                  tileColor: HexColor('#FFFFFF'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Icon(Feather.trash, color: HexColor('#FB4040')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hapus akun',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#FB4040'),
                          )),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              content: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Apakah Anda yakin mau hapus akun ini?',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015),
                                      Text(
                                        'Semua dana kredit dan peminjaman Anda akan terhapus',
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: RaisedButton(
                                                child: Text('Ya',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                color: HexColor('#FF8787'),
                                                onPressed: () async {
                                                  // User _auth =
                                                  //     FirebaseAuth
                                                  //         .instance
                                                  //         .currentUser;
                                                  // _auth.delete();
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                45.0))),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: RaisedButton(
                                              child: Text('Tidak',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              color: HexColor('#ECFBF4'),
                                              onPressed: () async {
                                                // User _auth =
                                                //     FirebaseAuth
                                                //         .instance
                                                //         .currentUser;
                                                // _auth.delete();
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              45.0))),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  },
                ),
              ),
            ),
            Container(
              height: 65,
              decoration: new BoxDecoration(
                  border: new Border(
                bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 4, 4, 0),
                child: ListTile(
                  tileColor: HexColor('#FFFFFF'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Icon(Feather.log_out, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Log out',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}