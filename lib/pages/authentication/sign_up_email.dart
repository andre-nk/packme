part of "../pages.dart";

class SignUpWithEmailPage extends StatefulWidget {
  @override
  _SignUpWithEmailPageState createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {

  TextEditingController nameController = TextEditingController();
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
        child: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state){
            return SingleChildScrollView(
              child: Container(
                height: MQuery.height(0.775, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GFont.out(
                      title: "Daftar pakai E-mail",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    TextFormField(
                      cursorColor: Palette.greenWidget,
                      controller: nameController,
                      decoration: InputDecoration(                
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                        ),
                        hintText: "Nama lengkap kamu",
                        hintStyle: GFont.style(
                          color: Colors.grey
                        ),
                        labelText: "Nama lengkap kamu",
                        labelStyle: GFont.style(fontSize: 18),
                      ),
                      style: GFont.style(
                        height: 2,
                        fontSize: 18
                      ),
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
                          title: "Daftar",
                          fontSize: 20,
                          color: Palette.whiteColor,
                          fontWeight: FontWeight.bold
                        ),
                        method: (){
                          context.read<AuthCubit>().signIn(email: emailController.text, password: pass1Controller.text);
                        },
                        color: Palette.pinkAccent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
      ),
    );
  }
}