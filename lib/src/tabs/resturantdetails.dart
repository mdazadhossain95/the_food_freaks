import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/connectivity_provider.dart';
import 'package:the_food_freaks/src/no_internet.dart';
import 'package:the_food_freaks/src/screens/productdetails_screen.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/state/restaurant_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      // ignore: prefer_is_empty, unnecessary_this
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';

  // ignore: unnecessary_this
  String get toTitleCase => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.toCapitalized())
      .join(" ");
}

class ResturentDetails extends StatefulWidget {
  final assetPath;
  final assetId;
  final restName;

  ResturentDetails({Key? key, this.assetPath, this.assetId, this.restName})
      : super(key: key);

  @override
  State<ResturentDetails> createState() => _ResturentDetailsState();
}

class _ResturentDetailsState extends State<ResturentDetails> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;

  late final assetPaths;
  late final assetId;
  late final restName;

  bool _init = true;
  bool _isLoading = false;

  @override
  void initState() {
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();

    super.initState();
    assetId = widget.assetId;
    assetPaths = widget.assetPath;
    restName = widget.restName;

    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 3;
      });
    });
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
    final items = Provider.of<RestaurantState>(context);

    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;

    if (!_isLoading) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customAppBar(),
        body: const Text("Something is wrong.."),
      );
    } else {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customAppBar(),
        body: Column(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: closeTopContainer ? 0 : categoryHeight,
                  child: ResturentName(
                      restName: restName, assetPaths: assetPaths)),
            ),
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: items.getProductList.length,
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
                          detailsFood
                              .setActiveProduct(items.getProductList[index]);

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
                                      "http://10.0.2.2:8000${items.getProductList[index].image}",
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
                                      text: items.getProductList[index].title
                                          .toString()
                                          .toTitleCase,
                                      size: 18,
                                      weight: FontWeight.bold),
                                ),
                                //product price
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomText(
                                      text:
                                      "\$${items.getProductList[index].price.toString()}"),
                                ),
                                //product description
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomText(
                                      text: items
                                          .getProductList[index].description
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
          ],
        )
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

class ResturentName extends StatelessWidget {
  const ResturentName({
    Key? key,
    required this.restName,
    required this.assetPaths,
  }) : super(key: key);

  final restName;
  final assetPaths;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: '$restName'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Image.network(assetPaths, height: 250.0, fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
}
