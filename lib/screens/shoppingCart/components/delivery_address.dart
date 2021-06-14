import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/constant.dart';
import 'package:customer_app/screens/profile/update_profile/update_profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatefulWidget {
  final String currentUserId;
  const DeliveryAddress({Key key, this.currentUserId}) : super(key: key);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  var userInfo;
  var dio = new Dio();
  @override
  void initState() {
    // TODO: implement initState
    dio.get("$api_url/customer/${widget.currentUserId}/getInfo").then((value) {
      if(this.mounted) {
        setState(() {
          userInfo = value.data;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: color_gradient_glass,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          ),
          border: Border.all(color: Colors.white60, width: 1),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text("Thông tin giao hàng",
                style: Theme.of(context).textTheme.headline6.merge(TextStyle())),
          ),
          SizedBox(height: 15),
          Text("Họ tên:  ${userInfo != null ? userInfo["username"] : "N/A" }",
              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
          SizedBox(height: 10),
          Text("Số điện thoại:  ${userInfo != null ? userInfo["phone"] : "N/A" }",
              style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 16))),
          SizedBox(height: 10),
          Text("Địa chỉ:  ${userInfo != null ? userInfo["address"] : "N/A"}",
              style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 16))),
          SizedBox(height: 10),
          ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[400],
                padding: EdgeInsets.symmetric(horizontal: 5),
                primary: Colors.white,
                alignment: Alignment.center,
              ),
              onPressed: () {
                if(userInfo != null){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateProfile(update: (value){
                        setState(() {
                          userInfo = value;
                        });
                      }, userInfo: userInfo ))
                  );
                }
                else{
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
                            content: Text('Đang tải thông tin, vui lòng thử lại', style: TextStyle(color: Colors.white)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)))
                        );
                      }
                  );
                }
              },
              child: Text("Thay đổi thông tin", style: TextStyle(fontSize: 14))
          )
        ],
      ),
    );
  }
}
