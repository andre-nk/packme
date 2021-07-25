part of "../pages.dart";

class QRCodePage extends StatelessWidget {
  const QRCodePage({ Key? key }) : super(key: key);

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
            child: Icon(
              CupertinoIcons.chevron_right_2,
              color: Colors.white
            ),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onPressed: (){
              Get.Get.to(() => ChoosePackPage(
                fromTransferPack: true
              ), transition: Get.Transition.cupertino);
            },
          ),
        ),
      ),
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
          padding: EdgeInsets.all(
            MQuery.height(0.02, context)
          ),
          height: MQuery.height(0.9, context),
          width: MQuery.width(1, context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset("assets/cross_border.svg"),
                  Image.asset("assets/qrcode_sample.png"),
                ],
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Center(
                child: Container(
                  height: MQuery.height(0.065, context),
                  width: MQuery.height(0.065, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Palette.pinkAccent
                  ),
                ),
              ),
              SizedBox(height: MQuery.height(0.02, context)),
              GFont.out(
                title: "Irina",
                fontSize: 20,
                color: Palette.blackColor,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.bold
              ),
              SizedBox(height: MQuery.height(0.005, context)),
              GFont.out(
                title: "packme-user-0001",
                fontSize: 18,
                color: Palette.blackColor,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal
              ),
            ]
          )
        )
      )
    );
  }
}