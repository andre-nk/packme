part of '../pages.dart';

class CTAAuthPage extends StatefulWidget {
  @override
  _CTAAuthPageState createState() => _CTAAuthPageState();
}

class _CTAAuthPageState extends State<CTAAuthPage> {
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
                  height: MQuery.height(0.075, context),
                  color: Colors.grey,
                ),
                Container(
                  height: MQuery.width(0.425, context),
                  width: MQuery.height(0.45, context),
                  color: Colors.grey,
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
                      onTap: () {},
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
                    Container(
                      width: MQuery.width(0.19, context),
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MQuery.width(0.02, context)),
                      child: GFont.out(
                        title: "atau",
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: MQuery.width(0.19, context),
                      height: 1,
                      color: Colors.grey,
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
                      Get.to(() => SignUpWithEmailPage(),
                          transition: Transition.cupertino);
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
                        Get.to(() => SignInPage(), transition: Transition.cupertino);
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
