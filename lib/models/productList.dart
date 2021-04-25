import 'dart:convert';

import 'package:customer_app/models/product.dart';
import 'package:customer_app/services/http_services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductList {
  List<Product> listProduct = [];
  List<Product> listProductByCiteria = [];
  List<Product> listProductByClass = [];
  
  ProductList(this.listProduct);

  Future<void> fetchProductList() async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.get(
      '/product/', 
      queryParams: {
        'page': "0",
      },
      headers: {
        'Authorization': 'JWT ' + prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      return List<Product>.from(responseBody['docs'].map((product) => Product.fromJson(product)));
    } else {
      print('get product in cart fail');
      return [];
    }
  }

  
}