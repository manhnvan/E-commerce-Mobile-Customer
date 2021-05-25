import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/image_asset_url.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ProductBriefInfo extends StatelessWidget {
  var ratings;
  var likes;
  var price;
  var currencyFormatter = new NumberFormat.simpleCurrency(
      locale: "vi_VN", name: "", decimalDigits: 0);

  ProductBriefInfo(this.ratings, this.likes, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //A row of small info here (number of ratings, reviews)
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Number of ratings
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: space_tiny),
                        width: space_medium,
                        height: space_medium,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(icon_start)
                            )
                          )
                        ),
                    Text(ratings.toString() + '/5',
                        style: Theme.of(context).textTheme.bodyText2)
                  ],
                ),
              ),

              //Number of likes
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: space_tiny),
                      width: space_medium,
                      height: space_medium,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(icon_heart)
                        )
                      )
                    ),
                    Text(likes.toString(),
                        style: Theme.of(context).textTheme.bodyText2)
                  ],
                ),
              )
            ],
          ),
        ),

        //Price panel here :3
        Transform.translate(
          offset: Offset(space_medium, 0),
          child: Container(
              decoration: BoxDecoration(
                  gradient: color_gradient_primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(border_radius_huge),
                      bottomLeft: Radius.circular(border_radius_huge)),
                  boxShadow: [box_shadow_black]),
              padding: EdgeInsets.fromLTRB(
                  space_huge, space_medium, space_medium, space_medium),
              child: Text(currencyFormatter.format(price).toString() + 'đ',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: color_white))),
        )
      ],
    );
  }
}
