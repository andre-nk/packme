part of "../pages.dart";

class PromotionPage extends StatelessWidget {
  const PromotionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
        title: GFont.out(
          title: "Promosi dan Diskon",
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
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
      body: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
            },
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  MQuery.height(0.02, context),
                  index == 0 ? MQuery.height(0.015, context) : MQuery.height(0.01, context),
                  MQuery.height(0.02, context),
                  MQuery.height(0.01, context)
                ),
                width: MQuery.width(0.85, context),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),
          );
        },
      )
    );
  }
}