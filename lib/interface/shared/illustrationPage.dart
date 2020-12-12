import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String description;
  final String picturePath;
  final String button1;
  final String button2;
  final Function button1Tap;
  final Function button2Tap;

  IllustrationPage(
      {@required this.title,
      @required this.description,
      @required this.picturePath,
      @required this.button1,
      @required this.button1Tap,
      this.button2,
      this.button2Tap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            width: MediaQuery.of(context).size.height * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(image: NetworkImage(''))),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Text(title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: HexColor('#030835'),
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center),
          Text(description,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: HexColor('#030835'),
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Container(
              width: MediaQuery.of(context).size.height * 0.3,
              height: MediaQuery.of(context).size.height * 0.075,
              child: RaisedButton(
                elevation: 0,
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(button1,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: HexColor('#FFFFFF'),
                        fontWeight: FontWeight.w600
                      )),
                ),
                onPressed: button1Tap,
              )),
          (button2 == null)
              ? SizedBox()
              : Container(
                  width: MediaQuery.of(context).size.height * 0.4,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(button2,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: HexColor('#030835'),
                          )),
                    ),
                    onPressed: button1Tap,
                  ))
        ],
    ));
  }
}
