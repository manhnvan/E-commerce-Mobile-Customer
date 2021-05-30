import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/card_glass.dart';
import 'package:customer_app/screens/product_details/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  bool backgroundWhite;
  double width;
  var data;
  var currencyFormatter = new NumberFormat.simpleCurrency(
    locale: "vi_VN", name: "", decimalDigits: 0
  );

  ProductCard({this.backgroundWhite, this.width, this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetail(productId: data['_id'].toString()))
        );
      },
      child: GlassCard(
          childWidget: Column(
            children: [
              Container(
                height:
                    this.width == MediaQuery.of(context).size.width ? 130 : 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data['thumbnail']), fit: BoxFit.cover),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(space_small),
                  width: this.width == MediaQuery.of(context).size.width
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['productName'],
                          style: this.width == MediaQuery.of(context).size.width
                              ? (Theme.of(context).textTheme.bodyText1)
                              : (Theme.of(context).textTheme.bodyText2),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(
                          height: this.width == MediaQuery.of(context).size.width
                              ? space_big
                              : space_small),
                      Text(
                          this.width == MediaQuery.of(context).size.width
                              ? 'Giá: ' + currencyFormatter.format(data['price']) + 'đ'
                              : currencyFormatter.format(data['price']) + 'đ',
                          style: this.width == MediaQuery.of(context).size.width
                              ? (Theme.of(context).textTheme.bodyText1)
                                  .copyWith(fontWeight: FontWeight.bold)
                              : (Theme.of(context).textTheme.bodyText1))
                    ],
                  ))
            ],
          ),
          backgroundWhite: this.backgroundWhite),
    );
  }
}
