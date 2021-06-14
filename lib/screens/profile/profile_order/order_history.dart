import 'package:customer_app/screens/profile/profile_order/order_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../constant.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({
    Key key,
    this.currentUserId
  }) : super(key: key);

  final String currentUserId;

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<dynamic> listItem = [];
  var dio = new Dio();
  String currentUserId;

  void getData () {
    currentUserId = widget.currentUserId;
    EasyLoading.show(status: 'loading...');
    dio.get('$api_url/order/item/customer/$currentUserId/close').then((value) {
      if(this.mounted) {
        setState(() {
          listItem = value.data["items"];
        });
      }
      EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   EasyLoading.dismiss();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return listItem.length > 0 ? SingleChildScrollView(
      child: Column(
          children:
          listItem.map((i) => OrderCard(item: i, getData: getData, currentUserId: currentUserId)).toList()
      ),
    ) : Container(
      child: Center(child: Text("Bạn chưa có đơn hàng nào đã hoàn thành."))
    );
  }
}
