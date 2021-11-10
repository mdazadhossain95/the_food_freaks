import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/screens/payment.dart';
import 'package:the_food_freaks/src/tabs/home_tab.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:the_food_freaks/src/widgets/iconbutton.dart';

Future<List<Product>> ReadJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('jsonfiles/productlist.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => Product.fromJson(e)).toList();
}

class Cart extends StatefulWidget {
  // const Cart({Key? key}) : super(key: key);
  final assetPath;
  final productprice;
  final productname;
  late int add = 1;
  final description;

  Cart({
    Key? key,
    this.assetPath,
    this.productprice,
    this.productname,
    this.description,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late final assetPaths;
  late final productprices;
  late final productnames;
  late int adds;
  late final description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetPaths = widget.assetPath;
    productprices = widget.productprice;
    productnames = widget.productname;
    adds = widget.add;
    description = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    int DeleveryCharge = 20;
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
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (_, index) {
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
                          Column(
                            children: [
                              Hero(
                                tag: assetPaths,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      assetPaths,
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomText(
                                    text: productnames,
                                    size: 18,
                                    weight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomText(text: productprices),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomText(text: description),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                        icon: Icons.remove,
                                        onPressed: () {
                                          setState(() {
                                            adds--;
                                          });
                                        }),
                                    CustomText(
                                      text: adds.toString(),
                                      size: 20,
                                    ),
                                    RoundIconButton(
                                        icon: Icons.add,
                                        onPressed: () {
                                          setState(() {
                                            adds++;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ],
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Subtotal'),
                      CustomText(text: productprices),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Delevery'),
                      CustomText(text: '20'),
                    ],
                  ),
                ),
                Divider(
                  color: kWhite,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Total'),
                      CustomText(text: '25.99'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
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
