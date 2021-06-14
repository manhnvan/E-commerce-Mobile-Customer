import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/Rating/Rating.dart';
import 'package:customer_app/screens/product_details/product_detail.dart';
import 'package:customer_app/screens/profile/profile_order/order_card_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCard extends StatefulWidget {
  final dynamic item;
  final Function getData;
  final String currentUserId;
  const OrderCard({Key key, this.item, this.getData, this.currentUserId}) : super(key: key);
  @override
  _OrderCardState createState() => _OrderCardState();

}

class _OrderCardState extends State<OrderCard> {
  bool opened = false;
  dynamic item;
  String categories = "";
  double currentRate;
  List<String> listStatus =  ["waiting", "processing", "shipping", "close"];
  dynamic listConvert = {
    "waiting": "Đang xác nhận",
    "processing": "Đang xử lý",
    "shipping": "Đang vận chuyển",
    "close": "Đã hoàn thành",
    "denied": "Đã huỷ"
  };
  var dio = new Dio();
  SharedPreferences prefs;
  String currentUserId;

  void  _updateRate(newRate) {
    setState(() {
      currentRate = newRate;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    item = widget.item;
    int i = 0;
    item["productId"]["categories"].forEach((c) {
      categories += c.toString();
      categories += i != item["productId"]["categories"].length -1 ? ", " : "";
      i++;
    });
    if(item["denied"] != null) {
      listStatus[3] = "denied";
    }
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      setState(() {
        currentUserId = prefs.getString('customerId');
      });
      if(item["status"] == "close"){
        dio.post('$api_url/rating/check', data: {
          "product": item["productId"]["_id"],
          "customerId": currentUserId
        }).then((value) {
          if(this.mounted){
            setState(() {
              currentRate = value.data["rate"].toDouble();
            });
          }
        });
      }
    });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: const EdgeInsets.all(1),
                padding:
                    const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  gradient: color_gradient_glass,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  border: Border.all(color: Colors.white, width: 0.4)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(item["productId"]["thumbnail"]),
                          radius: 23,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProductDetail(productId: item["productId"]['_id'].toString()))
                              );
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:
                                8, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item["productId"]["productName"],
                                        style: Theme.of(context).textTheme.subtitle1,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: true),
                                    Text(categories, style: Theme.of(context).textTheme.caption,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: true)
                                  ],
                                )),
                          ),
                        ),
                        // Spacer(),
                        GestureDetector(
                        onTap: () {
                          setState(() {
                            opened = !opened;
                          });
                        },
                          child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  15, 4, 4, 4),
                              decoration: BoxDecoration(
                                  gradient: color_gradient_dark,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 3, // soften the shadow
                                      spreadRadius: 0, //extend the shadow
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                    )
                                  ],
                                  borderRadius:
                                  BorderRadius.horizontal(
                                      left: Radius.circular(20))),
                              child: Container(
                                  child: Row(children: [
                                    Text(listConvert[item["status"]],
                                        style: Theme.of(context)
                                            .textTheme
                                            .button.merge(TextStyle(color: Colors.white))),
                                    AnimatedContainer(
                                      transform: opened ? Matrix4.rotationZ(3.14) : Matrix4.rotationZ(0),
                                      transformAlignment: Alignment.center,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOut,
                                      child: Icon(
                                          Icons
                                              .keyboard_arrow_down_sharp,
                                          size: 30, color: Colors.white),
                                    )
                                  ]))),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    if(item["status"] == "denied") OrderCardButton(
                      color: Colors.green[300],
                      content: "Đặt lại đơn hàng",
                      onPress: (){
                        dio.post("$api_url/cart/customer/${widget.currentUserId}/update/${item["productId"]["_id"]}", data: {
                          "type": 1
                        }).then((value){
                          showDialog(
                              barrierDismissible: false,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext builderContext) {
                                Future.delayed(Duration(milliseconds: 700), () {
                                  Navigator.of(builderContext).pop();
                                });
                                return AlertDialog(
                                    backgroundColor: Colors.black.withOpacity(0.8),
                                    content: Text('Đã thêm lại vào giỏ hàng', style: TextStyle(color: Colors.white)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                );
                              }
                          );
                        });
                      },
                    )
                    else if(item["status"] == "close") OrderCardButton(
                      color: Colors.blue[300],
                      content: "Đánh giá ngay",
                      onPress: () {
                        currentRate != null ? showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            builder: (context) {
                              return Rating(
                                  item: item,
                                  currentRate: currentRate,
                                  updateRate: _updateRate,
                                  currentUserId: currentUserId);
                            }) : showDialog(
                            barrierDismissible: false,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext builderContext) {
                              Future.delayed(Duration(milliseconds: 500), () {
                                Navigator.of(builderContext).pop();
                              });
                              return AlertDialog(
                                  backgroundColor: Colors.black.withOpacity(0.8),
                                  content: Text('Đang tải thông tin, vui lòng chờ', style: TextStyle(color: Colors.white)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(12.0)))
                              );
                            }
                        );
                      },
                    )
                    else OrderCardButton(
                        color: Colors.red[500].withOpacity(1),
                        content: "Huỷ đơn",
                        onPress: () {
                          dio.post("$api_url/order/item/customer/cancel", data: {
                            "orderItemId": item["_id"]
                          }).then((value) {
                            widget.getData();
                            showDialog(
                                barrierDismissible: false,
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext builderContext) {
                                  Future.delayed(Duration(milliseconds: 700), () {
                                    Navigator.of(builderContext).pop();
                                  });
                                  return AlertDialog(
                                      backgroundColor: Colors.black.withOpacity(0.8),
                                      content: Text('Huỷ đơn thành công', style: TextStyle(color: Colors.white)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                  );
                                }
                            );
                          });
                        },
                      ),
                    AnimatedContainer(
                      margin: EdgeInsets.only(top: opened ? 10 : 0),
                      padding: EdgeInsets.only(top: opened ? 10 : 0),
                      decoration: BoxDecoration(
                          border: opened ? Border(
                          top: BorderSide(color: Colors.black87, width: 1)
                        ) : Border()
                      ),
                      height: opened ? 160 : 0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Tên mặt hàng: ${item["productId"]["productName"]}', style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 16)), overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: Text('Số lượng: ${item["amount"]}',
                                  style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 16)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true),
                            ),
                          ] + listStatus.map((s) =>
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 15.0,
                                      height: 15.0,
                                      decoration: new BoxDecoration(
                                        color: color_primary,
                                        border: Border.all(width: 2, color: Colors.green[800].withOpacity(item[s] != null ? 1 : 0.5) ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Dash(
                                        direction: Axis.vertical,
                                        length: (s != "close" && s != "denied") ? 12 : 0,
                                        dashLength: 12,
                                        dashColor: Colors.green[800].withOpacity(item[s] != null ? 1 : 0.5),
                                        dashThickness: 2),
                                  ],
                                ),
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(listConvert[s], style: TextStyle(fontSize: 14, color: item[s] != null ? Colors.black87 : Colors.black54)),
                                )),
                                item[s] != null ?
                                Container(
                                  width: 125,
                                  alignment: Alignment.centerLeft,
                                    child: Text(DateFormat('dd-MM-yyyy – kk:mm').format(DateTime.parse(item[s]).toLocal()),
                                    style: TextStyle(fontSize: 13)))
                                    :Container(),
                              ],
                            ),
                          )).toList()

                        )
                      ),
                    ),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}


