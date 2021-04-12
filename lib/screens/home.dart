import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/components/card_glass.dart';
import 'package:customer_app/components/hero/hero.dart';
import 'package:customer_app/models/productList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var _fetchProductList = Provider.of<ProductList>(context).fetchListData;

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: color_gradient_primary),
            child: Column(
              children: <Widget>[
                Container(padding: EdgeInsets.all(16.0), child: TextField()),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    addAutomaticKeepAlives: false,
                    cacheExtent: 100.0,
                    children: [
                      HeroSection(),
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              space_medium, space_big, 0, space_medium),
                          child: GlassCard(
                              childWidget: Column(
                                children: [
                                  Container(
                                    width: 164,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/image_hero_3-min.jpg'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(space_small),
                                      child: Column(
                                        children: [
                                          Text('Giày Nike Air Max 2017',
                                              style: (Theme.of(context)
                                                  .textTheme
                                                  .bodyText2)),
                                          SizedBox(height: space_small),
                                          Text('700.000d',
                                              style: (Theme.of(context)
                                                  .textTheme
                                                  .bodyText1))
                                        ],
                                      ))
                                ],
                              ),
                              width: null))
                    ],
                  ),
                )
              ],
            )),
        bottomNavigationBar: BottomNavbar());
  }
}
