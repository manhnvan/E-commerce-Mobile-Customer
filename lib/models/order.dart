import 'dart:convert';

import 'package:customer_app/services/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends ChangeNotifier {
  int id, customerId, sellerId;
  String orderStatus;
  double shipCost, productCost;

  Order.fromJson(json)
    : id = json['id'],
      customerId = json['customer_id'],
      sellerId = json['seller_id'],
      orderStatus = json['order_status'],
      shipCost = json['ship_cost'],
      productCost = json['product_cost'];
  
  Future<void> changeOrderStatus(String status) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      Response res = await HttpService.get(
        '/order/changeOrderStatus',
        queryParams: {
          'order': this.id.toString()
        },
        headers: {
          'Authorization': 'JWT ' + prefs.get('token')
        }
      );
      if (res.statusCode == 200) {
        this.orderStatus = status;
        notifyListeners();
      } else {
        print('change status fail');
      }
    } catch (e) {
      print(e);
    }
  }

}