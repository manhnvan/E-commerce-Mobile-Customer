import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:flutter/material.dart';

var heroData = [
  {
    'thumbnail': 'assets/images/image_hero_1-min.jpg',
    'headline': 'Thiết kế mái ấm của bạn',
    'category': 'Không gian & nhà ở'
  },
  {
    'thumbnail': 'assets/images/image_hero_2-min.jpg',
    'headline': 'Tự tin khoe cá tính',
    'category': 'Thời trang'
  },
  {
    'thumbnail': 'assets/images/image_hero_3-min.jpg',
    'headline': 'Khám phá những điều không tưởng',
    'category': 'Công nghệ'
  },
  {
    'thumbnail': 'assets/images/image_hero_4-min.jpg',
    'headline': 'Sẵn sàng cho mọi chuyến đi',
    'category': 'Thể thao & du lịch'
  },
];

class HeroSection extends StatefulWidget {
  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(border_radius_huge))),
      clipBehavior: Clip.antiAlias,
      child: CarouselSlider(
          items: heroData.map((slide) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(slide['thumbnail']),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              slide['headline'],
                              style: (Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: color_white)),
                            ),
                            SizedBox(height: space_small),
                            Text(
                              slide['category'],
                              style: (Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: color_white)),
                            ),
                            SizedBox(height: space_small),
                            Row(
                              children: heroData.map((slide) {
                                int index = heroData.indexOf(slide);
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
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              })),
    );
  }
}
