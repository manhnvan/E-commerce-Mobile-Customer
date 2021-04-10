import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/components/bottom_navbar.dart';
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
                      HeroSection()
                    ],
                  ),
                )
              ],
            )),
        bottomNavigationBar: BottomNavbar());
  }
}
