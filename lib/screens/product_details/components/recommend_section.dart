import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:flutter/material.dart';

var fakeProductData = [
  {
    'thumbnail': 'assets/images/fake-data-product/product01.jpg',
    'name': 'Giày Nike Air Max 2017',
    'price': 700000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product02.jpg',
    'name': 'Nike Zoom Pegasus 33',
    'price': 900000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product03.jpg',
    'name': 'MX MASTER 2S',
    'price': 200000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product03.jpg',
    'name': 'Surface Laptop Go 12.4',
    'price': 22000000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product05.jpg',
    'name': 'Áo phông Coolmate',
    'price': 150000
  },
  {
    'thumbnail': 'assets/images/fake-data-product/product06.jpg',
    'name': 'Áo Sweater Coolmate',
    'price': 300000
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
          Text('Sản phẩm tương tự',
              style: (Theme.of(context).textTheme.headline6)),
          SizedBox(height: space_medium),
          Container(
            width: 2000,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                addAutomaticKeepAlives: false,
                cacheExtent: 100.0,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: fakeProductData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    backgroundWhite: true,
                    width: null,
                    data: fakeProductData[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
