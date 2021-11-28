import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/tabs/foods_tab.dart';

class SearchBar2 extends StatefulWidget {
  const SearchBar2({Key? key}) : super(key: key);

  @override
  _SearchBar2State createState() => _SearchBar2State();
}

class _SearchBar2State extends State<SearchBar2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(color: kWhite, boxShadow: [
          BoxShadow(
            color: kGrey,
            offset: Offset(1, 1),
            blurRadius: 4,
          )
        ]),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => FoodsTab()
                  //   ),
                  // );

                },
                child: const Icon(
                  Icons.search,
                  color: kColor1,
                ),

              ),
              title: const TextField(
                decoration: InputDecoration(
                  hintText: 'Find your food',
                  border: InputBorder.none,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
