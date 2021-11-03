import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/home.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:the_food_freaks/src/widgets/iconbutton.dart';

class CookieDetail extends StatefulWidget {
  final assetPath;
  final productprice;
  final productname;
  int add = 0;
  final rating;

  CookieDetail(
      {Key? key,
      this.assetPath,
      this.productprice,
      this.productname,
      this.rating,
      required this.add})
      : super(key: key);

  @override
  _CookieDetailState createState() => _CookieDetailState();
}

class _CookieDetailState extends State<CookieDetail> {
  late final assetPaths;
  late final productprices;
  late final productnames;
  late int adds;
  late final ratings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetPaths = widget.assetPath;
    productprices = widget.productprice;
    productnames = widget.productname;
    adds = widget.add;
    ratings = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                color: kWhite,
              )),
        ],
      ),
      body: ListView(
        children: [
          Hero(
              tag: assetPaths,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(assetPaths,
                    height: 300.0, width: 70.0, fit: BoxFit.cover),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    onPressed: () {
                      setState(() {
                        adds--;
                      });
                    }),
                CustomText(
                  text: adds.toString(),
                  size: 25,
                ),
                RoundIconButton(
                    icon: FontAwesomeIcons.plus,
                    onPressed: () {
                      setState(() {
                        adds++;
                      });
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: productnames, size: 22.0, weight: FontWeight.bold),
                CustomText(
                    text: productprices, size: 22.0, weight: FontWeight.bold)
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomText(
                          text: ratings.toString() + '/5',
                          color: kBlack,
                          size: 14),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.star,
                      color: kColor1,
                      size: 16,
                    ),
                    const Icon(
                      Icons.star,
                      color: kColor1,
                      size: 16,
                    ),
                    const Icon(
                      Icons.star,
                      color: kColor1,
                      size: 16,
                    ),
                    const Icon(
                      Icons.star,
                      color: kColor1,
                      size: 16,
                    ),
                    const Icon(
                      Icons.star,
                      color: kGrey,
                      size: 16,
                    )
                  ],
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
                    width: MediaQuery.of(context).size.width - 50.0,
                    child: const CustomText(
                      text:
                          'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.shopping_cart,
              size: 25.0,
              color: kWhite,
            ),
            backgroundColor: kColor1,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
