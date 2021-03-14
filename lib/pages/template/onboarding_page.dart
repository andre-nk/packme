part of "../pages.dart";

class SplashContent extends StatelessWidget {
  final String title;
  final String description;

  const SplashContent({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MQuery.width(0.05, context)),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.grey,
              height: MQuery.height(0.15, context),
              width: MQuery.width(0.45, context),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 4,
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
