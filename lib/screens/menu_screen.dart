import 'package:flutter/material.dart';

//pages
import '../constants.dart';
import 'package:the_food_freaks/screens/order_screen.dart';
import 'package:the_food_freaks/screens/profile_screen.dart';
import 'package:the_food_freaks/screens/addresses_screen.dart';
import 'package:the_food_freaks/screens/settings_screen.dart';

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
            title: const Text('Order'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const OrderScreen()));
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ProfileScreen()));
            },
          ),
          ListTile(
            title: const Text('Addresses'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const AddressesScreen()));
            },
          ),
          ListTile(
            title: const Text('Settings'),
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
