part of "../pages.dart";

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();

  bool _obscurePass1 = true;

  @override
  Widget build(BuildContext context) {
    return BackFramePage(
      child: Padding(
        padding: EdgeInsets.only(
          left: MQuery.width(0.05, context),
          bottom: MQuery.width(0.05, context),
          right: MQuery.width(0.05, context),
          top: MQuery.height(0.005, context)
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MQuery.height(0.775, context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GFont.out(
                  title: "Masuk dulu yuk!",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: MQuery.height(0.01, context)),
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
                        BlocProvider.of<AuthCubit>(context).signUpWithGoogle();
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
                      flex: 3,
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
                      flex: 3,
                      child: Container(
                        width: MQuery.width(0.19, context),
                        height: 1,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                TextFormField(
                  cursorColor: Palette.greenWidget,
                  controller: emailController,
                  decoration: InputDecoration(                
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "E-mail",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "E-mail",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
                TextFormField(
                  onSaved: (val) => pass1Controller.text = val ?? "",
                  validator: (val){
                    if(val!.length < 6){
                      return "Kata sandi kamu terlalu pendek";
                    }else{
                      return null;
                    }
                  },
                  obscureText: _obscurePass1,
                  cursorColor: Palette.greenWidget,
                  controller: pass1Controller,
                  decoration: InputDecoration(     
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _obscurePass1 = !_obscurePass1;                      
                        });
                      },
                      icon: _obscurePass1
                        ? Icon(Icons.remove_red_eye_outlined, color: Palette.pinkAccent)
                        : Icon(Icons.remove_red_eye_rounded, color: Palette.pinkAccent)
                    ),               
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Kata sandi",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "Kata sandi",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
                SizedBox(
                  height: MQuery.height(0.01, context),
                ),       
                Container(
                  margin: EdgeInsets.only(bottom: MQuery.height(0.01, context)),
                  width: MQuery.width(0.475, context),
                  height: MQuery.height(0.08, context),
                  child: DefaultButton(
                    title: GFont.out(
                      title: "Masuk",
                      fontSize: 20,
                      color: Palette.whiteColor,
                      fontWeight: FontWeight.bold
                    ),
                    method: () async {
                      if(pass1Controller.text != ""){
                        if(emailController.text != ""){
                          context.read<AuthCubit>().signInWithEmailAndPassword(
                            emailController.text.trim(),
                            pass1Controller.text.trim(),
                          );
                        }                   
                      }   
                    },
                    color: Palette.pinkAccent,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFont.out(
                      title: "Lupa kata sandi?",
                      fontSize: 16,
                    ),
                    InkWell(
                      child: GFont.out(
                        title: " Klik disini!",
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(child: ResetPasswordPage(), type: PageTransitionType.rightToLeftWithFade)
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}