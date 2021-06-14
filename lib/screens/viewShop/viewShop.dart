import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:customer_app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewShop extends StatefulWidget {
  static String routeName = '/viewShop';
  final dynamic seller;

  ViewShop({
    Key key, this.seller,
  }) : super(key: key);
  @override
  _ViewShopState createState() => _ViewShopState();
}

class _ViewShopState extends State<ViewShop> {

  var dio = new Dio();
  SharedPreferences prefs;
  String currentUserId;
  dynamic shopInfo;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      setState(() {
        currentUserId = prefs.getString('customerId');
      });
      EasyLoading.show(status: 'loading...');
      dio.get("$api_url/seller/${widget.seller["_id"]}/customer/$currentUserId")
          .then((value) {
            if(this.mounted){
              setState(() {
                shopInfo= value.data["doc"];
              });
            }
        EasyLoading.dismiss();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Thông tin cửa hàng",style: Theme.of(context).textTheme.headline6.merge(TextStyle( fontSize: 25, color: Colors.white)), ),
        centerTitle: true,
      ),
      body: shopInfo != null ? Container(
          height: double.infinity,
        padding: EdgeInsets.only(top: 75),
        decoration: BoxDecoration(
          gradient: color_gradient_primary,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      gradient: color_gradient_glass,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1, color: Colors.white)),
                  // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(widget.seller['avatar']),
                            radius: 30
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.seller["shopName"], style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 18)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text("Số sản phẩm: ", style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 14))),
                                    Text(shopInfo["products"].length.toString(), style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 14, fontWeight: FontWeight.normal))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: shopInfo["isFollowed"] ? Colors.green[300] : Colors.deepOrange[300],
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                primary: Colors.white,
                                alignment: Alignment.center,
                              ),
                                onPressed: () {
                                  EasyLoading.show(status: 'loading...');
                                  dio.post("$api_url/follow/update", data: {
                                    "sellerId": shopInfo["_id"],
                                    "customerId": currentUserId
                                  }).then((value) {
                                    var newShopInfo = shopInfo;
                                    newShopInfo["isFollowed"] = !newShopInfo["isFollowed"];
                                    setState(() {
                                      shopInfo= newShopInfo;
                                    });
                                    EasyLoading.dismiss();
                                  });
                                },
                                child: Text(shopInfo["isFollowed"] ? "Đang theo dõi" :"+ Theo dõi", style: TextStyle(fontSize: 14))
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${shopInfo["rating"]} / 5.0 (${shopInfo["rateAmount"]})",
                                  style: Theme.of(context).textTheme.bodyText1),
                              SizedBox(height: 10),
                              Text("Đánh giá shop ",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                            ],
                          ),
                          Dash(
                            direction: Axis.vertical,
                            dashLength: 30,
                            dashThickness: 2,
                            length: 30,
                            dashColor: Colors.white,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(shopInfo["followCount"].toString(), style: Theme.of(context).textTheme.bodyText1),
                              SizedBox(height: 10),
                              Text("Người theo dõi", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                            ],
                          ),
                          // Text(address, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),  overflow:  TextOverflow.ellipsis,),
                        ],
                      )
                    ],
                  ),
                ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                child: Column(
                  children: [
                    Text("Các sản phẩm có trong cửa hàng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ],
                ),
              ),
              Wrap(
                  spacing: 0,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.end,
                  runSpacing: 10,

                  children: shopInfo["products"].map<Widget>((data) {
                    return ProductCard(
                        backgroundWhite: false,
                        // width: MediaQuery.of(context).size.width,
                        data: data
                    );
                  }).toList()
              ),
            ]
          ),
        ),
      ) : Container(
        padding: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          gradient: color_gradient_primary,
        ),
      ),
    );
  }
}
