part of "../pages.dart";

class ErrorStatePage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? buttonMessage;
  final String? image;

  const ErrorStatePage({
    this.image,
    this.title,
    this.description,
    this.buttonMessage
  });

  @override
  Widget build(BuildContext context) {

    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'packmeofficial.dev@example.com',
      queryParameters: {
        'subject': 'Issue App PackMe'
      }
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MQuery.width(0.05, context)),
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 14,
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Container(
                        height:  MQuery.height(0.25, context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor("FFDBDB")
                        ),
                      ),
                    ),
                    BounceInDown(
                      duration: Duration(milliseconds: 1650),
                      child: Image.asset("assets/error.png"),
                    )
                  ]
                ),
                height: MQuery.height(0.1, context),
                width: MQuery.width(0.45, context),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GFont.out(
                    title: this.title ?? "Maaf! Gagal!",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: MQuery.height(0.01, context)),
                  GFont.out(
                    title: this.description ?? "Proses ini tidak dapat dilakukan karena kendala pada layanan kami. Mohon coba lagi!",
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MQuery.height(0.08, context),
              padding: EdgeInsets.only(
                  bottom: MQuery.height(0.005, context)),
              child: DefaultButton(
                color: Palette.pinkAccent,
                method: () {},
                title: GFont.out(
                  title: this.buttonMessage ?? "Coba lagi",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Palette.whiteColor
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                launch(_emailLaunchUri.toString());
              },
              child: GFont.out(
                title: "Laporkan masalah?",
                fontWeight: FontWeight.bold
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}