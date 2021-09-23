part of '../pages.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({ Key? key }) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> with SingleTickerProviderStateMixin {

  bool isOpened = false;
  bool isOpened2 = false;

  @override
  Widget build(BuildContext context) {
    return BackFramePage(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MQuery.height(0.025, context)),
              GFont.out(
                title: "Pusat Bantuan",
                fontWeight: FontWeight.bold,
                fontSize: 28
              ),
              SizedBox(height: MQuery.height(0.005, context)),
              GFont.out(
                title: "punya kesulitan? Sini, kami bantuin!",
                fontWeight: FontWeight.normal,
                fontSize: 20
              ),
              SizedBox(height: MQuery.height(0.075, context)),
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                height: isOpened ? MQuery.height(0.35, context) : MQuery.height(0.075, context),
                width: MQuery.width(0.45, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  ),
                  border: Border.all(
                    color: HexColor("000000").withOpacity(0.25),
                  ),
                ),
                child: Theme(
                  data: ThemeData(
                    dividerColor: Colors.transparent
                  ),
                  child: ExpansionTile(
                    iconColor: Palette.greenAccent,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    expandedAlignment: Alignment.centerLeft,
                    title: GFont.out(
                      textAlign: TextAlign.start,
                      title: "Lupa kata sandi?",
                      fontSize: 18
                    ),
                    childrenPadding: EdgeInsets.all(MQuery.height(0.02, context)),
                    children: [
                      GFont.out(
                        title: "Kamu bisa mengubah kata sandi kamu di pengaturan (Klik foto profil kamu di Beranda) lalu tekan Ganti Kata Sandi. Kami akan mengirim link penggantian password yang aman dan mudah digunakan ke alamat e-mail akun ini. Silahkan buka linknya dan buat password baru. Jangan ragu untuk hubungi CS kami jika  terdapat masalah lebih lanjut",
                        textAlign: TextAlign.start,
                        fontSize: 16,
                      )
                    ],
                    onExpansionChanged: (val){
                      setState(() {
                        isOpened = !isOpened;
                      });
                    },
                  ),
                )
              ),
              SizedBox(height: MQuery.height(0.02, context)),
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                height: isOpened2 ? MQuery.height(0.7, context) : MQuery.height(0.075, context),
                width: MQuery.width(0.45, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  ),
                  border: Border.all(
                    color: HexColor("000000").withOpacity(0.25),
                  ),
                ),
                child: Theme(
                  data: ThemeData(
                    dividerColor: Colors.transparent
                  ),
                  child: ExpansionTile(
                    iconColor: Palette.greenAccent,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    expandedAlignment: Alignment.centerLeft,
                    title: GFont.out(
                      textAlign: TextAlign.start,
                      title: "Gabung kami sebagai MitraPRO",
                      fontSize: 18
                    ),
                    childrenPadding: EdgeInsets.all(MQuery.height(0.02, context)),
                    children: [
                      GFont.out(
                        title: "MitraPRO adalah program khusus dari PackMe bagi kamu yang merupakan owner dari bisnis kuliner sampai ekspedisi (online shop). Kami, PackMe menyediakan kemasan plastik reusable yang berkualitas tinggi, murah dan dapat didesain sesuai kebutuhan kamu. MitraPRO dapat memberikan beberapa keuntungan dari pemesanan kemasan plastik kami secara biasa. Sebut saja, biaya yang jauh lebih murah secara berkala yaitu mencapai 60% lebih murah dari kemasan komersial, proses pemasokan kemasan yang lebih diprioritaskan hingga kesempatan mengiklankan usaha kamu secara gratis sebanyak 2x dalam satu bulan dalam aplikasi dan kemasan-kemasan PackMe. Tunggu apa lagi? Gabung dengan kami melalui Side Bar (pojok kiri atas dari Beranda) lalu klik 'Gabung Kami'. Kamu bisa membaca lebih lanjut tentang S&K MitraPRO serta formulir pendaftaran lengkapnya disana",
                        textAlign: TextAlign.start,
                        fontSize: 16,
                      ),
                    ],
                    onExpansionChanged: (val){
                      setState(() {
                        isOpened2 = !isOpened2;
                      });
                    },
                  ),
                )
              ),
              SizedBox(height: MQuery.height(0.05, context)),
            ],
          ),
        )
      ),
    );
  }
}