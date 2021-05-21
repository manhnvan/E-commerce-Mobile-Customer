import 'package:customer_app/screens/ChatScreen/ChatScreen.dart';
import 'package:customer_app/screens/ChatScreen/Chatbox.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/login.dart';
import 'package:customer_app/screens/product_details/product_detail.dart';
import 'package:customer_app/screens/search/search.dart';
import 'package:customer_app/screens/shoppingCart/shoppingCart.dart';
import 'package:customer_app/screens/welcome/welcome_screen.dart';
import 'package:customer_app/screens/profile/profile.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  ProductDetail.routeName: (context) => ProductDetail(),
  Search.routeName: (context) => Search(),
  Profile.routeName: (context) => Profile(),
  Login.routeName: (context) => Login(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  ChatBox.routeName: (context) => ChatBox(),
  shoppingCart.routeName:(context) => shoppingCart()
};