part of "../pages.dart";

class RentCodePage extends StatefulWidget {
  const RentCodePage({ Key? key }) : super(key: key);

  @override
  _RentCodePageState createState() => _RentCodePageState();
}

class _RentCodePageState extends State<RentCodePage> {

  TextEditingController _codeController = TextEditingController();
  int length = 4;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(
            MQuery.height(0.02, context)
          ),
          height: MQuery.height(0.9, context),
          width: MQuery.width(1, context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MQuery.height(0.06, context)),
              GFont.out(
                title: "Masukkan kode merchant",
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              GFont.out(
                title: "Kode tersedia di papan merchant\n yang kamu kunjungi sekarang",
                fontSize: 18,
                fontWeight: FontWeight.normal
              ),
              SizedBox(height: MQuery.height(0.1, context)),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GFont.out(
                      title: "PMC -",
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: MQuery.height(0.075, context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isError ? Palette.alertColor : Colors.transparent
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                        color: Palette.greenShade,
                      ),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _codeController,
                          cursorColor: Palette.blackColor,
                          style: GFont.style(
                            fontSize: 18
                          ),
                          decoration: InputDecoration(
                            hintStyle: GFont.style(
                              fontSize: 18,
                              color: (isError ? Palette.alertColor : Palette.blackColor).withOpacity(0.4)
                            ),
                            hintText: isError ? "Isi kode terlebih dahulu" : "XXXXXXXX",
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            border: InputBorder.none
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
              SizedBox(height: MQuery.height(0.04, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFont.out(
                    title: "Butuh bantuan kami?",
                    fontSize: 16,
                  ),
                  InkWell(
                    child: GFont.out(
                        title: " Klik disini!",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    onTap: (){
                    },
                  )
                ],
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFont.out(
                    title: "Mau pakai metode scan QR?",
                    fontSize: 16,
                  ),
                  InkWell(
                    child: GFont.out(
                        title: " Klik disini!",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    onTap: (){
                    },
                  )
                ],
              ),
              SizedBox(height: MQuery.height(0.1, context)),
              Container(
                height: MQuery.height(0.1, context),
                padding: EdgeInsets.only(
                  bottom: MQuery.height(0.025, context)
                ),
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Palette.pinkAccent,
                    elevation: 5,
                    child: Icon(CupertinoIcons.chevron_right_2, color: Colors.white),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onPressed: (){
                      if(_codeController.text == ""){
                        setState(() {
                          isError = true;
                        });
                      } else {

                      }
                    },
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}