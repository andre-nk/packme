import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me_alpha/interface/app/appInfoPage.dart';
import 'package:pack_me_alpha/interface/app/historyPage.dart';
import 'package:pack_me_alpha/interface/app/profilePage.dart';
import 'package:pack_me_alpha/interface/app/settingPage.dart';
import 'package:pack_me_alpha/interface/app/timelinePage.dart';
import 'package:pack_me_alpha/interface/shared/homePageModel.dart';
import 'package:pack_me_alpha/models/user.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pack_me_alpha/models/zephyrnaut_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pack_me_alpha/cubit/user_cubit.dart';
import 'joinPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final User dataSource = sampleUser;

  @override
  Widget build(BuildContext context) {
    print(dataSource.picturePath);

    return Scaffold(
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
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.cyan,
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.contain,
                              image: new NetworkImage(dataSource.picturePath,
                                  scale: 0.5),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0),
                        Text(
                          (context.watch<UserCubit>().state as UserLoaded)
                              .user
                              .name,
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 18),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0),
                        Text(
                          ((context.watch<UserCubit>().state as UserLoaded)
                                      .user
                                      .email
                                      .length >=
                                  25)
                              ? (context.watch<UserCubit>().state as UserLoaded)
                                      .user
                                      .email
                                      .substring(0, 25) +
                                  '...'
                              : (context.watch<UserCubit>().state as UserLoaded)
                                  .user
                                  .email,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    )),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Icon(Feather.user, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Profil',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ProfilePage(),
                        ));
                  },
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Icon(Feather.clock, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Riwayat',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: HistoryPage()));
                  },
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Icon(Icons.timeline, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Timeline',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: TimelinePage()));
                  },
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Icon(Feather.users, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gabung kami',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: JoinPage()));
                  },
                ),
                ListTile(
                    tileColor: HexColor('#CDF0E0'),
                    leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Icon(Feather.info, color: HexColor('#030835')),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Informasi',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: AppInfo()));
                    }),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Icon(Feather.settings, color: HexColor('#030835')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pengaturan',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: SettingsPage()));
                  },
                ),
                ListTile(
                  tileColor: HexColor('#CDF0E0'),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
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
                  onTap: () async {
                    // await _auth.signOut();
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
              padding: const EdgeInsets.fromLTRB(18, 16, 0, 0),
              child: Column(
                children: [
                  IconButton(
                    icon: new Icon(Zephyrnaut.menuButton),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
                child: Container(
                  child: RaisedButton(
                    onPressed: () {
                      //f changeType();
                    },
                    child: Text('Mode User'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: HexColor('#CDF0E0'),
                  ),
                )),
          ],
        ),

        //BODY
        body: homeGenerator(
            _page,
            context,
            (context.watch<UserCubit>().state as UserLoaded).user.credit,
            (context.watch<UserCubit>().state as UserLoaded).user.packAmount),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height: 60.0,
          items: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
              child:
                  Icon(Zephyrnaut.qrMark, size: 25, color: HexColor('#030835')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 11.5, 0),
              child: Icon(Zephyrnaut.moneyMark,
                  size: 20, color: HexColor('#030835')),
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
        ));
  }
}
