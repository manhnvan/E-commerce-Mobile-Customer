import 'dart:convert';

import 'package:customer_app/models/product.dart';
import 'package:customer_app/services/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends ChangeNotifier {

  List<Product> productInCart;
  Cart(this.productInCart);

  Future<void> getProductInCart() async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.get(
      '/cart/getListProductCart/', 
      headers: {
        'Authorization': prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      this.productInCart = responseBody.map((product) => Product.fromJson(product));
      notifyListeners();
    } else {
      print('get product in cart fail');
    }
  }
}