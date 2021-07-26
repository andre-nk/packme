part of "../pages.dart";

class ReturnMethodPage extends StatefulWidget {
  const ReturnMethodPage({ Key? key }) : super(key: key);

  @override
  _ReturnMethodPageState createState() => _ReturnMethodPageState();
}

class _ReturnMethodPageState extends State<ReturnMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: MQuery.height(0.1, context),
        padding: EdgeInsets.only(
          bottom: MQuery.height(0.025, context)
        ),
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Palette.pinkAccent,
            elevation: 5,
            child: Icon(PackMe.qr, color: Colors.white),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onPressed: (){
              Get.Get.to(() => QRCodePage(), transition: Get.Transition.cupertino);
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
        title: GFont.out(
          title: "Metode Pengembalian",
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
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
          height: MQuery.height(0.9, context),
          padding: EdgeInsets.all(MQuery.height(0.02, context)),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: GestureDetector(
                  onTap: (){
                    Get.Get.to(() => MapPage(), transition: Get.Transition.cupertino);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      children: [
                        Image.network("https://blog-media.lifepal.co.id/wp-content/uploads/2018/02/5-Profesi-Baru-yang-Bisa-Dilirik.jpg"),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 140,
                            padding: EdgeInsets.all(MQuery.height(0.02, context)),
                            decoration: BoxDecoration(
                              color: Palette.greenShade,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GFont.out(
                                  title: "Driver Pick-up",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                                SizedBox(height: MQuery.height(0.01, context)),
                                GFont.out(
                                  title: "Driver PackMe atau mitra akan menjemput kemasan yang akan Anda kembalikan di lokasi permintaan",
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  textAlign: TextAlign.start
                                ),
                              ]
                            )
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ),
              Spacer(),
              Expanded(
                flex: 10,
                child:  GestureDetector(
                  onTap: (){
                    Get.Get.to(() => PointLocationPage(), transition: Get.Transition.cupertino);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      children: [
                        Image.network("https://media-cdn.tripadvisor.com/media/photo-s/0d/5c/06/89/information-counter-ground.jpg"),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 120,
                            padding: EdgeInsets.all(MQuery.height(0.02, context)),
                            decoration: BoxDecoration(
                              color: Palette.greenShade,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GFont.out(
                                  title: "Drop-off Point",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                                SizedBox(height: MQuery.height(0.01, context)),
                                GFont.out(
                                  title: "Kembalikan kemasan PackMe di berbagai PackMe Point terdekat dari Anda tanpa biaya operasional",
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  textAlign: TextAlign.start
                                ),
                              ]
                            )
                          ),
                        ),
                      ],
                    )
                  ),
                )
              )
            ]
          ),
        )
      )
    );
  }
}