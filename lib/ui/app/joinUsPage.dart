import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';


class JoinUs extends StatelessWidget {

 @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(12,0,0,0),
              child: 
              IconButton(
                      icon: new Icon(Feather.arrow_left),
                      onPressed: () => Navigator.pop(context),
              ),
            ),
        ),
        title: Text('Gabung dengan Kami',
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Text('Kamu punya restoran?', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                Text('Berminat untuk pakai service packaging', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(' dari PackMe?', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 25),
                Container(
                  color: HexColor('#FF8787'),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,0,25,0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Center(child: Text('Kualitas plastik terbaik, hasil recycle sehingga harga murah',  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400))),
                        
                      ]
                    ),
                  )
                ),
                Container(
                  color: HexColor('#43D1A5'),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,0,25,0),
                    child: Center(child: Text('Ramah lingkungan, karena pack dari kami dapat digunakan sampai 10x setelah disterilisasi sehingga dapat mengurangi sampah plastik',  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400))),
                  ),
                ),
                Container(
                  color: HexColor('#ECFBF4'),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,0,25,0),
                    child: Center(child: Text('Menarik konsumen karena dari peminjaman pack kami, konsumen akan mendapat uang hadiah',  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400))),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.fromLTRB(10,0,10,0),
                  child: Column(
                    children: [
                      Text('Punya pertanyaan? Mau daftar sekarang?', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400)),
                      Text('Tekan tombol di bawah!', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 190,
                  child: RaisedButton(
                    color: HexColor('#FF8787'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: (){},
                    child: Text('Daftar', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ],
      )
    );
  }
}