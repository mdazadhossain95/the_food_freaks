import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/screens/productdetails_screen.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/state/restaurant_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class ResturantDetails extends StatefulWidget {
  final assetPath;
  final assetId;

  const ResturantDetails({Key? key, this.assetPath, this.assetId})
      : super(key: key);

  @override
  State<ResturantDetails> createState() => _ResturantDetailsState();
}

class _ResturantDetailsState extends State<ResturantDetails> {
  late final assetPaths;
  late final assetId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetPaths = widget.assetPath;
    assetId = widget.assetId;
    // print(widget.assetId);

    Provider.of<RestaurantState>(context, listen: false)
        .productByRestaurant(assetId);
  }

  Future<List<Product>> readJsonData() async {
    // Provider.of<RestaurantState>(context, listen: false)
    //     .productByRestaurant(assetId);
    // final items = Provider.of<ProductState>(context).getProductList;

    final items = Provider.of<RestaurantState>(context).getProductList;

    return items;
  }

  @override
  Widget build(BuildContext context) {
    var detailsFood = Provider.of<ProductState>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
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
      ),
      body: FutureBuilder(
        future: readJsonData(),
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(text: 'Khanas'),
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
