import 'package:customer_app/screens/ChatScreen/ChatScreen.dart';
import 'package:customer_app/screens/ChatScreen/Chatbox.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/login.dart';
import 'package:customer_app/screens/profile/profile_cart/profile_cart.dart';
import 'package:customer_app/screens/search/search.dart';
import 'package:customer_app/screens/welcome/welcome_screen.dart';
import 'package:customer_app/screens/profile/profile.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  Search.routeName: (context) => Search(),
  Profile.routeName: (context) => Profile(),
  Login.routeName: (context) => Login(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  ProfileCart.routeName: (context) => ProfileCart(),
  ChatScreen.routeName: (context) => ChatScreen(),
  ChatBox.routeName: (context) => ChatBox()
};