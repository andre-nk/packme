part of '../pages.dart';

class MitraProRegistration extends StatefulWidget {
  const MitraProRegistration({ Key? key }) : super(key: key);

  @override
  _MitraProRegistrationState createState() => _MitraProRegistrationState();
}

class _MitraProRegistrationState extends State<MitraProRegistration> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController usageController = TextEditingController();
  TextEditingController amountController = TextEditingController();

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
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GFont.out(
                title: "Daftar pakai E-mail",
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: MQuery.height(0.025, context)),
              Container(
                height: MQuery.height(0.125, context),
                child: TextFormField(
                  cursorColor: Palette.greenWidget,
                  controller: nameController,
                  decoration: InputDecoration(                
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Nama lengkap",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "Nama lengkap",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Container(
                height: MQuery.height(0.125, context),
                child: TextFormField(
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
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Container(
                height: MQuery.height(0.125, context),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  cursorColor: Palette.greenWidget,
                  controller: phoneController,
                  decoration: InputDecoration(                
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Nomor telepon",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "Nomor telepon",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Container(
                height: MQuery.height(0.125, context),
                child: TextFormField(
                  cursorColor: Palette.greenWidget,
                  controller: businessController,
                  decoration: InputDecoration(                
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Nama usaha",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "Nama usaha",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Container(
                height: MQuery.height(0.125, context),
                child: TextFormField(
                  cursorColor: Palette.greenWidget,
                  controller: addressController,
                  decoration: InputDecoration(                
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Alamat usaha",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "Alamat usaha",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Container(
                height: MQuery.height(0.125, context),
                child: TextFormField(
                  cursorColor: Palette.greenWidget,
                  controller: usageController,
                  decoration: InputDecoration(                
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Penggunaan PackMe di usaha Anda",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "Penggunaan PackMe di usaha Anda",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(height: MQuery.height(0.01, context)),
              Container(
                height: MQuery.height(0.125, context),
                child: TextFormField(
                  cursorColor: Palette.greenWidget,
                  controller: amountController,
                  decoration: InputDecoration(                
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Palette.greenWidget, width: 3.0),
                    ),
                    hintText: "Kuota Kemasan yang Biasa Dipakai (per bulan)",
                    hintStyle: GFont.style(
                      color: Colors.grey
                    ),
                    labelText: "Kuota Kemasan yang Biasa Dipakai (per bulan)",
                    labelStyle: GFont.style(fontSize: 18),
                  ),
                  style: GFont.style(
                    height: 2,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(
                height: MQuery.height(0.05, context),
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
                    
                  },
                  color: Palette.greenAccent,
                ),
              ),
            ],
          ),
        ),
      ),   
    );
  }
}