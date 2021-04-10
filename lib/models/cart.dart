import 'package:customer_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {
  var listProductInCart = new List();

  Cart(this.listProductInCart);

  double getPrice() {
    double price = 0;
    for (var product in listProductInCart) {
      if (product.price && product.amountInCart) {
        price += (product.price * product.amountInCart);
      }
    }
    return price;
  }

  void addToCart(product) {
    if (product is Product) {
      listProductInCart.add(product);
    }
    notifyListeners();
  }

  List getProductInCartList() {
    return this.listProductInCart;
  }
}