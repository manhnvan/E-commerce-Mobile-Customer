import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:flutter/material.dart';

var fakeProductData = [
  {
    'thumbnail': 'assets/images/fake-data-product/product01.jpg',
    'name': 'Giày Nike Air Max 2017',
    'price': '700000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product02.jpg',
    'name': 'Nike Zoom Pegasus 33',
    'price': '900000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product03.jpg',
    'name': 'MX MASTER 2S',
    'price': '200000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product04.jpg',
    'name': 'Surface Laptop Go 12.4',
    'price': '22000000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product05.jpg',
    'name': 'Áo phông Coolmate',
    'price': '150000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product06.jpg',
    'name': 'Áo Sweater Coolmate',
    'price': '300000'
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
          ProductCard(
              width: MediaQuery.of(context).size.width, data: fakeProductData[1])
        ],
      ),
    );
  }
}
