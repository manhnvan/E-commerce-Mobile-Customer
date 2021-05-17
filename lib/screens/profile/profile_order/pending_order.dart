import 'package:flutter/material.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key key}) : super(key: key);

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Pending Order")
    );
  }
}
