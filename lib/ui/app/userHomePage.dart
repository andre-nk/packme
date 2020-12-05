import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/services/loginChecker.dart';
import 'package:pack_me/services/database.dart';
import 'package:pack_me/ui/app/appInfoPage.dart';
import 'package:pack_me/ui/app/joinUsPage.dart';
import 'package:pack_me/ui/app/profilePage.dart';
import 'package:pack_me/ui/app/settingsPage.dart';
import 'package:pack_me/ui/app/userInfoHomeDB.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'historyPage.dart';
import 'package:pack_me/ui/models/homeModel.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:pack_me/ui/models/userModel.dart';
//THEMES
class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  final LoginChecker _auth = LoginChecker();
  final currentCredit = WithdrawInfo();
  final packAmount = PackInfo();

  // ignore: unused_field
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  

  @override
  Widget build(BuildContext context) {

    final userProfileData = Provider.of<Pengguna>(context);
    // final packAmount2 = Provider.of<OrderModel>(context);

      return StreamProvider<List<UserProfileModel>>.value(
        value: DatabaseService().userProfile,
        child: Scaffold(
        backgroundColor: Colors.white,
        //DRAWER
        drawer: new Drawer(
          child: Container(
            color: HexColor('#CDF0E0'),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    color: HexColor('#CDF0E0'),
                    height: MediaQuery.of(context).size.height * 0.32,
                    child: DrawerHeader(
                      child: Center(
                        //NODE CALLER
                        child: UserProfile(),
                      ),
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,5),
                    child: Icon(Feather.user, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Profil',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ProfilePage() ));
                  },      
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,5),
                    child: Icon(Feather.clock, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Riwayat',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HistoryPage()));
                  },     
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,5),
                    child: Icon(Feather.users, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gabung kami',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: JoinUs() ));
                  },      
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,5),
                    child: Icon(Feather.info, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Informasi',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: AppInfo()));
                  }      
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,5),
                    child: Icon(Feather.settings, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pengaturan',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ],
                  ),
                  onTap: (){
                     Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SettingsPage() ));
                  },     
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,5),
                    child: Icon(Feather.log_out, color: HexColor('#030835')),
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
                  onTap:() async {
                    await _auth.signOut();
                  },
                ),            
              ],
            ),
          ),
        ),

        //APPBAR
        appBar: new AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(18,16,0,0),
              child: Column(
                children: [
                  IconButton(
                      icon: new Icon(Feather.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ],
              ), 
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20,22,20,20),
              child: Container(
                child: RaisedButton(
                  onPressed: (){
                    //f changeType();
                  },
                  child: Text('Mode User'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: HexColor('#CDF0E0'),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0,0,18,0),
            //   child: GestureDetector(
            //     onTap: (){
            //       Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: ProfilePage() ));
            //     },
            //     child: CircleAvatar(
            //       backgroundImage: NetworkImage(''),
            //       backgroundColor: Colors.red,
            //     ),
            //   ),
            // )
          ],
        ),

        //BODY
        body: homeGenerator(_page, context, currentCredit, userProfileData.uid, packAmount),
  
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
            animationDuration: Duration(milliseconds: 300),
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