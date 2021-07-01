part of '../pages.dart';

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
            // Future.delayed(Duration(seconds: 1), (){
            //   Get.Get.back();
            //   Get.Get.dialog(
            //     Dialog(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(20))
            //       ),
            //       backgroundColor: Palette.whiteColor,
            //       child: Container(
            //         padding: EdgeInsets.all(10),
            //         height: MQuery.height(0.65, context),
            //         child: Container(
            //           clipBehavior: Clip.hardEdge,
            //           decoration: BoxDecoration(
            //             color: Palette.whiteColor,
            //             borderRadius: BorderRadius.all(Radius.circular(10))
            //           ),
            //           child: Image.asset("assets/sample_ads.png", fit: BoxFit.fill),
            //         )
            //       )
            //     ),
            //   );
            // });
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
                            
                          },
                          title: GFont.out(
                            title: "Riwayat",
                            fontSize: 18,
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
                            Get.Get.to(() => PromotionPage(), transition: Get.Transition.cupertino);
                          },
                          title: GFont.out(
                            title: "Promosi",
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
                      child: FlutterLogo(),
                    ),
                  )
                ],
              ),
              extendBody: true,
              body: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox()
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
                                  Icon(PackMe.history),
                                  Icon(PackMe.help)
                                ],
                              ),
                              SizedBox(height: MQuery.height(0.025, context)),
                              selectedPage == "Withdraw"
                              ? Column(
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
                                )
                              : selectedPage == "Rent"
                                ? Column(
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
                                  )
                                : selectedPage == "Return"
                                  ? Column(
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
                              print("tap");
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
                                print("tap");
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
