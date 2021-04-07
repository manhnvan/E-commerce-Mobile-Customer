import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  String name;
  String price;
  Product(this.name, this.price);
}