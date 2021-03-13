part of "../pages.dart";

class BackFramePage extends StatelessWidget {

  final Widget child;

  const BackFramePage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: MQuery.height(0.1, context),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_rounded, color: Palette.blackColor),
        ),
      ),
      body: SafeArea(child: this.child),
    );
  }
}