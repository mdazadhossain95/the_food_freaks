import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/cart.dart';
import 'package:the_food_freaks/src/screens/favorite.dart';
import 'package:the_food_freaks/src/screens/menu_screen.dart';
import 'package:the_food_freaks/src/state/cart_state.dart';
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
  bool _init = true;
  // var cart;
  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<CartState>(context).getCartDatas();
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // var items = Provider.of<ProductState>(context);
    var cart;
    cart = Provider.of<CartState>(context);
    if (cart != null) {
      cart = cart.cartModel;
    }
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 14.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
                },
                child: Badge(
                  badgeContent: Text(
                    cart!.isEmpty
                        ? '0'
                        : cart[0].cartproducts.length.toString(),
                    // '',
                    style: const TextStyle(
                      color: kWhite,
                    ),
                  ),
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ],
        ),
        drawer: const MenuScreen(),
        body: MainTab(),
      ),
    );
  }
}
