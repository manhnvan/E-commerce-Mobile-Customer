import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/models/productList.dart';
import 'package:customer_app/screens/home/components/new_products_section.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:customer_app/screens/shoppingCart/components/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ItemsOfStore extends StatelessWidget {
  ItemsOfStore({
    Key key,
    this.storeImage,
    this.storeName,
    this.items
  }) : super(key: key);

  String storeImage, storeName;
  List items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            gradient: color_gradient_glass,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        // color: Colors.greenAccent,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children:[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              // color: Colors.white,
              height: 80,
              child: Column(
                children: [
                  InkWell(
                    onTap:(){print('go to shop');},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(storeImage),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            SizedBox(width: 15,),
                            Text(storeName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),),
                          ],
                        ),
                        RoundCheckBox(
                            size: 25,
                            onTap: (selected){},
                            uncheckedColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  )
                ],
              ),
            ),
            Column(
              children: items.map((e) => Item(productName: e['productName'],image: e['image'],price: e['price'],amount: e['amount'],)).toList(),
            ),

          ]
        ),
      )
    );
  }
}
