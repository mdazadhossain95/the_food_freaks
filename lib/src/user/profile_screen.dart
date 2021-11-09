import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/models/info_profile.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

const name = 'Md Azad Hossain Tutul';
const email = 'mdazadhossain95@gmail.com';
const phone = '+880 1626364610';
const address = 'Divine IT Ltd, Uttora-10, Dhaka';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: kColor1,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(text: 'Profile', size: 25,),
                ),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/food_5.jpg'),
                  ),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(text: 'Name', size: 20),
                    ),
                    InformationProfile(text: name, onPressed: (){

                    }),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(text: 'Email', size: 20),
                    ),
                    InformationProfile(text: email, onPressed: (){

                    }),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(text: 'Phone', size: 20,),
                    ),
                    InformationProfile(text: phone, onPressed: (){

                    }),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(text: 'Address', size: 20,),
                    ),
                    InformationProfile(text: address, onPressed: (){

                    }),

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