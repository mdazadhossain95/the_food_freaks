import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  TextEditingController editingController = TextEditingController();

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
        child: const ListTile(
          trailing: Icon(
            Icons.search,
            color: kColor1,
          ),
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Find food and restaurant',
              border: InputBorder.none,
            ),
          ),

        ),
      ),
    );
  }
}
