part of "../pages.dart";

class SignUpWithEmailPage extends StatefulWidget {

  final AuthenticationViewModel? viewModel;
  SignUpWithEmailPage({this.viewModel});

  @override
  _SignUpWithEmailPageState createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();

  bool _obscurePass1 = true;
  bool _obscurePass2 = true;

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
            TextFormField(
              onSaved: (val) => pass2Controller.text = val ?? "",
              validator: (val){
                if(val!.length < 6){
                  return "Kata sandi kamu terlalu pendek";
                }else if (pass1Controller.text == "" || val != pass1Controller.text){
                  return "Kata sandi tidak sama";
                }else{
                  return null;
                }
              },
              obscureText: _obscurePass2,
              cursorColor: Palette.greenWidget,
              controller: pass2Controller,
              decoration: InputDecoration(  
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _obscurePass2 = !_obscurePass2;                      
                    });
                  },
                  icon: _obscurePass2
                    ? Icon(Icons.remove_red_eye_outlined, color: Palette.pinkAccent)
                    : Icon(Icons.remove_red_eye_rounded, color: Palette.pinkAccent)
                ),              
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                ),
                hintText: "Konfirmasi kata sandi",
                hintStyle: GFont.style(
                  color: Colors.grey
                ),
                labelText: "Konfirmasi kata sandi",
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
                  if(nameController.text != ""){
                    if(emailController.text != ""){
                      if(pass1Controller.text == pass2Controller.text){
                        widget.viewModel!.signUpWithEmail(
                          email: emailController.text.trim(),
                          password: pass1Controller.text.trim(),
                        );
                      }
                    }
                  }   
                },
                color: Palette.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}