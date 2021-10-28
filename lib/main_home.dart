import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//pages
import '../constants.dart';
import 'package:the_food_freaks/screens/menu_screen.dart';
import 'package:the_food_freaks/tabs_screen.dart';
import 'package:the_food_freaks/search_bar.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'The Food Freaks',
        ),
        backgroundColor: kColor1,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const MenuScreen(),
      body: TabsScreen(),
    );
  }
}
