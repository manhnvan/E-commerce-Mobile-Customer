import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:customer_app/services/http_services.dart';
import 'package:customer_app/services/debouncer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Product extends ChangeNotifier {
  double rating, price;
  List<String> categories, productImages;
  String id, productName, description, unit, vendor, sellerId, thumbnail;
  bool likedByUser;
  final _debouncer = Debouncer(milliseconds: 500);
  int like;
  Product(
    this.id, 
    this.productName, 
    this.price, 
    this.vendor, 
    this.description, 
    this.unit,
    this.categories,
    this.rating,
    this.sellerId,
    this.like,
    this.likedByUser,
    this.productImages,
    this.thumbnail,
  );

  Product.fromJson(json) 
    : id = json['_id'],
      sellerId = json['sellerId'],
      productName = json['productName'],
      price = json['price'],
      vendor = json['vendor'],
      description = json['description'],
      unit = json['unit'],
      categories = json['categories'],
      rating = json['rating'],
      likedByUser = json['like'],
      productImages = json['productImages'],
      thumbnail = json['thumbnail'];

  Future<void> favoriteAction() async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.post(
      '/like/',
      body: {
        "product": this.id,
        "user": prefs.get('userId')
      }, 
      headers: {
        'Authorization': 'JWT ' + prefs.get('token')
      }
    );
    dynamic responseBody = jsonDecode(res.body);
    if (res.statusCode == 200 && responseBody['success']) {
      this.like = responseBody['totalLikeOfProduct'];
      notifyListeners();
    } else {
      print('fail to like');
    }
  }

  Future<void> creatComment(String content, String image) async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.post(
      '/comment/', 
      body: {
        "content": content,
        "user": prefs.get('userId'),
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

  Future<void> createAndUpdateRating(int star) async {
    final prefs = await SharedPreferences.getInstance();
    Response res = await HttpService.post(
      '/rating/', 
      body: {
        "star": star,
        "product": this.id.toString(),
        "user": prefs.get('userId'),
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