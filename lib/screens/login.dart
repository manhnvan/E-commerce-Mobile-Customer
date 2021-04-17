import 'package:customer_app/models/productList.dart';
import 'package:customer_app/models/user.dart';
import 'package:customer_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

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
                text: 'login',
                onPressed: () => Provider.of<User>(context, listen: false)
                                  .login('seller1@gmail.com', 'newpassword'),
              ),
              SignInButton(
                Buttons.Google,
                text: 'getList',
                onPressed: () => Provider.of<ProductList>(context, listen: false)
                                  .fetchProductListByCiteria(1, vendor: "No", price: 25, product_name: "áo"),
              ),
            ],
          ),
        ),
    );
  }
}
