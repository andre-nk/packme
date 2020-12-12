import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pack_me_alpha/models/user.dart';

class ProfilePageTile extends StatelessWidget {
  final User userSource;
  final String type;

  ProfilePageTile({this.userSource, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Icon(Feather.user, color: HexColor('#030835')),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(type,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              Text(
                  (type == 'Nama')
                      ? userSource.name
                      : (type == 'E-mail')
                          ? userSource.email
                          : (type == 'Password')
                              ? '>'
                              : (type == 'Nomor Telepon')
                                  ? userSource.phoneNumber
                                  : (type == 'Alamat')
                                      ? userSource.address.substring(0, 20) +
                                          '...'
                                      : (type == 'QR Code Personal')
                                          ? '>'
                                          : 'Data gagal dimuat',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w300)),
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
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Ganti $type',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Container(
                                decoration: BoxDecoration(
                                    color: HexColor('#ECFBF4'),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(67, 209, 165, 0.1),
                                        spreadRadius: 5,
                                        blurRadius: 50,
                                      )
                                    ]),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 15),
                                      isDense: true,
                                      border: InputBorder.none,
                                      hintText: userSource.name,
                                      hintStyle: GoogleFonts.poppins(
                                          color: Colors.grey[500],
                                          fontSize: 18)),
                                  validator: (val) => val.isEmpty
                                      ? 'Masukkan informasi yang baru'
                                      : null,
                                  onChanged: (val) {},
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: RaisedButton(
                                  child: Text('Ganti',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  color: HexColor('#FF8787'),
                                  onPressed: () async {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(45.0))),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
