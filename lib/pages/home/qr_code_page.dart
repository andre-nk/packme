part of "../pages.dart";

class QRCodePage extends StatelessWidget {
  const QRCodePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        toolbarHeight: MQuery.height(0.07, context),
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(
            MQuery.height(0.02, context)
          ),
          height: MQuery.height(0.9, context),
          width: MQuery.width(1, context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset("assets/cross_border.svg"),
                  Image.asset("assets/qrcode_sample.png"),
                ],
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if(state is AuthSuccess){
                    return Column(
                      children: [
                        Center(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: MQuery.height(0.065, context),
                            width: MQuery.height(0.065, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Palette.pinkAccent
                            ),
                            child: Image.network(
                              state.user.profileURL ?? ""
                            )
                          ),
                        ),
                        SizedBox(height: MQuery.height(0.02, context)),
                        GFont.out(
                          title: state.user.name,
                          fontSize: 20,
                          color: Palette.blackColor,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.bold
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: Palette.greenAccent)
                    );
                  }
                },
              ),
              SizedBox(height: MQuery.height(0.005, context)),
              GFont.out(
                title: "packme-user-0001",
                fontSize: 18,
                color: Palette.blackColor,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.normal
              ),
            ]
          )
        )
      )
    );
  }
}