import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/screens/shoppingCart/components/ItemsOfStore.dart';
import 'package:flutter/material.dart';

var data = [
  {
    'storeImage':'https://brandkey.vn/wp-content/uploads/2019/12/mau-logo-thoi-trang-dep-fendi.png',
    'storeName':'Candy',
    'items':[
      {
        'productName':'Áo thun',
        'price':300000,
        'amount':3,
        'image': "https://product.hstatic.net/1000284478/product/43s_31ts15031_2_fbd792bda27645b28c87e963527ee172_1024x1024.jpg"
      },
      {
        'productName':'Áo thun',
        'price':300000,
        'amount':3,
        'image': "https://product.hstatic.net/1000284478/product/43s_31ts15031_2_fbd792bda27645b28c87e963527ee172_1024x1024.jpg"
      },
      {
        'productName':'Áo thun',
        'price':300000,
        'amount':3,
        'image': "https://product.hstatic.net/1000284478/product/43s_31ts15031_2_fbd792bda27645b28c87e963527ee172_1024x1024.jpg"
      },
    ]
  },
  {
    'storeImage':'https://brandkey.vn/wp-content/uploads/2019/12/mau-logo-thoi-trang-dep-fendi.png',
    'storeName':'Candy',
    'items':[
      {
        'productName':'Áo thun',
        'price':300000,
        'amount':3,
        'image': "https://product.hstatic.net/1000284478/product/43s_31ts15031_2_fbd792bda27645b28c87e963527ee172_1024x1024.jpg"
      },
      {
        'productName':'Áo thun',
        'price':300000,
        'amount':3,
        'image': "https://product.hstatic.net/1000284478/product/43s_31ts15031_2_fbd792bda27645b28c87e963527ee172_1024x1024.jpg"
      },
      {
        'productName':'Áo thun',
        'price':300000,
        'amount':3,
        'image': "https://product.hstatic.net/1000284478/product/43s_31ts15031_2_fbd792bda27645b28c87e963527ee172_1024x1024.jpg"
      },
    ]
  },
];

String total='1.000.000';
class shoppingCart extends StatefulWidget {
  static String routeName = '/shoppingCart';

  @override
  _shoppingCartState createState() => _shoppingCartState();
}

class _shoppingCartState extends State<shoppingCart> {
  @override
  Widget build(BuildContext context) {
    // _items[0] = _item;
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ hàng của bạn", style: TextStyle(fontSize: 25, color: Colors.black), ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: color_gradient_primary),
        child: SingleChildScrollView(
          child: Column(
            children: data.map((e)=> ItemsOfStore(storeImage: e['storeImage'], storeName: e['storeName'], items: e['items'],)).toList(),
          ),
        )
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(1.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              gradient: color_gradient_primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(total, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation:5.0,
                    padding: EdgeInsets.all(10)
                ),
                onPressed: (){
                  print("OK");
                },
                child: Text("Mua ngay", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),),
              ),
            ],
          ),
        ),
        ),
    );
  }
}
