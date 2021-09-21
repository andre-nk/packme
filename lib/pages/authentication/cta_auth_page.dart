part of '../pages.dart';
class CTAAuthPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthCubit, AuthState>(
        child: SafeArea(
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
                          Navigator.push(
                            context,
                            PageTransition(child: HelpPage(), type: PageTransitionType.rightToLeftWithFade)
                          );
                        },
                      )
                    ],
                  )
                ),
                SizedBox(height: MQuery.height(0.1, context)),
                Container(
                  height: MQuery.width(0.25, context),
                  width: MQuery.height(0.25, context),
                  child: Spin(
                    infinite: true,
                    child: Image.asset("assets/recycle_2.png")
                  ),
                ),
                SizedBox(height: MQuery.height(0.075, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 48,
                        child: Image(image: AssetImage("assets/facebook.png"))
                      ),
                    ),
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: (){
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        child: Image(image: AssetImage("assets/google.png"))
                      ),
                    ),
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 48,
                        child: Image(image: AssetImage("assets/apple.png"))
                      ),
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
                      fontWeight: FontWeight.bold
                    ),
                    method: () {
                      Navigator.push(
                        context,
                        PageTransition(child: SignUpWithEmailPage(), type: PageTransitionType.rightToLeftWithFade)
                      );
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
                        fontWeight: FontWeight.bold
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(child: SignInPage(), type: PageTransitionType.rightToLeftWithFade)
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        listener: (context, state){
          if(state is AuthSuccess){
            Navigator.pushAndRemoveUntil(
              context,
              PageTransition(child: HomePage(), type: PageTransitionType.rightToLeftWithFade),
              (route) => false
            );
          } else if (state is AuthFailed) {
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
                      title: state.error,
                      fontSize: 18,
                      color: Palette.whiteColor
                    ),
                  )
                ),
              )
            );
          }
        }
      )
    );
  }
}
