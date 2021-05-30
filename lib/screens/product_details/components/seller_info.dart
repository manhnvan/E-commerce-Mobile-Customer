import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/screens/viewShop/viewShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SellerInfo extends StatelessWidget {
  dynamic seller;

  SellerInfo(this.seller);

  //Right now seller's image and name are hard coded, please use sellerId to get real data

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewShop(seller: seller))
          );
        },
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
                      image: NetworkImage(seller['avatar']),
                      fit: BoxFit.cover)),
            ),

            //Seller's name here :)
            Text(seller["shopName"],
                style:
                    Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
