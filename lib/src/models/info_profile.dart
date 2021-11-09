import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';

class InformationProfile extends StatefulWidget {
  final String text;
  VoidCallback onPressed;

  InformationProfile(
      {Key? key,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  _InformationProfileState createState() => _InformationProfileState();
}

class _InformationProfileState extends State<InformationProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
        color: kWhite,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
            title: CustomText(
              text: widget.text,
              size: 18,
            )),
      ),
    );
  }
}
