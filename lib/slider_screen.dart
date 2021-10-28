// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({Key? key}) : super(key: key);

  final List<String> imgList = [
    'images/food/food_1.jpg',
    'images/food/food_2.jpg',
    'images/food/food_3.jpg',
    'images/food/food_4.jpg',
    'images/food/food_5.jpg',
    'images/food/food_6.jpg',
    'images/food/food_7.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8),
        items: imgList
            .map(
              (item) => Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
