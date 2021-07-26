part of '../pages.dart';

enum AniProps { x, y, r }

class UserListener extends StatelessWidget {

  final UserDataRepository user = UserDataRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(user),
      child: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String selectedPage = "Rent";
  bool isDialogShowed = false;
  User currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {

    UserState states = context.watch<UserCubit>().state;
    final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');

    if(states is UserInitial){
      context.watch<UserCubit>().isUserDataExisted();
    }

    if(states is UserNonExistent){
      context.watch<UserCubit>().createUserData();
    }

    final _tweenRent = TimelineTween<AniProps>()
    ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 1000))
        .animate(AniProps.x, tween: (80.0).tweenTo(-60.0))
    ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 1000))
        .animate(AniProps.y, tween: (10.0).tweenTo(-36.0))
    ..addScene(begin: 1000.milliseconds, duration: Duration(milliseconds: 1500))
        .animate(AniProps.x, tween: (-60.0).tweenTo(80.0))
    ..addScene(begin: 1000.milliseconds, duration: Duration(milliseconds: 1500))
        .animate(AniProps.y, tween: (-36.0).tweenTo(-80.0))
    ..addScene(begin: 2500.milliseconds, duration: Duration(milliseconds: 1000))
        .animate(AniProps.x, tween: (80.0).tweenTo(32.0))
    ..addScene(begin: 2500.milliseconds, duration: Duration(milliseconds: 1000))
        .animate(AniProps.y, tween: (-80.0).tweenTo(30.0))
    ..addScene(begin: 3500.milliseconds, duration: Duration(milliseconds: 1500))
        .animate(AniProps.x, tween: (32.0).tweenTo(-20.0))
    ..addScene(begin: 3500.milliseconds, duration: Duration(milliseconds: 1500))
        .animate(AniProps.y, tween: (30.0).tweenTo(-20.0))
    ..addScene(begin: 5000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.x, tween: (-20.0).tweenTo(0.0))
    ..addScene(begin: 5000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.y, tween: (-20.0).tweenTo(-15.0))
    ..addScene(begin: 5500.milliseconds, duration: Duration(milliseconds: 1500))
        .animate(AniProps.x, tween: (-0.0).tweenTo(0.0))
    ..addScene(begin: 5500.milliseconds, duration: Duration(milliseconds: 1500))
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
    ..addScene(begin: 1000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.x, tween: (60.0).tweenTo(40.0))
    ..addScene(begin: 1000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.y, tween: (-60.0).tweenTo(-50.0))
    ..addScene(begin: 1500.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.x, tween: (40.0).tweenTo(20.0))
    ..addScene(begin: 1500.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.y, tween: (-50.0).tweenTo(-20.0))
    ..addScene(begin: 2000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.x, tween: (20.0).tweenTo(20.0))
    ..addScene(begin: 2000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.y, tween: (-20.0).tweenTo(-20.0))
    ..addScene(begin: 2500.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.x, tween: (20.0).tweenTo(90.0))
    ..addScene(begin: 2500.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.y, tween: (-20.0).tweenTo(-20.0))
    ..addScene(begin: 3000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.x, tween: (90.0).tweenTo(90.0))
    ..addScene(begin: 3000.milliseconds, duration: Duration(milliseconds: 500))
        .animate(AniProps.y, tween: (-20.0).tweenTo(-35.0));

    final _tweenWithdraw = TimelineTween<AniProps>()
    ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 2500))
        .animate(AniProps.x, tween: (40.0).tweenTo(150.0))
    ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 2500))
        .animate(AniProps.y, tween: (20.0).tweenTo(20.0))
    ..addScene(begin: 0.seconds, duration: Duration(milliseconds: 2500))
        .animate(AniProps.r, tween: (0.0).tweenTo(5.0))
    ..addScene(begin: 2500.milliseconds, duration: Duration(milliseconds: 2500))
        .animate(AniProps.x, tween: (150.0).tweenTo(40.0))
    ..addScene(begin: 2500.milliseconds, duration: Duration(milliseconds: 2500))
        .animate(AniProps.y, tween: (20.0).tweenTo(20.0))
    ..addScene(begin: 2500.milliseconds, duration: Duration(milliseconds: 2500))
        .animate(AniProps.r, tween: (5.0).tweenTo(0.0));

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state){
        if ((state is UserLoading)) {
          return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        } else {
          if (state is UserExist) {
            Future.delayed((1.seconds), (){
              Get.Get.back();
              if(isDialogShowed == false){
                Get.Get.dialog(
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  backgroundColor: Palette.whiteColor,
                  child: GestureDetector(
                      onTap: (){
                        WidgetsBinding.instance!.addPostFrameCallback((_){
                          setState(() {
                            isDialogShowed = true;
                          });
                        });
                      },
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MQuery.height(0.6, context),
                        minWidth: MQuery.width(0.6, context)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Palette.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MQuery.height(0.1, context),
                                child: Image.asset("assets/logo_fiksi.jpg")
                              ),
                              SizedBox(height: MQuery.height(0.02, context)),
                              Column(
                                children: [
                                  GFont.out(
                                    title: "Halo!\nSelamat datang di versi MVP PackMe",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: MQuery.height(0.02, context)),
                                  GFont.out(
                                    title: "Fitur-fitur dalam aplikasi ini adalah demonstrasi untuk kompetisi FIKSI 2021 dan implementasi fitur belum selesai sepenuhnya seperti pembayaran dan penarikan dana.\n Hubungi CS kami di halaman Hubungi Kami / Bantuan untuk panduan aplikasi.\n Selamat mencoba!",
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ),
                  )
                ),
              );
            }});

            return Scaffold(
              drawer: Drawer(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MQuery.width(0.02, context)
                    ),
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
                          onTap: (){},
                          title: GFont.out(
                            title: "Beranda",
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            textAlign: TextAlign.start
                          ),
                        ),
                        ListTile(
                          onTap: (){
                            Get.Get.back();
                            Get.Get.to(() => TransferPage(), transition: Get.Transition.cupertino);
                          },
                          title: GFont.out(
                            title: "Transfer Packs",
                            fontSize: 18,
                            textAlign: TextAlign.start
                          ),
                        ),
                        ListTile(
                          onTap: (){
                            Get.Get.back();
                            Get.Get.to(() => HistoryPage(), transition: Get.Transition.cupertino);
                          },
                          title: GFont.out(
                            title: "Riwayat",
                            fontSize: 18,
                            textAlign: TextAlign.start
                          ),
                        ),
                        ListTile(
                          onTap: (){},
                          title: GFont.out(
                            title: "FAQ",
                            fontSize: 18,
                            textAlign: TextAlign.start
                          ),
                        ),
                        ListTile(
                          onTap: (){
                            Get.Get.back();
                            Get.Get.to(() => AboutUsPage(), transition: Get.Transition.cupertino);
                          },
                          title: GFont.out(
                            title: "Tentang kami",
                            fontSize: 18,
                            textAlign: TextAlign.start
                          ),
                        ),
                        ListTile(
                          onTap: (){},
                          title: GFont.out(
                            title: "Gabung kami",
                            fontSize: 18,
                            textAlign: TextAlign.start
                          ),
                        ),
                        ListTile(
                          onTap: (){
                            context.read<AuthenticationCubit>().signOut();
                            Get.Get.offAll(CTAAuthPage());
                          },
                          title: GFont.out(
                            title: "Log out",
                            fontWeight: FontWeight.bold,
                            color: Palette.alertColor,
                            fontSize: 18,
                            textAlign: TextAlign.start
                          ),
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
                leading: Builder(builder: (context) => // Ensure Scaffold is in context
                  IconButton(
                    onPressed: (){
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      PackMe.menu,
                      color: Palette.blackColor,
                      size: 22
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: (){
                      Get.Get.to(() => ProfilePage(), transition: Get.Transition.cupertino);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: MQuery.width(0.02, context)
                      ),
                      child: Container(
                        child: currentUser.photoURL != null
                        ? Image.network(currentUser.photoURL!)
                        : FlutterLogo(),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.only(
                          top: MQuery.height(0.0125, context),
                          bottom: MQuery.height(0.0125, context)
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                      )
                    ),
                  )
                ],
              ),
              extendBody: true,
              body: Column(
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
                              duration: _tweenRent.duration, // Obtain duration
                              builder: (context, child, value) {
                                return Transform.translate(
                                  offset: Offset(value.get(AniProps.x), value.get(AniProps.y)),
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
                        padding: EdgeInsets.only(
                          bottom: 5
                        ),
                        child: LoopAnimation<TimelineValue<AniProps>>(
                          tween: _tweenReturn, // Pass in tween
                          duration: _tweenReturn.duration, // Obtain duration
                          builder: (context, child, value) {
                            return Transform.translate(
                              offset: Offset(value.get(AniProps.x), value.get(AniProps.y)),
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
                        padding: EdgeInsets.only(
                          bottom: 5
                        ),
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
                                      offset: Offset(value.get(AniProps.x), value.get(AniProps.y)),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 20.0
                                            ),
                                            child: Image.asset("assets/pack_withdraw.png"),
                                          ),
                                          SizedBox(width: MQuery.width(0.025, context)),
                                          LoopAnimation<TimelineValue<AniProps>>(
                                            tween: _tweenWithdraw, // Pass in tween
                                            duration: _tweenWithdraw.duration,
                                            builder: (context, child, value) {
                                              return Transform.rotate(
                                                angle: value.get(AniProps.r),
                                                child: Image.asset("assets/coin_withdraw.png")
                                              );
                                            }
                                          )// Obtain durationTransform.rotate(
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
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
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
                                      Get.Get.to(() => HistoryPage(), transition: Get.Transition.cupertino);
                                    },
                                    child: Icon(PackMe.history)
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Get.Get.to(() => HelpPage(), transition: Get.Transition.cupertino);
                                    },
                                    child: Icon(PackMe.help)
                                  )
                                ],
                              ),
                              SizedBox(height: MQuery.height(0.025, context)),
                              selectedPage == "Withdraw"
                              ? FadeInUp(
                                  child: Column(
                                    children: [
                                      GFont.out(
                                        title: formatCurrency.format(215540).substring(0, formatCurrency.format(215540).length - 3),
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
                                          fontWeight: FontWeight.w800
                                        ),
                                        GFont.out(
                                          title: "di merchant / vendor\nuntuk mulai pinjam packs",
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal
                                        )
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
                                            fontWeight: FontWeight.w800
                                          ),
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
                            ? (MQuery.width(0.5, context) / 2) - 38
                            : selectedPage == "Rent"
                              ? (MQuery.width(0.5, context) / 4)
                              : selectedPage == "Return"
                                ? (MQuery.width(0.5, context) / 2) - 38
                                : 0,
                          top: -40,
                          child: InkWell(
                            onTap: (){
                              if(selectedPage == "Return"){
                                Get.Get.to(() => ReturnMethodPage(), transition: Get.Transition.cupertino);
                              } else if (selectedPage == "Withdraw"){
                                Get.Get.to(() => WithdrawPage(), transition: Get.Transition.cupertino);
                              } else if (selectedPage == "Rent"){
                                Get.Get.to(() => QRViewExample(), transition: Get.Transition.cupertino);
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
                                  padding: EdgeInsets.only(
                                    right: selectedPage == "Withdraw"
                                    ? 3
                                    : 0
                                  ),
                                  child: Icon(
                                    selectedPage == "Withdraw"
                                    ? PackMe.withdraw
                                    : PackMe.qr,
                                    size: selectedPage == "Withdraw"
                                    ? 28
                                    : 28,
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
                              onTap: (){
                                Get.Get.to(() => RentCodePage(), transition: Get.Transition.cupertino);
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
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(PackMe.code, size: 22, color: Palette.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox()
                      ]
                    ),
                  )
                ]
              ),
              bottomNavigationBar: FloatingNavbar(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: MQuery.height(0.015, context) 
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: MQuery.width(0.03, context),
                  vertical: MQuery.width(0.03, context)
                ),
                itemBuilder: (context, item){
                  return GestureDetector(
                    onTap: (){
                      setState((){
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
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Icon(
                          item.icon,
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
          } else {
            return ErrorStatePage();
          }
        }
      },
    );
  }
}
