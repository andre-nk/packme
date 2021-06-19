part of '../pages.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({ Key? key }) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> with SingleTickerProviderStateMixin {

  bool isOpened = false;

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
                height: isOpened ? MQuery.height(0.8, context) : MQuery.height(0.075, context),
                width: MQuery.width(0.45, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  ),
                  border: Border.all(
                    color: HexColor("000000").withOpacity(0.25),
                  ),
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
                      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel sem lacus. Sed turpis nunc, malesuada sed venenatis ac, congue sed metus. Aliquam at dui elit. Pellentesque aliquam posuere nulla, in maximus eros iaculis sed. Duis quis lacus venenatis, auctor quam in, maximus est. Fusce euismod purus tortor, nec dignissim arcu dignissim ac. Pellentesque tincidunt in lorem sit amet iaculis. Morbi scelerisque eros sed tristique lobortis. Vivamus quis suscipit enim, iaculis sodales justo. Vivamus imperdiet lacinia mi a pulvinar. Donec condimentum placerat erat sed placerat. Nulla facilisi. Integer rhoncus diam velit, at pellentesque orci gravida et. Vestibulum et ultricies odio. Mauris gravida pretium tortor nec dapibus. Sed id pulvinar neque. Nullam ex odio, consequat non augue ut, vestibulum tincidunt sapien. In sit amet scelerisque risus. Mauris quis turpis ipsum. Integer aliquet vehicula augue, at rhoncus libero luctus at. Nunc vitae nibh justo. Nullam suscipit finibus quam pulvinar tincidunt. Cras rutrum scelerisque molestie. Nam sed sagittis ipsum, sed pharetra erat. Morbi ut odio a nisl pulvinar condimentum ac vel mi. Aliquam eget commodo eros, a sollicitudin eros. Cras libero eros, tempus ac congue sed, vulputate eu nisi. Curabitur a justo bibendum, sodales quam vel, luctus orci. Nulla vel malesuada tellus, vel mattis mi. Cras cursus purus eu rhoncus sollicitudin.",
                      textAlign: TextAlign.start,
                      fontSize: 14,
                    )
                  ],
                  onExpansionChanged: (val){
                    setState(() {
                      isOpened = !isOpened;
                    });
                  },
                )
              )
            ],
          ),
        )
      ),
    );
  }
}