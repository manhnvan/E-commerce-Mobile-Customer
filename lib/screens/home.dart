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
  int _currentNavigationIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _setCuttentNavigationIndex(int index) {
    setState(() {
      _currentNavigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
        bottomNavigationBar: BottomNavbar()
    );
  }
}
