// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_food_freaks/fortest/cookie_detail.dart';
import 'package:the_food_freaks/fortest/cookie_page.dart';

import 'constants.dart';
import 'nested_page.dart';
import 'slider_screen.dart';

class TabOne extends StatelessWidget {
  const TabOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const SizedBox(height: 5.0),
          SliderScreen(),
          const SizedBox(height: 5.0),
          GestureDetector(
            child: const Text('Popular',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CookiePage(),
                ),
              );
            },
          ),
          const SizedBox(height: 10.0),
          NestedPage(),
          const SizedBox(height: 10.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 30.0,
              child: GridView.count(
                // shrinkWrap: true,
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                children: [
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
                  assetPath: imgPath, cookieprice: price, cookiename: name)));
        },
        child: Container(
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ], color: kColor3),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  isFavorite
                      ? const Icon(Icons.favorite, color: kColor1)
                      : const Icon(Icons.favorite_border, color: kColor1)
                ])),
            Hero(
                tag: imgPath,
                child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.contain)))),
            const SizedBox(height: 7.0),
            Text(price,
                style: const TextStyle(
                    color: kColor1, fontFamily: 'Oswald', fontSize: 14.0)),
            Text(name,
                style: const TextStyle(
                    color: kLabelColor, fontFamily: 'Oswald', fontSize: 14.0)),
          ]),
        ),
      ),
    );
  }
}
