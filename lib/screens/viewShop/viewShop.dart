import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:customer_app/models/productList.dart';
import 'package:customer_app/screens/home/components/new_products_section.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:customer_app/screens/shoppingCart/components/Item.dart';
import 'package:customer_app/screens/shoppingCart/components/ItemsOfStore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


var fakeProductData = [
  {
    'thumbnail': 'assets/images/fake-data-product/product08.jpg',
    'name': 'Cây dương xỉ trang trí nội thất đủ kích thước',
    'price': '500000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product09.jpg',
    'name': 'Cây xương rồng nhỏ trang trí bàn học',
    'price': '200000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product10.jpg',
    'name': 'Phím cơ Logitech G610',
    'price': '1250000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product11.jpg',
    'name': 'Bestseller Book  - milk and honey',
    'price': '240000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product12.jpg',
    'name': 'Pass sách cũ',
    'price': '300000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product14.jpg',
    'name': 'Rubik3x3',
    'price': '110000'
  }
];

int numOfProduct=2000;
String shopName="Cửa hàng quần áo";
String address = "36 xuân thủy, cầu giấy, hà nội 36 xuân thủy, cầu giấy, hà nội";
String phoneNumber="0123456789";

class viewShop extends StatelessWidget {

  static String routeName = '/viewShop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black), ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                decoration: BoxDecoration(
                    gradient: color_gradient_primary,
                    borderRadius: BorderRadius.vertical(top: Radius.elliptical(6, 8), bottom: Radius.elliptical(6, 8) )
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Text("Thông tin shop", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Tổng số các sản phẩm: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        Text(numOfProduct.toString(), style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Text("Địa chỉ: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ],
                        ),
                        Flexible(
                            child: Text(address, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),)
                        ),
                        // Text(address, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),  overflow:  TextOverflow.ellipsis,),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Tỉ lệ phản hồi chat: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        Flexible(
                            child: Text("100%(trong vài giờ)", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),)
                        ),
                        // Text(address, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),  overflow:  TextOverflow.ellipsis,),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Số điện thoại: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        Flexible(
                            child: Text( phoneNumber, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),)
                        ),
                        // Text(address, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),  overflow:  TextOverflow.ellipsis,),
                      ],
                    ),
                  ],
                ),
              ),
            Container(
              decoration: BoxDecoration(
                  gradient: color_gradient_primary,
                  borderRadius: BorderRadius.vertical(top: Radius.elliptical(6, 8), bottom: Radius.elliptical(6, 8) )
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // primary: Colors.,
                          elevation:5.0,
                          // padding: EdgeInsets.all(5)
                      ),
                      onPressed: (){},
                      child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: Row(
                            children: [
                              Icon(Icons.chat, size: 40, color: Colors.white,),
                              SizedBox(width: 15,),
                              Text("Chat", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),)
                            ],
                          )
                      )
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // primary: Colors.white,
                          elevation:5.0,
                          // padding: EdgeInsets.all(5)
                      ),
                      onPressed: (){},
                      child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: Row(
                            children: [
                              Icon(Icons.add, size: 40, color: Colors.white,),
                              SizedBox(width: 15,),
                              Text("Follow", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),)
                            ],
                          )
                      )
                  )
                ],
              )
            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  Text("Các sản phẩm có trong cửa hàng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            ),
              Column(
                children: fakeProductData.map((data) {
                  return ProductCard(
                      width: MediaQuery.of(context).size.width,
                      data: data
                  );
                }).toList()
            ),
          ]
        ),
      ),
    );
  }
}
