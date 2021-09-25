part of "../pages.dart";

class RentPackConfirmation extends StatefulWidget {
  const RentPackConfirmation({ Key? key }) : super(key: key);

  @override
  _RentPackConfirmationState createState() => _RentPackConfirmationState();
}

class _RentPackConfirmationState extends State<RentPackConfirmation> {

  User currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context), 
        elevation: 0,
        leading: IconButton(
          onPressed: (){
          },
          icon: Icon(
            CupertinoIcons.chevron_left,
            color: Palette.blackColor
          ),
        )
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MQuery.height(0.875, context),
          width: MQuery.width(1, context),
          padding: EdgeInsets.symmetric(
            horizontal: MQuery.width(0.04, context)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: MQuery.height(0.01, context)),
                  Container(
                    height: MQuery.height(0.725, context),
                    width: MQuery.width(0.8, context),
                    padding: EdgeInsets.symmetric(
                      vertical: MQuery.height(0.01, context)
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette.blackColor.withOpacity(0.5)
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: ListView(
                      children: [
                        ListTile(
                          horizontalTitleGap: MQuery.width(0.02, context),
                          leading: Container(
                            clipBehavior: Clip.antiAlias,
                            height: MQuery.height(0.05, context),
                            width: MQuery.height(0.05, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Palette.pinkAccent
                            ),
                            child: currentUser.photoURL == null
                            ? SizedBox()
                            : Image.network(currentUser.photoURL!)
                          ),
                          title: GFont.out(
                            title: "Andreas Notokusumo",
                            fontSize: 16,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.bold
                          ),
                          subtitle: GFont.out(
                            title: "+62 822 1234 5678",
                            fontSize: 14,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        ListTile(
                          leading: Container(
                            width: MQuery.width(0.05, context),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.clock
                              ),
                            ),
                          ),
                          title: GFont.out(
                            title: "10 Oktober 2021 (tenggat kembali)",
                            fontSize: 14,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.bold
                          ),
                          subtitle: GFont.out(
                            title: "sebelum bonus hangus",
                            fontSize: 12,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        ListTile(
                          leading: Container(
                            width: MQuery.width(0.05, context),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.location
                              ),
                            ),
                          ),
                          title: GFont.out(
                            title: "Janji Jiwa Jilid 61 (Central Park)",
                            fontSize: 14,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.bold
                          ),
                          subtitle: GFont.out(
                            title: "Jakarta Utara",
                            fontSize: 12,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        Divider(),
                        Container(
                          height: MQuery.height(0.2, context),
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  ListTile(
                                    horizontalTitleGap: MQuery.width(0.005, context),
                                    leading: Container(
                                      height: MQuery.height(0.04, context),
                                      width: MQuery.height(0.04, context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Palette.pinkAccent
                                      ),
                                      child: Image.asset(
                                        index.isEven
                                        ? "assets/box_drink.png"
                                        : "assets/box_food.png"
                                      )
                                    ),
                                    title: GFont.out(
                                      title: index.isEven ? "Mealbox Size L" : "Drink Glass Size M",
                                      fontSize: 16,
                                      color: Palette.blackColor,
                                      textAlign: TextAlign.start
                                    ),
                                    trailing: GFont.out(
                                      title: "2x",
                                      fontSize: 14,
                                      color: Palette.blackColor,
                                      textAlign: TextAlign.start
                                    ),
                                  ),
                                  Divider(thickness: 0.5),
                                ],
                              );                  
                            },
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: MQuery.width(0.02, context),
                            vertical: MQuery.height(0.01, context)
                          ),
                          child: ListTile(
                            tileColor: Palette.greenShade,
                            leading: Container(
                              width: MQuery.width(0.03, context),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.location
                                ),
                              ),
                            ),
                            title: GFont.out(
                              title: "Pilih promo yang tersedia",
                              fontSize: 16,
                              color: Palette.blackColor,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        SizedBox(height: MQuery.height(0.01, context)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MQuery.width(0.025, context)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GFont.out(
                                title: "Total packs",
                                fontSize: 16,
                                color: Palette.blackColor,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500
                              ),
                              GFont.out(
                                title: "3",
                                fontSize: 16,
                                color: Palette.blackColor,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.bold
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MQuery.height(0.01, context)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MQuery.width(0.025, context)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GFont.out(
                                title: "Estimasi bonus",
                                fontSize: 16,
                                color: Palette.blackColor,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500
                              ),
                              GFont.out(
                                title: "Rp 10.000,-",
                                fontSize: 16,
                                color: Palette.blackColor,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.bold
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MQuery.height(0.01, context)),
                      ],
                    ),
                  ),
                  SizedBox(height: MQuery.height(0.025, context)),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: MQuery.height(0.1, context),
                    width: MQuery.width(0.35, context),
                    padding: EdgeInsets.only(
                      bottom: MQuery.height(0.025, context)
                    ),
                    child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MQuery.width(0.01, context)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GFont.out(
                              title: " Pinjam packs dipilih",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            Icon(CupertinoIcons.chevron_right_2),
                          ],
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            child: SuccessStatePage(
                              title: "Yeay! Berhasil!",
                              description: "Terimakasih untuk meminjam kemasan kami! Jangan lupa untuk mengembalikannya dan dapatkan bonus uangnya ya!",
                              buttonMessage: "Kembali ke Beranda",
                              image: "assets/success_box.png",
                            ),
                            type: PageTransitionType.rightToLeftWithFade
                          ),
                          (route) => false
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Palette.pinkAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50)
                          )
                        )
                      )
                    )
                  ),
                ],
              ),
            ]
          )
        ),
      ),
    );
  }
}