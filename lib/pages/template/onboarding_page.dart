part of "../pages.dart";

class SplashContent extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;

  const SplashContent({
    this.image,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MQuery.width(0.05, context)),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Container(
                      height:  MQuery.height(0.25, context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: image == "assets/return.png"
                          ? HexColor("FFDBDB")
                          : HexColor("C7F1E4")
                      ),
                    ),
                  ),
                  Bounce(
                    
                    duration: Duration(milliseconds: 1650),
                    infinite: true,
                    child: Image.asset(image ?? ""),
                  )
                ]
              ),
              height: MQuery.height(0.15, context),
              width: MQuery.width(0.45, context),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GFont.out(
                  title: this.title,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: MQuery.height(0.01, context)),
                GFont.out(
                  title: this.description,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
