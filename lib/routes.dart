import 'package:customer_app/screens/ChatScreen/ChatScreen.dart';
import 'package:customer_app/screens/ChatScreen/Chatbox.dart';
import 'package:customer_app/screens/LoginScreen/LoginScreen.dart';
import 'package:customer_app/screens/RegisterScreen/RegisterScreen.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/product_details/product_detail.dart';
import 'package:customer_app/screens/profile/update_profile/update_profile.dart';
import 'package:customer_app/screens/search/search.dart';
import 'package:customer_app/screens/shoppingCart/components/confirm_order.dart';
import 'package:customer_app/screens/shoppingCart/shoppingCart.dart';
import 'package:customer_app/screens/viewShop/viewShop.dart';
import 'package:customer_app/screens/welcome/welcome_screen.dart';
import 'package:customer_app/screens/profile/profile.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  ProductDetail.routeName: (context) => ProductDetail(),
  Search.routeName: (context) => Search(),
  Profile.routeName: (context) => Profile(),
  LoginScreen.routeName: (context) => LoginScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  ViewShop.routeName: (context) => ViewShop(),
  ChatScreen.routeName: (context) => ChatScreen(),
  ChatBox.routeName: (context) => ChatBox(),
  ShoppingCart.routeName: (context) => ShoppingCart(),
  ConfirmOrder.routeName: (context) => ConfirmOrder(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  UpdateProfile.routeName: (context) => UpdateProfile()
};