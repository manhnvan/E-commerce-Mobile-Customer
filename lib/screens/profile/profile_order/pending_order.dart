import 'package:customer_app/constaint.dart';
import 'package:customer_app/screens/profile/profile_order/order_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key key}) : super(key: key);


  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
   List<dynamic> listItem = [];
  var dio = new Dio();
  @override
  void initState() {
    // TODO: implement initState
    EasyLoading.show(status: 'loading...');
    dio.get('$api_url/order/item/customer/$customerId').then((value) {
      setState(() {
        listItem = value.data["items"];
      });
      EasyLoading.dismiss();
    });
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return listItem.length > 0 ? ListView(
         children:
         listItem.map((i) => OrderCard(item: i)).toList()
     ) : Container(
         child: Center(child: Text("Bạn chưa có đơn hàng nào."))
     );
   }
}
