import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class InfoProfile extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  InfoProfile(
      {Key? key,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: kWhite,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
            title: CustomText(
              text: text,
              size: 18,
            )),
      ),
    );
  }
}
