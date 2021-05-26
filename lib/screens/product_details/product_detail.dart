import 'package:customer_app/abstracts/image_asset_url.dart';
import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:customer_app/screens/product_details/components/menu.dart';
import 'package:customer_app/screens/product_details/components/productBriefInfo.dart';
import 'package:customer_app/screens/product_details/components/product_images.dart';
import 'package:customer_app/screens/product_details/components/seller_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../constaint.dart';

class ProductDetail extends StatefulWidget {
  static String routeName = '/productDetail';

  final String productId;

  const ProductDetail({
    Key key,
    this.productId
    }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _isAddedToFav = false;

  dynamic productData;

  var dio = new Dio();
  int page = 0;
  int limit = 10;
  bool loading = true;

  @override
  void initState() {
    String productId = widget.productId;
    EasyLoading.show(status: 'loading...');
    dio
      .get('$api_url/product/$productId', options: Options(
        headers: {
          "authorization": customerId
        }
      ))
      .then((value) {
        print(value.data['isLiked']);
        if (value.data['success']) {
          setState(() {
            productData = value.data['doc'];
            _isAddedToFav = value.data['isLiked'];
            loading = false;
          });
        }
        EasyLoading.dismiss();
      });
  }



  void addedToFav() {
    dio.post('$api_url/like', data: {
      "product": widget.productId,
      "user": customerId
    }).then((value) {
      print(value);
      if (value.data['success']) {
        setState(() {
          productData['like'] = value.data['totalLikeOfProduct'];
          _isAddedToFav = value.data['isLiked'];
        });
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    print(widget.productId);
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            width: space_big,
            height: space_big,
            child: Icon(Icons.arrow_back_ios),
          )
        ),
      ),
      body: 
        loading ? Container() : Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                ListView(
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: false,
                  cacheExtent: 100.0,
                  children: [
                    ProductImages(productData['productImages']),
                    SizedBox(height: space_medium),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          space_medium, 0, space_medium, space_huge * 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Seller's information and heart icon here ^^
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Seller Information
                              SellerInfo(productData['sellerId']),

                              //Add to Favorite
                              TextButton(
                                onPressed: addedToFav,
                                child: Stack(
                                  children: [
                                    Container(
                                    width: space_huge + space_small,
                                    height: space_huge + space_small,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(icon_heart)
                                        )
                                    ),
                                  ),
                                    Visibility(
                                      visible: _isAddedToFav,
                                      child: Container(
                                        width: space_huge + space_small,
                                        height: space_huge + space_small,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(icon_heart_active)
                                            )
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: space_medium),

                          //Product title here ^^
                          Text(
                            productData['productName'],
                            style: Theme.of(context).textTheme.headline5
                          ),

                          //Product brief information here (like price, number of reviews, number of ratings, etc...)
                          ProductBriefInfo(
                            productData['rating'],
                            productData['like'], 
                            productData['price']
                          ),

                          SizedBox(height: space_big),

                          //Product description here :v
                          Text(
                            productData['description'],
                            style: Theme.of(context).textTheme.bodyText1
                          ),

                          SizedBox(height: space_huge),

                          //Recommend section here :>
                          RecommendSection()
                        ],
                      ),
                    ),
                  ],
                ),

                //Our super cool menu's down here ^^
                Menu(
                  productId: productData['_id'], 
                  sellerId: productData['sellerId'],
                  productName: productData['productName'],
                )
              ]),
            ),
          ],
        )
      )
    );
  }
}
