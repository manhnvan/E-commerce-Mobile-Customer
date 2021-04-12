import 'dart:convert';

import 'package:customer_app/services/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ProductList extends ChangeNotifier {
  var listProduct = [];
  ProductList(this.listProduct);

  void setListProduct(List products) {
    this.listProduct = List.from(products);
    notifyListeners();
  }

  List getListProduct() {
    return this.listProduct;
  }

  void fetchListData(Map filter) async {
    try {
      Response response = await HttpService.get('/books/v1/volumes');
      print(jsonEncode(response.body));
      notifyListeners();
    } catch(e) {
      print(e);
    }
  }
}