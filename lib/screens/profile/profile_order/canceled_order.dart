import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/profile/profile_order/order_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CanceledOrder extends StatefulWidget {
  const CanceledOrder({
    Key key,
    this.currentUserId
  }) : super(key: key);

  final String currentUserId;

  @override
  _CanceledOrderState createState() => _CanceledOrderState();
}

class _CanceledOrderState extends State<CanceledOrder> {
  List<dynamic> listItem = [];
  var dio = new Dio();
  String currentUserId;

  void getData () {
    currentUserId = widget.currentUserId;
    EasyLoading.show(status: 'loading...');
    dio.get('$api_url/order/item/customer/$currentUserId/denied').then((value) {
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
        child: Center(child: Text("Bạn chưa huỷ đơn hàng nào."))
    );
  }
}
