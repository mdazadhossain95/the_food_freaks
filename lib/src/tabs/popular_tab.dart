import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/productdetails_screen.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class PopularTab extends StatefulWidget {
  const PopularTab({Key? key}) : super(key: key);

  @override
  _PopularTabState createState() => _PopularTabState();
}

class _PopularTabState extends State<PopularTab> {
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

  // backgroundColor: kBackgroundColor,
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ProductState>(context).getProductList;

    if (!_isLoading) {
      return const Scaffold(
        backgroundColor: kBackgroundColor,
        body: Text("Loading Data."),
      );
    } else {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: MediaQuery.of(context).size.width * 0.50,
                  decoration: const BoxDecoration(
                    color: kWhite,
                    boxShadow: [
                      BoxShadow(
                          color: kColor1, offset: Offset(1, 1), blurRadius: 30)
                    ],
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                assetPath:
                                    "http://10.0.2.2:8000${items[index].image}",
                                productprice: items[index].price.toString(),
                                productname: items[index].title.toString(),
                                rating: items[index].rateing.toString(),
                                description:
                                    items[index].description.toString(),
                                add: 0,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: "http://10.0.2.2:8000${items[index].image}",
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://10.0.2.2:8000${items[index].image}"),
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
                              text: items[index].title.toString(),
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
                                      color: kGrey,
                                      offset: Offset(1, 1),
                                      blurRadius: 4)
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<ProductState>(context,
                                          listen: false)
                                      .favoriteButton(items[index].id as int);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: items[index].favorite
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
                                    text: items[index].rateing.toString(),
                                    color: kGrey,
                                    size: 14),
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
                              text: "\$${items[index].price.toString()}",
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
}
