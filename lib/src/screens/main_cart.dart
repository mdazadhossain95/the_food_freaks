import 'package:flutter/material.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import '../../constants.dart';

class MainCart extends StatelessWidget {
  const MainCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kColor1,
        centerTitle: true,
        title: const CustomText(
          text: 'Cart',
          size: 18,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
