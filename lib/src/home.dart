import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/favorite.dart';
import 'package:the_food_freaks/src/screens/main_cart.dart';
import 'package:the_food_freaks/src/screens/menu_screen.dart';
import 'package:the_food_freaks/src/tabs/main_tab.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

// Touhid
class Home extends StatefulWidget {
  // static const String id = 'Home_screen';
  static const routeName = '/home-screens';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const CustomText(
            text: 'The Food Freaks',
            size: 18,
          ),
          backgroundColor: kColor1,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteScreen()));
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainCart()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            )
          ],
        ),
        drawer: const MenuScreen(),
        body: MainTab(),
      ),
    );
  }
}
