part of '../pages.dart';

enum AniProps { x, y, r }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPage = "Rent";

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');

    final _tweenRent = TimelineTween<AniProps>()
      ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 1000))
          .animate(AniProps.x, tween: (80.0).tweenTo(-60.0))
      ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 1000))
          .animate(AniProps.y, tween: (10.0).tweenTo(-36.0))
      ..addScene(
              begin: 1000.milliseconds, duration: Duration(milliseconds: 1500))
          .animate(AniProps.x, tween: (-60.0).tweenTo(80.0))
      ..addScene(
              begin: 1000.milliseconds, duration: Duration(milliseconds: 1500))
          .animate(AniProps.y, tween: (-36.0).tweenTo(-80.0))
      ..addScene(
              begin: 2500.milliseconds, duration: Duration(milliseconds: 1000))
          .animate(AniProps.x, tween: (80.0).tweenTo(32.0))
      ..addScene(
              begin: 2500.milliseconds, duration: Duration(milliseconds: 1000))
          .animate(AniProps.y, tween: (-80.0).tweenTo(30.0))
      ..addScene(
              begin: 3500.milliseconds, duration: Duration(milliseconds: 1500))
          .animate(AniProps.x, tween: (32.0).tweenTo(-20.0))
      ..addScene(
              begin: 3500.milliseconds, duration: Duration(milliseconds: 1500))
          .animate(AniProps.y, tween: (30.0).tweenTo(-20.0))
      ..addScene(
              begin: 5000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (-20.0).tweenTo(0.0))
      ..addScene(
              begin: 5000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-20.0).tweenTo(-15.0))
      ..addScene(
              begin: 5500.milliseconds, duration: Duration(milliseconds: 1500))
          .animate(AniProps.x, tween: (-0.0).tweenTo(0.0))
      ..addScene(
              begin: 5500.milliseconds, duration: Duration(milliseconds: 1500))
          .animate(AniProps.y, tween: (-15.0).tweenTo(-15.0));

    final _tweenReturn = TimelineTween<AniProps>()
      ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (90.0).tweenTo(85.0))
      ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-35.0).tweenTo(-70.0))
      ..addScene(begin: 500.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (85.0).tweenTo(60.0))
      ..addScene(begin: 500.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-70.0).tweenTo(-60.0))
      ..addScene(
              begin: 1000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (60.0).tweenTo(40.0))
      ..addScene(
              begin: 1000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-60.0).tweenTo(-50.0))
      ..addScene(
              begin: 1500.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (40.0).tweenTo(20.0))
      ..addScene(
              begin: 1500.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-50.0).tweenTo(-20.0))
      ..addScene(
              begin: 2000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (20.0).tweenTo(20.0))
      ..addScene(
              begin: 2000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-20.0).tweenTo(-20.0))
      ..addScene(
              begin: 2500.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (20.0).tweenTo(90.0))
      ..addScene(
              begin: 2500.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-20.0).tweenTo(-20.0))
      ..addScene(
              begin: 3000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.x, tween: (90.0).tweenTo(90.0))
      ..addScene(
              begin: 3000.milliseconds, duration: Duration(milliseconds: 500))
          .animate(AniProps.y, tween: (-20.0).tweenTo(-35.0));

    final _tweenWithdraw = TimelineTween<AniProps>()
      ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 2500))
          .animate(AniProps.x, tween: (40.0).tweenTo(150.0))
      ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 2500))
          .animate(AniProps.y, tween: (20.0).tweenTo(20.0))
      ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 2500))
          .animate(AniProps.r, tween: (0.0).tweenTo(5.0))
      ..addScene(
              begin: 2500.milliseconds, duration: Duration(milliseconds: 2500))
          .animate(AniProps.x, tween: (150.0).tweenTo(40.0))
      ..addScene(
              begin: 2500.milliseconds, duration: Duration(milliseconds: 2500))
          .animate(AniProps.y, tween: (20.0).tweenTo(20.0))
      ..addScene(
              begin: 2500.milliseconds, duration: Duration(milliseconds: 2500))
          .animate(AniProps.r, tween: (5.0).tweenTo(0.0));

    return Scaffold(
      backgroundColor: Palette.whiteColor,
      drawer: Drawer(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: MQuery.width(0.02, context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: MQuery.width(0.02, context)
                  ),
                  width: MQuery.width(0.3, context),
                  child: Image.asset("assets/logo_wide.png")
                ),
                SizedBox(height: MQuery.height(0.04, context)),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: GFont.out(
                    title: "Beranda",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    textAlign: TextAlign.start
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(child: TransferPage(), type: PageTransitionType.rightToLeftWithFade)
                    );
                  },
                  title: GFont.out(
                    title: "Transfer Packs",
                    fontSize: 18,
                    textAlign: TextAlign.start
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(child: HistoryPage(), type: PageTransitionType.rightToLeftWithFade)
                    );
                  },
                  title: GFont.out(
                      title: "Riwayat",
                      fontSize: 18,
                      textAlign: TextAlign.start),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(child: HelpPage(), type: PageTransitionType.rightToLeftWithFade)
                    );
                  },
                  title: GFont.out(
                      title: "FAQ",
                      fontSize: 18,
                      textAlign: TextAlign.start),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(child: AboutUsPage(), type: PageTransitionType.rightToLeftWithFade)
                    );
                  },
                  title: GFont.out(
                      title: "Tentang kami",
                      fontSize: 18,
                      textAlign: TextAlign.start),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(child: MitraProRegistration(), type: PageTransitionType.rightToLeftWithFade)
                    );
                  },
                  title: GFont.out(
                      title: "Gabung kami",
                      fontSize: 18,
                      textAlign: TextAlign.start),
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return ListTile(
                      onTap: () {
                        if(state is AuthSuccess){
                          if(state.user.provider == 'email'){
                            context.read<AuthCubit>().signOut();
                          } else if(state.user.provider == 'google'){
                            context.read<AuthCubit>().signOutWithGoogle();
                          }
                        }
                      },
                      title: GFont.out(
                        title: "Log out",
                        fontWeight: FontWeight.bold,
                        color: Palette.alertColor,
                        fontSize: 18,
                        textAlign: TextAlign.start
                      ),
                    );
                  },
                )
              ]
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(PackMe.menu, color: Palette.blackColor, size: 22),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(child: ProfilePage(), type: PageTransitionType.rightToLeftWithFade)
              );
            },
            child: Container(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if(state is AuthSuccess && state.user.profileURL != ""){
                    print(state.user.profileURL);
                    return CircleAvatar(
                      radius: MQuery.height(0.035, context),
                      backgroundColor: Palette.greenShade,
                      child: Image.network(
                        state.user.profileURL ?? ""
                      ),
                    );
                  } else {
                    return CircleAvatar(
                      radius: MQuery.height(0.035, context),
                      backgroundColor: Palette.pinkShade
                    );
                  }
                },
              ),
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(
                top: MQuery.height(0.02, context),
                right: MQuery.height(0.02, context),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.pinkAccent
              ),
            ),
          )
        ],
      ),
      extendBody: true,
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state){
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: selectedPage == "Rent"
                ? Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 20,
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Image.asset("assets/QR.png")
                          )
                        ),
                        LoopAnimation<TimelineValue<AniProps>>(
                          tween: _tweenRent, // Pass in tween
                          duration:
                              _tweenRent.duration, // Obtain duration
                          builder: (context, child, value) {
                            return Transform.translate(
                              offset: Offset(value.get(AniProps.x),
                                  value.get(AniProps.y)),
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset("assets/HP.png"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : selectedPage == "Return"
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: LoopAnimation<TimelineValue<AniProps>>(
                        tween: _tweenReturn, // Pass in tween
                        duration: _tweenReturn.duration, // Obtain duration
                        builder: (context, child, value) {
                          return Transform.translate(
                            offset: Offset(
                              value.get(AniProps.x),
                              value.get(AniProps.y)
                            ),
                            child: Container(
                              width: 200,
                              height: 200,
                              child: Image.asset("assets/return_anim.png"),
                            ),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: LoopAnimation<TimelineValue<AniProps>>(
                        tween: _tweenReturn, // Pass in tween
                        duration: _tweenReturn.duration, // Obtain duration
                        builder: (context, child, value) {
                          return Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              LoopAnimation<TimelineValue<AniProps>>(
                                tween: _tweenWithdraw, // Pass in tween
                                duration: _tweenWithdraw.duration, // Obtain duration
                                builder: (context, child, value) {
                                  return Transform.translate(
                                    offset: Offset(
                                      value.get(AniProps.x),
                                      value.get(AniProps.y)
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20.0),
                                          child: Image.asset("assets/pack_withdraw.png"),
                                        ),
                                        SizedBox(
                                          width: MQuery.width(0.025, context)),
                                        LoopAnimation<TimelineValue<AniProps>>(
                                          tween:_tweenWithdraw, // Pass in tween
                                          duration: _tweenWithdraw.duration,
                                          builder: (context, child, value) {
                                          return Transform.rotate(
                                            angle: value.get(AniProps.r),
                                            child: Image.asset("assets/coin_withdraw.png")
                                          );
                                        }) // Obtain durationTransform.rotate(
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 120,
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset("assets/phone_variant.png")
                                )
                              ),
                            ],
                          );
                        },
                      ),
                    )
                    ),
            Expanded(
              flex: 5,
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  padding: EdgeInsets.all(MQuery.height(0.04, context)),
                  decoration: BoxDecoration(
                    color: Palette.greenShade,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)
                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: MQuery.height(0.01, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                PageTransition(child: HistoryPage(), type: PageTransitionType.rightToLeftWithFade)
                              );
                            },
                            child: Icon(PackMe.history)
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                PageTransition(child: HelpPage(), type: PageTransitionType.rightToLeftWithFade)
                              );
                            }, child: Icon(PackMe.help)
                          )
                        ],
                      ),
                      SizedBox(height: MQuery.height(0.025, context)),
                      selectedPage == "Withdraw"
                          ? FadeInUp(
                              child: Column(
                                children: [
                                  GFont.out(
                                    title: formatCurrency.format(215000).substring(0, formatCurrency.format(215000).length -3),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800
                                  ),
                                  GFont.out(
                                    title: "yang dapat kamu cairkan\nke e-money atau rekening kamu!",
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal
                                  )
                                ],
                              ),
                            )
                          : selectedPage == "Rent"
                              ? FadeInUp(
                                  child: Column(
                                    children: [
                                      GFont.out(
                                          title: "Scan QR",
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800),
                                      GFont.out(
                                          title:
                                              "di merchant / vendor\nuntuk mulai pinjam packs",
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)
                                    ],
                                  ),
                                )
                              : selectedPage == "Return"
                              ? FadeInUp(
                                  child: Column(
                                    children: [
                                      GFont.out(
                                        title: "10 packs",
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800),
                                      GFont.out(
                                        title: "yang dapat kamu kembalikan\ndan dapatkan bonusnya!",
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox()
                    ],
                  ),
                ),
                Positioned(
                  left: selectedPage == "Withdraw"
                  ? (MQuery.width(0.5, context) / 2) - 45
                  : selectedPage == "Rent"
                  ? (MQuery.width(0.5, context) / 4)
                  : selectedPage == "Return"
                  ? (MQuery.width(0.5, context) / 2) - 45
                  : 0,
                  top: -40,
                  child: InkWell(
                    onTap: () {
                      if(selectedPage == "Withdraw"){
                        Navigator.push(
                          context,
                          PageTransition(child: WithdrawPage(), type: PageTransitionType.rightToLeftWithFade)
                        );
                      } else if (selectedPage == "Rent"){
                        Navigator.push(
                          context,
                          PageTransition(child: QRCodeScanner(), type: PageTransitionType.rightToLeftWithFade)
                        );
                      } else if (selectedPage == "Return"){
                        Navigator.push(
                          context,
                          PageTransition(child: ReturnMethodPage(), type: PageTransitionType.rightToLeftWithFade)
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Palette.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      height: 75,
                      width: 75,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: selectedPage == "Withdraw" ? 3 : 0),
                          child: Icon(
                            selectedPage == "Withdraw"
                            ? PackMe.withdraw
                            : PackMe.qr,
                            size: selectedPage == "Withdraw" ? 28 : 28,
                            color: Palette.whiteColor
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                selectedPage == "Rent"
                ? Positioned(
                    right: (MQuery.width(0.5, context) / 4),
                    top: -40,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(child: RentCodePage(), type: PageTransitionType.rightToLeftWithFade)
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Palette.pinkAccent,
                            borderRadius: BorderRadius.all(
                                Radius.circular(50))),
                        height: 75,
                        width: 75,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(PackMe.code,
                                size: 22, color: Palette.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox()
              ]),
            )
          ],
        );
        },
        listener: (context, state){
          print(state);
        }
      ),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: MQuery.height(0.015, context)),
        margin: EdgeInsets.symmetric(
          horizontal: MQuery.width(0.03, context),
          vertical: MQuery.width(0.03, context)
        ),
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedPage = item.title ?? "";
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedPage == "Rent" && item.icon!.codePoint == 59396
                ? Palette.pinkShade
                : selectedPage == "Withdraw" && item.icon!.codePoint == 59392
                  ? Palette.pinkShade
                  : selectedPage == "Return" && item.icon!.codePoint == 63003
                    ? Palette.pinkShade
                    : Palette.whiteColor,
                borderRadius:  BorderRadius.all(Radius.circular(50))
              ),
              height: 50,
              width: 50,
              child: Center(
                child: Icon(item.icon,
                  color: Palette.blackColor,
                  size: item.icon!.codePoint == 59392 || item.icon!.codePoint == 59396
                  ? 20
                  : 24
                ),
              ),
            ),
          );
        },
        borderRadius: 50,
        onTap: (int val) {},
        currentIndex: 0,
        items: [
          FloatingNavbarItem(icon: PackMe.withdraw, title: 'Withdraw'),
          FloatingNavbarItem(icon: PackMe.qr, title: 'Rent'),
          FloatingNavbarItem(icon: CupertinoIcons.cube_box, title: 'Return'),
        ],
      )
    );
  }
}
