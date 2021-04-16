import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/card_glass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  double width;
  var data;

  ProductCard({this.width, this.data});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
        childWidget: Column(
          children: [
            Container(
              height:
                  this.width == MediaQuery.of(context).size.width ? 130 : 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data['thumbnail']), fit: BoxFit.cover),
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
                    Text(data['name'],
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
                            ? 'Giá: ' + data['price'] + 'đ'
                            : data['price'] + 'đ',
                        style: this.width == MediaQuery.of(context).size.width
                            ? (Theme.of(context).textTheme.bodyText1)
                                .copyWith(fontWeight: FontWeight.bold)
                            : (Theme.of(context).textTheme.bodyText1))
                  ],
                ))
          ],
        ),
        width: this.width);
  }
}
