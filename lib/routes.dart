import 'package:customer_app/screens/ChatScreen/ChatScreen.dart';
import 'package:customer_app/screens/ChatScreen/Chatbox.dart';
import 'package:customer_app/screens/home/home.dart';
import 'package:customer_app/screens/search.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  Search.routeName: (context) => Search(),
  ChatScreen.routeName: (context) => ChatScreen(),
  ChatBox.routeName: (context) => ChatBox()
};