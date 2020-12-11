part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  GeneralPage({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: IconButton(
                icon: new Icon(Feather.arrow_left),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          title: Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: HexColor('#030835'))),
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
    );
  }
}
