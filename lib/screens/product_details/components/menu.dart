import 'dart:ui';

import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/image_asset_url.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/constaint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Menu({Key key, this.productId, this.sellerId, this.productName}) : super(key: key);

  final String productId;
  final String sellerId;
  final String productName;

  var dio = new Dio();

  @override
  Widget build(BuildContext context) {
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
                            "participants": [customerId, sellerId],
                            "topic": productName,
                            "avatar": "https://i.imgur.com/hUD8wd6.jpeg"
                          }).then((value) {
                            print(value.data);
                            if (value.data['success']) {

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
                          onPressed: () {},
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
