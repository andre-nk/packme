import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:pack_me/services/database.dart';

class OrderDriverOnBoard extends StatefulWidget {
  @override
  _OrderDriverOnBoardState createState() => _OrderDriverOnBoardState();
}

class _OrderDriverOnBoardState extends State<OrderDriverOnBoard> {
  @override
  Widget build(BuildContext context) {

    String userAddress;

    final userProfileFullData = Provider.of<List<UserProfileModel>>(context);
    userProfileFullData.forEach((element) {
      //user avatar
      userAddress = element.userAddress;
    });

    print(userAddress);
    print('a');

    return StreamProvider<List<UserProfileModel>>.value(
          value: DatabaseService().userProfile,
          child: Scaffold(
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
            title: Text('Pengembalian',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#030835'))),
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFFECFBF4).withOpacity(0.3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                    ],
                  )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15.0),
                //       color: Color(0xFFECFBF4).withOpacity(0.3)),
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         height: MediaQuery.of(context).size.height * 0.3,
                //         width: MediaQuery.of(context).size.width * 0.9,
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(10.0),
                //           child: Image(
                //             fit: BoxFit.fitWidth,
                //             image: NetworkImage(
                //               'https://i.ibb.co/XJrP4D1/mostafa-meraji-X0y-Kd-R-F9r-M-unsplash.jpg',
                //             ),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         bottom: 0,
                //         child: Container(
                //             height: MediaQuery.of(context).size.height * 0.1,
                //             width: MediaQuery.of(context).size.width * 0.9,
                //             decoration: BoxDecoration(
                //                 color: Color(0xFF43D1A5).withOpacity(0.9),
                //                 borderRadius: BorderRadius.only(
                //                   bottomRight: Radius.circular(10),
                //                   bottomLeft: Radius.circular(10),
                //                 )),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                //                   child: Text('Drop-off ke Counter kami',
                //                       style: GoogleFonts.poppins(
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                           fontSize: 16)),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                //                   child: Text(
                //                       'Temukan counter terdekat kami dan kembalikan pack Anda',
                //                       style: GoogleFonts.poppins(
                //                           fontWeight: FontWeight.w400,
                //                           color: Colors.white,
                //                           fontSize: 10)),
                //                 ),
                //               ],
                //             )),
                //       ),
                //     ],
                //   ),
                // )
              ], 
            ),
          )),
    );
  }
}
