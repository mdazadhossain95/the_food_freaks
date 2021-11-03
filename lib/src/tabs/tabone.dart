// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:the_food_freaks/src/tabs/slider_screen.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:the_food_freaks/src/screens/card_container.dart';

class TabOne extends StatelessWidget {
  const TabOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 5.0),
          SliderScreen(),
          const SizedBox(height: 5.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: CustomText(
              text: 'Popular',
              size: 20,
              color: kGrey,
            ),
          ),
          const SizedBox(height: 10.0),
          const CardContainer(),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: CustomText(
              text: 'Restaurants',
              size: 20,
              color: kGrey,
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Image.asset('images/map.jpg'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
