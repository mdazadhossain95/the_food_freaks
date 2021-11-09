import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';


List<Product> productsList = [
  Product(
      name: 'Cereals',
      price: "4.7",
      rating: "4.7",
      vendor: "GoodFoods",
      isFavorite: true,
      imgPath: 'food_1.jpg'),
  Product(
      name: 'burger',
      price: "4.7",
      rating: "4.7",
      vendor: "GoodFoods",
      isFavorite: false,
      imgPath: 'food_2.jpg'),
  Product(
      name: 'Cereals',
      price: "4.7",
      rating: "4.7",
      vendor: "GoodFoods",
      isFavorite: true,
      imgPath: 'food_3.jpg'),
  Product(
      name: 'Cereals',
      price: "4.7",
      rating: "4.7",
      vendor: "GoodFoods",
      isFavorite: true,
      imgPath: 'food_4.jpg'),
  Product(
      name: 'Cereals',
      price: "4.7",
      rating: "4.7",
      vendor: "GoodFoods",
      isFavorite: true,
      imgPath: 'food_5.jpg'),
  Product(
      name: 'Cereals',
      price: "4.7",
      rating: "4.7",
      vendor: "GoodFoods",
      isFavorite: true,
      imgPath: 'food_6.jpg')
];

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: productsList.length,
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
                        color: kColor1, offset: Offset(1, 1), blurRadius: 30)
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'images/${productsList[index].imgPath.toString()}',
                                height: 90,
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              CustomText(
                                  text: productsList[index].name.toString(), size: 22),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              CustomText(
                                text: "\$${productsList[index].price.toString()}",
                                weight: FontWeight.bold,

                              ),
                            ],
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
