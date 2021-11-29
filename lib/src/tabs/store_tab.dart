import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/src/state/restaurant_state.dart';
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
      _isLoading = await Provider.of<RestaurantState>(context).getRestaurant();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<RestaurantState>(context).getRestaurantList;
    if (!_isLoading) {
      return const Scaffold(
        body: Text("Something is wrong"),
      );
    } else {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 230.0),
          // margin: const EdgeInsets.symmetric(vertical: 50.0),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
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
                            assetId: items[index].id,
                            restName: items[index].name,
                          ),
                        ),
                      );
                      // Provider.of<RestaurantState>(context, listen: false)
                      //     .productByRestaurant(items[index].id as int);
                    },
                    child: Column(
                      children: [
                        // GestureDetector

                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "http://10.0.2.2:8000${items[index].image}",
                              height: 200.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(text: items[index].name),
                        ),
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
