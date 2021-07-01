part of "../pages.dart";

class ChoosePackPage extends StatefulWidget {
  const ChoosePackPage({ Key? key }) : super(key: key);

  @override
  _ChoosePackPageState createState() => _ChoosePackPageState();
}

class _ChoosePackPageState extends State<ChoosePackPage> {

  TextEditingController _searchController = TextEditingController();
  Set<int> selectedPacks = Set();
  bool isSelecting = false;
  int length = 4;

  @override
  Widget build(BuildContext context) {

    print(selectedPacks);

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
          title: "Pilih Packs",
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
                title: "Pilih kemasanmu",
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
                        ListTile(
                          onTap: (){
                            if(isSelecting){
                              if(selectedPacks.toList().indexOf(index) >= 0){
                                setState(() {
                                  selectedPacks.remove(index);
                                });
                              } else {
                                setState(() {
                                  selectedPacks.add(index);
                                });
                              }
                            }
                          },
                          onLongPress: (){
                            setState(() {
                              isSelecting = !isSelecting;
                            });
                          },
                          horizontalTitleGap: MQuery.width(0.025, context),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: MQuery.width(0.015, context),
                            vertical: MQuery.height(0.005, context)
                          ),
                          leading: Container(
                            height: MQuery.height(0.05, context),
                            width: MQuery.height(0.05, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Palette.pinkAccent
                            ),
                          ),
                          title: GFont.out(
                            title: "Mealbox Size L",
                            fontSize: 18,
                            color: Palette.blackColor,
                            textAlign: TextAlign.start
                          ),
                          trailing: Container(
                            width: MQuery.width(0.075, context),
                            child: Row(
                              children: [
                                GFont.out(
                                  title: "2x",
                                  fontSize: 16,
                                  color: Palette.blackColor,
                                  textAlign: TextAlign.start
                                ),
                                SizedBox(width: MQuery.width(
                                  selectedPacks.toList().indexOf(index) >= 0
                                  ? 0.02
                                  : 0, context)),
                                selectedPacks.toList().indexOf(index) >= 0
                                ? ZoomIn(
                                    duration: Duration(milliseconds: 100),
                                    child: Icon(PackMe.check, size: MQuery.height(0.02, context), color: Palette.successColor)
                                  )
                                : SizedBox()
                              ],
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