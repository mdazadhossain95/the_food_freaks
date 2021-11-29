import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/cart.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductState>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: 'Product Details',
          size: 18,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 14.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              },
              child: Badge(
                badgeContent: Text(
                  items.getCartQty().toString(),
                  style: const TextStyle(
                    color: kWhite,
                  ),
                ),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),

        ],
        backgroundColor: kColor1,
      ),
      body: ListView(
        children: [
          //picture
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                "http://10.0.2.2:8000${items.activeProduct.image}",
                height: 300.0,
                width: 70.0,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //product name
                CustomText(
                    text: items.activeProduct.title,
                    size: 22.0,
                    weight: FontWeight.bold),

                //product price
                CustomText(
                    text: "\$${items.activeProduct.price.toString()}",
                    size: 22.0,
                    weight: FontWeight.bold)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: 'Description', size: 16),
                Row(
                  children: [
                    //product ratings
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomText(
                          text: items.activeProduct.rating.toString() + '/5',
                          color: kBlack,
                          size: 14),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.star,
                      color: kColor1,
                      size: 16,
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //product description
                Center(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    child: CustomText(
                      text: items.activeProduct.description,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 100,
                    width: 100,
                    child: FittedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          items.addOneItemToCart(
                            items.activeProduct);
                          const snackBar = SnackBar(
                            content: Text('Food Added to your cart. Click Cart icon to check.'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(kColor1),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: const CustomText(
                          text: 'Add to Cart',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








// FloatingActionButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => Cart(),
// ),
// );
// },
// child: const Icon(
// Icons.shopping_cart,
// size: 25.0,
// color: kWhite,
// ),
// backgroundColor: kColor1,
// ),
