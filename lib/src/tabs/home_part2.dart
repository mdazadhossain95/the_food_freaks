import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/productdetails_screen.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class HomePart2 extends StatefulWidget {
  const HomePart2({Key? key}) : super(key: key);

  @override
  State<HomePart2> createState() => _HomePart2State();
}

class _HomePart2State extends State<HomePart2> {
  bool _init = true;
  bool _isLoading = false;

  @override
  // everytime we call a api or future data we need to make the function async
  void didChangeDependencies() async {
    if (_init) {
      // calling global state here
      // we are calling getProduct function form Product class
      _isLoading = await Provider.of<ProductState>(context).getProducts();

      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductState>(context);
    if (!_isLoading) {
      return Container();
    } else {
      return Container(
        height: 260,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: items.getProductList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        GestureDetector(
                          onTap: () {
                            items.setActiveProduct(items.getProductList[index]);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "http://10.0.2.2:8000${items.getProductList[index].image}",
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
                                  text: items.getProductList[index].title
                                      .toString()),
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
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<ProductState>(context,
                                            listen: false)
                                        .favoriteButton(items
                                            .getProductList[index].id as int);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: items.getProductList[index].favorite
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
                                        text: items.getProductList[index].rating
                                            .toString(),
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
                                  text:
                                      "\$${items.getProductList[index].price.toString()}",
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
              );
            }),
      );
    }
  }
}
