import 'dart:ui';

import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/image_asset_url.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/ChatScreen/Chatbox.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../constant.dart';

class Menu extends StatelessWidget {
  Menu({
    Key key, 
    this.productId, 
    this.sellerId, 
    this.productName, 
    this.thumbnail,
    this.currentUserId
  }) : super(key: key);

  final String productId;
  final String sellerId;
  final String productName;
  final String thumbnail;
  final String currentUserId;

  var dio = new Dio();

  @override
  Widget build(BuildContext context) {
    var dio = new Dio();

    return Positioned(
        bottom: 0,
        left: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(border_radius_big),
              topRight: Radius.circular(border_radius_big)),
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              decoration: BoxDecoration(
                  gradient: color_gradient_glass),
              height: space_huge * 2 + space_small - 1,
              width: MediaQuery.of(context).size.width,
              child: (Row(
                children: [
                  //Chat button here :)
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: TextButton(
                        onPressed: () {
                          dio.post('$chat_url/createChatbox', data: {
                            "participants": [currentUserId, sellerId],
                            "topic": productName,
                            "avatar": thumbnail,
                            "productId": productId,
                          }).then((value) {
                            if (value.data['success']) {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => ChatBox(chatboxId: value.data['chatbox']['_id']))
                              );
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(icon_chat)
                            ),
                          )
                        )
                      )
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: TextButton(
                          onPressed: () {
                            EasyLoading.show(status: 'loading...');
                            dio.post('$api_url/cart/customer/$currentUserId/update/$productId', data: {
                              "type": 1
                            })
                                .then((value) {
                              if (value.data['success']) {
                                EasyLoading.dismiss();
                                showDialog(
                                    barrierDismissible: false,
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext builderContext) {
                                      Future.delayed(Duration(milliseconds: 1000), () {
                                        Navigator.of(builderContext).pop();
                                      });
                                      return AlertDialog(
                                          backgroundColor: Colors.black.withOpacity(0.8),
                                          content: Text('Thêm vào giỏ hàng thành công', style: TextStyle(color: Colors.white)),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                      );
                                    }
                                );
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        icon_cart))),
                          ))),

                  //Order button here guys ^^
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: space_huge * 2 + space_small - 1,
                      decoration: BoxDecoration(
                        gradient: color_gradient_primary
                      ),
                      child: TextButton(
                          onPressed: () {
                            EasyLoading.show(status: 'loading...');
                            dio.post('$api_url/cart/customer/$currentUserId/buynow/$productId')
                                .then((value) {
                              EasyLoading.dismiss();
                              Navigator.pushNamed(context, "/shoppingCart");
                            });

                          },
                          child: Text("Đặt Mua",
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                color: color_white,
                                fontWeight: FontWeight.w700
                              ))))
                ],
              )),
            ),
          ),
        ));
  }
}
