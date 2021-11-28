import 'package:flutter/material.dart';
import 'package:the_food_freaks/constants.dart';
import 'package:the_food_freaks/src/tabs/foods_tab.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textController = TextEditingController();
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
                onTap: () {
                  // Provider.of<ProductState>(context, listen: false)
                  //     .searchProducts(textController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodsTab(
                        searchText: textController.text,
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.search,
                  color: kColor1,
                ),
              ),
              title: TextField(
                controller: textController,
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
