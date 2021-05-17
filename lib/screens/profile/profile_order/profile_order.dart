import 'package:flutter/material.dart';

class ProfileOrder extends StatefulWidget {
  const ProfileOrder({Key key}) : super(key: key);

  @override
  _ProfileOrderState createState() => _ProfileOrderState();
}

class _ProfileOrderState extends State<ProfileOrder> {
  String currentScreen = "pending";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 4),
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
                      child: Center(
                          child: Text(
                        'Đang xử lý',
                        style: Theme.of(context).textTheme.subtitle1.merge(
                            TextStyle(
                                color: currentScreen != "pending"
                                    ? Colors.black54
                                    : Colors.black)),
                      )),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = "following";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border(
                          left: BorderSide(width: 1, color: Colors.black87),
                        )),
                        child: Center(
                            child: Text(
                          'Lịch sử',
                          style: Theme.of(context).textTheme.subtitle1.merge(
                              TextStyle(
                                  color: currentScreen == "pending"
                                      ? Colors.black54
                                      : Colors.black)),
                        )),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
