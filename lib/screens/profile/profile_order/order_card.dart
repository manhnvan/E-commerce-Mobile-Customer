import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/screens/product_details/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dash/flutter_dash.dart';

class OrderCard extends StatefulWidget {
  final dynamic item;
  const OrderCard({Key key, this.item}) : super(key: key);
  @override
  _OrderCardState createState() => _OrderCardState();

}

class _OrderCardState extends State<OrderCard> {
  bool opened = false;
  dynamic item;
  String categories = "";
  List<String> listStatus =  ["waiting", "processing", "shipping", "close"];
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
              decoration: BoxDecoration(
                  gradient: color_test,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0.5,
                        0.5,
                      ),
                    )
                  ]),
              child: Container(
                  margin: const EdgeInsets.all(1),
                  padding:
                      const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    gradient: color_gradient_primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
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
                                      Text(item["status"],
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
                                    child: Text(s, style: TextStyle(fontSize: 14, color: item[s] != null ? Colors.black87 : Colors.black54)),
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
            ),

          ],
        ),
      ),
    );
  }
}


