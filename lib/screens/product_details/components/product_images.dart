import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductImages extends StatefulWidget {
  var images;

  ProductImages(this.images);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.only(topLeft: Radius.circular(border_radius_huge))),
      clipBehavior: Clip.antiAlias,
      child: CarouselSlider(
          items: widget.images.map<Widget>((slide) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(slide),
                                fit: BoxFit.cover))),
                    Container(
                        padding: EdgeInsets.all(space_medium),
                        height: height_hero,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0),
                                  Colors.black,
                                ],
                                stops: [
                                  -1.0,
                                  1.0
                                ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: widget.images.map<Widget>((slide) {
                                int index = widget.images.indexOf(slide);
                                return Container(
                                  width: space_small,
                                  height: space_small,
                                  margin: EdgeInsets.only(right: space_small),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? color_white
                                        : Color.fromRGBO(166, 166, 166, 1),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ))
                  ],
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
              height: height_hero,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              })),
    );
  }
}
