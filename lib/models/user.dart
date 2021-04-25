import 'dart:convert';

import 'package:customer_app/models/product.dart';
import 'package:customer_app/services/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier {

  List<dynamic> productImages = [];
  

  Future<void> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.post(
      '/user/login/', 
      body: {
        'email': email,
        'password': password
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      prefs.setString('token', responseBody['token']);
      prefs.setString('username', responseBody['username']);
      prefs.setString('userId', responseBody['customerId']);
      prefs.setString('user_type', responseBody['user_type']);
      print(prefs.get('token'));
    } else {
      print('fail');
    }
  }

  Future<void> register(String email, String password, String username) async {
    Response res = await HttpService.post(
      '/user/customerregister/', 
      body: {
        'email': email,
        'password': password,
        'username': username
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      print('register success');
    } else {
      print('register fail');
    }
  }

}