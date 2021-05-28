import 'package:customer_app/abstracts/image_asset_url.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SellerInfo extends StatelessWidget {
  final dynamic sellerId;

  const SellerInfo({Key key, this.sellerId}) : super(key: key);

  //Right now seller's image and name are hard coded, please use sellerId to get real data

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Seller's profile image here :)
          Container(
            width: space_huge + space_small,
            height: space_huge + space_small,
            margin: EdgeInsets.only(right: space_small),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                image: DecorationImage(
                    image: NetworkImage(sellerId["avatar"]),
                    fit: BoxFit.cover)),
          ),

          //Seller's name here :)
          Text(sellerId["username"],
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20))
        ],
      ),
    );
  }
}
