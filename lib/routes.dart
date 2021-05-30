import 'package:customer_app/models/cart.dart';
import 'package:customer_app/screens/loading.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/login.dart';
import 'package:customer_app/screens/search/search.dart';
import 'package:customer_app/screens/shoppingCart/shoppingCart.dart';
import 'package:customer_app/screens/viewShop/viewShop.dart';
import 'package:customer_app/screens/welcome/welcome_screen.dart';
import 'package:customer_app/screens/profile/profile.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  Search.routeName: (context) => Search(),
  Profile.routeName: (context) => Profile(),
  Loading.routeName: (context) => Loading(),
  Login.routeName: (context) => Login(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  Loading.routeName: (context) => Loading(),
  shoppingCart.routeName:(context) => shoppingCart(),
  ViewShop.routeName: (context) => ViewShop()
};