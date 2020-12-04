import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {

    String userEmail;
    String userName;

    final userProfileData = Provider.of<List<UserProfileModel>>(context);

    //cycles
    userProfileData.forEach((element) { 
      //user avatar
      userEmail = element.email;
      userName = element.userName;
    });

    if(userEmail.length > 30){
      userEmail = userEmail.substring(0,30) + '...';
    }

    if(userName.length > 20){
      userEmail = userName.substring(0,20) + '...';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.12,
          child: CircleAvatar(
            child: Image(image: NetworkImage('')),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0),
        Text('$userName', 
          style: TextStyle(
          fontWeight: FontWeight.w900, fontSize: 18
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0),
        Text('$userEmail', 
          style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 14
          ),
        ),                                                            
      ],
    );                     
  }
}

class WithdrawInfo extends StatefulWidget {
  @override
  _WithdrawInfoState createState() => _WithdrawInfoState();
}

class _WithdrawInfoState extends State<WithdrawInfo> {
  @override
  Widget build(BuildContext context) {
    
    String currentCredit;

    final userProfileCredit = Provider.of<List<UserProfileModel>>(context);

    //cycles
    userProfileCredit.forEach((element) { 
      currentCredit = element.credit;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (currentCredit != null)?
          Text('$currentCredit', 
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ) :
          Text('', 
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          )                                                         
      ],
    );         
  }
}

class PackInfo extends StatefulWidget {
  @override
  _PackInfoState createState() => _PackInfoState();
}

class _PackInfoState extends State<PackInfo> {
  @override
  Widget build(BuildContext context) {
    int currentAmount;

    final userProfileCredit = Provider.of<List<UserProfileModel>>(context);

    //cycles
    userProfileCredit.forEach((element) { 
      currentAmount = element.amount;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$currentAmount', 
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 32
          ),
        )                                                          
      ],
    );       
  }
}
