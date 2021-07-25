part of "../pages.dart";

class TransferConfirmationPage extends StatefulWidget {
  const TransferConfirmationPage({ Key? key }) : super(key: key);

  @override
  _TransferConfirmationPage createState() => _TransferConfirmationPage();
}

class _TransferConfirmationPage extends State<TransferConfirmationPage> {

  bool transferBonusActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Container(
      //   height: MQuery.height(0.1, context),
      //   margin: EdgeInsets.only(
      //     top: MQuery.height(0.025, context)
      //   ),
      //   padding: EdgeInsets.only(
      //     bottom: MQuery.height(0.025, context)
      //   ),
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //       backgroundColor: Palette.pinkAccent,
      //       elevation: 5,
      //       child: Icon(PackMe.qr, color: Colors.white),
      //       materialTapTargetSize: MaterialTapTargetSize.padded,
      //       onPressed: (){
      //         Get.Get.to(() => QRCodePage(), transition: Get.Transition.cupertino);
      //       },
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context), 
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.Get.back();
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
                            height: MQuery.height(0.05, context),
                            width: MQuery.height(0.05, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Palette.pinkAccent
                            ),
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MQuery.width(0.03, context)
                            ),
                            child: Icon(
                              CupertinoIcons.arrow_down
                            ),
                          ),
                        ),
                        ListTile(
                          horizontalTitleGap: MQuery.width(0.02, context),
                          leading: Container(
                            height: MQuery.height(0.05, context),
                            width: MQuery.height(0.05, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Palette.pinkAccent
                            ),
                          ),
                          title: GFont.out(
                            title: "Irina",
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
                        Divider(),
                        Container(
                          height: MQuery.height(0.275, context),
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
                                      title: index.isEven ? "Mealbox Size L" : "Drink Glass Size M" ,
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
                        Divider(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: MQuery.height(0.01, context),
                            horizontal: MQuery.width(0.02, context)
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GFont.out(
                                    title: "Total packs",
                                    fontSize: 16,
                                    color: Palette.blackColor,
                                    textAlign: TextAlign.start
                                  ),
                                  GFont.out(
                                    title: "3",
                                    fontSize: 16,
                                    color: Palette.blackColor,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.bold
                                  ),
                                ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GFont.out(
                                    title: "Pindah tangankan bonus?",
                                    fontSize: 16,
                                    color: Palette.blackColor,
                                    textAlign: TextAlign.start
                                  ),
                                  Switch(
                                    inactiveTrackColor: Colors.grey,
                                    inactiveThumbColor: Colors.grey.withOpacity(0.5),
                                    trackColor: MaterialStateProperty.all(Palette.greenAccent.withOpacity(0.5)),
                                    thumbColor: MaterialStateProperty.all(Palette.greenAccent),
                                    value: transferBonusActive,
                                    onChanged: (bool value){
                                      setState(() {
                                        transferBonusActive = !transferBonusActive;
                                      });
                                    }
                                  )
                                ]
                              ),
                              GFont.out(
                                title: "Jika bonus dipindahtangankan, kamu tidak akan dapat bonus setelah kemasan dikembalikan.",
                                fontSize: 16,
                                color: Palette.alertColor,
                                textAlign: TextAlign.start
                              ),
                            ],
                          ),
                        )
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