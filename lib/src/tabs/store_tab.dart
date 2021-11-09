import 'package:flutter/material.dart';
import 'package:the_food_freaks/src/models/stores.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

List<Store> StoresList = [
  Store(name: 'store name', image: 'food_5.jpg'),
  Store(name: 'store name', image: 'food_5.jpg'),
  Store(name: 'store name', image: 'food_5.jpg'),
  Store(name: 'store name', image: 'food_5.jpg'),
  Store(name: 'store name', image: 'food_5.jpg'),
];

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: StoresList.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/${StoresList[index].image}',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(text: StoresList[index].name),
                  )
                ],
              ),
            ),
          );
        });
  }
}
