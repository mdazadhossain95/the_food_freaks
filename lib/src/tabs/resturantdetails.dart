import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/screens/productdetails_screen.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/state/restaurant_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class ResturantDetails extends StatefulWidget {
  final assetPath;
  final assetId;
  final restName;

  ResturantDetails({Key? key, this.assetPath, this.assetId, this.restName})
      : super(key: key);

  @override
  State<ResturantDetails> createState() => _ResturantDetailsState();
}

class _ResturantDetailsState extends State<ResturantDetails> {
  late final assetPaths;
  late final assetId;
  late final restName;

  bool _init = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    assetId = widget.assetId;
    assetPaths = widget.assetPath;
    restName = widget.restName;
  }

  @override
  // everytime we call a api or future data we need to make the function async
  void didChangeDependencies() async {
    if (_init) {
      // calling global state here
      // we are calling getProduct function form Product class
      _isLoading = await Provider.of<RestaurantState>(context)
          .productByRestaurant(assetId);
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var detailsFood = Provider.of<ProductState>(context);
    final items = Provider.of<RestaurantState>(context).getProductList;

    if (!_isLoading) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customAppBar(),
        body: Text("Something is wrong.."),
      );
    } else {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customAppBar(),
        body: Column(
          children: [
            Container(
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(text: '$restName'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(assetPaths,
                          height: 250.0, fit: BoxFit.cover),
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
                            detailsFood.setActiveProduct(
                                detailsFood.getProductList[index]);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  //product picture
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        "http://10.0.2.2:8000${items[index].image}",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //product name
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomText(
                                        text: items[index].title.toString(),
                                        size: 18,
                                        weight: FontWeight.bold),
                                  ),
                                  //product price
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomText(
                                        text:
                                            "\$${items[index].price.toString()}"),
                                  ),
                                  //product description
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
        ),
      );
    }
  }

  AppBar customAppBar() {
    return AppBar(
      centerTitle: true,
      title: const CustomText(
        text: 'Restaurant details',
        size: 18,
      ),
      backgroundColor: kColor1,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: kWhite,
            )),
      ],
    );
  }
}
