import 'dart:convert';

import 'package:customer_app/models/product.dart';
import 'package:customer_app/services/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductList extends ChangeNotifier {
  List<Product> listProduct = [];
  List<Product> listProductByCiteria = [];
  List<Product> listProductByClass = [];
  
  ProductList(this.listProduct);

  Future<void> fetchProductListByCiteria(page ,{vendor, price, product_name}) async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.get(
      '/product/searchbyciteria', 
      queryParams: {
        'vendor': vendor,
        'price': price.toString(),
        'product_name': product_name,
        'page': page.toString(),
      },
      headers: {
        'Authorization': 'JWT ' + prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200) {
      this.listProductByCiteria = List<Product>.from(responseBody.map((product) => Product.fromJson(product)));
      print(this.listProductByCiteria[0].id);
      await this.listProductByCiteria[0].favoriteAction();
      notifyListeners();
    } else {
      print('get product in cart fail');
    }
  }

  Future<void> fetchProductListByClass(page , productClass) async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.get(
      '/product/searchbyclass', 
      queryParams: {
        'product_class': productClass,
        'page': page.toString(),
      },
      headers: {
        'Authorization': 'JWT ' + prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200) {
      this.listProductByClass = List<Product>.from(responseBody.map((product) => Product.fromJson(product)));
      print(this.listProductByClass[0]);
      this.listProductByClass[0].fetchProductHeadImage();
      notifyListeners();
    } else {
      print('get product in cart fail');
    }
  }
}