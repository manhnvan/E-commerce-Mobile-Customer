import 'file:///E:/Android%20Studio/EZ_shop/E-commerce-Mobile-Customer/lib/screens/home/home.dart';
import 'package:customer_app/screens/loading.dart';
import 'package:customer_app/screens/login.dart';
import 'package:customer_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  Loading.routeName: (context) => Loading(),
  Login.routeName: (context) => Login(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  Loading.routeName: (context) => Loading()
};