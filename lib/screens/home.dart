import 'package:customer_app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../components/bottom_navbar.dart';

class Home extends StatefulWidget {
  static String routeName = '/home';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(FirebaseAuth.instance.currentUser);
            Navigator.pop(context);
          },
          child: Text('click'),
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: BottomNavbar()
    );
  }
}
