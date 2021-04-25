import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:flutter/material.dart';

var fakeProductData = [
  {
    'thumbnail': 'assets/images/fake-data-product/product01.jpg',
    'productName': 'Giày Nike Air Max 2017',
    'price': '700000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product02.jpg',
    'productName': 'Nike Zoom Pegasus 33',
    'price': '900000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product03.jpg',
    'productName': 'MX MASTER 2S',
    'price': '200000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product04.jpg',
    'productName': 'Surface Laptop Go 12.4',
    'price': '22000000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product05.jpg',
    'productName': 'Áo phông Coolmate',
    'price': '150000'
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product06.jpg',
    'productName': 'Áo Sweater Coolmate',
    'price': '300000'
  }
];

class RecommendSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return Container(
      padding: EdgeInsets.fromLTRB(space_medium, space_big, 0, space_medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bạn có thể thích',
              style: (Theme.of(context).textTheme.headline6)),
          SizedBox(height: space_medium),
          Container(
            width: 2000,
            height: MediaQuery.of(context).size.height * 0.23,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: fakeProductData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(width: null, data: fakeProductData[index]);
                }),
          )
        ],
      ),
    );
  }
}
