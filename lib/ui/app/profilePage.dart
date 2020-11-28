import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(12,25,0,0),
              child: 
              IconButton(
                      icon: new Icon(Feather.arrow_left),
                      onPressed: () => Navigator.pop(context),
              ),
            ),
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(  
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    children:[
                      Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width * 0.415,
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(''),
                          backgroundColor: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.53,
                        height: MediaQuery.of(context).size.height * 0.042,
                        width: MediaQuery.of(context).size.width * 0.07,
                        child: ClipOval(
                          child: Material(
                            color: HexColor('#B9EEDC'), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: Container(width: 20, height: 20, child: Icon(Feather.edit_2, size: 14)),
                              onTap: () {},
                            ),
                          ),
                        )                      ),
                    ]
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        top: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nama',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          Text('Lim Yoona',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                            )
                          ),
                        ],
                      ),  
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('E-mail',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          Text('yoonalim64@gmail.com', //IF EMAIL > X LETTER => CUT WITH ... 
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                            )
                          ),
                        ],
                      ),  
                    ),
                  ),
                ),
                 Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('No. Telepon',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          Text('(+62)82243010141',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                            )
                          ),
                        ],
                      ),  
                    ),
                  ),
                ),
                 Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Password',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          Icon(Feather.chevron_right, color: HexColor('#030835')),
                        ],
                      ),  
                    ),
                  ),
                ),
                 Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Alamat',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          Icon(Feather.chevron_right, color: HexColor('#030835')),
                        ],
                      ),  
                    ),
                  ),
                ),
                 Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('QR Code',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          Icon(Feather.chevron_right, color: HexColor('#030835')),
                        ],
                      ),  
                    ),
                  ),
                ),
                 Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hapus akun',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ],
                      ),  
                    ),
                  ),
                ),
                 Container(
                  height: 65,
                  decoration: new BoxDecoration(
                      border: new Border(
                        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2,4,4,0),
                    child: ListTile(
                      tileColor: HexColor('#FFFFFF'),
                      leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: Icon(Feather.settings, color: HexColor('#030835')),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Log out',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ],
                      ),  
                    ),
                  ),
                )  
              ],
            )
          )
        ],
      )
    );
  }
}