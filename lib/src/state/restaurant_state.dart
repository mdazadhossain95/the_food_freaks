import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:the_food_freaks/src/models/products.dart';
import 'package:the_food_freaks/src/models/restaurant.dart';

class RestaurantState with ChangeNotifier {
  // Making a list of products from product Model class
  late List<Restaurant> _restaurant = [];
  late List<Product> _products = [];
  late Product _activeProduct;

  LocalStorage storage = LocalStorage('usertoken');

  // Making a http request to get the data from api
  Future<bool> getRestaurant() async {
    var token = storage.getItem('token');
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/restaurant'); // while using on emulator
    try {
      http.Response response = await http.get(url, headers: {
        'Authorization': "token $token",
      });
      // converting the response body as a json list
      var data = json.decode(response.body) as List;
      List<Restaurant> temp = [];
      data.forEach((element) {
        Restaurant restaurant = Restaurant.fromJson(element);
        temp.add(restaurant);
      });
      // assigning the list to _product from temporary list
      _restaurant = temp;
      notifyListeners();
      // print(response.body);
      return true;
    } catch (e) {
      print("e getRestaurant");
      print(e);
      return false;
    }
  }

  // using get we can only get the data
  List<Restaurant> get getRestaurantList {
    return [..._restaurant];
  }

  // Making a http request to get the data from api
  Future<bool> productByRestaurant(int id) async {
    var token = storage.getItem('token');

    var url = Uri.parse(
        'http://10.0.2.2:8000/api/productbyrestaurant/?id=$id'); // while using on emulator
    try {
      http.Response response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "token $token",
        },
      );
      // converting the response body as a json list
      var data = json.decode(response.body) as List;
      List<Product> temp = [];
      for (var element in data) {
        Product product = Product.fromJson(element);
        temp.add(product);
      }
      _products = temp;
      // print('calling resaturant by id');
      // print(_products);
      // notifyListeners();
      return true;
    } catch (e) {
      print("e product by restaurant");
      print(e);
    }
    return false;
  }

  // using get we can only get the data
  List<Product> get getProductList {
    // print(_products);
    return [..._products];
  }

  Product? get activeProduct => _activeProduct;

  // getting a single product by the product id

  setActiveProduct(Product p) {
    _activeProduct = p;
  }
}
