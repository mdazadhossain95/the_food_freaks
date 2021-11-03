import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';

import 'package:the_food_freaks/src/screens/addtocart.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          // const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Cookie mint', '\$3.99', 'images/food_1.jpg',
                      false, false, context),
                  _buildCard('Cookie cream', '\$5.99', 'images/food_2.jpg',
                      true, false, context),
                  _buildCard('Cookie classic', '\$1.99', 'images/food_3.jpg',
                      false, true, context),
                  _buildCard('Cookie choco', '\$2.99', 'images/food_4.jpg',
                      false, false, context)
                ],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      productprice: price,
                      productname: name, add: 0,)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? const Icon(Icons.favorite, color: kColor1)
                                : const Icon(Icons.favorite_border,
                                    color: kColor1)
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  const SizedBox(height: 7.0),
                  Text(price,
                      style: const TextStyle(
                          color: kColor1,
                          fontFamily: 'Oswald',
                          fontSize: 14.0)),
                  Text(name,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Oswald',
                          fontSize: 14.0)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: kBackgroundColor, height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              const Icon(Icons.shopping_basket,
                                  color: kColor1, size: 12.0),
                              const Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      color: kColor1,
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              const Icon(Icons.remove_circle_outline,
                                  color: kColor1, size: 12.0),
                              const Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Oswald',
                                      color: kColor1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              const Icon(Icons.add_circle_outline,
                                  color: kColor1, size: 12.0),
                            ]
                          ]))
                ]))));
  }
}
