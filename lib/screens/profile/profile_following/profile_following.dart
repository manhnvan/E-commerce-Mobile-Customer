import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/screens/viewShop/viewShop.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../constant.dart';

class ProfileFollowing extends StatefulWidget {
  const ProfileFollowing({
    Key key,
    this.currentUserId, this.listFollow, this.update
  }) : super(key: key);

  final String currentUserId;
  final listFollow;
  final Function update;

  @override
  _ProfileFollowingState createState() => _ProfileFollowingState();
}

class _ProfileFollowingState extends State<ProfileFollowing> {
  var index;
  var dio = new Dio();
  @override
  Widget build(BuildContext context) {
    index = -1;
    return ListView(
      children: widget.listFollow.map<Widget>((f) {
        index += 1;
        var curIndex = index;
      return
          Container(
              decoration: BoxDecoration(
                  gradient: color_gradient_glass,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                  ),
                  border: Border.all(color: Colors.white60, width: 1)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(f["sellerId"]["avatar"]),
            ),
            SizedBox(width: 10),
            Expanded(child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewShop(seller: f["sellerId"]))
                );
              },
                child: Text(f["sellerId"]["shopName"],
                    style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 18))))),
            SizedBox(
              width: 110,
              height: 30,
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: f["isFollow"] ? Colors.green[500] : Colors.deepOrange[500],
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    primary: Colors.white,
                    alignment: Alignment.center,
                  ),
                  onPressed: () {
                    var newList = widget.listFollow;
                    EasyLoading.show(status: 'loading...');
                    dio.post("$api_url/follow/update", data: {
                      "sellerId": newList[curIndex]["sellerId"]["_id"],
                      "customerId": widget.currentUserId
                    }).then((value) {
                      newList[curIndex]["isFollow"] = !newList[curIndex]["isFollow"];
                      widget.update(newList);
                      EasyLoading.dismiss();
                    });
                  },
                  child: Text(f["isFollow"] ? "Đang theo dõi" : "Theo dõi", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
              ),
            ),
          ],
        )
      );}).toList(),
    );
  }
}
