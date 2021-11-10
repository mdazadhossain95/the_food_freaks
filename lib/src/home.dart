import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/cart.dart';
import 'package:the_food_freaks/src/screens/menu_screen.dart';
import 'package:the_food_freaks/src/tabs/main_tab.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class Home extends StatefulWidget {
  static const String id = 'Home_screen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      loggedInUser.email;
    }
  }

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
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  Cart();
                });
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
