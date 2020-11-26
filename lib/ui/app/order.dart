import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:line_icons/line_icons.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/services/loginCh.dart';
import 'package:pack_me/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';
import 'history.dart';
import 'package:pack_me/ui/models/homeModel.dart';


class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {

  final LoginChecker _auth = LoginChecker();


  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<QuerySnapshot>.value(
        value: DatabaseService().currentUserInfo,
        child: Scaffold(
        backgroundColor: Colors.white,
        //DRAWER
        drawer: new Drawer(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: HexColor('#CDF0E0'),
                  height: 200,
                  child: DrawerHeader(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Image(image: NetworkImage('')),
                          ),
                          
                          Text('TBA', 
                            style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18
                            ),
                          ),
                          Text('TBA', 
                            style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              SizedBox(height: 8),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,5),
                  child: Icon(Feather.user),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Profil',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),
                onTap: (){
                  print('a');
                },      
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,5),
                  child: Icon(Feather.clock),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Riwayat',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HistoryPage()));
                },     
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,5),
                  child: Icon(Feather.moon),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Mode gelap',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),      
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,5),
                  child: Icon(Feather.users),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Gabung kami',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),      
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,5),
                  child: Icon(Feather.info),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Informasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),      
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,5),
                  child: Icon(Feather.settings),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pengaturan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),      
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,5),
                  child: Icon(Feather.log_out),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Log out',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),  
                onTap:() async {
                  await _auth.signOut();
                },
              ),            
            ],
          ),
        ),

        //APPBAR
        appBar: new AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(18,0,0,0),
              child: IconButton(
                  icon: new Icon(Feather.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
            ),
          ),
        ),

        //BODY 
        body: homeGenerator(_page, context),
      
        bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _page,
            height: 60.0,
            items: <Widget>[
              Icon(Icons.qr_code_rounded, size: 30, color: HexColor('#030835')),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,5,0),
                child: Icon(FontAwesomeIcons.moneyBillAlt, size: 25, color: HexColor('#030835')),
              ),
              Icon(Feather.box, size: 28, color: HexColor('#030835')),
            ],
            color: HexColor('#B9EEDC'),
            buttonBackgroundColor: HexColor('#ECFBF4'),
            backgroundColor: HexColor('#ECFBF4'),
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          )
      ),
    );
  }
}