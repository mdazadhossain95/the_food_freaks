import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

import '../../constants.dart';
import 'productdetails_screen.dart';

class SingleProduct extends StatelessWidget {
  int id;
  String title;
  int price;
  String image;
  double rateing;
  bool favorite;
  String description;

  SingleProduct(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.rateing,
      required this.favorite,
      required this.description});

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductState>(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width * 0.80,
        decoration: const BoxDecoration(
          color: kWhite,
          // boxShadow: [
          //   BoxShadow(color: kColor1, offset: Offset(1, 1), blurRadius: 30)
          // ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                items.setActiveProduct(id);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(),
                  ),
                );
              },
              child: Hero(
                tag: "$kServerAddress$image",
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("$kServerAddress$image"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: title,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhite,
                      boxShadow: const [
                        BoxShadow(
                            color: kGrey, offset: Offset(1, 1), blurRadius: 4)
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<ProductState>(context, listen: false)
                            .favoriteButton(id as int);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: favorite
                            ? const Icon(
                                Icons.favorite,
                                color: kColor1,
                                size: 18,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: kColor1,
                                size: 18,
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomText(
                          text: rateing.toString(), color: kGrey, size: 14),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.star,
                      color: kColor1,
                      size: 16,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CustomText(
                    text: "\$$price",
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
