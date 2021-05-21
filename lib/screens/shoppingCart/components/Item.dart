import 'package:customer_app/abstracts/colors.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/bottom_navbar.dart';
import 'package:customer_app/models/productList.dart';
import 'package:customer_app/screens/home/components/new_products_section.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Item extends StatelessWidget {
  Item({
    Key key,
    this.productName,
    this.image,
    this.price,
    this.amount
  }) : super(key: key);

  String image, productName;
  int price, amount;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){print("go to detail");},
        child: Container(
          height: 170,
          // padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // gradient: color_gradient_glass,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      // color: Colors.greenAccent,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Image(
                        image: NetworkImage(image),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 25,),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 110,
                                child: Text(
                                  productName,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                )
                            ),
                            SizedBox(width: 10,),
                            Container(
                                width: 125,
                                child: Text(
                                  price.toString(),
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: CircleBorder(),
                                    elevation:5.0
                                ),
                                child: Text('-', style: TextStyle(fontSize: 32, color: Colors.black),),
                                onPressed: () {
                                  print("minus");
                                },
                              ),
                            ),
                            Text(amount.toString(), style: TextStyle(fontSize: 25),),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: CircleBorder(),
                                    elevation:5.0
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  print("add");
                                },
                              ),
                            )
                          ],
                        )
                      ],
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
      ),
    );
  }
}
