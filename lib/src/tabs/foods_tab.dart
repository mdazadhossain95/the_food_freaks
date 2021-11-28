import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/home.dart';
import 'package:the_food_freaks/src/screens/productdetails_screen.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:the_food_freaks/src/widgets/search_bar2.dart';

class FoodsTab extends StatefulWidget {
  const FoodsTab({Key? key}) : super(key: key);

  @override
  State<FoodsTab> createState() => _FoodsTabState();
}

class _FoodsTabState extends State<FoodsTab> {
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

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: 'Foods',
          size: 18,
        ),
        backgroundColor: kColor1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SearchBar2(),
          GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400),
              itemCount: items.getProductList.length,
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
                            color: kColor1,
                            offset: Offset(1, 1),
                            blurRadius: 30)
                      ],
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            items.setActiveProduct(items.getProductList[index]);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(),
                              ),
                            );
                          },
                          child: Hero(
                            tag:
                                "http://10.0.2.2:8000${items.getProductList[index].title}",
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://10.0.2.2:8000${items.getProductList[index].image}"),
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
                                text: items.getProductList[index].title
                                    .toString(),
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
                                        .favoriteButton(items
                                            .getProductList[index].id);
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
                        const SizedBox(height: 1),
                        Row(
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
                                text:
                                    "\$${items.getProductList[index].price.toString()}",
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
        ],
      ),
    );
  }
}