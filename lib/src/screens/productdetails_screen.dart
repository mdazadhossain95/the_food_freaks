import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/connectivity_provider.dart';
import 'package:the_food_freaks/src/no_internet.dart';
import 'package:the_food_freaks/src/screens/cart.dart';
import 'package:the_food_freaks/src/state/cart_state.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // final TextEditingController _controller = TextEditingController();
  var cart = [];

  @override
  void initState() {
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductState>(context);
    cart = Provider.of<CartState>(context).cartModel;

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
                onTap: () {
                  if (items.cart.isEmpty) {}
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
                },
                child: Badge(
                  badgeContent: Text(
                    cart.isEmpty ? '0' : cart[0].cartproducts.length.toString(),
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
        body: pageUI());
  }

  Widget pageUI() {
    var items = Provider.of<ProductState>(context);
    var cart = Provider.of<CartState>(context).cartModel;

    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        // ignore: unnecessary_null_comparison
        if (model.isOnline != null) {
          return model.isOnline
              ? ListView(
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
                                    text:
                                        items.activeProduct.rating.toString() +
                                            '/5',
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
                                    // if don't have cart product then this section is working
                                    if (cart[0].cartproducts.isEmpty) {
                                      print('don\'t have cart product');
                                      Provider.of<CartState>(context,
                                              listen: false)
                                          .addtoCart(items.activeProduct.id);
                                      const snackBar = SnackBar(
                                        content: Text(
                                            'Food Added to your cart. Click Cart icon to check.'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      var cond;
                                      cond = cart[0]
                                          .cartproducts[0]
                                          .product[0]
                                          .vendor;

                                      if (cond != null) {
                                        if (cond !=
                                            items.activeProduct.vendor.id) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "This Food Isn't From Same Restaurant Do You Want To Delete Old Cart?"),
                                                  actions: [
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(kGrey),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text("No"),
                                                    ),
                                                    // delete cart product working
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(kColor1),
                                                      ),
                                                      onPressed: () {
                                                        Provider.of<CartState>(
                                                                context,
                                                                listen: false)
                                                            .deleteallcartproduct(
                                                                cart[0].id);

                                                        Navigator.of(context)
                                                            .pop();

                                                        const snackBar =
                                                            SnackBar(
                                                          content: Text(
                                                              'Old Cart Successfully Deleted Please Add Food Again..'),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      },
                                                      child: const Text("Yes"),
                                                    )
                                                  ],
                                                );
                                              });
                                        }
                                      }

                                      if (cond ==
                                          items.activeProduct.vendor.id) {
                                        Provider.of<CartState>(context,
                                                listen: false)
                                            .addtoCart(items.activeProduct.id);
                                        const snackBar = SnackBar(
                                          content: Text(
                                              'Food Added to your cart. Click Cart icon to check.'),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(kColor1),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                )
              : const NoInternet();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
