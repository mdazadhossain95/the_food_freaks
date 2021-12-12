import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_food_freaks/src/screens/single_product.dart';
import 'package:the_food_freaks/src/state/product_state.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

import '../../constants.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<ProductState>(context).favorites;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kColor1,
        centerTitle: true,
        title: const CustomText(
          text: 'Favorite',
          size: 18,
          weight: FontWeight.bold,
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: favorite.length,
        itemBuilder: (ctx, i) => SingleProduct(
          id: favorite[i].id,
          title: favorite[i].title,
          price: favorite[i].price,
          image: favorite[i].image.toString(),
          rateing: favorite[i].rating,
          favorite: favorite[i].favorite,
          description: favorite[i].description,
        ),
      ),
    );
  }
}
