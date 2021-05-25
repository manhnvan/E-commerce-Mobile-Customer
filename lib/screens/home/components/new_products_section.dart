import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

var fakeProductData = [
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'productName': 'Cây dương xỉ trang trí nội thất đủ kích thước',
    'price': 500000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'productName': 'Cây xương rồng nhỏ trang trí bàn học',
    'price': 200000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'productName': 'Phím cơ Logitech G610',
    'price': 1250000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9KIogM7FBXXFj1Y2vz4SmuxVOUy4nmcxijA&usqp=CAU',
    'productName': 'Bestseller Book  - milk and honey',
    'price': 240000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ2-GtlvbhztdpHSZPeQyT3EXzxmHaU025tg&usqp=CAU',
    'productName': 'Pass sách cũ',
    'price': 300000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfkFVBUATcGBWWyp20s-aH5AlrQT1TPBDFNw&usqp=CAU',
    'productName': 'Rubik3x3',
    'price': 110000
  }
];

class NewProductsSection extends StatefulWidget {
  @override
  _NewProductsSectionState createState() => _NewProductsSectionState();
}

class _NewProductsSectionState extends State<NewProductsSection> {

  List<dynamic> newProductList = [];
  var dio = new Dio();

  int page = 0;
  int limit = 10;

  @override
  void initState() {
    dio
      .get('$api_url/product/lastest?page=$page&limit=$limit')
      .then((value) {
        print(value.data);
        if (value.data['success']) {
          setState(() {
            newProductList = value.data['docs'];
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(space_medium, 0, space_medium, space_medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sản phẩm mới', style: (Theme.of(context).textTheme.headline6)),
          SizedBox(height: space_medium),
          Column(
            children: newProductList.map((product) => ProductCard(
                  backgroundWhite: false,
                  width: MediaQuery.of(context).size.width, 
                  data: product
                )).toList()
          )
        ],
      ),
    );
  }
}

