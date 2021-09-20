part of '../pages.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
        title: GFont.out(
          title: "Riwayat",
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
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
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(
                      MQuery.width(0.03, context),
                      MQuery.height(0.005, context),
                      MQuery.width(0.03, context),
                      MQuery.height(0.005, context),
                    ),
                    isThreeLine: true,
                    title: GFont.out(
                      title: "Tarik saldo",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GFont.out(
                          title: "OVO",
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start
                        ),
                        GFont.out(
                          title: "11 November 2021",
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GFont.out(
                          title: "-Rp 50.000",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 2,)
                ],
              );
            },
          )
        ),
      ),
    );
  }
}