import 'package:customer_app/abstracts/theme/ez_themes.dart';
import 'package:customer_app/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: EzTheme,
      initialRoute: '/home',
      routes: routes,
    );
  }
}