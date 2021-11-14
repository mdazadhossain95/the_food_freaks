import 'package:flutter/material.dart';

//pages
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/user/profileScreenTest.dart';
import 'package:the_food_freaks/src/user/profile_screen.dart';
import 'package:the_food_freaks/src/screens/settings_screen.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: kColor1,
            ),
            accountName: Text('Azad Hossain'),
            accountEmail: Text('mdazadhossain95@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: kColor2,
              backgroundImage: NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/people-avatars-2/64/Avatars_39-512.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const CustomText(text: 'Profile', size: 16,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ProfileScreenTest()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const CustomText(text: 'Settings', size: 16,),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
