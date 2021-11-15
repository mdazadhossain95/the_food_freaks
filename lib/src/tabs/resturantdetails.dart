import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/screens/addtocart.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class ResturantDetails extends StatefulWidget {
  final assetPath;

  const ResturantDetails({Key? key, this.assetPath}) : super(key: key);

  @override
  State<ResturantDetails> createState() => _ResturantDetailsState();
}

class _ResturantDetailsState extends State<ResturantDetails> {
  late final assetPaths;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetPaths = widget.assetPath;
  }

  Future<List<Product>> ReadJsonData() async {
    final items = Provider.of<ProductState>(context).getProductList;

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: 'The Food Freaks',
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(text: 'Khanas'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(assetPaths, fit: BoxFit.cover),
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
                                      assetPath: items[index].image.toString(),
                                      productprice:
                                          items[index].price.toString(),
                                      productname:
                                          items[index].title.toString(),
                                      rating: items[index].rateing.toString(),
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
                                            items[index].image.toString(),
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
                                            text: items[index].title.toString(),
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
