import 'package:customer_app/models/currentBottomNavigationIndex.dart';
import 'package:customer_app/models/productList.dart';
import 'package:customer_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: CurrentBottomNavigation(0)
        ),
        ChangeNotifierProvider.value(
            value: ProductList([])
        )
      ],
      child: MaterialApp(
        initialRoute: '/home',
        routes: routes,
      ),
    );
  }
}


