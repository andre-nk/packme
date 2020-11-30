import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pack_me/ui/models/userProfileModel.dart';

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
    userProfileData.forEach((element) { 
      //user avatar
      userEmail = element.email;
      userName = element.userName;
    });

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