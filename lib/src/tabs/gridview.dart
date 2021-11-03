import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/addtocart.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              children: <Widget>[
                buildCard(
                    name: 'Cereals',
                    imgPath: 'images/food_1.jpg',
                    rating: 4.7,
                    price: '\$5.99',
                    added: true,
                    isFavorite: true,
                    context: context),
                buildCard(
                    name: 'Cereals',
                    imgPath: 'images/food_1.jpg',
                    rating: 4.7,
                    price: '\$5.99',
                    added: true,
                    isFavorite: true,
                    context: context),
                buildCard(
                    name: 'Cereals',
                    imgPath: 'images/food_1.jpg',
                    rating: 4.7,
                    price: '\$5.99',
                    added: true,
                    isFavorite: true,
                    context: context),
                buildCard(
                    name: 'Cereals',
                    imgPath: 'images/food_1.jpg',
                    rating: 4.7,
                    price: '\$5.99',
                    added: true,
                    isFavorite: true,
                    context: context),
                buildCard(
                    name: 'Cereals',
                    imgPath: 'images/food_1.jpg',
                    rating: 4.7,
                    price: '\$5.99',
                    added: true,
                    isFavorite: true,
                    context: context),
                buildCard(
                    name: 'Cereals',
                    imgPath: 'images/food_1.jpg',
                    rating: 4.7,
                    price: '\$5.99',
                    added: true,
                    isFavorite: true,
                    context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(
      {required String name,
      required String imgPath,
      required double rating,
      String? price,
      required bool added,
      required bool isFavorite,
      context}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CookieDetail(
                    assetPath: imgPath,
                    productprice: price,
                    productname: name,
                    rating: rating,
                    add: 0,
                  )));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.33,
          width: MediaQuery.of(context).size.width * 0.50,
          decoration: const BoxDecoration(
            color: kWhite,
            boxShadow: [
              BoxShadow(color: kColor1, offset: Offset(1, 1), blurRadius: 30)
            ],
          ),
          child: Column(
            children: [
              Hero(
                tag: imgPath,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgPath),
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
                    child: CustomText(text: name),
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
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: isFavorite
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
              const SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CustomText(
                            text: rating.toString(), color: kGrey, size: 14),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomText(
                      text: price,
                      weight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
