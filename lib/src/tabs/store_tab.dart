import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/tabs/resturantdetails.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  bool _init = true;
  bool _isLoading = false;
  @override
  // everytime we call a api or future data we need to make the function async
  void didChangeDependencies() async {
    if (_init) {
      // calling global state here
      // we are calling getProduct function form Product class
      _isLoading = await Provider.of<ProductState>(context).getProducts();
      print("in store_tab 2 $_isLoading");

      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ProductState>(context).getProductList;
    if (!_isLoading) {
      return const Scaffold(
        body: Text("Something is wrong"),
      );
    } else {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResturantDetails(
                            assetPath:
                                "http://10.0.2.2:8000${items[index].image}",
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        // GestureDetector

                        GestureDetector(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const ResturantDetails(),
                          //     ),
                          //   );
                          // },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "http://10.0.2.2:8000${items[index].image}",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(text: items[index].vendor),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
