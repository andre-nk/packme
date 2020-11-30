import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:flutter/rendering.dart';
import "package:hexcolor/hexcolor.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pack_me/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserProfileFull extends StatefulWidget {
  @override
  _UserProfileFullState createState() => _UserProfileFullState();
}

class _UserProfileFullState extends State<UserProfileFull> {
  @override
  Widget build(BuildContext context) {

    // UserData user = Provider.of<UserData>(context);
    void _changePassword(String password) async{
   //Create an instance of the current user. 
      User _auth = FirebaseAuth.instance.currentUser;
      FirebaseAuth _authSystem = FirebaseAuth.instance;
      //Pass in the password to updatePassword.
      _auth.updatePassword(password).then((_){
        print("Succesfull changed password");
        _authSystem.signOut();
      }).catchError((error){
        print("Password can't be changed" + error.toString());
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    }

    String userEmail;
    String userName;
    String userPhone;
    String userPassword;
    String userAddress;
    String userQR; 
    String userUID;
    String oldPass;
    String oldPassMatcher;

    final userProfileFullData = Provider.of<List<UserProfileModel>>(context);
    userProfileFullData.forEach((element) { 
      //user avatar
      userEmail = element.email;
      userName = element.userName;
      userPhone = element.phoneNumber;
      userPassword = element.password;
      userAddress = element.userAddress;
      userQR = element.userQR;
      userUID = element.uid;
      oldPassMatcher = element.password;
    });

    return StreamBuilder<List<UserProfileModel>>(
        stream: DatabaseService().userProfile,
        builder: (context, snapshot){
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0,0,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(  
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Stack(
                        children:[
                          Positioned(
                            top: 0,
                            left: MediaQuery.of(context).size.width * 0.415,
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(''),
                              backgroundColor: Colors.red,
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.1,
                            left: MediaQuery.of(context).size.width * 0.53,
                            height: MediaQuery.of(context).size.height * 0.042,
                            width: MediaQuery.of(context).size.width * 0.07,
                            child: ClipOval(
                              child: Material(
                                color: HexColor('#B9EEDC'), // button color
                                child: InkWell(
                                  splashColor: Colors.red, // inkwell color
                                  child: Container(width: 20, height: 20, child: Icon(Feather.edit_2, size: 14)),
                                  onTap: () {},
                                ),
                              ),
                            )                      ),
                        ]
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            top: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nama',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Text('$userName',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300
                                )
                              ),
                            ],
                          ),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)
                                  )
                                ),
                                content: Container(
                                        height: MediaQuery.of(context).size.height * 0.3,
                                        width: MediaQuery.of(context).size.width * 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Ganti Nama Pengguna',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor('#ECFBF4'),
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(67, 209, 165, 0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 50,
                                                        
                                                      )
                                                    ]
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                                                    isDense: true,
                                                    border: InputBorder.none,
                                                    hintText: "$userName",
                                                    hintStyle: GoogleFonts.poppins(
                                                      color: Colors.grey[500], fontSize: 18
                                                    )
                                                  ),
                                                  validator: (val) => val.isEmpty ? 'Masukkan nama pengguna baru' : null,
                                                  onChanged: (val) {
                                                    setState(() => userName = val);
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.065,
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                child: RaisedButton(
                                                  child: Text('Ganti',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500
                                                    )
                                                  ),
                                                  color: HexColor('#FF8787'),
                                                  onPressed: () async{
                                                    await DatabaseService(uid: userUID).updateUserData(
                                                      userUID,
                                                      userAddress,
                                                      userQR,
                                                      userPassword,
                                                      userName,
                                                      userPhone,
                                                      userEmail
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(45.0)
                                                    )
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                ),
                              )
                            );
                          },  
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('E-mail',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Text('$userEmail', //IF EMAIL > X LETTER => CUT WITH ... 
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300
                                )
                              ),
                            ],
                          ),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)
                                  )
                                ),
                                content: Container(
                                        height: MediaQuery.of(context).size.height * 0.3,
                                        width: MediaQuery.of(context).size.width * 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Ganti Alamat E-mail',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor('#ECFBF4'),
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(67, 209, 165, 0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 50,
                                                        
                                                      )
                                                    ]
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                                                    isDense: true,
                                                    border: InputBorder.none,
                                                    hintText: "$userEmail",
                                                    hintStyle: GoogleFonts.poppins(
                                                      color: Colors.grey[500], fontSize: 18
                                                    )
                                                  ),
                                                  validator: (val) => val.isEmpty ? 'Masukkan e-mail baru' : null,
                                                  onChanged: (val) {
                                                    setState(() => userEmail = val);
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.065,
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                child: RaisedButton(
                                                  child: Text('Ganti',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500
                                                    )
                                                  ),
                                                  color: HexColor('#FF8787'),
                                                  onPressed: () async{
                                                    await DatabaseService(uid: userUID).updateUserData(
                                                      userUID,
                                                      userAddress,
                                                      userQR,
                                                      userPassword,
                                                      userName,
                                                      userPhone,
                                                      userEmail
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(45.0)
                                                    )
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                ),
                              )
                            );
                          },  
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('No. Telepon',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Text('$userPhone',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300
                                )
                              ),
                            ],
                          ),  
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)
                                  )
                                ),
                                content: Container(
                                        height: MediaQuery.of(context).size.height * 0.3,
                                        width: MediaQuery.of(context).size.width * 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Ganti Nomor Telepon',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor('#ECFBF4'),
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(67, 209, 165, 0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 50,
                                                        
                                                      )
                                                    ]
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                                                    isDense: true,
                                                    border: InputBorder.none,
                                                    hintText: "$userPhone",
                                                    hintStyle: GoogleFonts.poppins(
                                                      color: Colors.grey[500], fontSize: 18
                                                    )
                                                  ),
                                                  validator: (val) => val.isEmpty ? 'Masukkan nomor telepon baru' : null,
                                                  onChanged: (val) {
                                                    setState(() => userPhone = val);
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.065,
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                child: RaisedButton(
                                                  child: Text('Ganti',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500
                                                    )
                                                  ),
                                                  color: HexColor('#FF8787'),
                                                  onPressed: () async{
                                                    await DatabaseService(uid: userUID).updateUserData(
                                                      userUID,
                                                      userAddress,
                                                      userQR,
                                                      userPassword,
                                                      userName,
                                                      userPhone,
                                                      userEmail
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(45.0)
                                                    )
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                ),
                              )
                            );
                        },
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Password',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Icon(Feather.chevron_right, color: HexColor('#030835')),
                            ],
                          ),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)
                                  )
                                ),
                                content: Container(
                                        height: MediaQuery.of(context).size.height * 0.55,
                                        width: MediaQuery.of(context).size.width * 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Ganti Password',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                )
                                              ),
                                              Center(child: 
                                                Text('Akun akan keluar setelah password diganti',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                  )
                                                )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor('#ECFBF4'),
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(67, 209, 165, 0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 50,
                                                        
                                                      )
                                                    ]
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.fromLTRB(15,10,15,10),
                                                    isDense: true,
                                                    border: InputBorder.none,
                                                    hintText: "Password lama",
                                                    hintStyle: GoogleFonts.poppins(
                                                      color: Colors.grey[500], fontSize: 18
                                                    )
                                                  ),
                                                  validator: (val) => val.isEmpty ? '' : null,
                                                  onChanged: (val) {
                                                    setState(() => oldPass = val);
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor('#ECFBF4'),
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(67, 209, 165, 0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 50,
                                                        
                                                      )
                                                    ]
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.fromLTRB(15,10,15,10),
                                                    isDense: true,
                                                    border: InputBorder.none,
                                                    hintText: "Password baru",
                                                    hintStyle: GoogleFonts.poppins(
                                                      color: Colors.grey[500], fontSize: 18
                                                    )
                                                  ),
                                                  validator: (val) => val.isEmpty ? '' : null,
                                                  onChanged: (val) {
                                                    setState(() => userPassword = val);
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.06,
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                child: RaisedButton(
                                                  child: Text('Ganti',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500
                                                    )
                                                  ),
                                                  color: HexColor('#FF8787'),
                                                  onPressed: () async{
                                                    if(oldPass == oldPassMatcher){
                                                      _changePassword(userPassword);
                                                      await DatabaseService(uid: userUID).updateUserData(
                                                        userUID,
                                                        userAddress,
                                                        userQR,
                                                        userPassword,
                                                        userName,
                                                        userPhone,
                                                        userEmail
                                                      );
                                                      oldPassMatcher = userPassword;
                                                      Navigator.pop(context);
                                                    }else{
                                                      return Text('Password lama tidak sesuai');
                                                    }
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(45.0)
                                                    )
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                            ],
                                          ),
                                        ),
                                ),
                              )
                            );
                          },  
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alamat',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Icon(Feather.chevron_right, color: HexColor('#030835')),
                            ],
                          ),  
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)
                                  )
                                ),
                                content: Container(
                                        height: MediaQuery.of(context).size.height * 0.55,
                                        width: MediaQuery.of(context).size.width * 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Ganti Alamat',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor('#ECFBF4'),
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(67, 209, 165, 0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 50,
                                                        
                                                      )
                                                    ]
                                                ),
                                                child: TextFormField(
                                                  minLines: 4,
                                                  maxLines: 10,
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.fromLTRB(15,10,15,10),
                                                    isDense: true,
                                                    border: InputBorder.none,
                                                    hintText: "$userAddress",
                                                    hintStyle: GoogleFonts.poppins(
                                                      color: Colors.grey[500], fontSize: 18
                                                    )
                                                  ),
                                                  validator: (val) => val.isEmpty ? '' : null,
                                                  onChanged: (val) {
                                                    setState(() => userAddress = val);
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.06,
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                child: RaisedButton(
                                                  child: Text('Ganti',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500
                                                    )
                                                  ),
                                                  color: HexColor('#FF8787'),
                                                  onPressed: () async{
                                                    await DatabaseService(uid: userUID).updateUserData(
                                                      userUID,
                                                      userAddress,
                                                      userQR,
                                                      userPassword,
                                                      userName,
                                                      userPhone,
                                                      userEmail
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(45.0)
                                                    )
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                            ],
                                          ),
                                        ),
                                ),
                              )
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('QR Code',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              Icon(Feather.chevron_right, color: HexColor('#030835')),
                            ],
                          ),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)
                                  )
                                ),
                                content: Container(
                                        height: MediaQuery.of(context).size.height * 0.75,
                                        width: MediaQuery.of(context).size.width * 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('QR Code Pribadi',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                                )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor('#ECFBF4'),
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(67, 209, 165, 0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 50,
                                                      )
                                                    ]
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                                      Image(
                                                        image:  NetworkImage(
                                                        'https://api.qrserver.com/v1/create-qr-code/?data=pack-me-user-$userUID&amp;size=500x500'
                                                        ),
                                                      ),
                                                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                                      Text('pack-me-user-$userUID',
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                                    ],
                                                  ),
                                                )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                              Text('Gunakan QR Code Pribadi ini atau masukkan kode pribadi Anda untuk memindah tangankan suatu aktivitas peminjaman pack kami ke orang lain.',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14
                                                ),
                                                textAlign: TextAlign.center,
                                              ),

                                            ],
                                          ),
                                        ),
                                ),
                              )
                            );
                          },  
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Hapus akun',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            ],
                          ),
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)
                                  )
                                ),
                                content: Container(
                                            height: MediaQuery.of(context).size.height * 0.4,
                                            width: MediaQuery.of(context).size.width * 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('Apakah Anda yakin mau hapus akun ini?',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                                  Text('Semua dana kredit dan peminjaman Anda akan terhapus',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                                        child: Container(
                                                          height: MediaQuery.of(context).size.height * 0.06,
                                                          width: MediaQuery.of(context).size.width * 0.3,
                                                          child: RaisedButton(
                                                            child: Text('Ya',
                                                              style: GoogleFonts.poppins(
                                                                color: Colors.white,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w500
                                                              )
                                                            ),
                                                            color: HexColor('#FF8787'),
                                                            onPressed: () async{
                                                              User _auth = FirebaseAuth.instance.currentUser;
                                                              _auth.delete();
                                                            },
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(45.0)
                                                              )
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      
                                                      Container(
                                                        height: MediaQuery.of(context).size.height * 0.06,
                                                        width: MediaQuery.of(context).size.width * 0.3,
                                                        child: RaisedButton(
                                                          child: Text('Tidak',
                                                            style: GoogleFonts.poppins(
                                                              color: Colors.black,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500
                                                            )
                                                          ),
                                                          color: HexColor('#ECFBF4'),
                                                          onPressed: () async{
                                                            User _auth = FirebaseAuth.instance.currentUser;
                                                            _auth.delete();
                                                          },
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(45.0)
                                                            )
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                ),
                              )
                            );
                          },  
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      decoration: new BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(width: 1, color: HexColor('#C7F1E4')),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2,4,4,0),
                        child: ListTile(
                          tileColor: HexColor('#FFFFFF'),
                          leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Icon(Feather.settings, color: HexColor('#030835')),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Log out',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            ],
                          ),  
                        ),
                      ),
                    )  
                  ],
                )
              )
            ],
          );
        } 
    );
  }
}