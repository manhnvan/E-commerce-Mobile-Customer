import 'dart:convert';

import 'package:customer_app/models/order.dart';
import 'package:customer_app/services/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orders extends ChangeNotifier {
  List<Order> orderList = [];

  Future<void> fetchOrderList(page) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      Response res = await HttpService.get(
        '/order/listOrderOfCustomer',
        queryParams: {
          'page': page
        },
        headers: {
          'Authorization': 'JWT ' + prefs.get('token')
        }
      );
      dynamic responseBody = jsonDecode(res.body);
      if (res.statusCode == 200) {
        this.orderList = List<Order>.from(responseBody.map((product) => Order.fromJson(product)));
        notifyListeners();
      } else {
        print('get product in cart fail');
      }
    } catch (e) {
      print(e);
    }
  }
}