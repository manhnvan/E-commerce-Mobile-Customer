import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/screens/home/components/new_products_section.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:flutter/material.dart';

import 'components/hero.dart';

class Home extends StatefulWidget {
  static String routeName = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: color_gradient_primary),
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(space_medium),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField()),
                        SizedBox(height: space_big)
                      ],
                    )),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    addAutomaticKeepAlives: false,
                    cacheExtent: 100.0,
                    children: [
                      HeroSection(),
                      RecommendSection(),
                      NewProductsSection()
                    ],
                  ),
                ),
              ],
            )),
        bottomNavigationBar: BottomNavbar(0));
  }
}
