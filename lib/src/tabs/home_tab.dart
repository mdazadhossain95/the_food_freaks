import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:the_food_freaks/src/tabs/home_tab1.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:the_food_freaks/src/screens/card_container.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeTab1(),
          ),
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
          const SizedBox(height: 230.0)
        ],
      ),
    );
  }
}
