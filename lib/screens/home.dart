import 'package:customer_app/models/productList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bottom_navbar.dart';

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
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _fetchProductList({}),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
        bottomNavigationBar: BottomNavbar()
    );
  }
}
