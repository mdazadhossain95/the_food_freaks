import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_food_freaks/src/models/stores.dart';
import 'package:the_food_freaks/src/widgets/customtext.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../../constants.dart';


Future<List<Stores>> ReadJsonData() async {
  final jsondata =
  await rootBundle.rootBundle.loadString('jsonfiles/shoplist.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => Stores.fromJson(e)).toList();
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: CustomText(
                text: "${data.error}",
              ),
            );
          } else if (data.hasData) {
            var items = data.data as List<Stores>;

            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              items[index].storeImgPath.toString(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(text: items[index].storeName),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
