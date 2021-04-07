import 'package:flutter/cupertino.dart';

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
}