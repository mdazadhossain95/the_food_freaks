import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/home.dart';
import 'package:the_food_freaks/src/screens/productdetails_screen.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class FoodsTab extends StatefulWidget {
  late final searchText;
  FoodsTab({Key? key, required this.searchText}) : super(key: key);

  @override
  State<FoodsTab> createState() => _FoodsTabState();
}

class _FoodsTabState extends State<FoodsTab> {
  late final searchText;
  bool _init = true;
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    searchText = widget.searchText;
  }

  @override
  // everytime we call a api or future data we need to make the function async
  void didChangeDependencies() async {
    if (_init) {
      // calling global state here
      // we are calling getProduct function form Product class
      _isLoading =
          await Provider.of<ProductState>(context).searchProducts(searchText);

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
      body: items.getSearchProduct == null
          ? ListView(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400),
                    itemCount: items.getSearchProduct.length,
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
                                  items.setActiveProduct(
                                      items.getProductList[index].id);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag:
                                      "$kServerAddress${items.getSearchProduct[index].title}",
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "$kServerAddress${items.getSearchProduct[index].image}"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //name
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: items.getSearchProduct[index].title
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
                                                  .getSearchProduct[index].id);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: items.getSearchProduct[index]
                                                  .favorite
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CustomText(
                                            text: items
                                                .getSearchProduct[index].rating
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
                                          "\$${items.getSearchProduct[index].price.toString()}",
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
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                    width: double.infinity,
                    child: Text(
                      'No result found',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
    );
  }
}
