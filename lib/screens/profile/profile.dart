import 'package:customer_app/screens/profile/profile_following/profile_following.dart';
import 'package:customer_app/screens/profile/profile_order/profile_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  static String routeName = '/profile';

  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;
  String screen = "order";
  SharedPreferences prefs;
  String currentUserId;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      setState(() {
        currentUserId = prefs.getString('customerId');
      });
    });
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(gradient: color_gradient_primary),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 4, bottom: 8),
                    decoration: BoxDecoration(
                        gradient: color_gradient_glass,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      gradient: color_gradient_secondary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.brown.shade800,
                                    child: Text('TH'),
                                    radius: 40,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Xin chào,",
                                            style: TextStyle(fontSize: 25)),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              4, 0, 12, 0),
                                          child: Icon(
                                            Icons.menu,
                                            size: 35,
                                          ),
                                        )
                                      ],
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text('Vương Thành',
                                            style: TextStyle(fontSize: 25))),
                                    // Align(
                                    //     alignment: Alignment.bottomRight,
                                    //     child: Container(
                                    //         margin: EdgeInsets.only(top: 8),
                                    //         padding: EdgeInsets.fromLTRB(
                                    //             15, 4, 4, 4),
                                    //         decoration: BoxDecoration(
                                    //             color: Colors.white,
                                    //             borderRadius:
                                    //                 BorderRadius.horizontal(
                                    //                     left: Radius.circular(
                                    //                         20))),
                                    //         child: Container(
                                    //             width: 138,
                                    //             child: Row(children: [
                                    //               Text("Cửa hàng của tôi",
                                    //                   style: Theme.of(context)
                                    //                       .textTheme
                                    //                       .button),
                                    //               Icon(
                                    //                   Icons
                                    //                       .keyboard_arrow_right_sharp,
                                    //                   size: 30)
                                    //             ]))))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/shoppingCart');
                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.local_grocery_store_outlined,
                                            size: 35, color: Colors.black45),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Giỏ hàng",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      screen = "order";
                                    });
                                  },
                                  child: Column(
                                      children: [
                                        Icon(Icons.local_mall_outlined,
                                            size: 35, color: screen == "order" ? Colors.black : Colors.black45),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Đơn hàng",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      screen = "following";
                                    });
                                  },
                                  child: Column(
                                      children: [
                                        Text(
                                          "69",
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: screen != "order" ? Colors.black : Colors.black45),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Đang theo dõi",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                currentUserId != null ? Expanded(child: screen == "order" ? ProfileOrder(
                  currentUserId: currentUserId
                ) : ProfileFollowing(currentUserId: currentUserId)) : Container()
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(3)
    );
  }
}
