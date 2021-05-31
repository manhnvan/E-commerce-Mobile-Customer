import 'package:customer_app/screens/profile/profile_order/order_history.dart';
import 'package:customer_app/screens/profile/profile_order/pending_order.dart';
import 'package:flutter/material.dart';
import 'canceled_order.dart';

class ProfileOrder extends StatefulWidget {

  const ProfileOrder({
    Key key,
    this.currentUserId
  }) : super(key: key);

  final String currentUserId;

  @override
  _ProfileOrderState createState() => _ProfileOrderState();
}

class _ProfileOrderState extends State<ProfileOrder> {
  String currentScreen = "pending";
  String currentUserId;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      currentUserId = widget.currentUserId;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.black87),)
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = "pending";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(),
                        child: Center(
                            child: Text(
                          'Đang xử lý',
                          style: Theme.of(context).textTheme.subtitle1.merge(
                              TextStyle(
                                  color: currentScreen != "pending"
                                      ? Colors.black54
                                      : Colors.black)),
                        )),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = "history";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border(
                          left: BorderSide(width: 1, color: Colors.black87),
                          right: BorderSide(width: 1, color: Colors.black87),
                        )),
                        child: Center(
                            child: Text(
                          'Lịch sử',
                          style: Theme.of(context).textTheme.subtitle1.merge(
                              TextStyle(
                                  color: currentScreen == "history"
                                      ? Colors.black
                                      : Colors.black54)),
                        )),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = "canceled";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(),
                        child: Center(
                            child: Text(
                              'Đã huỷ',
                              style: Theme.of(context).textTheme.subtitle1.merge(
                                  TextStyle(
                                      color: currentScreen != "canceled"
                                          ? Colors.black54
                                          : Colors.black)),
                            )),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(child: currentScreen == "pending" ? PendingOrder(
            currentUserId: currentUserId
          ) : currentScreen == "history" ? OrderHistory(currentUserId: currentUserId) : CanceledOrder(currentUserId: currentUserId))
        ],
      ),
    );
  }
}
