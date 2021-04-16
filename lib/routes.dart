import 'package:customer_app/screens/loading.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/login.dart';
import 'package:customer_app/screens/search.dart';
import 'package:customer_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  Search.routeName: (context) => Search(),
  Loading.routeName: (context) => Loading(),
  Login.routeName: (context) => Login(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  Loading.routeName: (context) => Loading(),
};