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

var productData = {
  "categories": ["Trang phục", "Đồ gia dụng", "Thiết bị điện tử", "Trang sức"],
  "productImages": [
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fenternews.vn%2Fstartup-coolmate-tien-phong-trong-phong-cach-mua-sam-cho-nam-gioi-196404.html&psig=AOvVaw2wvI1l9VTGyl0x1rFwJH8g&ust=1621776538225000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjKwNOy3fACFQAAAAAdAAAAABAm",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4vXI_TwslKocCxkBQY5vpUq_x_H0cvWgkjQkWMbsB0ojIa1vnSISqs5gge-7Q6U7_zpQ&usqp=CAU",
    "https://kieutruong.com/wp-content/uploads/2021/03/da%CC%81nh-gia%CC%81-coolmate-box.jpg",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.topdev.vn%2Fnha-tuyen-dung%2Fcoolmate-2-83993&psig=AOvVaw2wvI1l9VTGyl0x1rFwJH8g&ust=1621776538225000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjKwNOy3fACFQAAAAAdAAAAABAg"
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
      .get('$api_url/product/$productId')
      .then((value) {
        print(value.data);
        if (value.data['success']) {
          setState(() {
            productData = value.data['doc'];
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
          _isAddedToFav = !_isAddedToFav;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    print(widget.productId);
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.black.withOpacity(0.15),
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)
          ),
        ),
        body:
          loading ? Container() : Container(
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                // scrollDirection: Axis.vertical,
                // addAutomaticKeepAlives: false,
                // cacheExtent: 100.0,
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
            ),
            //Our super cool menu's down here ^^
            Menu(productId: widget.productId)
          ])
        )
      ),
    );
  }
}
