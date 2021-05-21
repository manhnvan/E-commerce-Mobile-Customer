import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/screens/home/components/recommend_section.dart';
import 'package:customer_app/screens/product_details/components/menu.dart';
import 'package:customer_app/screens/product_details/components/productBriefInfo.dart';
import 'package:customer_app/screens/product_details/components/product_images.dart';
import 'package:customer_app/screens/product_details/components/seller_info.dart';
import 'package:flutter/material.dart';

var productData = {
  "categories": ["Trang phục", "Đồ gia dụng", "Thiết bị điện tử", "Trang sức"],
  "productImages": [
    "assets/images/image_hero_1-min.jpg",
    "assets/images/image_hero_2-min.jpg",
    "assets/images/image_hero_3-min.jpg",
    "assets/images/image_hero_4-min.jpg"
  ],
  "rating": 0,
  "like": 0,
  "_id": "6091ffde9435a50afc8db2b4",
  "sellerId": "608eb567489da0f52b6ec179",
  "productName": "Ao phong",
  "description":
      "Với mong muốn gửi đến khách hàng những chiếc quần thoải mái hơn, có sự thay đổi hơn trong kiểu dáng cũng như cách thiết kế và đặc biệt là vẫn có đầy đủ những đặc điểm cần có của một chiếc quần tốt, Coolmate tin chiếc Easy Active Short chính là sự kết hợp đặc biệt giữa \"Dễ dàng để mặc\" và \"Thoải mái trong vận động\". Tìm hiểu cùng Coolmate chiếc quần này có gì đặc biệt nhé! ",
  "thumbnail": "1620180917769thumbnail_image.png",
  "price": 800000,
  "unit": "cai",
  "vendor": "Coolmate",
  "__v": 0
};

class ProductDetail extends StatefulWidget {
  static String routeName = '/productDetail';

  const ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _isAddedToFav = false;

  void addedToFav() {
    setState(() {
      _isAddedToFav = !_isAddedToFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            width: space_big,
            height: space_big,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/icon_arrow-back.png')
              )
            ),
          )
        ),
      ),
        body: Container(
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
                                        image: AssetImage('assets/icons/icon_heart.png')
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
                                            image: AssetImage('assets/icons/icon_heart-active.png')
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
                      Text(productData['productName'],
                          style: Theme.of(context).textTheme.headline5),

                      //Product brief information here (like price, number of reviews, number of ratings, etc...)
                      ProductBriefInfo(productData['rating'],
                          productData['like'], productData['price']),

                      SizedBox(height: space_big),

                      //Product description here :v
                      Text(productData['description'],
                          style: Theme.of(context).textTheme.bodyText1),

                      SizedBox(height: space_huge),

                      //Recommend section here :>
                      RecommendSection()
                    ],
                  ),
                ),
              ],
            ),

            //Our super cool menu's down here ^^
            Menu()
          ]),
        ),
      ],
    )));
  }
}
