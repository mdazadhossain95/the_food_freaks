import 'dart:async';
import 'dart:convert';

import 'package:collection/src/iterable_extensions.dart';
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
  List<Product> _cart = [];

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
      // print(_products[0].title);
      // notifyListeners();
      return true;
    } catch (e) {
      print("e product by restaurant");
      print(e);
    }
    return false;
  }

  List<Product> get cart => _cart;

  List<Product> get favorites {
    return _products.where((element) => element.favorite == true).toList();
  }

  // using get we can only get the data
  List<Product> get getProductList {
    // print(_products);
    return [..._products];
  }

  setActiveProduct(Product p) {
    _activeProduct = p;
  }

  addOneItemToCart(Product p) {
    //find if the p is already in the basket
    //if that is the case just increment the qty property by 1
    Product? found = _cart.firstWhereOrNull((a) => a.id == p.id);
    if (found != null) {
      found.quantity += 1;
    } else {
      _cart.add(p);
    }

    notifyListeners();
  }

  removeOneItemToCart(Product p) {
    //find if the p is already in the basket
    //if that is the case just increment the qty property by 1
    Product? found = _cart.firstWhereOrNull((a) => a.id == p.id);
    if (found != null && found.quantity == 0) {
      _cart.remove(p);
      found.quantity == 0;
    } else {
      found!.quantity -= 1;
    }
    notifyListeners();
  }

  getCartQty() {
    int total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].quantity;
    }
    return total;
  }

  getTotalPrice() {
    double total = 0.0;
    cart.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  deleteOneItemToCart(Product p) {
    //find if the p is already in the basket
    //if that is the case just increment the qty property by 1
    Product? found = _cart.firstWhereOrNull((a) => a.id == p.id);
    _cart.remove(p);
    p.quantity = 0;
    notifyListeners();
  }
}
