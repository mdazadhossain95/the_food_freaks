import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/home.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/screens/favorite.dart';
import 'package:the_food_freaks/src/screens/payment.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

Future<List<Product>> ReadJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('jsonfiles/productlist.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => Product.fromJson(e)).toList();
}

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductState>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kColor1,
        centerTitle: true,
        title: const CustomText(
          text: 'Cart',
          size: 18,
          weight: FontWeight.bold,
        ),
        actions: [
          IconButton(
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: items.cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kWhite,
                        boxShadow: const [
                          BoxShadow(
                              color: kColor1,
                              offset: Offset(1, 1),
                              blurRadius: 30)
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      "http://10.0.2.2:8000${items.cart[index].image}",
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomText(
                                      text: items.cart[index].title,
                                      size: 18,
                                      weight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomText(
                                      text:
                                          '\$${items.cart[index].price.toString()}'),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Do You Want to Delete This Food from your cart?"),
                                            actions: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          kGrey),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("No"),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kColor1),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  items.deleteOneItemToCart(
                                                      items.cart[index]);
                                                },
                                                child: const Text("Yes"),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon:
                                      const Icon(Icons.delete, color: kColor1),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      onPressed: () {
                                        items.removeOneItemToCart(
                                            items.cart[index]);
                                      },
                                      icon: const Icon(Icons.remove,
                                          color: Colors.red),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kWhite),
                                      ),
                                      child: Text(
                                        items.cart[index].quantity.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 30,
                                      onPressed: () {
                                        items.addOneItemToCart(
                                            items.cart[index]);
                                      },
                                      icon: const Icon(Icons.add,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text:
                                            '\$${items.cart[index].price * items.cart[index].quantity}'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: kWhite,
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: 'Total'),
                      CustomText(text: '\$${items.getTotalPrice()}'),
                      // TextField()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      items.deleteAllItemToCart();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Payment(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kColor2),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const CustomText(
                      text: 'Checkout',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
