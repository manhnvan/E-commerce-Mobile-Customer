import 'package:customer_app/abstracts/theme/ez_themes.dart';
import 'package:customer_app/models/cart.dart';
import 'package:customer_app/models/currentBottomNavigationIndex.dart';
import 'package:customer_app/models/productList.dart';
import 'package:customer_app/models/user.dart';
import 'package:customer_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
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
        ),
        ChangeNotifierProvider.value(
            value: User()
        ),
        ChangeNotifierProvider.value(
            value: Cart([])
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: EzTheme,
        initialRoute: '/viewShop',
        // initialRoute: '/home',
        routes: routes,
      ),
    );
  }
}
