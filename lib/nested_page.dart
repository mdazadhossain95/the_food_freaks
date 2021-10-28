import 'package:flutter/material.dart';

class NestedPage extends StatelessWidget {
  NestedPage({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: imgList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: 150,
                width: 150,
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: Image.asset(
                    imgList[index],
                  ),
                ),
                // color: Colors.green[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// {
//   return Image.asset(imgList[index],
//       fit: BoxFit.cover);
// },
