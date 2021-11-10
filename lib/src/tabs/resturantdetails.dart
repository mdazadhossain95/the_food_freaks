import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/screens/addtocart.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:flutter/services.dart' as rootBundle;

Future<List<Product>> ReadJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('jsonfiles/productlist.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => Product.fromJson(e)).toList();
}

class ResturantDetails extends StatelessWidget {
  const ResturantDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
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

            return Column(
              children: [
                Container(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(text: 'Khanas'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/food_1.jpg',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: items.length,
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
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                      assetPath:
                                          items[index].imgPath.toString(),
                                      productprice:
                                          items[index].price.toString(),
                                      productname: items[index].name.toString(),
                                      rating: items[index].rating.toString(),
                                      description:
                                          items[index].description.toString(),
                                      add: 0,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            items[index].imgPath.toString(),
                                            height: 90,
                                            width: 130,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                            text: items[index].name.toString(),
                                            size: 18,
                                            weight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                            text:
                                                "\$${items[index].price.toString()}"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                            text: items[index]
                                                .description
                                                .toString()),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
