import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';

class CompoBar extends StatelessWidget {
  const CompoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'The Food Freaks',
      ),
      backgroundColor: kColor1,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ))
      ],
    );
  }
}
