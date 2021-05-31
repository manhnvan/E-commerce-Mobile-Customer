import 'package:customer_app/constaint.dart';
import 'package:customer_app/screens/profile/profile_following/profile_following.dart';
import 'package:customer_app/screens/profile/profile_order/profile_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/abstracts/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Profile extends StatefulWidget {
  static String routeName = '/profile';

  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  String screen = "order";
  SharedPreferences prefs;
  String currentUserId;
  dynamic listFollowing;
  dynamic userInfo;
  var dio = new Dio();
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      setState(() {
        currentUserId = prefs.getString('customerId');
        EasyLoading.show(status: 'loading...');
        dio.get("$api_url/customer/$currentUserId/getInfo").then((value) {
          print(value.data);
          if(this.mounted) {
            setState(() {
              userInfo = value.data;
              listFollowing = value.data['listFollow'].map((f) => {...f, "isFollow": true}).toList();
            });
          }
          EasyLoading.dismiss();
        });
      });
    });
    super.initState();
  }

  void _updateListFollow(newList) {
      setState(() {
        listFollowing= newList;
      });
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
                                    backgroundImage: NetworkImage(userInfo != null ? userInfo["avatar"] : "https://i.pinimg.com/originals/0c/3b/3a/0c3b3adb1a7530892e55ef36d3be6cb8.png"),
                                    backgroundColor: Colors.transparent,
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
                                        child: Text(userInfo != null ? userInfo["username"] : "username",
                                            style: TextStyle(fontSize: 25))),
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
                                    child: Container(
                                      decoration: BoxDecoration(),
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
                                  child: Container(
                                    decoration: BoxDecoration(),
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
                              ),
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    EasyLoading.dismiss();
                                    setState(() {
                                      screen = "following";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                        children: [
                                          Text(
                                            userInfo != null ? userInfo["listFollow"].length.toString() : "N/A",
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
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                currentUserId != null ? Expanded(child: screen == "order" ? ProfileOrder(
                  currentUserId: currentUserId
                ) : ProfileFollowing(
                    currentUserId: currentUserId,
                    listFollow: listFollowing,
                    update: _updateListFollow,
                )) : Container()
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(3)
    );
  }
}
