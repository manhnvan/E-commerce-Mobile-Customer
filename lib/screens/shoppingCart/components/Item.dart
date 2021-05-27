import 'package:customer_app/screens/product_details/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import '../../../constaint.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Item extends StatelessWidget {
  final List<dynamic> store;
  final int productIndex;
  final Function updateStore;

  Item({
    Key key,
    this.store,
    this.productIndex,
    this.updateStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = store[productIndex];
    var checkedProduct = product["checked"];

    var dio = new Dio();

    return Container(
      padding: EdgeInsets.only(top: 18),
      margin: EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black, width: 1)
        )
      ),
      child: Slidable(
        actionExtentRatio: 0.2,
        actionPane: SlidableStrechActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.redAccent.withOpacity(1),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            onTap: () {
              //remove product
              dio.post('$api_url/cart/customer/$customerId/deleteAll', data: {
                'listProduct': [product["product"]["_id"]]
              }). then((value) => {});
              store.removeAt(productIndex);
              updateStore(store);
            },
          ),
        ],
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(productId: product["product"]['_id'].toString()))
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    // gradient: color_gradient_glass,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(2, 2)
                  ),]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                    width: 100,
                    // height: 75,
                    image: NetworkImage(product["product"]["productImages"][0]),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            // Spacer(),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      product["product"]["productName"],
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 20)),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false
                    )
                  ),
                  SizedBox(height: 8),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                          "${NumberFormat.simpleCurrency(locale: 'vi_VN').format(product["product"]["price"])}",
                        style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 15)),
                        overflow: TextOverflow.ellipsis,
                      )
                  ),
                  SizedBox(height: 8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.remove_circle_outlined,
                            // size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            dio.post('$api_url/cart/customer/$customerId/update/${product["product"]["_id"]}', data: {
                              "type": -1
                            })
                                .then((value) {
                              if (value.data['success']) {
                                // print(value);
                              }
                            });
                            var cur = store[productIndex]["amount"];
                            store[productIndex]["amount"] = (cur - 1) > 0 ? cur - 1 : 0;
                            updateStore(store);
                          },
                        ),
                      ),
                      Text(product["amount"].toString(), style: TextStyle(fontSize: 20)),
                      Container(
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.add_circle_outlined,
                            // size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            dio.post('$api_url/cart/customer/$customerId/update/${product["product"]["_id"]}', data: {
                              "type": 1
                            })
                                .then((value) {
                              if (value.data['success']) {
                                // print(value);
                              }
                            });
                            store[productIndex]["amount"] += 1;
                            updateStore(store);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                dio
                    .post('$api_url/cart/customer/$customerId/update/${product["product"]["_id"]}', data: {
                        "checked": !product["checked"]
                    })
                    .then((value) {
                  if (value.data['success']) {
                    // print(value);
                  }
                });
                store[productIndex]["checked"] = !product["checked"];
                updateStore(store);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width:1),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Icon(checkedProduct ? Icons.check_circle_sharp : Icons.circle,
                    color: checkedProduct ? Colors.white : Colors.transparent, size: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
