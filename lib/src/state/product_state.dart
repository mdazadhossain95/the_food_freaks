import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:the_food_freaks/src/models/products.dart';

class ProductState with ChangeNotifier {
  // Making a list of products from product Model class
  List<Product> _products = [];
  LocalStorage storage = LocalStorage('usertoken');

  // Making a http request to get the data from api
  Future<bool> getProducts() async {
    // local host for android: http://10.0.2.2:8000
    // var url = Uri.parse('http://10.0.2.2:8080/api/products/');
    // 'Authorization': 'token 5335e412ef8951e7fc82c9af032d0abff9f84705'
    // var url = Uri.parse('http://192.168.200.112:8000/api/products'); // while using on real device
    var token = storage.getItem('token');
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/products'); // while using on emulator
    try {
      http.Response response = await http.get(url, headers: {
        'Authorization': "token $token",
      });
      // converting the response body as a json list
      var data = json.decode(response.body) as List;
      List<Product> temp = [];
      data.forEach((element) {
        Product product = Product.fromJson(element);
        temp.add(product);
      });
      // assigning the list to _product from temporary list
      _products = temp;
      notifyListeners();
      // print(response.body);
      return true;
    } catch (e) {
      print("e getProducts");
      print(e);
      return false;
    }
  }

  // Making a http request to get the data from api
  Future<void> favoriteButton(int id) async {
    var token = storage.getItem('token');
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/favorite/'); // while using on emulator
    try {
      http.Response response = await http.post(
        url,
        body: json.encode({
          "id": id,
        }),
        headers: {
          "Content-Type": "application/json",
          'Authorization': "token $token"
        },
      );
      // converting the response body as a json list
      var data = json.decode(response.body);
      print(data);
      getProducts();
      // notifyListeners();
    } catch (e) {
      print("e favorite button");
      print(e);
    }
  }

  // using get we can only get the data
  List<Product> get getProductList {
    return [..._products];
  }

// using get we can only get the data then convert it to a list
  List<Product> get favorites {
    return _products.where((element) => element.favorite == true).toList();
  }

  // getting a single product by the product id
  Product singleProduct(int id) {
    return _products.firstWhere((element) => element.id == id);
  }
}
