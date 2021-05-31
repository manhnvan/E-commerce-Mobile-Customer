import 'package:customer_app/constaint.dart';
import 'package:customer_app/screens/profile/profile_order/order_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({
    Key key,
    this.currentUserId
  }) : super(key: key);

  final String currentUserId;


  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
   List<dynamic> listItem = [];
  var dio = new Dio();
  String currentUserId;
  @override
  void initState() {
    currentUserId = widget.currentUserId;
    // TODO: implement initState
    EasyLoading.show(status: 'loading...');
    dio.get('$api_url/order/item/customer/$currentUserId').then((value) {
      if(this.mounted){
        setState(() {
          listItem = value.data["items"];
        });
      }
      EasyLoading.dismiss();
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   print('end');
  //   // TODO: implement dispose
  //   EasyLoading.dismiss();
  //   super.dispose();
  // }
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
