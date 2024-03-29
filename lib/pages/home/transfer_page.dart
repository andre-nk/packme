part of "../pages.dart";

class TransferPage extends StatefulWidget {
  const TransferPage({ Key? key }) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {

  TextEditingController _searchController = TextEditingController();
  int length = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
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
              Navigator.push(context, PageTransition(child: QRCodePage(), type: PageTransitionType.rightToLeftWithFade));
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
        title: GFont.out(
          title: "Transfer Packs",
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
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
          padding: EdgeInsets.all(
            MQuery.height(0.02, context)
          ),
          height: MQuery.height(0.9, context),
          width: MQuery.width(1, context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MQuery.height(0.02, context)),
              GFont.out(
                title: "Pilih kontak PackMe",
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
              SizedBox(height: MQuery.height(0.04, context)),
              Container(
                height: MQuery.height(0.075, context),
                width: MQuery.width(0.9, context),
                margin: EdgeInsets.only(
                  left: MQuery.width(0.025, context),
                  right: MQuery.width(0.025, context)
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Palette.greenShade,
                ),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _searchController,
                    cursorColor: Palette.blackColor,
                    style: GFont.style(
                      fontSize: 18
                    ),
                    decoration: InputDecoration(
                      hintStyle: GFont.style(
                        fontSize: 18,
                        color: Palette.blackColor.withOpacity(0.4)
                      ),
                      hintText: "Cari kontak...",
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      border: InputBorder.none
                    ),
                  ),
                )
              ),
              SizedBox(height: MQuery.height(0.04, context)),
              Container(
                height: MQuery.height(0.6, context),
                child: ListView.builder(
                  itemCount: length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageTransition(child: TransferConfirmationPage(
                                name: index == 0
                                ? "Alex"
                                : "Irina",
                                photoPath: index == 0
                                ? "assets/alex.jpg"
                                : "assets/irina.jpg",
                              ), type: PageTransitionType.rightToLeftWithFade)
                            );
                          },
                          child: ListTile(
                            horizontalTitleGap: MQuery.width(0.025, context),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: MQuery.width(0.015, context),
                              vertical: MQuery.height(0.01, context)
                            ),
                            leading: Container(
                              clipBehavior: Clip.antiAlias,
                              height: MQuery.height(0.05, context),
                              width: MQuery.height(0.05, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Palette.pinkAccent
                              ),
                              child: Image.asset(
                                index == 0
                                ? "assets/alex.jpg"
                                : "assets/irina.jpg",
                                fit: BoxFit.fill
                              )
                            ),
                            title: GFont.out(
                              title: index == 0 ? "Alex" : "Irina",
                              fontSize: 18,
                              color: Palette.blackColor,
                              textAlign: TextAlign.start
                            ),
                          ),
                        ),
                        Divider(thickness: 0.5,)
                      ],
                    );                  
                  },
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}