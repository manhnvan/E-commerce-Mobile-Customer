import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


var fakeProductData = [
  {
    'thumbnail': 'https://i.imgur.com/2fa6ukp.jpeg',
    'productName': 'Cây dương xỉ trang trí nội thất đủ kích thước',
    'price': 500000
  },
  {
    'thumbnail': 'https://i.imgur.com/2fa6ukp.jpeg',
    'productName': 'Cây xương rồng nhỏ trang trí bàn học',
    'price': 200000
  },
  {
    'thumbnail': 'https://i.imgur.com/2fa6ukp.jpeg',
    'productName': 'Phím cơ Logitech G610',
    'price': 1250000
  },
  {
    'thumbnail': 'https://i.imgur.com/2fa6ukp.jpeg',
    'productName': 'Bestseller Book  - milk and honey',
    'price': 240000
  },
  {
    'thumbnail': 'https://i.imgur.com/2fa6ukp.jpeg',
    'productName': 'Pass sách cũ',
    'price': 300000
  },
  {
    'thumbnail': 'https://i.imgur.com/2fa6ukp.jpeg',
    'productName': 'Rubik3x3',
    'price': 110000
  }
];

int numOfProduct=2000;
String shopName="Cửa hàng quần áo";
String address = "36 xuân thủy, cầu giấy, hà nội 36 xuân thủy, cầu giấy, hà nội";
String phoneNumber="0123456789";

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
  @override
  Widget build(BuildContext context) {
    print(widget.seller);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Thông tin cửa hàng",style: Theme.of(context).textTheme.headline6.merge(TextStyle( fontSize: 25, color: Colors.white)), ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            gradient: color_gradient_primary,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        gradient: color_gradient_glass,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1, color: Colors.white)),
                    // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                      Text(numOfProduct.toString(), style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontSize: 14, fontWeight: FontWeight.normal))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: ElevatedButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.green[300],
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      primary: Colors.white,
                                      alignment: Alignment.center,
                                      // side: BorderSide(
                                      //     color: Colors.white,
                                      //     width: 1)
                                    ),
                                      onPressed: () {},
                                      child: Text("+ Theo dõi", style: TextStyle(fontSize: 14))
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: ElevatedButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        primary: Colors.white,
                                        alignment: Alignment.center,
                                        // side: BorderSide(
                                        //     color: Colors.white,
                                        //     width: 1),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.chat_bubble_outline_sharp ),
                                          SizedBox(width: 5),
                                          Text("Chat")
                                        ],
                                      )
                                  ),
                                )
                              ]
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("4.9 / 5.0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                Text("Đánh giá shop ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("584,300", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                Text("Người theo dõi", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
                              ],
                            ),
                            // Text(address, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),  overflow:  TextOverflow.ellipsis,),
                          ],
                        )
                      ],
                    ),
                  ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                  child: Column(
                    children: [
                      Text("Các sản phẩm có trong cửa hàng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 5,
                  children: fakeProductData.map((data) {
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
        ),
      ),
    );
  }
}
