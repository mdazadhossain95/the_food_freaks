import 'package:flutter/material.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

List<Product> productsList = [
  Product(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: "GoodFoods",
      wishList: true,
      image: 'food_1.jpg'),
  Product(
      name: 'burger',
      price: 2.99,
      rating: 4.2,
      vendor: "GoodFoods",
      wishList: false,
      image: 'food_2.jpg'),
  Product(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: "GoodFoods",
      wishList: true,
      image: 'food_3.jpg'),
  Product(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: "GoodFoods",
      wishList: true,
      image: 'food_4.jpg'),
  Product(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: "GoodFoods",
      wishList: true,
      image: 'food_5.jpg'),
  Product(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: "GoodFoods",
      wishList: true,
      image: 'food_6.jpg')
];

class PopularTab extends StatelessWidget {
  const PopularTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      // width: 200,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 13, 16, 12),
              child: Container(
                height: 220,
                width: 200,
                decoration: const BoxDecoration(
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(
                        color: kColor1, offset: Offset(15, 5), blurRadius: 30)
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'images/${productsList[index].image}',
                      height: 140,
                      width: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(text: productsList[index].name),
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
                              child: productsList[index].wishList
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
                                  text: productsList[index].rating.toString(),
                                  color: kGrey,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomText(
                            text: "\$${productsList[index].price}",
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
