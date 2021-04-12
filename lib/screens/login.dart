import 'package:customer_app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  static String routeName = '/login';
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              SignInButton(
                Buttons.Google,
                text: 'Login',
                onPressed: () => Authentication.signOut(),
              ),
              SizedBox(height: 10,),
              SignInButton(
                Buttons.Facebook,
                onPressed: () => Authentication
                    .signInWithFacebook()
                    .then((value) => Navigator.pushNamed(context, '/home'))
                    .catchError((error) => print(error)),
              ),
              SizedBox(height: 10,),
              SignInButton(
                Buttons.Google,
                onPressed: () => Authentication
                    .signInWithGoogle()
                    .then((value) => Navigator.pushNamed(context, '/home'))
                    .catchError((error) => print(error)),
              ),
            ],
          ),
        ),
    );
  }
}
