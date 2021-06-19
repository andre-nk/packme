part of '../pages.dart';
class CTAAuthPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MQuery.width(0.025, context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MQuery.width(0.45, context),
                height: MQuery.height(0.06, context),
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/logo_wide.png",
                      fit: BoxFit.fitHeight,
                      height: MQuery.height(0.1, context),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(3),
                      icon: Icon(CupertinoIcons.info_circle),
                      onPressed: (){
                        Get.Get.to(() => HelpPage(), transition: Get.Transition.cupertino);
                      },
                    )
                  ],
                )
              ),
              Container(
                height: MQuery.width(0.45, context),
                width: MQuery.height(0.45, context),
                color: Colors.grey.withOpacity(0.1),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {},
                    child: Image(
                        image: AssetImage("assets/facebook-icon.png")),
                  ),
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: (){
                      BlocProvider.of<AuthenticationCubit>(context).signUpWithGoogle();
                    },
                    child:
                        Image(image: AssetImage("assets/google-icon.png")),
                  ),
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {},
                    child:
                        Image(image: AssetImage("assets/apple-icon.png")),
                  )
                ],
              ),
              SizedBox(height: MQuery.height(0.005, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: MQuery.width(0.19, context),
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MQuery.width(0.02, context)),
                      child: GFont.out(
                        title: "atau",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: MQuery.width(0.19, context),
                      height: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              SizedBox(height: MQuery.height(0.005, context)),
              Container(
                width: MQuery.width(0.475, context),
                height: MQuery.height(0.08, context),
                child: DefaultButton(
                  title: GFont.out(
                      title: "Daftar pakai E-mail",
                      fontSize: 20,
                      color: Palette.whiteColor,
                      fontWeight: FontWeight.bold),
                  method: () {
                    Get.Get.to(() => SignUpWithEmailPage(),transition: Get.Transition.cupertino);
                  },
                  color: Palette.pinkAccent,
                ),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFont.out(
                    title: "Udah punya akun?",
                    fontSize: 16,
                  ),
                  InkWell(
                    child: GFont.out(
                        title: " Masuk aja!",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    onTap: (){
                      Get.Get.to(() => SignInPage(), transition: Get.Transition.cupertino);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
