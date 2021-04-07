import 'package:customer_app/screens/home.dart';
import 'package:customer_app/screens/loading.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  Loading.routeName: (contect) => Loading()
};