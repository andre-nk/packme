part of "../pages.dart";

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
        title: GFont.out(
          title: "Tentang kami",
          fontSize: 22,
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
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey,
                  width: MQuery.width(1, context),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: MQuery.width(1, context),
                  padding: EdgeInsets.all(MQuery.height(0.03, context)),
                  child: GFont.out(
                    title: "PackMe adalah aplikasi peminjaman kemasan produk berkualitas tinggi yang bertujuan untuk memaksimalkan poin Reuse dalam sistem 3R (Reduce, Reuse, Recycle). PackMe akan mensuplai banyak jenis kemasan mulai dari minuman, makanan, produk dll. kepada produsen atau distributor produk terkait seperti restoran, pemilik online shop ataupun stand minuman. Kemasan ini yang nantinya akan berada di tangan konsumen dapat dikembalikan ke PackMe dan konsumen yang mengembalikan akan diberi reward / bounty berupa uang. Setelah itu, PackMe akan mensterilkan semua kemasan makanan yang kembali atau melakukan proses recycle dan proses suplai ke distributor dilakukan lagi. Dengan demikian, PackMe pada dasarnya akan membatasi penggunaan kemasan plastik di kalangan masyarakat ditambah lagi memberi hadiah dan bonus bagi masyarakat yang peduli lingkungan.",
                    fontSize: 18,
                    textAlign: TextAlign.start
                  ),
                )
              )
            ],
          )
        ),
      )
    );
  }
}