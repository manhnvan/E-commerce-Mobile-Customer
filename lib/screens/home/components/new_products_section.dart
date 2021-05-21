import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:flutter/material.dart';

var fakeProductData = [
  {
    'thumbnail': 'assets/images/fake-data-product/product08.jpg',
    'name': 'Cây dương xỉ trang trí nội thất đủ kích thước',
    'price': 500000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product09.jpg',
    'name': 'Cây xương rồng nhỏ trang trí bàn học',
    'price': 200000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product10.jpg',
    'name': 'Phím cơ Logitech G610',
    'price': 1250000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product11.jpg',
    'name': 'Bestseller Book  - milk and honey',
    'price': 240000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product12.jpg',
    'name': 'Pass sách cũ',
    'price': 300000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product14.jpg',
    'name': 'Rubik3x3',
    'price': 110000
  }
];

class NewProductsSection extends StatelessWidget {
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
              children: fakeProductData.map((data) {
            return ProductCard(
              backgroundWhite: false,
                width: MediaQuery.of(context).size.width, data: data);
          }).toList())
        ],
      ),
    );
  }
}

// Container(
// height: 500,
// child: ListView.builder(
// addAutomaticKeepAlives: false,
// cacheExtent: 100.0,
// shrinkWrap: true,
// scrollDirection: Axis.vertical,
// itemCount: fakeProductData.length,
// itemBuilder: (context, index) {
// return ProductCard(
// width: MediaQuery.of(context).size.width,
// data: fakeProductData[index]);
// }),
// ),
