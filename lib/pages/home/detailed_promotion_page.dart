part of "../pages.dart";

class DetailedPromotionPage extends StatelessWidget {
  const DetailedPromotionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          height: MQuery.height(0.9, context),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: MQuery.width(1, context),
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/sample_ads.png"),
                  ),
                )
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(MQuery.height(0.03, context)),
                  color: Palette.whiteColor,
                  child: Column(
                    children: [
                      GFont.out(
                        title: "Tambahan 10% untuk Pengembalian Kemasan KFC",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start
                      ),
                      SizedBox(height: MQuery.height(0.025, context)),
                      GFont.out(
                        title: "Promosi 10% tambahan bounty untuk pengembalian kemasan dari vendor KFC hanya tersedia sampai 20 Juni 2021 tanpa batas pemakaian. Aktifkan promo ini di opsi promo saat peminjaman kemasan KFC berlangsung.",
                        fontSize: 18,
                        textAlign: TextAlign.start
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}