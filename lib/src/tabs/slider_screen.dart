// ignore_for_file: avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({Key? key}) : super(key: key);

  final List<String> imgList = [
    'images/food_1.jpg',
    'images/food_2.jpg',
    'images/food_3.jpg',
    'images/food_4.jpg',
    'images/food_5.jpg',
    'images/food_6.jpg',
    'images/food_7.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.7),
        items: imgList
            .map(
              (item) => Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  )),
            )
            .toList(),
      ),
    );
  }
}
