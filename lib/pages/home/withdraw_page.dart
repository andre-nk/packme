part of "../pages.dart";

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({ Key? key }) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {

  TextEditingController withdrawController = TextEditingController();
  TextEditingController creditCardController1 = TextEditingController();
  TextEditingController creditCardController2 = TextEditingController();
  TextEditingController creditCardController3 = TextEditingController();
  TextEditingController creditCardController4 = TextEditingController();
  List<String> paymentMethods = [
    "Credit Card",
    "ovo",
    "gopay",
    "dana"
  ];
  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
        title: GFont.out(
          title: "Penarikan Saldo PackMe",
          fontSize: 18,
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
          padding: EdgeInsets.all(MQuery.height(0.025, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GFont.out(
                    title: "jumlah penarikan:",
                    fontSize: 18,
                    fontWeight: FontWeight.normal
                  ),
                  Row(
                    children: [
                      GFont.out(
                        title: "Rp.",
                        fontSize: 24,
                        fontWeight: FontWeight.normal
                      ),
                      SizedBox(width: MQuery.width(0.015, context)),
                      Expanded(
                        flex: 8,
                        child: TextField(
                          controller: withdrawController,
                          keyboardType: TextInputType.number,
                          style: GFont.style(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),  
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: Palette.greenAccent),   
                            ),  
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Palette.pinkShade),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MQuery.height(0.015, context)),
                  Row(
                    children: [
                      GFont.out(
                        title: "dari total saldo: ",
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                      ),
                      SizedBox(width: MQuery.width(0.005, context)),
                      GFont.out(
                        title: "Rp215.250",
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ],
                  ),
                  SizedBox(height: MQuery.height(0.03, context)),
                  GFont.out(
                    title: "Metode",
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  SizedBox(height: MQuery.height(0.005, context)),
                  Container(
                    height: MQuery.height(0.075, context),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: paymentMethods.length,
                      itemBuilder: (context, index){
                        return Row(
                          children: [
                            Container(
                              height: MQuery.height(0.06, context),
                              child: ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    selectedMethod = index;
                                  });
                                },
                                child: index == 0
                                ? GFont.out(
                                    title: paymentMethods[index],
                                    fontSize: 16,
                                    color: selectedMethod == index ? Colors.white : Colors.black,
                                    fontWeight: selectedMethod == index ? FontWeight.bold : FontWeight.normal
                                  )
                                : Image.asset("assets/${paymentMethods[index]}.png", fit: BoxFit.fitHeight, scale: index == 3 ? 1.5 : null),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: index == 1
                                  ? EdgeInsets.symmetric(vertical: 15, horizontal: 15)
                                  : index == 2
                                    ? EdgeInsets.symmetric(vertical: 5, horizontal: 15)
                                    : null,
                                  primary:  selectedMethod == index ? Palette.greenAccent : Colors.grey[100],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                                ),
                              ),
                            ),
                            SizedBox(width: MQuery.width(0.02, context)),
                          ],
                        );
                      },
                    )
                  ),
                  SizedBox(height: MQuery.height(0.03, context)),
                  Container(
                    width: double.infinity,
                    height: MQuery.height(0.165, context),
                    padding: EdgeInsets.all(
                      MQuery.height(0.02, context),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(
                        color: Palette.greenAccent
                      )
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          GFont.out(
                            title: "Nomor kartu kredit:",
                            fontSize: 16
                          ),
                          SizedBox(height: MQuery.height(0.01, context)),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: creditCardController1,
                                  keyboardType: TextInputType.number,
                                  style: GFont.style(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                  ),  
                                  decoration: InputDecoration(
                                    hintText: "   XXXX",
                                    hintStyle: GFont.style(
                                      fontSize: 18,
                                      color: Palette.blackColor.withOpacity(0.25)
                                    ),
                                    enabledBorder: UnderlineInputBorder(      
                                      borderSide: BorderSide(color: Palette.greenAccent),   
                                    ),  
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Palette.pinkShade),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MQuery.width(0.02, context),
                                child: GFont.out(
                                  title: "-",
                                  fontSize: 16
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: creditCardController2,
                                  keyboardType: TextInputType.number,
                                  style: GFont.style(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                  ),  
                                  decoration: InputDecoration(
                                    hintText: "   XXXX",
                                    hintStyle: GFont.style(
                                      fontSize: 18,
                                      color: Palette.blackColor.withOpacity(0.25)
                                    ),
                                    enabledBorder: UnderlineInputBorder(      
                                      borderSide: BorderSide(color: Palette.greenAccent),   
                                    ),  
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Palette.pinkShade),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MQuery.width(0.02, context),
                                child: GFont.out(
                                  title: "-",
                                  fontSize: 16
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: creditCardController3,
                                  keyboardType: TextInputType.number,
                                  style: GFont.style(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                  ),  
                                  decoration: InputDecoration(
                                    hintText: "   XXXX",
                                    hintStyle: GFont.style(
                                      fontSize: 18,
                                      color: Palette.blackColor.withOpacity(0.25)
                                    ),
                                    enabledBorder: UnderlineInputBorder(      
                                      borderSide: BorderSide(color: Palette.greenAccent),   
                                    ),  
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Palette.pinkShade),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MQuery.width(0.02, context),
                                child: GFont.out(
                                  title: "-",
                                  fontSize: 16
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: creditCardController4,
                                  keyboardType: TextInputType.number,
                                  style: GFont.style(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                  ),  
                                  decoration: InputDecoration(
                                    hintText: "   XXXX",
                                    hintStyle: GFont.style(
                                      fontSize: 18,
                                      color: Palette.blackColor.withOpacity(0.25)
                                    ),
                                    enabledBorder: UnderlineInputBorder(      
                                      borderSide: BorderSide(color: Palette.greenAccent),   
                                    ),  
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Palette.pinkShade),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: MQuery.height(0.08, context),
                width: double.infinity,
                margin: EdgeInsets.only(
                  bottom: MQuery.height(0.04, context)
                ),
                child: ElevatedButton(
                  onPressed: (){
                    if(int.parse(withdrawController.text) > 215250){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Palette.alertColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          behavior: SnackBarBehavior.floating,
                          content: Container(
                            height: MQuery.height(0.03, context),
                            child: Center(
                              child: GFont.out(
                                title: "Nominal penarikan melebihi saldo PackMe kamu!",
                                fontSize: 18,
                                color: Palette.whiteColor
                              )
                            ),
                          ),
                        )
                      );
                    }
                  },
                  child: GFont.out(
                    title: "Konfirmasi Penarikan",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Palette.whiteColor
                  ),  
                  style: ElevatedButton.styleFrom(
                    primary: Palette.pinkAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)
                    )
                  )
                )
              )
            ]
          ),
        )
      )
    );
  }
}