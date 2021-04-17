import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:customer_app/services/http_services.dart';
import 'package:customer_app/services/debouncer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Product extends ChangeNotifier {
  int id, inStock, sellerId, price, totalLike, totalViews, sold, commentNum;
  double averageRate;
  String productName, description, unit, status, productClass, vendor;
  bool likedByUser;
  final _debouncer = Debouncer(milliseconds: 500);
  int productInCart = 0;
  Product(
    this.id, 
    this.productName, 
    this.price, 
    this.vendor, 
    this.description, 
    this.unit,
    this.status,
    this.inStock,
    this.productClass,
    this.averageRate,
    this.totalViews,
    this.sellerId,
    this.commentNum,
    this.sold,
    this.totalLike,
    this.likedByUser
  );

  Product.fromJson(json) 
    : id = json['id'],
      sellerId = json['seller'],
      productName = json['product_name'],
      price = json['price'],
      vendor = json['vendor'],
      description = json['description'],
      unit = json['unit'],
      status = json['status'],
      inStock = json['in_stock'],
      productClass = json['product_class'],
      averageRate = json['averageRate'],
      totalViews = json['total_views'],
      commentNum = json['commentNum'],
      sold = json['sold'],
      totalLike = json['total_like'],
      likedByUser = json['like'];

  Future<Uint8List> fetchProductHeadImage() async {
    try {
      Response response = await HttpService.get(
        '/productImage/getProductImage',
        queryParams: {
          'product': this.id.toString(),
          'type': 'head'
        }
        );
      dynamic responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 && responseBody['success']) {
        String imageString = responseBody['image'][0];
        return Base64Decoder().convert(imageString);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Uint8List>> fetchListProductImage() async {
    try {
      Response response = await HttpService.get(
        '/productImage/getProductImage',
        queryParams: {
          'product': this.id.toString(),
          'type': 'all'
        }
      );
      dynamic responseBody = jsonDecode(response.body);
      print(responseBody.toString());
      if (response.statusCode == 200 && responseBody['success']) {
        List<String> listBase64String = jsonDecode(responseBody['image']);
        return listBase64String.map((image) => Base64Decoder().convert(image)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<void> addProductToCart(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    _debouncer.run(() {
      HttpService.post(
        '/cart/productCart/', 
        body: {
          "amount": amount,
          "product": this.id
        }, headers: {
          'Authorization': prefs.get('token')
        }
      )
        .then((value) {
          this.productInCart = jsonDecode(value.body)['amount'];
          notifyListeners();
        })
        .catchError((e) => print(e));
    });
  }

  Future<void> favoriteAction() async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.post(
      '/favorite/createDelete/' + this.id.toString(), 
      headers: {
        'Authorization': 'JWT ' + prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      this.likedByUser = responseBody['likedByUser'];
      this.totalLike = responseBody['totalLike'];
      notifyListeners();
    } else {
      print('fail to like');
    }
  }

  Future<void> createAndUpdateComment(String content, String image) async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.post(
      '/comment/createAndUpdateComment/', 
      body: {
        "content": content,
        "image": image,
        "product": this.id.toString()
      },
      headers: {
        'Authorization': 'JWT ' + prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      notifyListeners();
    } else {
      print('fail to comment');
    }
  }

  Future<void> createAndUpdateRating(int rating) async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.post(
      '/rating/createAndUpdateRating/', 
      body: {
        "rating": rating,
        "product": this.id.toString()
      },
      headers: {
        'Authorization': 'JWT ' + prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      notifyListeners();
    } else {
      print('fail to rating');
    }
  }
}