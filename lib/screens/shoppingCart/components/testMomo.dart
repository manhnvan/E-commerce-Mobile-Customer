import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:momo_vn/momo_vn.dart';

import '../../../constant.dart';

class Momo extends StatefulWidget {
  final dynamic items;
  final String currentUserId;
  final String username;
  final int totalFee;

  const Momo({Key key, this.items, this.currentUserId, this.totalFee, this.username}) : super(key: key);

  @override
  _MomoState createState() => _MomoState();
}

class _MomoState extends State<Momo> {
  MomoVn _momoPay;
  PaymentResponse _momoPaymentResult;

  void onSuccess () {
    var dataToSend = [];
    var listIdToDelete = [];
    widget.items.forEach((e) {
      e["products"].forEach((p) {
        if(p["checked"] && (p["amount"] > 0)){
          listIdToDelete.add(p["product"]["_id"].toString());
          dataToSend.add({
            "productId": p["product"]["_id"],
            "sellerId": p["product"]["sellerId"]["_id"],
            "amount": p["amount"]
          });
        }
      });
    });
    EasyLoading.show(status: 'loading...');
    Dio().post('$api_url/cart/customer/${widget.currentUserId}/deleteAll', data: {
      'listProduct': listIdToDelete
    }). then((value) => {
      // widget.getData();
    });
    Dio().post("$api_url/order/create", data: {
      "customer": widget.currentUserId,
      "orderItems": dataToSend
    }).then((value) {
      EasyLoading.dismiss();
      Navigator.pushNamed(context, '/profile');
    });
  }

  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: [
            SizedBox(height: 20),
            Text("Phương thức thanh toán", style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10,),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.all(8.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network("https://img.mservice.io/momo-payment/icon/images/logo512.png", width: 30,),
                  ),
                  Text('Momo E-Wallet', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
                ],
              ),
              onPressed: () async {
                MomoPaymentInfo options = MomoPaymentInfo(
                    partner: 'merchant',
                    appScheme: "momo5qdq20210617",
                    amount: widget.totalFee.toDouble(),
                    description: 'Thanh toán mua hàng qua EZ Shopping',
                    merchantCode: 'MOMO5QDQ20210617',
                    merchantName: "EZ Shopping",
                    merchantNameLabel: "EZ Shopping",
                    partnerCode: 'MOMO5QDQ20210617',
                    orderId: '12321312',
                    orderLabel: 'EZ Shopping',
                    fee: 0,
                    username: widget.username,
                    isTestMode: true
                );
                try {
                  _momoPay.open(options);
                } catch (e) {
                  print(e);
                }

              },
            ),
            SizedBox(height: 15)
          ],
        ),
      ],
    );
  }
  @override
  void dispose() {
    super.dispose();
    // _momoPay.clear();
  }

  void _handlePaymentSuccess(PaymentResponse response) {
    if(response.isSuccess) onSuccess();
  }

  void _handlePaymentError(PaymentResponse response) {
    print(response);
  }
}