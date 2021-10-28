import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      controller: editingController,
      decoration: const InputDecoration(
          hintText: 'Search Here',
          prefixIcon: Icon(
            Icons.search,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)))),
    );
  }
}
