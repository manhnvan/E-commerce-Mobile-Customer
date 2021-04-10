import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

var heroData = [
  {
    'thumbnail': 'assets/images/image_hero_1.jpg',
    'headline': 'Thiết kế ngôi nhà của bạn',
    'category': 'Không gian và nhà ở'
  },
  {
    'thumbnail': 'assets/images/image_hero_1.jpg',
    'headline': "yo yo :v"
  }
];

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.only(topLeft: Radius.circular(60.0))),
      clipBehavior: Clip.antiAlias,
      child: CarouselSlider(
          items: heroData.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(i['thumbnail']),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Text(
                      i['headline'],
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
          options: CarouselOptions(
              height: 340,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: false)),
    );
  }
}
