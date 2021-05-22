import 'package:customer_app/abstracts/variables.dart';
import 'package:customer_app/components/product_card.dart';
import 'package:flutter/material.dart';

var fakeProductData = [
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'name': 'Giày Nike Air Max 2017',
    'price': 700000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'name': 'Nike Zoom Pegasus 33',
    'price': 900000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'name': 'MX MASTER 2S',
    'price': 200000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'name': 'Surface Laptop Go 12.4',
    'price': 22000000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'name': 'Áo phông Coolmate',
    'price': 150000
  },
  {
    'thumbnail': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKPHp2PuTqnncp5CdkRi_9fsl_T0Uk0qgUCA&usqp=CAU',
    'name': 'Áo Sweater Coolmate',
    'price': 300000
  }
];

class RecommendSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rerendering');
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
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                addAutomaticKeepAlives: false,
                cacheExtent: 100.0,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: fakeProductData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    backgroundWhite: false,
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
