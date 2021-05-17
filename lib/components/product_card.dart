import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/card_glass.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  double width;
  var data;

  ProductCard({this.width, this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(border_radius_small),
          topRight: Radius.circular(border_radius_big),
          bottomRight: Radius.circular(border_radius_small),
          bottomLeft: Radius.circular(border_radius_big)),
      child: Container(
        width: this.width,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          gradient: color_gradient_secondary,
          boxShadow: [box_shadow_black],
        ),
        child: GlassCard(
            childWidget: Column(
          children: [
            Container(
              width: this.width == MediaQuery.of(context).size.width
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.4,
              height:
                  this.width == MediaQuery.of(context).size.width ? 130 : 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data['thumbnail']),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
                padding: EdgeInsets.all(space_small),
                child: Column(
                  children: [
                    Text(data['productName'],
                        style: (Theme.of(context).textTheme.bodyText2)),
                    SizedBox(height: space_small),
                    Text(data['price'],
                        style: (Theme.of(context).textTheme.bodyText1))
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
