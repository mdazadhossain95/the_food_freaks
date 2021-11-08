import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/screens/addtocart.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:flutter/services.dart' as rootBundle;

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key}) : super(key: key);

  Future<List<Product>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfiles/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: CustomText(
                text: "${data.error}",
              ),
            );
          } else if (data.hasData) {
            var items = data.data as List<Product>;

            return Container(
              height: 260,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                assetPath: items[index].imgPath.toString(),
                                productprice: items[index].price.toString(),
                                productname: items[index].name.toString(),
                                rating: items[index].rating.toString(),
                                description: items[index].description.toString(),
                                add: 0,
                              )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 13, 16, 12),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: const BoxDecoration(
                              color: kWhite,
                              boxShadow: [
                                BoxShadow(
                                    color: kColor1,
                                    offset: Offset(15, 5),
                                    blurRadius: 30)
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Positioned.fill(
                                    child: Image.asset(
                                      items[index].imgPath.toString(),
                                      height: 140,
                                      width: 140,
                                      fit: BoxFit.cover,
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
                                          text: items[index].name.toString()),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: kWhite,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: kGrey,
                                                offset: Offset(1, 1),
                                                blurRadius: 4)
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: items[index].isFavorite
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
                                    )
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: CustomText(
                                                text: items[index].rating.toString(),
                                                color: kGrey,
                                                size: 14),
                                          ),
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
                                          text: "\$${items[index].price.toString()}",
                                          weight: FontWeight.bold,
                                          size: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
