import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:the_food_freaks/src/models/products.dart';

import '../../constants.dart';

class ProductState with ChangeNotifier {
  // Making a list of products from product Model class
  List<Product> _products = [];
  List<Product> _cart = [];
  List<Product> _searchProduct = [];
  late Product _activeProduct;

  LocalStorage storage = LocalStorage('usertoken');

  // Making a http request to get the data from api
  Future<bool> getProducts() async {
    // local host for android: http://10.0.2.2:8000
    // var url = Uri.parse('http://10.0.2.2:8080/api/products/');
    // 'Authorization': 'token 5335e412ef8951e7fc82c9af032d0abff9f84705'
    // var url = Uri.parse('http://192.168.200.112:8000/api/products'); // while using on real device
    var token = storage.getItem('token');
    var url =
        Uri.parse('$kServerAddress/api/products'); // while using on emulator
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
      return true;
    } catch (e) {
      print("e getProducts");
      print(e);
      return false;
    }
  }

  // List<Product> get products => _products;

  // Making a http request to get the data from api
  Future<void> favoriteButton(int id) async {
    var token = storage.getItem('token');
    var url =
        Uri.parse('$kServerAddress/api/favorite/'); // while using on emulator
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

  List<Product> get cart => _cart;

  Product get activeProduct => _activeProduct;

  // getting a single product by the product id
  Product singleProduct(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

  setActiveProduct(int p) {
    _activeProduct = singleProduct(p);
  }

  Future<bool> searchProducts(String query) async {
    print(query);
    var token = storage.getItem('token');
    var url = Uri.parse(
        '$kServerAddress/api/searchproduct/?search=$query'); // while using on emulator
    try {
      http.Response response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "token $token"
        },
      );
      // converting the response body as a json list
      var data = json.decode(response.body) as List;
      List<Product> temp = [];
      for (var element in data) {
        Product product = Product.fromJson(element);
        temp.add(product);
        // print(element);
      }
      _searchProduct = temp;
      // print(_searchProduct);
      // notifyListeners();
      return true;
    } catch (e) {
      print("e searchProducts");
      print(e);
    }
    return false;
  }

  List<Product> get getSearchProduct {
    return [..._searchProduct];
  }
}
