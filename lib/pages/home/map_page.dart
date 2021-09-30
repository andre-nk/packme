part of "../pages.dart";

class MapPage extends StatefulWidget {
  const MapPage({ Key? key }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    } 
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(5000.seconds, (){
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: SuccessStatePage(
            title: "Yeay! Berhasil!",
            description: "Terimakasih telah mengembalikan kemasan PackMe, Tunggu bonus uang dari PackMe dan jangan lupa untuk pakai kemasan PackMe lagi ya!",
            buttonMessage: "Kembali ke Beranda",
            image: "assets/success_box.png",
          ),
          type: PageTransitionType.rightToLeftWithFade
        ),
        (route) => false
      );
    });

    return Scaffold(
      body: SlidingUpPanel(
        minHeight: MQuery.height(0.2, context),
        maxHeight: MQuery.height(0.6, context),
        backdropColor: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        ),
        panel: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MQuery.height(0.03, context),
            horizontal: MQuery.height(0.03, context)
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                height: 6.5,
                width: 100
              ),
              SizedBox(height: MQuery.height(0.015, context)),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage(
                    "assets/driver_avatar.jpg"
                  )
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: GFont.out(
                    title: "Fajar Putra Permana",
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: GFont.out(
                  title: "Driver PackMe",
                  textAlign: TextAlign.start,
                  fontSize: 14,
                ),
                trailing: Container(
                  width: MQuery.width(0.125, context),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.phone, color: Colors.black
                        )
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.chat, color: Colors.black
                        )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GFont.style(
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Estimasi driver tiba pada pukul: ',
                          ),
                          TextSpan(
                            text: '${DateFormat.Hm().format(DateTime.now().add(5.minutes))}',
                            style: GFont.style(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MQuery.height(0.01, context)),
                    GFont.out(
                      title: "Jalan Carina Sayang II, Gading Laundry No. 17, Penjaringan, Jakarta Utara",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                      color: Palette.blackColor.withOpacity(0.75)
                    ),
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
                                    : "assets/box_food.png",
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
                    SizedBox(height: MQuery.height(0.03, context)),
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
                            title: "4",
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
                            title: "Rp 17.000,-",
                            fontSize: 16,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.bold
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MQuery.height(0.01, context)),
                  ]
                )
              )
            ]
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: FutureBuilder<Position>(
                future: _determinePosition(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                  ? FlutterMap(
                      options: MapOptions(
                        center: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                        zoom: 13.0,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']
                        ),
                      ],
                    )
                  : SizedBox();
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}