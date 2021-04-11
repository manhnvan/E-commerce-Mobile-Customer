import 'package:customer_app/screens/welcome/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {

  static String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreenBody(),
    );
  }
}
