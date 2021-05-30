import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/screens/shoppingCart/components/ItemsOfStore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constaint.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ShoppingCart extends StatefulWidget {
  static String routeName = '/shoppingCart';
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<dynamic> items = [];
  int index = -1;
  int totalPrice = 0;
  var dio = new Dio();
  SharedPreferences prefs;
  String currentUserId;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      setState(() {
        currentUserId = prefs.getString('customerId');
      });
      EasyLoading.show(status: 'loading...');
      dio
          .get('$api_url/cart/customer/$currentUserId/getCart')
          .then((value) {
        if (value.data['success']) {
          setState(() {
            items = value.data["data"]['items'];
          });
          EasyLoading.dismiss();
        }
      });
    });
    
  }

  void _update(List<dynamic> newItems) {
    setState(() {
      items = newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    index = -1;
    totalPrice = 0;
    items.forEach((item) {
      item["products"].forEach((p) => {
        totalPrice += p["checked"] ? p["amount"]*p["product"]["price"] : 0
      });
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(
              icon: new Icon(Icons.arrow_back,size: 35),
          onPressed: () {
          // Perform Your action here
            Navigator.pop(context);
            EasyLoading.dismiss();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Giỏ hàng của bạn",
            style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 25, color: Colors.white))),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        decoration: BoxDecoration(gradient: color_gradient_primary),
        child: Column(
          children: [
            Expanded(child: items.length > 0 ? SingleChildScrollView(
              child: Column(
                  children: items.map((e) {
                      index += 1;
                      return ItemsOfStore(
                        currentUserId: currentUserId,
                        items: items,
                        storeIndex: index,
                        update: _update); }).toList()),
            ): Center(child: Text("Bạn chưa có sản phẩm trong giỏ hàng"))),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  gradient: color_gradient_primary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(color: Colors.white, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 12,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8) ,
                        child: Align(
                        alignment: Alignment.center,
                            child: Text("Tổng:  ${NumberFormat.simpleCurrency(locale: 'vi_VN').format(totalPrice)}",
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 20))))),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){
                        if(totalPrice == 0){
                          showDialog(
                              barrierDismissible: false,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext builderContext) {
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.of(builderContext).pop();
                                });
                                return AlertDialog(
                                    backgroundColor: Colors.black.withOpacity(0.8),
                                    // title: Text('Thông báo', style: TextStyle(color: Colors.white)),
                                    content: Text('Bạn chưa chọn sản phẩm nào', style: TextStyle(color: Colors.white)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                );
                              }
                          );
                        }
                        else Navigator.pushNamed(context, '/confirmOrder');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: color_gradient_primary,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 8,
                              blurRadius: 12,
                              offset: Offset(1, 10), // changes position of shadow
                            ),
                          ],
                        ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Thanh toán",
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 20, color: Colors.white))),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
