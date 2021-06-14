import 'package:flutter/material.dart';

class OrderCardButton extends StatelessWidget {
  final String content;
  final Function onPress;
  final Color color;
  const OrderCardButton({Key key, this.content, this.onPress, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 5),
          primary: Colors.white,
          alignment: Alignment.center,
        ),
        onPressed: () {
            onPress();
        },
        child: Text(content, style: TextStyle(fontSize: 14))
    );
  }
}
