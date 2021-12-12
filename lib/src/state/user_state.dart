import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../../constants.dart';

// Touhid
class UserState with ChangeNotifier {
  // saving the token in localStorage
  LocalStorage storage = LocalStorage('usertoken');
  Future<bool> loginNow(String username, String password) async {
    var url =
        Uri.parse('$kServerAddress/api/login/'); // while using on emulator
    try {
      http.Response response = await http.post(
        url,
        body: json.encode({
          "username": username,
          "password": password,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      // converting the response body as a json list
      var data = json.decode(response.body) as Map;
      print(data['token']);
      if (data.containsKey("token")) {
        print(true);
        storage.setItem('token', data['token']);
        return true;
      }
      print(false);
      return false;
    } catch (e) {
      print("e login now");
      print(e);
      return false;
    }
  }

  // Register
  Future<bool> registerNow(String username, String password) async {
    var url =
        Uri.parse('$kServerAddress/api/register/'); // while using on emulator
    try {
      http.Response response = await http.post(
        url,
        body: json.encode({
          "username": username,
          "password": password,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      // converting the response body as a json list
      var data = json.decode(response.body) as Map;
      print(data);
      if (data['error'] == false) {
        print(true);
        return true;
      }
      print(false);
      return false;
    } catch (e) {
      print("e register now");
      print(e);
      return false;
    }
  }
}
