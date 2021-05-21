import 'package:customer_app/abstracts/colors.dart';
import 'package:flutter/material.dart';

class ProfileCart extends StatefulWidget {
  static String routeName = '/cart';
  const ProfileCart({Key key}) : super(key: key);

  @override
  _ProfileCartState createState() => _ProfileCartState();
}

class _ProfileCartState extends State<ProfileCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        title: Text('Giỏ hàng của bạn'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          gradient: color_gradient_primary
        ),
      ),
    );
  }
}
