import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:pack_me_alpha/interface/shared/appInfoTile.dart';
// import 'package:provider/provider.dart';

class AppInfoDB extends StatefulWidget {
  @override
  _AppInfoDBState createState() => _AppInfoDBState();
}

class _AppInfoDBState extends State<AppInfoDB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
      )),
      child: ExpansionTile(
        expandedAlignment: Alignment.topLeft,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Text('Sample',
              style: GoogleFonts.poppins(
                color: HexColor('#030835'),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Column(
              children: [
                Text('Sample Lorem',
                    style: GoogleFonts.poppins(
                        color: HexColor('#030835'),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.65)),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );

    /*ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index){
        return AppInfoTile();
        // infoContainerReversed = infoContainer.reversed.toList();
      }
    );*/
  }
}
